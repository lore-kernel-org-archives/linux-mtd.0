Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Onpud-0003rO-By
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 09:35:24 +0000
Received: by fxm12 with SMTP id 12so4440048fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 02:35:21 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTikidFJWVGVp-y2kzat7+PxVFx6e3-ozYx_wP=vZ@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
	<AANLkTikkRNqnEX0PkHigv=zT+Z36J52DEtoVeMGbBExf@mail.gmail.com>
	<AANLkTim6U4uO_2yf-VyoL+4j9-yDkouTQdP_aszpEXwW@mail.gmail.com>
	<1282566891.24044.32.camel@localhost>
	<AANLkTinqAT=aCYFBi8Nri72L898U0k6dTk3z90OJOpRc@mail.gmail.com>
	<1282574489.24044.74.camel@localhost>
	<AANLkTik+T6HA+umRvxj5oPmGwf5=tQvk-sNzSTqaq8VB@mail.gmail.com>
	<1282640035.24044.149.camel@localhost>
	<AANLkTikidFJWVGVp-y2kzat7+PxVFx6e3-ozYx_wP=vZ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 12:33:53 +0300
Message-ID: <1282642433.24044.153.camel@localhost>
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

> May I ask you to have a look at it. I can't really interpet some
> messgages.

I can't give you that level of support, sorry. You need to look into the
source code and debug stuff, or ask for support from your kernel or HW
verndor. Just quick notes: when module insmods without error, it is
success. Otherwise - failure.

On Tue, 2010-08-24 at 11:19 +0200, Arno Steffen wrote:
> =================================================
> mtd_subpagetest: MTD device: 0
> mtd_subpagetest: MTD device size 262144, eraseblock size 131072, page
> size 2048, subpage size 512, count of eraseblocks 0, pages per
> eraseblock 0, OOB size 64
> mtd_subpagetest: scanning for bad eraseblocks
> mtd_subpagetest: scanned 2 eraseblocks, 0 are bad
> mtd_subpagetest: erasing whole device
> mtd_subpagetest: erased 2 eraseblocks
> mtd_subpagetest: writing whole device
> mtd_subpagetest: error: write failed at 0x200
> mtd_subpagetest:   write size: 0x200
> mtd_subpagetest:   written: 0x0
> mtd_subpagetest: error -5 occurred
> =================================================
> insmod: cannot insert 'mtd_subpagetest.ko': Input/output error
> [root@or:/opt/configs]# insmod mtd_stresstest.ko

Your flash driver reports it supports sub-pages, but this is a lie and
it does not. Writing a sub-page results in an error. Dig the driver.

> =================================================
> mtd_torturetest: Warning: this program is trying to wear out your
> flash, stop it if this is not wanted.
> mtd_torturetest: MTD device: 0
> mtd_torturetest: torture 32 eraseblocks (8-39) of mtd0
> mtd_torturetest: write verify enabled
> mtd_torturetest: block_isbad() returned -22 for EB 8
> mtd_torturetest: finished after 0 erase cycles
> mtd_torturetest: error -22 occurred during torturing
> =================================================
> insmod: cannot insert 'mtd_torturetest.ko': invalid parameters 

Dunno, you need to debug your driver.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
