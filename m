Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FCCC35280
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 19:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C972166E
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 19:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btZGr8Ie";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="rQA/Iz6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C972166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPmnYA7M3rJHIj9Y8/ZN9mfbD+thTz8hfhUMH5ZQAq0=; b=btZGr8IeVBBqC9
	ZuEK/zZIk6H8NdBQIdQFJNtEOdHz/enbJ5vsFZ8mOlmBDWCFs/lnTwhgG2suyTagMuRjbarx/+Qdy
	2B8KpNqYcah+8YXOkmV1eHJ2WB/LqKxV+Ooabw96GpL2K2ZCI3c4rm2vposEPbq4HRuIZT4/bisic
	wg4eUo+YkdlXbCtx0KJ7tjl+zXrBEkKqJe5jpVl+SYNAHeUucrsZw8qtL1pMHy/UL9NXprdI04/oX
	+LBnXiAbxfGsATbeL1+o8Q/w/1r3wp8UeZarLhABnVfdJSYJGg2AwofBQZlR+m02Bf0Y8y14LkFPH
	JJBY0ESgJGSs4sJwf2HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUbjU-0001xa-Gu; Fri, 01 May 2020 19:54:00 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUbjR-0001x4-Qu
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 19:53:59 +0000
Received: by mail-lf1-x141.google.com with SMTP id u10so4680302lfo.8
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2020 12:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DjyBJW1x9xq3OO9QX2kjXITLa7rSEZtOxGV/szN8ssQ=;
 b=rQA/Iz6qopAcSD6RaJpa25ei472NB1/RdKo6s8Xf9ezXVrzTsMNOFXFUtOw/R+lPOJ
 t7LWVp8unTanX0NUn8uT52ZghM6lhjmW8ReKG2tbNyvOXW4kCbyMgPHnbQsYPO/DcFqg
 9hta5GF7g76VSSmAgQh1GShR43o47mr85GAu4wSvBVdl1dWc37QG8I4w50i2pDg8alPR
 5fHWT3f6Hkid4QgDVj358jCaSkYU96ikVzOfxzoCpeNz+hEa7OosUL8ZiDbhVWxrJ6M3
 4FmUhTO0TCF/ZICyZNcu6UCt4btE2RBiAcLIBfxoOAZDjrriuzA99EEjCh39CtpZNaJT
 AFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DjyBJW1x9xq3OO9QX2kjXITLa7rSEZtOxGV/szN8ssQ=;
 b=Rvm+KrkDMmdWzbwNCqzEgnfucFAG2WO6CqLD3uqGgA1/wtWi6B0ZnXEyrxRPvUl7i2
 mdzUcZdNLgsdCk/FfZxram8gXdfwofjZqCGQ/9wPGL+brc6CfNBY9UMxcC8C6L3ij1ds
 T1ex8waCF1za0jKMk/+DXO7rpEmzDmKyp2RKe0nXCBJMVoLHKIDX5vBAhvHVroPXZiyr
 bTnmfAtQ4LJUTrjry9JN6DTJIWikgqDkEEsuGqxdHOPoEKNys5FI23XS+XVIbaaoBxox
 8V7SrC90JBC2uNuIupkd5R9QDH03H9nI+ZsbmOc9Be0vhhrdyoCHYU8j8iqtobn5kAid
 frcw==
X-Gm-Message-State: AGi0PubGDKs7rsVJdvXUKexC9504mEcZV9OaDJrNYzQskWr+tgFvSKnT
 s/EgjIq+934+Kp9wKy1U/iXoKp2P6dw=
X-Google-Smtp-Source: APiQypJGRJkSHaNVBrBzdA4J4AdjeJz18skkVX6S9HiByuoRv6BgWCIctObBa+/pS+P+nJ6jEE0tXQ==
X-Received: by 2002:a19:3f57:: with SMTP id m84mr90351lfa.3.1588362833575;
 Fri, 01 May 2020 12:53:53 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:897:831c:be55:f11f:34f6:89a0])
 by smtp.gmail.com with ESMTPSA id d3sm1675807lfq.2.2020.05.01.12.53.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 May 2020 12:53:52 -0700 (PDT)
Subject: Re: [PATCH trivial] mtd: spi-nor: Fix SPI NOR acronym
To: Tudor.Ambarus@microchip.com, vigneshr@ti.com
References: <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
 <20200428084739.799468-1-tudor.ambarus@microchip.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <474915a2-6fde-dc8b-ea26-50e46b3337d5@cogentembedded.com>
Date: Fri, 1 May 2020 22:53:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200428084739.799468-1-tudor.ambarus@microchip.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_125358_016656_A3AB7CA6 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 04/28/2020 11:47 AM, Tudor.Ambarus@microchip.com wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The correct terminology is serial NOR flash or SPI NOR.
> s/SPI-NOR/SPI NOR and s/spi-nor/SPI NOR across the subsystem.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
