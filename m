Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0VAS-0000Q4-Ov
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 08:04:05 +0000
Received: by bwz19 with SMTP id 19so5458141bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 01:04:03 -0700 (PDT)
Subject: Re: RE : UBI/UBIFS interrupted write page handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CA19DAE.7030402@parrot.com>
References: <4C88DDD5.4060507@parrot.com>
	<1284054669.11335.21.camel@brekeke> <1285006478.1762.1.camel@brekeke>
	<4C9B7CD8.4070806@parrot.com>,<1285266914.1766.1.camel@brekeke>
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>
	<1285523911.1776.9.camel@brekeke> <1285657088.2437.23.camel@localhost>
	<4CA19DAE.7030402@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 11:02:14 +0300
Message-ID: <1285660934.2437.44.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-28 at 09:47 +0200, Matthieu CASTET wrote:
> Artem Bityutskiy a écrit :
> > On Sun, 2010-09-26 at 20:58 +0300, Artem Bityutskiy wrote:
> >>> The test is still running, but because for each boot we got this slow
> >>> dump (take near 1 min), I expect others errors to take longer to
> >>> appear.
> >> Your PEB 20 contains almost all 0xFFs, but not quite, and NAND pages are
> >> read with ECC errors. I think this is a result of power cut during
> >> erasure.
> >>
> >> My new patch-set is trying to detect situations when we have a PEB which
> >> contains important data, but its VID header is corrupted. We try to
> >> preserve such PEBs instead of erasing. UBI would not spam so much if
> >> debugging was disabled.
> > 
> > Matthieu, thanks for testing the latest UBI changes. I wonder, do you
> > have issues with the follow-up fix I sent you. I just wonder if it is ok
> > for me to put these patches to linux-next or it is better to wait a
> > little?
> > 
> That's better : interrupt erased page are not put anymore in corrupted list.
> But I have problem with interrupt write :
> this night the test crashed [1].

Yeah, this should be fixed by forcing LEB refresh for the last LEBs of
journal heads. This problem exists long time. I'll work on this and send
you patches.

Then I'll push the patches to the linux-next. This means I'll re-base
once again the master branch - will you survive such frequent
re-basing :-) ? But once the stuff in the linux-next - I do not rebase
it.

We also have the outstanding gc_lnum problem - did you see it in new
ubifs?

Also I wanted to add re-try logic to UBI read path, so that we could try
to read several times if there is an ECC errors, because as you pointed,
re-trying sometimes helps. However, this also needs a fix in mtd, which
is currently in my l2 tree:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/755e723d39ac6975e6488298e129284e30d74823


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
