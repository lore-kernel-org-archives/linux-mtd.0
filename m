Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB2FC7115B
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jun 2025 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6lxcmIrpzDpReZvNf6o/XwcNlm9JCT7iAfSeEsmRKY=; b=mXOE8Z6Vny6CYk
	XH66puslb3N/2z1dqQyEnyyd/zXyyZPnq6mdvfbZBbVVJsXE5LD5cq+Dpn7AFh6w0lyf6hB2cJH4T
	FeuB8vgn64A6rwrews3I0qi6FZt3r0FcuhKcnMzdF2eqOfaikfl0Dt2IY4DhHq7lvKEC6JqJqGpIv
	cNSFoHFaW2xz+G36NlE8HULwlUnzVOVgm+RzLRIdK5wIltUK5wFcNHzmybhodjP3LB21rb2nXwnab
	7pmlM9dWJge1Ika4B943ES8UbklBYDq6pl0nRZnteTG+gjBe7A716gzpNkk3kWkj6daj91ZnifK53
	K6XANRXThDAV40Zu/l1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXJh-00000007Yns-3gks;
	Tue, 17 Jun 2025 14:29:37 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWl3-00000007R5j-1HIj
	for linux-mtd@lists.infradead.org;
	Tue, 17 Jun 2025 13:53:50 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-748da522e79so301929b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jun 2025 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750168428; x=1750773228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g1BtAQQpGbzIOM8FU4ybFS/hA+ZhDvsR/nkcqvafeLk=;
        b=XVV3atKVqFJ+rHbmaDVBunUXeDI9pGZ0YZ0ZuMjPz6ia5fmIScw4M95BCvezCAJMd/
         jwBPgNTvz9wuttH8FBVChBD+UuOTdaZRBrOQ/poivYMH8n4d45zNGJWt0GFOdH58EgVg
         YvHXlMMRCDu1KFFKDnYJs9tQq3cjo8nINP2Iw6+PCG+FdMsX41HgPbuRJSPKBVF0ikfs
         PU6NMdiMJ5IGpXlasKIKTh3zGCcbfmeNoqGNMNSPfefV1dANRG+TuhmIsQqhvYxSEeSS
         vQO1PF/cx4xffvpcmobHFJsBLkrt0wcBpEQxx1fEJWY6pfSTQ6uAk9I7krlMTApMfndd
         GWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168428; x=1750773228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1BtAQQpGbzIOM8FU4ybFS/hA+ZhDvsR/nkcqvafeLk=;
        b=BA2p8+0sTZwyYR0lH90QH1Z6l3vYCLn9qjxCdo1nsmKe+ekdKWePhSxAhIpc+A4PLq
         3COTbv0lAJGMiZYteh7icAmof7qGPimqX/Z/TVq9KxUvFce7pkX2a7VScsEsZKj6QUhO
         SF9eZqw30KkcRhY653zDnS6JpjeTUy0+lcWm/fy5vdKfsP3OQUsXD0G419WtnCKmOYSw
         l60H4xgjEj91mEdDt1HcVo+rA+cEPEKKcZhNFPsUtXCYqOJHOCGAAGOO+dyMFKnjvTmq
         jocrtab1XGu7o45YTCEoEmePs3qQ5GZPVr3zIFsS5swr76giSag5EHn1W9WUnlUty6RI
         jdDg==
X-Forwarded-Encrypted: i=1; AJvYcCVYCyrbxMQroYx5QD1jRQelGrhIHv456fmp292eEmcb1ljsqZb7emK9YQ3R+esKO7KfauDhxEyWjgU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw856oZfzCnx1a8GgCigdQHaODu09m5Ec6/52Ol2No7npWBnUXm
	L89PU+c230gvbEgRFmJ2/+ZriQDKtwA14N/GKX1JYge4TqktQpNuhvPq
X-Gm-Gg: ASbGncvugAF17gFidtRy5K/4gTvg0hc5itx6nDBfcsk6ouljQIERY1z6ZXU3+5dzUxx
	23SRkUUsCDTvVOmfcUAWg9m/76tHismp2xFG14MjKt5jr14OQFVvd7qTN/7TksdtEXp+om/Xaz9
	3um+URKPWU7ljkzkT5RpT08QMzt/utnYgtbB0Gr452DQjv6t2G/WiI0HBVfCKlWJnZRxlqVFazo
	4OHUkxXtwMtoiy0fQP4+cW8JE86T688Vkzoas7/t3V7Q4fCCcViKYk++VKCMRSus0CdkX/rAmCt
	tpw1L2fVgc+8AAhztR92rqTF6h/DMeQ313p2fgDZEBE3g+5nAgPglCkg3eUD9AzxyyuhCfOc9j9
	0SkNvjU+/QIVrIgrxtrFo7uDSL/qyI1WyFeY=
X-Google-Smtp-Source: AGHT+IFKeH5wiH+7HoEMNFGa1cc/Tf5yCOeGF0VpXH3fnijeW9PnrNqL+WAbXwok8nKaHGPmlMlp/g==
X-Received: by 2002:a05:6a00:1894:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-7489d03b7e9mr19179661b3a.20.1750168428439;
        Tue, 17 Jun 2025 06:53:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748df06a4f5sm535658b3a.85.2025.06.17.06.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:53:47 -0700 (PDT)
Message-ID: <45b25abe-7474-44e9-8e6d-5c8a28ba165a@roeck-us.net>
Date: Tue, 17 Jun 2025 06:53:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mtd: core: always create master device"
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
References: <20250613180722.1268159-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250613180722.1268159-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065349_353422_6DE09255 
X-CRM114-Status: GOOD (  11.34  )
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

On 6/13/25 11:07, Miquel Raynal wrote:
> The idea behind this patch was to always let a "master" mtd device
> available to anchor runtime PM. Historically, there was no mtd device
> representing the whole storage as soon as partitions were coming into
> play. The introduction of CONFIG_MTD_PARTITIONED_MASTER allowed to keep
> this "master" device, but was not enabled by default to avoid breaking
> existing users (otherwise the mtd device numbering would be totally
> messed up with an off by 1, at least).
> 
> The approach of adding an mtd_master class on top of partitioned mtd
> devices is breaking the mtd core in many creative ways, so better think
> again this approach and revert the faulty changes for now.
> 
> This reverts commit 0aa7b390fc40a871267a2328bbbefca8b37ad307.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
