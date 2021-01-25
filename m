Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73407C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 03:13:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3E32085B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 03:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3E32085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dbYmJuaEJbAX7J/bNtUvmZm+Q/E03APM/0i5vswfdwQ=; b=IbbTAQYnP1ri0BlkQWcxAB6Dv
	y4cmA7Gm6j31kahetgXLfz4ZUxnS78LRh5fgtp2aBGoLbwOxGPCrK9Yhyli5pZZAe60VyXiN9wjue
	0bX4Jvn/PJRvsyYZbzEeUNzTLiFxhiVrdrv4M8b4+9+dS69VRR/tphHRUa7I4ge7/xvGPg0gN9Hkg
	31HEbxGPY4M83dn3ox7mDraCmHjkmxCPGMVF/R+OpPNCvsElXtjfzrsRAevz/9HJJCUkSZ2kf3Bf6
	H3NkTN4zrbKt3wJ9M5fAQHRtHsxF6v82xvMjnGSFcY5Qg4zqdkyV8/be/+8HLzd1al7G+QKhcXd3I
	8dWUA1nMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3sIg-0006A1-R1; Mon, 25 Jan 2021 03:12:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3sIe-00069Z-9o
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 03:12:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id q2so3957435plk.4
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jan 2021 19:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B/4pJkiDnsB5oZfPOkIsiefXIJ/3N6UvIcVjcRdIqSM=;
 b=nJvEXS0J6OMGYH8gbDTnuQ/tiCHn9KgIw5oJbHn8kemE8GKjeW7w1sAkd1ONEQUOB+
 WHW1KqeZWWgBkWJy69C/HV/5uTWrCao9rKUY0Ppk5NCBfCIWO42tI51dom9J5gKJhawf
 Z2j6t+q8LO2AnZtZmQmjBJU4Teb7t4e0aJYDIrjoK+nwJGYmOvvFLe9Q/JBjsBQNx8gL
 bI2bJ+vRCL6TdHlS+HxoOAT5qfKIiQRxp2ErPAJIG7pDBdRCWSD27bK3zcVJrmEdsngi
 UL2rqR8ds7uy9UsNDhNpSF9bXy4IyaxPCtvmu0Ou2kfHmrg49dWohvVAD9wLljv3JjCo
 wKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B/4pJkiDnsB5oZfPOkIsiefXIJ/3N6UvIcVjcRdIqSM=;
 b=CZsxlvHzNAbGa3jgKOTyjyUA/6iU11MlJVJADc4ppK1jpxu0J8mY6Al3YP010Pu9W2
 efV2XnkpEEPM7U5AvQGQPrQ6SKG3ELE04pfjY6ZAMUgZEBAAMC6SDVVk9v9CmaTLMI/d
 5LFXo2VGntnXk2WpSz9CpSMtN5+ByC8VfIC5FbykHX24cfi2pw42SdyOXoqbAwV4RPdK
 J6723XWefFrQbqO4RgvgYqffXX+Gflz2MGZmEXiCguzFkwAgldThTa03O4kwg4i/3lyt
 FDOW6Uh+3GdoWVZpaUAMBVFk/hl4I8CQYqt+Jdy9tQCnMUDHQI5OVppDLMOlwSpYO8kR
 ZmVg==
X-Gm-Message-State: AOAM533YD9MAKMWMbtD+nKAgS2NE/Yk+uYYVtxGdbp42kcBFnMLcArUo
 YQDkbN0yLJVGVrGt+ftGkG7VVzxvDxEQWA==
X-Google-Smtp-Source: ABdhPJysjY4nGpM1dcHtEOnCSksxrOPRuLw7tbjVhF7INzewQwnIvze2UDynWc+AW03qkcO2uuZxoQ==
X-Received: by 2002:a17:90b:8cf:: with SMTP id
 ds15mr8729426pjb.182.1611544336025; 
 Sun, 24 Jan 2021 19:12:16 -0800 (PST)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id n15sm16700072pjk.57.2021.01.24.19.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 19:12:15 -0800 (PST)
Subject: Re: [PATCH 0/4] mtd: spi-nor: Fix non-uniform erase map issues
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 Takahiro.Kuwano@infineon.com
References: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
 <bab4deed-36e9-7cea-4c09-dcc1ee22a3aa@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <9d3c333d-6ff8-e548-c993-09662883522f@gmail.com>
Date: Mon, 25 Jan 2021 12:11:58 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <bab4deed-36e9-7cea-4c09-dcc1ee22a3aa@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_221220_351207_651BBE46 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, Bacem.Daassi@infineon.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 1/24/2021 7:34 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Takahiro,
> 
> Are these theoretical fixes or do they fix the non uniform erase
> on some flash?

They fix non uniform erase on the S25HL-T/S25HS-T that added by:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20201127064043.29541-1-Takahiro.Kuwano@infineon.com/

And theoretically, they should fix on S25FS-S family that also
has non uniform erase option.

Thank you for looking into this.

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
