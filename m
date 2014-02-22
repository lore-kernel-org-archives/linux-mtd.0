Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WH0tp-00063q-7k
 for linux-mtd@lists.infradead.org; Sat, 22 Feb 2014 00:57:02 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
 <877g8ojqsn.fsf@nbsps.com> <53079725.6080105@nod.at>
 <87ios8gsho.fsf@nbsps.com>
Date: Fri, 21 Feb 2014 19:49:29 -0500
In-Reply-To: <87ios8gsho.fsf@nbsps.com> (Bill Pringlemeir's message of "Fri,
 21 Feb 2014 14:45:07 -0500")
Message-ID: <87k3coq8di.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Wiedemer, Thorsten \(Lawo AG\)" <Thorsten.Wiedemer@lawo.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Am 21.02.2014 18:53, schrieb Bill Pringlemeir:

>>> I don't think the spin_lock() will do anything on a UP system like
>>> the ARM926's that have encountered this issue.

> On 21 Feb 2014, richard@nod.at wrote:

>> Also on UP a spin_lock disables preemption.  So, le->users is
>> protected.

On 21 Feb 2014, bpringlemeir@nbsps.com wrote:

> Thanks, now this make sense...

[snip]

> Also, it seems that 'sem->wait_list.next' is NULL and this is in the
> space allocated by the 'ltree_entry'.  Ie, the head of the list has
> NULL; I was thinking something within the list was NULL.

I think the 'ubi_eba_copy_leb()' may have an issue.

int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
		     struct ubi_vid_hdr *vid_hdr)
{
...

	err = leb_write_trylock(ubi, vol_id, lnum);

static int leb_write_trylock(struct ubi_device *ubi, int vol_id, int lnum)
{
..
	le = ltree_add_entry(ubi, vol_id, lnum);  /* users + 1 */
	if (IS_ERR(le))
		return PTR_ERR(le);
	if (down_write_trylock(&le->mutex))
		return 0;

	/* Contention, cancel */
	spin_lock(&ubi->ltree_lock);
	le->users -= 1;                           /* user - 1 */
...
	spin_unlock(&ubi->ltree_lock);           

	return 1;
}

	if (err)...

	if (vol->eba_tbl[lnum] != from) {
		dbg_wl("LEB %d:%d is no longer mapped to PEB %d, mapped to PEB %d, cancel",
		       vol_id, lnum, from, vol->eba_tbl[lnum]);
		err = MOVE_CANCEL_RACE;
		goto out_unlock_leb;
	}
...
out_unlock_leb:
	leb_write_unlock(ubi, vol_id, lnum);     /* user - 1 */


Didn't the count have to bump up in this case?  This isn't in Thorsten's
traces, but neither are any 'down_read' or 'up_read' traces; maybe
everything is in cache?

Regards,
Bill Pringlemeir.
