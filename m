Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1081FA3728
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 18:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CE32053B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 18:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMF3YoF3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Dwz3NSK8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CE32053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xqU5eScxhdpzt4Rnt1A0kr9HdlX9ApsqdaEJq71rZVg=; b=uMF3YoF3lQTbsDcnXppEdc1JOk
	RwU8K4MWXcSxDyOUefDSEAZpeRHMK8C3w3WQ0U9yMVNX+ZcWLKtDWyAXSXaXNJIn6GCez2DFuX6zR
	f3833R3NZzw9ZXTn568/9ZkdNhnMgu8xaPTJQR1oGyzYXDGGNXoJkM7yvAoVrQo/Zs+CuhkON8kyB
	BUlgEI2hGzs7DzX/GJiIlQrEtFHMBuupdXDGPmYrtAetW7gK3wIHk9WEuZ3agtntWnHQqjbPl+DVO
	RsSP8FJltg23wk/ddedshBW0jqMPjsRb/9eHVPtnOjInczw/F1uqlAfk0mVioiNLKl09wnLVCPzBD
	YDrb/wFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKoMX-0007MS-2j; Wed, 16 Oct 2019 18:49:33 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKoMT-0007M2-Sg
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 18:49:31 +0000
Received: by mail-lj1-x243.google.com with SMTP id d1so25038905ljl.13
 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2019 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hSTPS8UEXdTUVzHVLM+ao8gBrBjxaL2tGy7dpf7Z4hs=;
 b=Dwz3NSK8pcd3vpjSVPkOrOjH/naF2Jpar5xPc1fiZeYkK409HKrnJMZvEwRcVz+OZz
 0nZSGu3Ke2P9HXNYEWTaCpfHXy2BJPajKDTfExVOT/hreT1wiyHf9JWk/asOQs518rTS
 gFmkciQBCPhSmiR6FjJq4jA5gpxpoBCyW0WHskiLFvWJC6+gSDkcalY4Qe6U6VqkAw/q
 LzdbytlSkSTckK3KCzPEuiLgBKqGo2J89drAo/YXIckkvOfxS0Q8QFDZNTd07tULmf8b
 yRRC98neY7cntvHTORbhMf+puXCZuK7bBc/gPfmAQExbo5gcN9l7Lqd9nb5BGkOwHrd4
 iQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hSTPS8UEXdTUVzHVLM+ao8gBrBjxaL2tGy7dpf7Z4hs=;
 b=AH9c3ah9I8Y17NsHjNAuO3STxwNxtJB9/JpAqbXuvgPDOEdwSphFIQH9JAJvwNJTuF
 VzBwQ07rEKjp1bx4+9I98RfVP9JRTMl81MzfKp5MRKsMk84m4Q8KkIAhRDbEHJGRw6I+
 0WBNfRHIbvKpiwMYKAWRPkeb3WyFF2IsmK3eyN8x1WmV+poJP07OwDA+h+COn0WO2Cmi
 vr7LCM6lpLP1dTFnBGAb3HD7qv2K6OH4cyhkq2+W0wmKjEl1v1/Ul2IhN/mmAJicJqLU
 J4yY6HVTRFNNHsHJZLWXzUejVOKKvJt0LOb5PbwvSbmkExVQYcXo5mLn8bae9F3gZp7B
 wPuw==
X-Gm-Message-State: APjAAAUDkU7QZ0ct7y4agxxbkGQeZmv5g4EJ8E3OB3vpDbnp/ZV9Q0ta
 qEUbxlUY4L7OJvYTv2rP8BYkEQoK4Bo=
X-Google-Smtp-Source: APXvYqzbkh0U7aO1Cki/PS//xDktds6066J+3WKJxBAvQlB4XDPdZQ7WR9ybn1gd7FsoF/ZqHrh8wA==
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr25904179lja.29.1571251765532; 
 Wed, 16 Oct 2019 11:49:25 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:851:2077:6439:f78e:8a6c:a7c0])
 by smtp.gmail.com with ESMTPSA id k8sm7517764ljg.9.2019.10.16.11.49.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 11:49:24 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix silent truncation in spi_nor_read()
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <72e77a25-fe33-b88e-bfe2-654e10281fba@cogentembedded.com>
 <04bdd57e-5b5b-55ce-dc9c-e04097af8e27@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <40ccd9d8-0c3c-b8be-d7be-9068c5238142@cogentembedded.com>
Date: Wed, 16 Oct 2019 21:49:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <04bdd57e-5b5b-55ce-dc9c-e04097af8e27@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_114930_067761_8A1FD6C0 
X-CRM114-Status: GOOD (  12.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 10/16/2019 08:18 AM, Vignesh Raghavendra wrote:

>> spi_nor_read() assigns the result of 'ssize_t spi_nor_read_data()' to
>> an 'int ret' variable, where the silent truncation isn't really valid --
>> ssize_t is a 64-bit type and *int* is a 32-bit type on 64-bit machines.
>>
> 
> Good catch! Curious to know if you did observe any real issue because of
> this bug?

   I think I need to rewrite the description in a more clear way, so don't
apply this as yet, please.

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
