Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A00FC54791
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 02:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZhCPaIki3T7Kq2cZHDbxTTFnAmycV/Ebpo7z/JWxRY=; b=BSxmHduNwYykVW
	O0GazgnWQ9/S/cpN38AwYBA1o2IacadZcOs+HVboD1PuwVryA2TP+JwQnDVobifGp6lJNdjuPb0X/
	6EnJ4ZXSz/17rjx1kZq6hc0xjfJ/kWndfmdFW/j0yOIguItAD0TRPsksRqP9rD9ErQ8qy1tUWt3uG
	C4CazbcdhkNugpZz4TcHoQTNGZ6VoEqV1wiay2Trx9hx5Sjxc+LqyvX8nmhXTj9olI3EoQ9Bi7s/i
	PyTPVFRojyQ6+iBdCWw1+XJ7gHI541ACjnrUmCHjapX6od7oi4MWDC94ggtGz5DFxjRqr6Vkv+bkC
	huQnKly/dus6X9SynhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjVXc-0000000HXgT-30ZQ;
	Mon, 11 Mar 2024 02:37:28 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjVXY-0000000HXfd-1CHb
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 02:37:26 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rjVXJ-0005rO-36;
	Mon, 11 Mar 2024 02:37:10 +0000
Date: Mon, 11 Mar 2024 02:37:07 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
Message-ID: <Ze5uUyUuEDBM3p43@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org>
 <82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org>
 <20240219120156.383a1427@xps-13>
 <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at>
 <ZdvV1KABu_UCSL7B@makrotopia.org>
 <1754825522.38834.1710105437883.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1754825522.38834.1710105437883.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240310_193724_373987_60B04B9D 
X-CRM114-Status: GOOD (  26.36  )
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

Hi Richard,

On Sun, Mar 10, 2024 at 10:17:17PM +0100, Richard Weinberger wrote:
> Daniel,
> =

> ----- Urspr=FCngliche Mail -----
> > Von: "Daniel Golle" <daniel@makrotopia.org>
> >> Finally(!), I had enough time to look.
> >> Thanks for addressing all my comments form the previous series.
> >> Patches applied.
> > =

> > It's an enourmous coicident that you are writing just now that I found
> > a sizeof(int)-related problem which triggers a compiler warning when
> > building the UBI NVMEM provider on 32-bit platforms. I was just about
> > to prepare an updated series. Literally in this minute.
> > Should I still send the whole updates series or only the final patch
> > (as the necessary change is there) or a follow-up patch fixing the
> > original patch?
> =

> I have just merged your fixup patch. So all good.

Thank you!

> =

> >> =

> >> I have only one tiny request, can you share the lockdep spalt
> >> you encountered in ubi_notify_add() regarding mtd_table_mutex
> >> and ubi_devices_mutex? The solutions looks okay to me, but
> >> if you have more details that would be great.
> > =

> > I will setup a test build to reproduce the original warning and
> > let you know shortly.
> =

> Any news on that?

I've tried for days now to reproduce this on recent kernels and fail
to do so. Ie. when using regular mutex_lock() instead of
mutex_lock_nested() I no longer see any lockdep warning with
linux-next. It could be that I'm chasing a lockdep ghost...

> BTW: Is there a nice way to test this with nandsim in qemu?
> I'd love being able to test all ubi attach code paths on my test setup.

From what I can tell 'nandsim' doesn't have a way to be defined in
Device Tree, making it unsuitable to test the attachment of UBI in
this way.

However, QEMU does support emulating TI OMAP's OneNAND controller, eg.
as part of the Nokia N810 hardware supported by qemu-system-arm, see

https://www.qemu.org/docs/master/system/arm/nseries.html

So we could use that and modify the device tree in Linux to have a MTD
partition for UBI and 'compatible =3D "linux,ubi";' set therein:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi#n84

If you like I can prepare such a test setup.

Is there a repository for MTD/UBI tests to be run on QEMU which I should
contribute this to?


Cheers


Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
