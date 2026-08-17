Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD37AC5B572
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2026 05:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nenIRWFhZb6txjlbO+PSeADUZj/cPeL3uMxOkS59ZAg=; b=0FT8MwWbmcCFbc
	FLbiWVnL7HHUQ7n0fC9QQabq3zw5r9wMmpff9JwFQVSNmu5LuhZ3zyH7z8+epiMIljnIbu2yrp5m+
	qlstnEZzJzmVvgqG27We4WnScm2UHZGHFTmkjs4XuMPxHhZbBxvD2sZKuZrJqiTEngD/vCn50XXo4
	1gaiVWAbC0XxCooKSilLjJaKxt8o80OJHN0yOOSQ/XP03JuPVduWqoMw8lXYkWB/c4RS+78IcMyIN
	+1C41ZNQxcTnl0Y2eYhy8IkJyKRtLGySn3u45W1seyRJowj8v+UXmLBi4CzP76xHFbtj/L/SxFset
	AXvpEGP9bNftAUZdJW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpmo-00000005R2O-2aB0;
	Mon, 17 Aug 2026 05:21:26 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpmm-00000005R1z-0Iwk
	for linux-mtd@lists.infradead.org;
	Mon, 17 Aug 2026 05:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786944079;
	bh=JFcy3Wc1ev9TJYPaW9onVUV6Qu7dhyqkvUY4s2GO6o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/NDXDQBk8xdLesas1T/zRY/VYE1wlWIWQZTz0blybxIivycAxjEc3Aqwp59YAC5i
	 TclqutlvT0ESoq5DGZb8EgofrO8nz40df2vMpnhBaKOL1wECB+6ZbWpJv2R2gjCOqU
	 RzH70OZoavyCeIdaRPM6HNI9bbA2X8pF/xRdg0LzyjBCkEoTp5kS+luEUxXPa+ie3W
	 LumnoA8T25PbTspDzNYmlQc5gp3uOPVSE3H97b4mwCA3xHeCqirOXTvgABz1WK//DZ
	 hNRQROuHv33+vfPgbmVfgnEX68NGNXicTjPOu3gVFOJGSVokuN8I6JeDHlX1DZt22W
	 NB3tgYvT3k94A==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 32DBC836
	for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 14:21:19 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=LEFpYmLR;
	dkim-atps=neutral
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 108C9836
	for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 14:21:18 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3440892a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2026 22:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786944077; x=1787548877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoQVukNFHORcEJRS2cqOoqlMj+TxEPbZPN8vtZ9zCec=;
        b=LEFpYmLRI2X2DhK6my+R9TUEnCwfhEnT4rRd83zcsioy7hJqLOkRmpMBfM5ioVzKQL
         lDxRrs2c9hV/wJAhwJ2xDjcx9G0FuXt3eA5EKMCMLg1IeA3h7oSxy5EN6pBn+pj2ZFNe
         ZkivDR+z2aoprMjnbgLvTPtC9PcbAZHsOfden8wA/HTIfXl3olJUbyHqpIJh+ZrSf9RL
         gP5V0PM3nvLpm+UqKzCtyLl+CllOQgrsFsRFzNiE/lA95oXpSEPCpNTECTVg/3Eq6ax0
         M3FvYeiQ5NP8Vhu89O+sk+sv6peADGdyf/ZeAHxqIMEtFciLlm5Rr/a4XJnK9yWXfS8L
         7p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786944077; x=1787548877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoQVukNFHORcEJRS2cqOoqlMj+TxEPbZPN8vtZ9zCec=;
        b=hMXrmFSldsCB/QHbPSN/s4tv5kXxcPIPp4wCloRtDUbSuFJemmomMgbBz/kZfwmWwr
         E1T8Ij5XJIrjx+rcrxL/lAv6Q8Q3LO01qRYcMnGZ4/pOvpAnInn0n3/kJGxUeAGAzRnz
         96K8FIdIEcVz9tkS0Eb93RlZrrSMnjb+NRz1IKY0JGa23VBhzrsZXRkU3oDwdiDY5Sn3
         UZbkG3zT5lPeb3ZkOuIenESxS62Ssrg2w8qRPBliXFJbTHcuWaothZ9PvSSG5Fb1xhk3
         IznP0Ikw7/PR1/QDjihtK55XvOfvF/SP8cowM4LRi50FOINcMDjhko2kGTfz2gG7NET8
         rkDQ==
X-Gm-Message-State: AOJu0YxwDDZfXWxqcMumVDhOH56UCTNWL6MosULkQ2XLJYNblpf6l51d
	WIwDfygjTx+pi5qq6UFJ8cWMOrb6ykNc+PGDrCd3TOMEP/MJJuvuIrNlwqhdN0vuCc4kKEHF5sr
	y5r9ljp/RKJzBMj9AV06gcZF9TBqMY0neJetYPtUDQdO39U8cuccyn/x/gwFQVXeBXzEh
X-Gm-Gg: AR+sD12vxH9kjQx101D97N5QMh4W53Wn1jUj2c6jRdUM3tRzAsY3K9FiJXDTyF5GP1d
	ylno2/bDsxBsgl3G09WHVsQyfGnzyCC5TAReHAAFlirTEueTy5IKPbRDwQFVXz48MaY+M+63m2Q
	EysYuh9TGd2QIBlfEMEALPsQN8DBH24ofyO4xeCfKq9u/s5DvicNldUPspzzI1Dtf79rZvfTBDK
	AWr6fAt57CHZcou4VGoi+QYVUjANsPCUT/7PfLPyb92nLFlALEDhW/o3DC/x5my4ZYbOi7fQ+I0
	Dl2b2o30G+0wVkaAgJ6ee3rWXwj+AsU5BiBmpWNzQ+gzcra7JZexFDioPOHiXVJ9yuckK0rjqvg
	4YQtU2HVDDpDVA7QyQ+Nq2CkFZZ2ICKFW/pItl30zii3UuG89
X-Received: by 2002:a17:90b:2f10:b0:38e:f6eb:2b38 with SMTP id 98e67ed59e1d1-3933e63ba0bmr22671489a91.17.1786944077253;
        Sun, 16 Aug 2026 22:21:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2f10:b0:38e:f6eb:2b38 with SMTP id 98e67ed59e1d1-3933e63ba0bmr22671457a91.17.1786944076793;
        Sun, 16 Aug 2026 22:21:16 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-39531e31b8fsm3352349a91.3.2026.08.16.22.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:21:16 -0700 (PDT)
Date: Mon, 17 Aug 2026 14:21:04 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Md Sadre Alam <md.alam@oss.qualcomm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daisuke Mizobuchi <mizo@atmark-techno.com>
Subject: Re: [PATCH v3] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <aoKaQLEY6bAyg5Iv@atmark-techno.com>
References: <20260814-w25n04lw-v3-1-c6a7423ac7d0@atmark-techno.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814-w25n04lw-v3-1-c6a7423ac7d0@atmark-techno.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_222124_233403_4842EE80 
X-CRM114-Status: GOOD (  22.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dominique Martinet wrote on Fri, Aug 14, 2026 at 08:12:11AM +0000:
> - I still need to check about the high number of ecc errors next week,
> but I don't think it's likely to be related to this patch so sending
> ahead... Feel free to wait a bit (there's no hurry on my end for this to
> get into 7.3; it's fine to skip a cycle as you see fit)

That looks like to have been hardware related, I've tried two other
identical boards and these worked fine (one had zero ECC error, the
other had a handful but nothing like what I was seeing)

That was the last item left on my list of things to verify,
so I thought this patch was now OK, but sashiko's comment is spot on...

> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 9b78c1e6cbc9..171f4c264220 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -326,9 +327,16 @@ static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
>  static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
>  				   struct mtd_oob_region *region)
>  {
> -	if (section > 3)
> +	if (section >= mtd->oobsize / 32)
>  		return -ERANGE;

From sashiko:
> Does this change cause a regression for the W25N01KV device?
> The W25N01KV chip uses this shared w25n02kv_ooblayout_free() function
> and has an oobsize of 96 bytes.
> With mtd->oobsize = 96, 96 / 32 evaluates to 3. The new check 
> (section >= mtd->oobsize / 32) will return -ERANGE for section 3, whereas 
> the original code (section > 3) allowed it. This drops the 4th free 
> OOB region for W25N01KV devices.

I could find the W25N01KV datasheet online and it's correctly 96 bytes
with 4x 16 bytes user data and 4x 8 bytes ECC, so this patch is
incorrect (I had only checked w25n02kv_ooblayout was only used with
oobsize = 128, but w25n01kv_ooblayout also uses
w25n02kv_ooblayout_free...)

I'll send a v4 with fixed functions, even if it's less elegant.

-- 
Dominique



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
