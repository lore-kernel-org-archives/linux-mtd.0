Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488BBC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 18:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fn1bqIc1RGVOTybo0l7HogeaDP9zeW/fWohu7OLtWtI=; b=UJlDuRBX/IiBli
	DWfzj3G3u6c6fYohZYuSA/flhFq7ey8rdkb6AKdX9Ibf1JNEJEbAiX5pYYwAo75P2PCHPLhOsHA+0
	wdGxvP0PEl2FrjTuMzFCkmJQ/NQDY15k3Rm/6MAm3Wflot5D4Nc6cAwcYW9oxFHFdMxnSPNMRIrN/
	xVlGIzI5/T+55jGupPDfEDath6VAcgYNiPVeeprOOvFLdi/vZ2uirN21q0PxaiSmz6EA6jiTQSLNs
	m/KuDZoikL70uB+NqwPEkTVfpoUmQ+kmnj7caex75Xn5tBN5P7DIihDRHJQI35gg80bZtrT2hYzbL
	2dYn7BewPw35iCf3ngmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okVIc-00EMq8-Lc; Mon, 17 Oct 2022 18:57:18 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okVIZ-00EMoF-I7
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2022 18:57:17 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D8FFA5C0004;
	Mon, 17 Oct 2022 14:57:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 17 Oct 2022 14:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666033029; x=1666119429; bh=brZU7k6nAi
	83ZTeOEpnk113lxxOaz1ldrl7yzOIH/9s=; b=ATabucUNxT2IZzwjY0cLElccIl
	+m04lCbB8YTfC1pYoI0+v3eligTpcKg3vcfcDEOrJjVBgUHWpfUqJKs9vnmqBZ7T
	ynp7+i+o9wJD5v0aKrOm/epx7+hUH5lVKGtPuFlMRYbUk8FFflqvpJQKmS35Xeaa
	v1/7uQWh7vC647ONPNXsK8iYwJUSgXnz3hGBqgXjufQxuRvoctOtLwX279dl9t4f
	oCtK27Eudbx488CMFEmP1uxB4NmUV9vdsyOoxoEFcjR2bAD7RIyw/ypMfRHIBoda
	C8yAA5D2GqJ9QO1GJWIj2qs4kvLNc31jx/jnTju2wZGpPZr3kq+3G9mZ3d7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666033029; x=1666119429; bh=brZU7k6nAi83ZTeOEpnk113lxxOa
	z1ldrl7yzOIH/9s=; b=YTBTnVuhAeHfVpehGddq3C1sUKnuV97Z2TX1Ql6P2OXb
	UHCbKws0whxzyJQ+nrLT/jLD1i8yQn+effYSDNFzX6qiMilS98EoXSFN/7tGjThK
	uhMqLghECOQq5LQ5VeGwHjsdPsRx4yBXi6ztVP0rmx2+QTjfQMgxCssmk+mEQ+r3
	5qA8j8Tt8WzvKR1OerGDgK0jUxAoNo7ZyIFVAnq23K+OoudMbaS2Noo8ZOhcTkq/
	qN+/piCumESGRYvrEzN/pxRZ3jyL0XF389zMZ+B7Bbjc/dYAES6xo5Hr/9mSCGRC
	EwQlkIqdBG28frJRTUHvqLv65EjgrPB7q4QctaB9HA==
X-ME-Sender: <xms:haVNY6QKI0zelUrLJ8Laitauwb1mSfZiPdKYJOnFhLd8ZCtum6d6Bw>
    <xme:haVNY_z7oDVd9uXSjOCCNmq65goVwcR4ULBX-1qulcJCsV7f043CNwfc7chphqlzA
    cRXwM0PV5n251zPWpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekledgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeefhfdtgedvhfduteegvdekgfeffeetvdfglefgueegleduvdehieevieei
    hedujeenucffohhmrghinheptddurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:haVNY30KoENDtOGwHAf9ILJmM_NLSUJy8KYbOtNYlZrDIGff5azxjQ>
    <xmx:haVNY2AxsOpcFB7L8iDaHVw8UEuiY9ErjdhZIYXI2rKVpcwDVPYjsA>
    <xmx:haVNYzgKJTrMzwWwF9KNRVTspq9EsWDj2kwYrUkaATCCYbNKQ6wILg>
    <xmx:haVNY7YImI3YW5tznGGEgjvKergmda4jEe_X9yQ1RhQCDK8_JxORiQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9983EB60086; Mon, 17 Oct 2022 14:57:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <55aede4b-e364-4366-8261-bd461f542b16@app.fastmail.com>
In-Reply-To: <20221017152640.32362-1-vkorenblit@sequans.com>
References: <20221017152640.32362-1-vkorenblit@sequans.com>
Date: Mon, 17 Oct 2022 20:56:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Valentin Korenblit" <vkorenblit@sequans.com>,
 linux-mtd@lists.infradead.org
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, ye.xingchen@zte.com.cn
Subject: Re: [PATCH v2] mtd: rawnand: cadence: support 64-bit slave dma interface
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_115715_911228_105496D4 
X-CRM114-Status: GOOD (  16.31  )
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

On Mon, Oct 17, 2022, at 5:26 PM, Valentin Korenblit wrote:
> 32-bit accesses on 64-bit sdma trigger sdma_err in intr_status register.
>
> Check dma capabilities before reading/writing from/to sdma interface.
>
> Link to discussion:
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/3NMACGIM5NDUBPXRT5RTBZON6LQE5A3B/
>
> Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>

Seems reasonable overall based on the discussion so far.

Minor comments:

> Changes v1 -> v2:
> 	- Replaced ioread64_rep by cadence_nand_readsq (suggested by Arnd)
> 	- Replaced iowrite64_rep by cadence_nand_writesq (suggested by Arnd)
> 	- Do not try to access 64-bit sdma if __raw_readq/__raw_writeq are not defined


> +static inline void cadence_nand_readsq(struct cdns_nand_ctrl 
> *cdns_ctrl,
> +				       void *buffer, unsigned int count)
> +{
> +#ifdef __raw_readq
> +	const volatile void __iomem *addr = cdns_ctrl->io.virt;
> +
> +        if (count) {
> +                u64 *buf = buffer;
> +
> +                do {
> +                        u64 x = __raw_readq(addr);
> +                        *buf++ = x;
> +                } while (--count);
> +        }

While this is correct, I suppose you don't actually need that
loop any more, since architectures that have __raw_readq()
should also also have ioread64_rep() or readsq(). We actually
just had a few issues with that in another context, but I think
starting with 6.1-rc1 you should be able to rely on that ;-)

> +#else
> +	dev_err(cdns_ctrl->dev,
> +		"cannot read 64-bit sdma on !64-bit architectures");
> +#endif

It would be nice to print an error at probe time and fail attaching
the device rather than waiting for the first transfer to continue
with incorrect data.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
