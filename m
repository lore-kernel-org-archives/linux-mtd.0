Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnu09-0007Vr-NS
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:29:38 +0000
Received: by wyf22 with SMTP id 22so2411112wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:29:36 -0800 (PST)
Subject: Re: mount ubi volume fails: No such device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lh_post@yahoo.com>
In-Reply-To: <421430.70003.qm@web30207.mail.mud.yahoo.com>
References: <421430.70003.qm@web30207.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:28:27 +0200
Message-ID: <1297434507.2760.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-02-09 at 00:32 -0800, Lars Michael wrote:
> > On Mon, 2011-02-07 at 07:05 -0800, Lars Michael wrote:
> > > UBI: scrubbed PEB 863, data moved to PEB 1097 UBI warning:
> > ubi_eba_copy_leb: read data back from PEB 1092 and it is different UBI
> > error: wear_leveling_worker: error -22 while moving PEB 868 to PEB 1092
> > UBI warning: ubi_ro_mode: switch to read-only mode UBI error: do_work:
> > work failed with error code -22 UBI error: ubi_thread: ubi_bgt0d: work
> > failed with error code -22
> > 
> > It says you that it wrote some date, then read it back, compared, and
> > the data did not match. You need to start with validating your falash
> > drivers - use mtd tests:
> > 
> > http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
> > 
> 
> The speedtest, stresstest, readtest, pagetest ran ok, but showing 1
> bad eraseblock. I guess that is acceptable?

Yes.

> The oobtest and subpagetest found 3 errors, see below. Does it explain
> my initial problem?

Yes. You cannot go forward with UBIFS before you have fixed those.
Esepcially subpage test is relevant to you, you really have to have it
fixed, or you can just ask UBIFS to not use sub-pages and see how it
behaves, but this is less optimal.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
