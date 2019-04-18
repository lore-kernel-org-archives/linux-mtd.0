Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F18AC10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:39:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 375122064A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JP9DmQ4F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Me8xyGum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 375122064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lSiGPZz2R5UAPgDIakjIzIAN19ZCHrL1+0f9JsLlOM=; b=JP9DmQ4FnJwsBu
	iKYMWvn3rQ0juHszbTy9fjVMfWHt3wCwyedIEUNNHUHvX7AFCzb5rA+tG04/XgwqAhcQcIa/jUN6g
	IYQKCbB7cxJg0m0xd5x5HwRwhxhAE9JIFr907Wwe3F32Rn1YNogi9mvnTQ6G5w+9yeiI7/u7zH3Mq
	csAIvj4Wrs8Yh/G+xD71Fv1LTWbqCNrCISFx0SG7yDZoBwAEfyQhr0fP1zI6+eyTfWgXF3X8WDqKY
	yKdEXW67va8SMHDIHXkijZJi7f3If1C9giauTaH+OHbawRgHxZXjLCilmDzOF6yelHXex3vp1Et5/
	pIPT7zE0zGcRkbsfoptA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHA4B-0008Ij-Hp; Thu, 18 Apr 2019 16:39:15 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHA43-0008Bc-4w
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:39:09 +0000
Received: by mail-lf1-x142.google.com with SMTP id j20so2122543lfh.2
 for <linux-mtd@lists.infradead.org>; Thu, 18 Apr 2019 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q9SN4l7UyWsDjFX3sHxki8ZWqrL4mJS7jSv1YjPxhPE=;
 b=Me8xyGum4KaZOfgILRJHXLzuCzKg954py9giPTofkNRlG1aJJ1K8v78Z2A7GUd2ZiN
 yCHcDalaxKOz4HpvP0h+ywTg/oJbRT9ECLORzI/S6krIuLiDVCU34w4jh3XJEatoGsIS
 kw3GBYhagFQkY0L+5MEox6/dYPRIo2L1FS9tmSm5JleRPL7EkqoOZAoOQhaO9N4WR3n1
 noy2GuGI4HlIOAXdnyKq4S+TpSMWXTlFg6+ZtSPCRqLO1mRpWQBM3dnT3UjNIn5fm2HK
 HNo3e45JEZ4xiAzbJmDjbRzboRIw47PgnS7dSzktgKw1XuS+tpyF+g6sw+x8a0+eWCRG
 xUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=q9SN4l7UyWsDjFX3sHxki8ZWqrL4mJS7jSv1YjPxhPE=;
 b=TUE+p2EdMDCHRDIh0RRQTj6vTr4UEubUqCYt1y2RrU9FNAklh/gZLHSWqa/dBnhnrw
 ctDPu4ziGNmYO5DRMLKw/n45zAk3RVox/FbQbdfXjEhsSXntQNETCsf/pC2ymrp29I+8
 Ab1r+emuRkRBm8bwM39wAcS1afgnt+SMYnT3fxWpPiiGX0lijK72Xx1Rm7ZG/iyh2hox
 1qk6KZfq5ij+ddag77D/cGk7o1EOATlqC5flZrTHL8Wc+ufGdSDK//uCjKPvitHJ0MlV
 wXtnE/RwUaosrTCFUe7yLFRMtEzLqN2op4Xlq8BYrfZUeLK/5XnLFiqZ64RZqjedp5ud
 kcJg==
X-Gm-Message-State: APjAAAVmWY8qWXzofM0IfTd6Wfk1Cg1Xh91KAisY85kXm7WkIBG6O4Zp
 S1frfMPXUsXRZTZ0x0+TKJQG8g==
X-Google-Smtp-Source: APXvYqxwAf436imAJJPPOENJrclK50l31qpMeHpQ4YFeNfcZCi0+lIRAxk6GJaGeOGn7q7oh/wzCCw==
X-Received: by 2002:a19:f203:: with SMTP id q3mr2614113lfh.78.1555605544768;
 Thu, 18 Apr 2019 09:39:04 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.82.67])
 by smtp.gmail.com with ESMTPSA id 5sm541595lfy.73.2019.04.18.09.39.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 09:39:03 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] MTD: Add Initial Hyperbus support
To: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190412092923.24919-1-vigneshr@ti.com>
 <9e8575e2-b8de-341d-7ab5-08055b84c805@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <9ec33aa3-91aa-15f1-bd25-f94eccc65fcb@cogentembedded.com>
Date: Thu, 18 Apr 2019 19:39:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9e8575e2-b8de-341d-7ab5-08055b84c805@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_093907_634354_A2BECF32 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 04/17/2019 08:24 PM, Vignesh Raghavendra wrote:

>> Vignesh Raghavendra (5):
>>    mtd: cfi_cmdset_0002: Add support for polling status register
>>    dt-bindings: mtd: Add binding documentation for HyperFlash
>>    mtd: Add support for HyperBus memory devices
>>    dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>>      controller
>>    mtd: hyperbus: Add driver for TI's HyperBus memory controller
>>
> 
> Thanks for all the reviews!
> Were you able to test this series with your hardware? Would like to get this into v5.2-rc1 if possible

   Not yet, and I still haven't ported my driver to use your HyperBus code.

> Regards
> Vignesh

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
