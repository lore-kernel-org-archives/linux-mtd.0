Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFD3C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:22:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B62F2173C
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PAzHx7EM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pI2+dGa8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B62F2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUGf5MlTIxzF2W66DTe64kGO2NC+mwYb2OB1ny9BN7U=; b=PAzHx7EMKI054+
	hdT2TdDaH1KKjaJvVuRFXfPAJqlagDeRdbSZ4jrxILPYmu6Dl+SsAH8Q6daqUf68NavNcb2FkOrGo
	KIod+fdLmoDc+gP+AzBJ6atMu27W8Ro42WMN3HbJXCsHfMbkntVuVyTFwSLYJdHIZ4fg2jc2vq9kg
	DQd/1zxSoFaPcL3ObE/fKZlz5Q5X8g0MfPQdhluM0xtHWr/QcseHa7TjIUOxdLDQec8ob6ItlbajW
	px96uneRMiRDE6P6z7i4OOLTobgtJrjbFPCbAN62OeC/OGzFshNlbPUHsF17o/6JNoso/vGzjABAY
	2CoWDtbTdEBi9EyPBBWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9hA4-0001oD-4Y; Fri, 29 Mar 2019 02:22:28 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9h1k-0005fr-89
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 02:14:00 +0000
Received: by mail-pg1-x542.google.com with SMTP id y3so408426pgk.12
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 19:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ur/hfgWwGEC70C6N2jJD+liie4wjHjbtjmn+jHv5Rho=;
 b=pI2+dGa8ed+3pIjVO2Ex/lkj1jWsvipAWq1SHuGoxiftYbZ9NrHHi9fzIJml6qszPO
 wXFfxVWJt7in7y9BpxQxUAdu0HomX1wiZbYsUUbmCpu3SC+IuoZ5Dj/pFPKrN7oOf33/
 acCUGWaXPwNHXKAbMNku3OwbudpmIFeR+IZXrvGqn2Zs6r1mMrMtOBgF392U86zftMSA
 3uWgl/Vq0ld2m2vItPsu1Y/uUQPJjlFGFm/dmr38nXXKIZ8qnAnI0HcNCiPfMHIZ7hK5
 SQu8VZXLX4EXdi8nhtkjagsgQe95vrRmiYhNcDXA8ylK8aVtBdbCOJvmI8HDSviw974Q
 ZxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ur/hfgWwGEC70C6N2jJD+liie4wjHjbtjmn+jHv5Rho=;
 b=sSw3CH1+93bCzwZaEbAQyYJEyhka6pRDgcyZ3WlqKD9t8YPs+8Tsmk7PBxSOviMMrc
 z+ueOgdIN9FJtRYNxRMOd+eP0TK8exefDYrm2xrP6Ol/9s6/4Z8P0mEWNKfK8WzDNwEP
 BEWHkSu6idVAAlgw4kccJP5A+Odi/kbDfllouxOGRL2af/mQVX+JL8V1u9Pa0iUu0tp8
 ltZ5U3OQeiwjRb1mS9yfLrH7eSL3+N196o69SOv8N8p/mwRtjGI13X1HTUEi4L5480bl
 0hLv7Bd0rzyKSfIjS7HIFnmXTIGriMZl83VQTd+r0sI6W+ThuXxCwhlpROIr9vMaNrtD
 Ar6A==
X-Gm-Message-State: APjAAAWcQQTH/1PI8yfk/Q4BSs8zsHfMu/2TqlWYfuB4SXmEJ3nafwz7
 uykWr3XRFJSEcBRePj9kiUgmyg9n
X-Google-Smtp-Source: APXvYqx5Gd9+eu4+9HBREKmFF7nvdRb8HG7++IeHbudirG6927JD4pLPeFI/0t2eefR0uFDWkx2KhQ==
X-Received: by 2002:a65:50cc:: with SMTP id s12mr42952069pgp.130.1553825631233; 
 Thu, 28 Mar 2019 19:13:51 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id e23sm586932pfi.7.2019.03.28.19.13.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 19:13:50 -0700 (PDT)
Subject: Re: [PATCH V2 5/5] mtd: parser_imagetag: add of_match_table support
To: Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
 <20190328141910.5723-6-jonas.gorski@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <2c2e524a-11a3-1a27-47db-1a482f5ef789@gmail.com>
Date: Thu, 28 Mar 2019 19:13:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328141910.5723-6-jonas.gorski@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_191352_841042_E84D1184 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/28/2019 7:19 AM, Jonas Gorski wrote:
> Allow matching the imagetag parser for fixed partitions defined in the
> device tree.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
