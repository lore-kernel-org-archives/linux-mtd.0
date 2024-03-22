Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E51C47DD9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AhItZnZDqdAHsb1ckS+QQx9AbDBzOTE/VITUCzfCnk=; b=NljNOgmriXPDac
	RlSwrOOIzYn0opXLfmyHgKD3QATh1uOQRppJWQoVhooJwsvBYKb+q+UBdRt8UpnIif/zcG8XpSI9y
	TO0JbpGzT4RdYc6/z0ku7czkP7Ldi9yKnotk+qkoQYoCKNEA4C2pW/3FMmRZLqxbNiOG+MzuPjwtz
	iXZFQCua6M87rBOXwTl2auvCG7UFMZmZi43WO9o37BaKYzZMnB11oqR2CVGLaUKWBd7X6iPnxHbxB
	30FeOZqryDRtfDEGxqYBmzeZ43nN1RRwxuHNw5XbARKf4EfIXzcBAMS5MFuTPMpEy4O+d9OYIej2K
	8frVexK9+fmt9NqeL6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhGe-00000007qMW-0DUv;
	Fri, 22 Mar 2024 15:57:16 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhGb-00000007qLL-0phj
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 15:57:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rnhGL-000542-0p;
	Fri, 22 Mar 2024 15:56:57 +0000
Date: Fri, 22 Mar 2024 15:56:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	david oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
Message-ID: <Zf2qQSRWYDzKd4--@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org>
 <82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org>
 <20240219120156.383a1427@xps-13>
 <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at>
 <ZdvV1KABu_UCSL7B@makrotopia.org>
 <1754825522.38834.1710105437883.JavaMail.zimbra@nod.at>
 <Ze5uUyUuEDBM3p43@makrotopia.org>
 <1196553263.78350.1710887478387.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1196553263.78350.1710887478387.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_085713_258081_E3EF52FA 
X-CRM114-Status: GOOD (  27.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 19, 2024 at 11:31:18PM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Daniel Golle" <daniel@makrotopia.org>
> >> BTW: Is there a nice way to test this with nandsim in qemu?
> >> I'd love being able to test all ubi attach code paths on my test setup.
> > =

> > From what I can tell 'nandsim' doesn't have a way to be defined in
> > Device Tree, making it unsuitable to test the attachment of UBI in
> > this way.
> > =

> > However, QEMU does support emulating TI OMAP's OneNAND controller, eg.
> > as part of the Nokia N810 hardware supported by qemu-system-arm, see
> > =

> > https://www.qemu.org/docs/master/system/arm/nseries.html
> > =

> > So we could use that and modify the device tree in Linux to have a MTD
> > partition for UBI and 'compatible =3D "linux,ubi";' set therein:
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi#n84
> > =

> > If you like I can prepare such a test setup.
> =

> This would be great!
> =

> > Is there a repository for MTD/UBI tests to be run on QEMU which I should
> > contribute this to?
> =

> UBI tests reside in the mtd-utils repository.
> http://git.infradead.org/?p=3Dmtd-utils.git;a=3Dtree;f=3Dtests/ubi-tests;=
h=3D20fd6a043eeb96a81736dd07885f74e4e0bb0cc0;hb=3DHEAD
> =

> Maybe you can provide a small shell script which configures qemu?
> It doesn't have to be fancy, just something David or I can use as staring=
 point.

I'm working on it but it turns out to be a bit more difficult than I
thought it would be, because

 * the only devices with NAND flash emulated in QEMU or Nokia N800 and
   N810 as well as some even more ancient Intel PXA270 based PDA like
   the Sharp 'spitz'.

 * QEMU support for the N800 and N810 has apparently been bitrotting and
   is broken at least since 2019, nobody seems to care much.

 * The spitz predates device tree and hence is unsuitable for testing
   attachment of UBI via DT. But it at least boots because Guenter Roeck
   makes sure it does[1].

I was about to create a spitz-like imaginary board with DT, but also that
doesn't seem to be completely trivial.

So: hold my beer, I'll be back shortly ;)

If anyone has better ideas on how to utilize support for raw NAND or the
OneNAND controller in QEMU in a device-tree environment which actually
works, that'd be great. Obviously I don't care about other peripherals
like Bluetooth and all the complicated stuff of the N80x...

[1]: https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/run-=
qemu-arm.sh#L64

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
