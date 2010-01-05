Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSC6Z-00046d-SK
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 16:18:03 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>,
	"linux newbie" <linux.newbie79@gmail.com>
Date: Tue, 5 Jan 2010 08:17:11 -0800
Subject: RE: JFFS2 - speed up while booting
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFCE341F@SJEXCHCCR01.corp.ad.broadcom.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
	<Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
	<a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>
	<Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
> It can take a few minutes to complete the erase procedure=20
> though; if you do a 'top' on your system you'll see the pdflush task at=20
> the top while it is in progress, so if you reboot your system several=20
> times in succession JFFS2 might not have time to complete the erase of al=
l=20
> unused blocks.

This pdflush activity can take much longer on very large flash parts and be
almost unnoticable on small devices. The reboot command in busybox (and any=
=20
command that tries to flush data to flash) is also stalled until this opera=
tion=20
is complete. You might think the system is hung at this point but it isn't.

This is the typical erase cycle for one block:

Starting erase of pending block 0x1b200000
Freeing all node refs for eraseblock offset 0x1b200000
jffs2_erase_block(): erase block 0x1b200000 (range 0x1b200000-0x1b280000)
Erase completed successfully at 0x1b200000
Verifying erase at 0x1b200000
Writing erased marker to block at 0x1b200000


The real reason for the long delay is not the erase time, but the time to=20
validate that the erase actually worked and that all the data is 0xff.=20
If you comment out the jffs2_block_check_erase function below
as shown, then in my case, the 4.5 minute pdflush delay dropped to 2-3=20
seconds! I was using a 16Gbit large page flash for this test.

static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_e=
raseblock *jeb)
{
	size_t retlen;
	int ret;
	uint32_t uninitialized_var(bad_offset);

#if 0
	switch (jffs2_block_check_erase(c, jeb, &bad_offset)) {
	case -EAGAIN:	goto refile;
	case -EIO:	goto filebad;
	}
#endif


Darwin


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
