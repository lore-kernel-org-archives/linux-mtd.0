Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763CCC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1slYMMXcqA7wl6JahS2OXRs3qP5cm+lFdYLVI+9eZso=; b=pfQcVhU0PRMwGH7xJjMf+44ZBR
	6jPaKz++pWDS8VlSadX/ybXKOgh2hDfs9SnaARe4vzD4x3vQlTttaY7g2zyeRkaOT5w8kHWMHT+ek
	82Q/Jv3aWrMBHK2LjSTHmnV9Ekve4TkFoLpxgKkQQRLM8cFzMepB5BcEOySfHrbsOixQngmhoyCJS
	bcA+Ng1o6UmDi6IEyytIXuUt8yGr7xpkMfpViIgPyGyS/QGPOoFMloTNYHrhJe/kyYDSRBNA0QHzV
	EesvqsbJh1jucpww7h0ZUywKduyckrOpP6mEvYTxD3fDWwu0/PS9dbt6rV94iGbN0O+6UTzGxgNc+
	wVf6YW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLX7-00CX91-VQ; Wed, 04 May 2022 20:23:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLWr-00CWyL-0l
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 20:23:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id m20so4998842ejj.10
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=9J1muNG7xxQsE+IQE8kK9Xe8x16+0OIP6QRk6sSLBHA=;
 b=HEK2utQXKHjtqLbqX/vqazx+hdZwt+Mg2EADF9WqJbFE5pMaDWvvu2FF2xc+26Q687
 ecMTl3kbnmdnSaNDtLpoo66vFp/eZlI2Z2WmQK30epJ8vLQGiexgkNtz7KKiG9Lz0PYx
 KU0ZGHdSruT4oWtDPR8ByQeAhB8aKdEcAKCYTusdSGiZ0Y6gNEEe5ml+Jrn/66bLpr7h
 TAs9lprs6QHYk1Sg32LzjBeUJ0mUPVWTTrJArdq5ynzMim4OcXiTMLXrRMvF60znfTqt
 RZ9HNUibOoW453GAI24+8tVkt15XJQ6U89hfMLqj/Gy6DtyAIWNU8+EB/Gjh1b74RM4G
 d8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=9J1muNG7xxQsE+IQE8kK9Xe8x16+0OIP6QRk6sSLBHA=;
 b=YrHeJkKYpziCGywB1jlf8Bloj0J4SOtEgXxnWLyOstRCX4DA6vFDIXFbmvkvl46Ev+
 e1SlZEgNJzGeYfsittKN34dV9tgMDRz37KfDkcxt/utjcQRr5lEl/LnRE1T9K/g2o5J5
 40mXKQB4pWLSBudtW+7Hlf4BT6+KtaU66kmSarDQhYHquLbwth4gBXX3UtTt2j9MQEua
 u63AUhi1DsJyhdNbPEiBSrKmhHdobpno0sI1uYNq68bdSFzOESHSqC30G5sl8cuCNk6i
 lsXaMmAX2vUE2r7beUeKtm3ui5Xdwrw11+wleaGlYYgP6xdcxY+1fJdloFTEYvEB6YLE
 wbiA==
X-Gm-Message-State: AOAM530uDJAAHnt+snsyy1LGcXqai/A+JNZjNlkjufTTEpBLFDpxM4TP
 lRi2SW/cLc3vVb9lEzYLtRw=
X-Google-Smtp-Source: ABdhPJwRIRMKn8SmQQLwOuNdIe7xBc/BywkOBRX4mCM0mgbE0qRs0UsZGf3yaw4d4xA3xKs282RfJg==
X-Received: by 2002:a17:907:1c01:b0:6f4:2692:e23 with SMTP id
 nc1-20020a1709071c0100b006f426920e23mr19550187ejc.243.1651695797311; 
 Wed, 04 May 2022 13:23:17 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 bo9-20020a0564020b2900b0042617ba63a5sm9559652edb.47.2022.05.04.13.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 13:23:16 -0700 (PDT)
Message-ID: <f511426e-47cd-7139-baab-ff31c9be2ba3@gmail.com>
Date: Wed, 4 May 2022 22:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [RESEND PATCH v3 0/2] Add nvmem support for dynamic partitions
To: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220429124825.21477-1-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220429124825.21477-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_132321_150358_00DF7586 
X-CRM114-Status: GOOD (  31.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29.04.2022 14:48, Ansuel Smith wrote:
> This very small series comes to fix the very annyoing problem of
> partitions declared by parser at runtime NOT supporting nvmem cells
> definition.
> 
> The current implementation is very generic. The idea is to provide an of
> node if defined for everyone and not strictly limit this to nvmem stuff.
> But still the actual change is done only for nvmem-cells mtd. (just to
> make sure) This can totally change by removing the compatible check.
> 
> The idea here is that a user can still use these dynamic parsers
> instead of declaring a fixed-partition and also declare how nvmem-cells
> are defined for the partition.
> This live with the assumption that dynamic partition have always the
> same name and they are known. (this is the case for smem-part partition
> that would require a bootloader reflash to change and for parsers like
> cmdlinepart where the name is always the same.)
> With this assumption, it's easy to fix this problem. Just introduce a
> new partition node that will declare just these special partition.
> Mtdcore then will check if these special declaration are present and
> connect the dynamic partition with the OF node present in the dts. Nvmem
> will automagically fin the OF node and cells will be works based on the
> data provided by the parser.
> 
> The initial idea was to create a special nvmem driver with a special
> compatible where a user would declare the mtd partition name and this
> driver would search it and register the nvmem cells but that became
> difficult really fast, mtd notifier system is problematic for this kind
> of stuff. So here is the better implementation. A variant of this is
> already tested on openwrt where we have devices that use cmdlinepart.
> (that current variant have defined in the dts the exact copy of
> cmdlinepart in the fixed-partition scheme and we patched the cmdlinepart
> parser to scan this fixed-partition node (that is ignored as cmdlinepart
> have priority) and connect the dynamic partition with the dts node)
> 
> I provided an example of this in the documentation commit.
> In short it's needed to add to the partitions where the compatible parser
> is declared, a partition with just the label declared (instead of the reg).
> Then declare some nvmem-cells and it will all work at runtime.
> Mtdcore will check if a node with the same label is present and assign an
> OF node to the MTD.
> 
> I currently tested this on my device that have smem-part and the
> gmac driver use nvmem to get the mac-address. This works correctly and
> the same address is provided.

Thanks a lot for working on this.

Another case (that I need this work for) is cmdline parser. Some
partitions passed by U-Boot may require extra handling and that needs to
be described in DT.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
