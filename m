Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97D8C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:39:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D482964E6F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D482964E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ykn0FzgY0DbWY3CnnCuupyAeFqKpXl44NwJaKwI+Z4Q=; b=ChT67MAV6RaVVglOvpZrxFUyX
	gGuSkrN17szX5z5WTExl0ibPOYcTVhke9KfVrcLZG+R+3pwFIuBqt5rZOjau/V6vVvwgr8pNI0K7U
	CuMsnOUx9G9QLAomhTdmGKIHVQwqH8R4rO7/Zl1bHDHs1EoeFV7i9NOhwxrmyWkbPuiDoH2LKjQOH
	T6hGsF8ZnzHzbOpw4nfRlQyp2K9BR+G8Iu7IEjZ/QF9I5j5J+hl1rcAXmvNNscd1q2FWmQk4GBjEp
	iczAAT71QyX0/wJ9aG+vTLdHYgeov4t27k9HJ1/B2euVM+p31LUB9WUMhLisSaeD6kc0dJ7bDqGjQ
	JdESARibg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUWA-005dSJ-RS; Wed, 03 Mar 2021 16:38:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSqL-005EDV-Aq
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=faWbq/WMv3ZR1gToxIr2aLjBRTdDNxo7+ThXJjNGaIo=; b=j4Euwth80M7rNgpDdy8UVNmbID
 g0DyvhrXrRgCzkveWt5RJHmv/SGToNFI8LOranSVCbXcEsBRoAiaorZvDNhQmeUS2cCm8IHdcfXEE
 NZxRWelsjGihkaBsB09qOceJbFHA9czO/Dr/llxueyT0bLJ706P6g0gHfLVxsiJyg1oJ9MryzdBLb
 KGp84lITweiU4M73YwkJRs8sDH4CiUva+SQcP65q18Yydo2PmbNG3+qRH1cQhaxBhFsvt0uxy2SUq
 FCuEtm2hMNPfn+7MI3t64zKTBJeSSSBrCJmTqw5zUAg0jTMnJi75tVaG1jK9Am9fPxiSxKb6CGQI2
 JI9DGWHA==;
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8IZ-00HULr-Qx
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:55:09 +0000
Received: by mail-lj1-x22b.google.com with SMTP id h4so24634513ljl.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 08:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=faWbq/WMv3ZR1gToxIr2aLjBRTdDNxo7+ThXJjNGaIo=;
 b=hmBekdGUxUExGQJ6JMFq6hE1MDzFwReePVI8GOf5z4T/95msnW4QO3MIEmsO/NaKEZ
 LQfdb7pOMUeCUrqJguC1IlMp+uzDJsrDME3ZJ4TsZsp8DARjnnLKhq2geD/GpRoRy+qk
 cK4b3GUoy4msSiT31Kdapphy7vtzuw8gdONd1mdwu2R8etVGOFwIvxuofeUW0ov7Kxv2
 +N+ERu2Szxo46lPTqNtzQbUcmsKEovWNcqH4YXgOc9MWnQmlPjDlE5Y1jvsqYLYljb7x
 HmARZIYImzMPiiltdmcOdY6Jm7gSjKsYT2xwxXTTekQIGMZxxulQAND9KJOoHvar31hO
 91uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=faWbq/WMv3ZR1gToxIr2aLjBRTdDNxo7+ThXJjNGaIo=;
 b=Y1EnyPAZKmhZwzt29Qvt7YoI069pNIh8iR7DhtpBUSz7t5IWMPFMcilZXgnxwZnUJA
 r7WIehBRljD76CLdnw21hLZuHS24cEBnNsHP+51dr/Kqy0dp0MmRZ7GnkVJHcu46B1BT
 xItQDi5L9e4HWwb+swJmyXNMk1wwwSUlChJoFXWba34a2ktDb1EHlUkgV/bmAkAUEQ4i
 UrgT72KVA1/0/jOAPgoaxIk2/MzVqKvCFx6jdDNG9aat9vq2z9U3HtagA/GonAvEPly6
 8DXvJACtaWDh8qt1YUTxRAeEdxjInRuwTYA51ZwN4IPeTPF3VwMG/SmS8nAs4kowF7Ep
 ip2A==
X-Gm-Message-State: AOAM530qiw4bm+vLU1M5+JMKPK7I50zjnD1N2xWYDPHWvDtYagp8syLs
 DCGMGUJa/yPms9fyrbS5aus=
X-Google-Smtp-Source: ABdhPJw/W01gIjsqpMNr8JSw/9SiRbUKcitCde7eXbhpqsWpDs9pwVC/y07CdIyBdlketTmha75GtQ==
X-Received: by 2002:a2e:2e19:: with SMTP id u25mr38659lju.487.1614704037798;
 Tue, 02 Mar 2021 08:53:57 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id g2sm2894780ljk.15.2021.03.02.08.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 08:53:56 -0800 (PST)
Subject: Re: [PATCH v2 1/3] mtd: partitions: ofpart: skip subnodes parse with
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-2-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <d504a4df-b1f7-b7c9-e62a-599d114d8a18@gmail.com>
Date: Tue, 2 Mar 2021 17:53:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210216212638.28382-2-ansuelsmth@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_165509_878541_276FAA50 
X-CRM114-Status: GOOD (  23.17  )
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

On 16.02.2021 22:26, Ansuel Smith wrote:
> If a partitions structure is not used, parse direct subnodes as
> fixed-partitions only if a compatible is not found or is of type
> fixed-partition. A parser can be used directly on the subnode and
> subnodes should not be parsed as fixed-partitions by default.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   drivers/mtd/parsers/ofpart.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/parsers/ofpart.c b/drivers/mtd/parsers/ofpart.c
> index daf507c123e6..4b363dd0311c 100644
> --- a/drivers/mtd/parsers/ofpart.c
> +++ b/drivers/mtd/parsers/ofpart.c
> @@ -50,6 +50,11 @@ static int parse_fixed_partitions(struct mtd_info *master,
>   			 master->name, mtd_node);
>   		ofpart_node = mtd_node;
>   		dedicated = false;
> +
> +		/* Skip parsing direct subnodes if a compatible is found and is not fixed-partitions */
> +		if (node_has_compatible(ofpart_node) &&
> +		    !of_device_is_compatible(ofpart_node, "fixed-partitions"))
> +			return 0;
>   	} else if (!of_device_is_compatible(ofpart_node, "fixed-partitions")) {
>   		/* The 'partitions' subnode might be used by another parser */
>   		return 0;

I admit I'm not familiar with the old binding, so let me know if my
understanding is incorrect.

It seems to me however that your change will break parsing in cases
like:

spi-flash@0 {
	compatible = "jedec,spi-nor";
	reg = <0x0>;

	partition@0 {
		label = "bootloader";
		reg = <0x0 0x100000>;
	};
};

nandcs@0 {
	compatible = "brcm,nandcs";
	reg = <0>;

	partition@0 {
		label = "bootloader";
		reg = <0x0000000 0x10000>;
	};
};

Did we ever use "fixed-partitions" without partitions { } subnode?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
