Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AE5C31680
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 17:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081302089F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 17:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f9VDLRc/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="IJX6rEsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 081302089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O6Jzb1ljtOb1Sx7nPiKv3fZjpJywpo3ixc2kPwGhnrE=; b=f9VDLRc/ebVATzmUDFBOP5cbio
	1jA8M/I41SHrcIazPh5EH60E4sG2TN2vb6f4tRL7XJRxZuxlRlYWg0npFxYexm2bf6hI52BBMmf00
	QZYAlPe5f8/XcAK5zBoZBPfw4uhm680Re1D9aO6lPVql2zzAqrfL1Wujvotbxo2+mH+o0Q99etL80
	GPmKCd+YTGjYl0rLmHXVbxzbEiEpYJedtk3Egp4U5OW7BlCQFoZxhLxCaK8U01iDJEylKEo2y4X6d
	vlPKZYi8GqHwFXa6+hDNkxvesNXTA2NBK4JDdiTIAxLBsc8tZw2KQV6OQUUl4b0LQW7AhMMWKkiG9
	SDzPNUKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gldYq-0005mV-7U; Mon, 21 Jan 2019 17:40:36 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gldYh-0005m8-Uf
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 17:40:29 +0000
Received: by mail-lf1-x144.google.com with SMTP id n18so16096929lfh.6
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2019 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LxMuAIgAixhCAKOWiF52610r4eCCi540bJEZ+ecDop0=;
 b=IJX6rEsxNYZFcC0K8y6OOqBhUisAgKsfpNaHo9wpqeZy7vDC/1NTWUTcsrQE53CJf8
 zLhK26B8MeZ+SL9jeUH7MOpeHPjJopv8uAmf1X7ZPxrQx+8vtYPVGk9YFeLFXMh2R2R2
 Np6l1nLejSWejQ3AtLVNZqT7iS4f2p6eH57rcWAPIyxJbrs+yNO22bCZ82siCKKMXGUx
 FWehHPwN5YXa9OpHzgwOCJsbBYnTaigh4AipICdEqboRq0BrDjhkgnLnfgkG0TXvYDhA
 spNKzCmtGbBzO/Ov2/Q0RV3PVm0A8IOfGtDiDEMSsB+QME3PB/rqD2QaavcbJPsNIUlt
 QPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LxMuAIgAixhCAKOWiF52610r4eCCi540bJEZ+ecDop0=;
 b=YheRz3r31F5DPcSwTevCJLNporBZKwWFlkxmNsZQBv+mcNKUI9/p7XtrLbX3g3OvyQ
 D0Jp85AwM2UGz1zkR5o2fthruOUPfCeY14rmzeYF/NU1CLENXDHaKHX9apx5huqoFPbZ
 9WOd5lWJ8JxMuO+t3Jx9/3oISDX8+Qw1OqqwL+r5oFOtFw1lmxR4dDX0pP+9XQuREU5p
 3zPZOLn6x6gBJJYz1N3qQnYjXVKww8ScTiLbriPzu7PhbjxUErV9sbxLKyjwdVUOZbu2
 LfRKxCO9wCkIbbUeQEkOQOGzZ7S7RZd/JiMQo+pXyKXE8WEMoVHYDrALSYsp74M++ZRN
 e0qw==
X-Gm-Message-State: AJcUukfWUJwPrCh1uGospI5cfBNBNsKYpMz5EkjSzPFJPzAmSfn3w3CP
 MmWRm3PaHrYDhFT/Gf5gArOUlQ==
X-Google-Smtp-Source: ALg8bN5wZ05I5X58GF0d2No6yttfhf3a+Aw4RJnRpB8Nl3G1P5zj6Poae14QzH3l35+YdKAqxilGfg==
X-Received: by 2002:a19:ced3:: with SMTP id e202mr18542382lfg.13.1548092425528; 
 Mon, 21 Jan 2019 09:40:25 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.215])
 by smtp.gmail.com with ESMTPSA id p10-v6sm2392618ljg.19.2019.01.21.09.40.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jan 2019 09:40:24 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/2] Untangle Spansion S25F{L|S}512S chip IDs
To: Tudor.Ambarus@microchip.com, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 linux-mtd@lists.infradead.org, Cyrille.Pitchen@microchip.com
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <0f8ec847-9e36-32c4-ecaa-8e8fcc1e3337@microchip.com>
Organization: Cogent Embedded
Message-ID: <fb92b27c-ed36-4b3b-9d0d-c568c8a9ce09@cogentembedded.com>
Date: Mon, 21 Jan 2019 20:40:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <0f8ec847-9e36-32c4-ecaa-8e8fcc1e3337@microchip.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_094028_128311_E58FC40E 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 01/21/2019 11:28 AM, Tudor.Ambarus@microchip.com wrote:

>> Here's the set of 2 patches against the 'spi-nor/next' branch of 'linux-mtd.git'
>> repo. We're untangling the S25FS512S being taken for S25FL512S by the SPI NOR code
>> due to omitting the family ID byte in the latter chip's ID. I'm proposing to use
>> the full 6-byte JEDEC ID for both these chips.
> 
> The patch set is looking good. If these patches are based on Cyrille's
> suggestion from [1], we can give him credit by adding:

   No, I even had trouble finding where Cyrille was suggesting that. :-)
BTW, looking at his message, I feel somewhat perplexed:

"Maybe you can do the magic by placing a new INFO6() entry for the S25FL512S,
just before the legacy INFO() entry for S25FL512S. Indeed entries are tested
in the order they appear inside the spi_nor_ids[] array from spi_nor_read_id(),
so the INFO6() entry would be tested 1st, trying to match 6 bytes, then the
INFO() entry only trying to match 3 bytes."

   Did he actually mean adding a new INFO6() entry for S25FS512S? Else that
sentence doesn't make a lot of sense to me. :-) Also INFO() entry matches 5 bytes,
not 3. 
   Anyway, I'm suggesting to get rid of the INFO() entry for S25FL512S altogether --
and that's not a part of his suggestion... perhaps it's too risky; I'm not sure
why 5-byte matching was used for S25FL512S in the 1st place.

> Suggested-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> We'll need his approval if that's the case.

[...]

> Of course, if this is not the case, and you came with this proposal without
> knowing about Cyrille's suggestion,

   Well, I remember you (or somebody else) pointing to that patchwork entry...
however, the idea I got was from the Renesas BSP patch.

> I'm not going to ask you to resubmit just
> for this little cosmetic change, just say.

   Thank you. :-)   

> Thanks,
> ta
> 
> [1] https://patchwork.kernel.org/patch/10595835/

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
