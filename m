Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RyO1K-0002CQ-1p
 for linux-mtd@lists.infradead.org; Fri, 17 Feb 2012 13:38:42 +0000
Received: by wera10 with SMTP id a10so2305909wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2012 05:38:40 -0800 (PST)
Date: Fri, 17 Feb 2012 15:38:28 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: ubi: suspicious calculation in 'ubi_wl_get_peb'
Message-ID: <20120217153828.71eba4e4@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Sorry for a long post - this issue requires some detailed background.

It looks like a calculation within 'ubi_wl_get_peb' involved in
picking a candidate PEB is incorrect.

The function 'find_wl_entry(rb_root *root, int max)' finds a
wear-leveling entry closest to a certain erase counter.

The parameter 'max' is documented as "highest possible erase counter",
however it is actually "diff from first entry" - since initially, the
funtion adds first entry's EC to the given 'max':

	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
	max += e->ec;

Almost all calls to 'find_wl_entry' follow the (undocumented)
convention, providing "diff from first" argument (where the absolute
'max' value seeked is calculated *internally* by 'find_wl_entry').
E.g. 4 of 5 calls are of the pattern:

	e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);

However, there is one call where the caller seems to provide an actual
absolute "max" value, instead of a "diff from first".
The call is within 'ubi_wl_get_peb', quote:

	case UBI_UNKNOWN:
		/*
		 * For unknown data we pick a physical eraseblock with medium
		 * erase counter. But we by no means can pick a physical
		 * eraseblock with erase counter greater or equivalent than the
		 * lowest erase counter plus %WL_FREE_MAX_DIFF.
		 */
		first = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry,
					u.rb);
		last = rb_entry(rb_last(&ubi->free), struct ubi_wl_entry, u.rb);

		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
			e = rb_entry(ubi->free.rb_node,
					struct ubi_wl_entry, u.rb);
		else {
			medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
			e = find_wl_entry(&ubi->free, medium_ec);
		}
		break;

Note calculation of 'medium_ec' - it does no seem as a "diff" value.
The *actual* resulting seeked EC is approximately 1.5*First + Diff/2.
Is it the intended behavior? it does not seem to fit the remark.

Deducting from the "last->ec - first->ec < WL_FREE_MAX_DIFF" condition,
it looks like it should have been:

-			e = find_wl_entry(&ubi->free, medium_ec);
+			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2)

Did I get something wrong?

Looking forward for any comments.

Regards,
Shmulik
