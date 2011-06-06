Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTcPe-0000Ls-Kl
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 16:12:23 +0000
Received: by eyh6 with SMTP id 6so1700592eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 09:12:20 -0700 (PDT)
Subject: RE: ubi image only mounts once
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Douglass, Woody" <Woodrow.Douglass@QinetiQ-NA.com>
In-Reply-To: <29EDD457F13D0846B91A4845A68C3836E4657A@BOSQNAOMAIL1.qnao.net>
References: <29EDD457F13D0846B91A4845A68C3836DF7DEF@BOSQNAOMAIL1.qnao.net>
	<BANLkTi=ymbNh93riTAjJ5RVFXogYt9HPYg@mail.gmail.com>
	<29EDD457F13D0846B91A4845A68C3836E4657A@BOSQNAOMAIL1.qnao.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 19:08:03 +0300
Message-ID: <1307376483.3112.94.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, "Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 11:53 -0400, Douglass, Woody wrote:
> Matt, 
> 
> Thanks for the quick reply. I have tried both ubiformat (passing -f with
> my image) and nandwrite, both seem to behave the same way. The
> filesystem mounts once, but when I reboot, it doesn't ever mount again.
> 
> I cannot upgrade my kernel as my development schedule is too aggressive;
> I don't have time. I'm using 2.6.32 for now; if I fail at getting UBI to
> work, I can fall back on jffs2, which works, but I prefer UBIFS.
> 
> Note that I did successfully load a ubi image with this kernel In the
> past with a filesystem image generated from OpenEmbedded. Could my
> mkfs.ubifs/ubinize be the issue?

I am sure the problem is your OMAP flash driver - it does not support
sub-pages correctly. There were several discussions. I have not idea
what is your kernel and which hacks it has.

Anyway, first try to check if I was right - run the mtd_subpagetest
test: http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

My prediction - it will fail. Let's check this.

If I'm right - you have 2 choices:

1. Fix the driver.
2. Do not use sub-pages (means you'll waste a bit more flash space).

For the latter - assume your sub-page size = page size = 2048 bytes, and
adjust your mkfs.ubifs/ubinise/ubisformat parameters accordingly. Feel
free to ask for more help - I do not want to write much now before you
have verified my theory.

Also, running all mtd tests is a good idea.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
