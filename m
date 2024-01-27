Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E258EC47DA9
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Jan 2024 00:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llVL19J/Sa4la2I+Xz/cy/eabd4Cf3xiC5SJNzcsIaY=; b=fDqO6pN1YDt/Gx
	Yz6hurWUv8f19/TgnqrxgLn0gvY0JkX92DN7ogaY3mG686MDhTMIKEFKz8rXMN+0+9sMm9cJcmxrj
	3SEaXnqOeZ7LI/JNdNFhJ3lQLQEuXR+tUWJ5Qsv/vok3j6dO2v+VYDkQgw4MoTSYfVn07zD5GWysw
	tapEsQf5TsqrLyCQCALrl9vhrflHmwP0fhX+uWQ5iqxHWEoUYzFkFgjBHOe3Cp/DmDmgGvKYS5l+/
	HItS1Wy1CYLf5ESFCSR/ptpnrGeIGJ7iDRTLlSV/5bYo8RyCbmCXMnPJVBlOvK8jAT0JKDTziC+Gs
	l1PxPzjchcYdWt/oR5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWfH-00000005z4u-2VdO;
	Sat, 27 Jan 2024 00:35:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWfE-00000005z4a-3yqO
	for linux-mtd@lists.infradead.org;
	Sat, 27 Jan 2024 00:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5144162614;
	Sat, 27 Jan 2024 00:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34C8C433C7;
	Sat, 27 Jan 2024 00:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706315716;
	bh=fUrdat8KdA6Jyp77IRytZ+BgoCNIsywCAFvHbHyuIyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNdx9ozRTxh+MHqjdKQe4WIuwq7Wz/Yc5ZfapIQ8dIzXoVV7gsCgAvlvJi5oslb5g
	 MqIk8DljuTRVcH5T3nlabdT1644MOgiCCthYPbVyRv/NT7ceq7aGpGN7TVZiq2eccu
	 /GGEhP+k1qM/BfKbdbGirEBYUwcKjCyJrEI8mdcM=
Date: Fri, 26 Jan 2024 16:35:15 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, jaimeliao@mxic.com.tw,
	stable@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: spinand: macronix: Fix MX35LFxGE4AD page size
Message-ID: <2024012606-stylist-alabaster-b300@gregkh>
References: <20240125024816.222554-1-jaimeliao.tw@gmail.com>
 <20240125100820.174eb458@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125100820.174eb458@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_163517_053182_E4478EB6 
X-CRM114-Status: GOOD (  24.71  )
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

On Thu, Jan 25, 2024 at 10:08:20AM +0100, Miquel Raynal wrote:
> Hi Jaime,
> =

> + linux-mtd which was missing to your contribution.
> =

> jaimeliao.tw@gmail.com wrote on Thu, 25 Jan 2024 10:48:16 +0800:
> =

> > From: JaimeLiao <jaimeliao@mxic.com.tw>
> > =

> > Support for MX35LF{2,4}GE4AD chips was added in mainline through
> > upstream commit 5ece78de88739b4c68263e9f2582380c1fd8314f.
> > =

> > The patch was later adapted to 5.4.y and backported through
> > stable commit 85258ae3070848d9d0f6fbee385be2db80e8cf26.
> > =

> > Fix the backport mentioned right above as it is wrong: the bigger chip
> > features 4kiB pages and not 2kiB pages.
> > =

> > Fixes: 85258ae30708 ("mtd: spinand: macronix: Add support for MX35LFxGE=
4AD")
> > Cc: stable@vger.kernel.org # v5.4.y
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> =

> Looks legitimate.
> =

> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> =

> > ---
> > Hello,
> > =

> > This is my third attempt to fix a stable kernel. This patch is not a
> > backport from Linus' tree per-se, but a fix of a backport. The original
> > mainline commit is fine but the backported one is not, we need to fix
> > the backported commit in the 5.4.y stable kernel, and this is what I am
> > attempting to do. Let me know if further explanations are needed.
> > =

> > Regards,
> > Jaime
> > ---
> >  drivers/mtd/nand/spi/macronix.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/mac=
ronix.c
> > index bbb1d68bce4a..f18c6cfe8ff5 100644
> > --- a/drivers/mtd/nand/spi/macronix.c
> > +++ b/drivers/mtd/nand/spi/macronix.c
> > @@ -125,7 +125,7 @@ static const struct spinand_info macronix_spinand_t=
able[] =3D {
> >  		     SPINAND_HAS_QE_BIT,
> >  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
> >  	SPINAND_INFO("MX35LF4GE4AD", 0x37,
> > -		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
> > +		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
> >  		     NAND_ECCREQ(8, 512),
> >  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> >  					      &write_cache_variants,
> =

> =

> Thanks,
> Miqu=E8l
> =


Now queued up, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
