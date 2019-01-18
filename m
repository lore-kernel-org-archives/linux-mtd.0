Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B76C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386652087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsUVDRxs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPOUqKMM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 386652087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4INS4MWeYKLGwHfh6fi9zo80nKnQQbdQlb0k9L5Lq8=; b=UsUVDRxsD29nnJ
	GNVFhGWpif5Fr6c5Za2CeISwXk8z33adcoJwM+89lEJdDstNLghOycc6kDRUKhA1M/4RCjQmKvdjQ
	8nyC6CG8GCfPg44kIktJP25L/DOOgY6OGMweIOyylRQe+YiaohHrn7FVaVP76TIxKZPqJnyFNrlf0
	8IOf61JI1eEs2GSJ0r4IeJuNW3KIWAhs8+SFmh2ai4sQNlPMl8fuDWCPBAd9lOKtzBli0NM5gWcEc
	3RcheAY9/ArTRN32YLsO1Fh0aBfsYCxV4Oa4LUakxCz5g0IfuMLVdTrUBxDzRcJxiXAgrJU+IGW6w
	sTteSbHR12Da94Sjcq7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPBw-0005jK-Ns; Fri, 18 Jan 2019 08:07:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPBt-0005iw-Kk
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:07:51 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1737E20855;
 Fri, 18 Jan 2019 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547798868;
 bh=iycJr6kMP0y8uo8Se6qfTNrgbB+LhAyuaI7z/89S51o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oPOUqKMMPfNCqnbLw20NA61qi0SdMPmFMJH6DehB8UnC8dZxattVHb88ATKxDtHoU
 TLibIkiyd1fI3uBF7gSTsk5fZifycuAfgcGqEJFUi5PxKB7r1FfoGREs/oWP1edSdz
 S7yYSZ+lJh1Qd9LmSkggyrVT7qajrULBoptzlCkQ=
Date: Fri, 18 Jan 2019 09:07:36 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/8] MIPS: DTS: CI20: Set BCH clock to 200 MHz
Message-ID: <20190118090736.6f1283bd@bbrezillon>
In-Reply-To: <20190118010634.27399-1-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_000749_798350_3CA51992 
X-CRM114-Status: GOOD (  18.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 James Hogan <jhogan@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Paul,

On Thu, 17 Jan 2019 22:06:27 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> This is currently done inside the jz4780-bch driver, but it really
> should be done here instead.
> 

I disagree with that statement. If it's a per-SoC constraint then you
can select the appropriate rate based on the compatible in the driver.
If the clock rate depends on the NAND chip it probably means it's used
to generate the RE/WE pulse and should depend on the NAND timings
passed to ->setup_data_interface(). In either case, this should not be
specified in the DT.

Regards,

Boris

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
> index 50cff3cbcc6d..aa892ec54d0a 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -111,6 +111,9 @@
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pins_nemc>;
>  
> +		assigned-clocks = <&cgu JZ4780_CLK_BCH>;
> +		assigned-clock-rates = <200000000>;
> +
>  		nand@1 {
>  			reg = <1>;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
