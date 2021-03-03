Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEB9C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:55:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB7D64EC4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EB7D64EC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UPjXGsfX2OU4TRoWiopNpvyRq1edPa6gvnGOKpbgQJY=; b=D6hpV8IJxfmtT/0wfJVjmDE0e
	hjmGycJksKjb6aDIZtrQY1gFjv7iKLzkswGKDbXLZEpya9ugXplGFGvukksm1WaF0h/WBa0X2QytZ
	wpzxmaEJ0S/VMULKlTl9wtcKvBJBzMc/0MzDCZ5Jykamh1pFV5nwwnVvTNIcuK6MxDPrKxhnHXmzL
	kV+vVDKJAX3GN8pyNyQ9EljntwXcEj5d5JIzN1ryzLwp1pHNEsfk2NHaKpML19Z8jvNV1KxIg71cH
	cfg22gpWSRT1LnH81hW7Q6xr85UouU/0Prv+0HbYO99xQz8/R4gH5mI0pifv9cIG5IC4t7LttZwjy
	/VVIsqyVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTpk-005Tzg-G1; Wed, 03 Mar 2021 15:54:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSnl-005COB-MM
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/mjreVpadpKOEE3R8AOsVJMSrNInXRosIgT1ZILxxiE=; b=R5wEP6S1VO1X6OaHcRIdL/C+TB
 s7fXuUTFQIdqXukxoY1pLlbIv/17sWdXWABGbHPcLmJu4yXZff4JQkDdZA11Z5h6csh6AKzWCRSqg
 bdym+uabbUsSsO1vERRx5CUW/3sTzraVC4/yKCe3IL0EtarTBVK2CbJO1goQWspIrg+frqoNDwi2h
 wMDyLZr5UW00RSKMu5d2WkcdBLu0oZ+pg3kC3pFHIfxr3zLpa/jDU2NEpl7o50wnkjQbW8ayIMjte
 +Q3afmMUTSMI/uGFHZ53ptPnWXsgKJceNiFsqwZEzCCbwT78Ww1kIWqnHep9Nm0FED8xI+WvcnhK0
 1f1JJGDw==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHMSn-001kxa-Ek
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 08:02:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id m22so35676954lfg.5
 for <linux-mtd@lists.infradead.org>; Wed, 03 Mar 2021 00:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/mjreVpadpKOEE3R8AOsVJMSrNInXRosIgT1ZILxxiE=;
 b=dE3+/vWuyuvijq2HriwGlgqNrY5erKdcaSErmK2duCWF6WD/2C8h7EOQjVGcS4zSmM
 pPhbNhDXsrbEJAYBQPQFQ7R2NdMRhtfkm7VAk7lsjd9Td+rBrmsF+pbzCoxYaMHS1RmZ
 QlDEhnV7zX8cBN4r3P1vM5Qsa6xO4+a4B4Yk+X1z+WCYcQn1S8byA33tyjjONVhOjit7
 PIHHXe+jAaoS8P21A/MdB+FWaifv7hnSjVwtQ3ssmV+puKaYZ7Y1tlHCFVxeg8UU6wb1
 OKT6E+KqdTeu1wY/Wbk1z/EYBj23ULaEemJkHUtyTH/ujsoRFhJMjFsm9kbvunzPhFuY
 VWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/mjreVpadpKOEE3R8AOsVJMSrNInXRosIgT1ZILxxiE=;
 b=ke6FiEcGWiFYmWw24EL7bNTXvpCPUw+Joz1oZYLkZNNSWP8zSlJgAIgIIdi4C+Nfrc
 g+G68933CE3szqqdcvobDBUhINOOevvpEbw458cBEPiwj3jEV3DqBYTk8hJaGpCP2t5W
 ES/ryjfb4hLq3ddbZ6+ggV3X6F+BVKDmGoyG4ExYiuTLcYUIzMhIpVbzzL1ka77nw7D4
 H/f5GL0RjY/MOYVZKqYy1UL90rOOGqxugb3kjmmXQnKTiWpJXwXJXe1l+v3WPaIqv9WW
 Z+buTsyId3wifBHaJno61pHe5EbYqJyBwfU/m0IMwN/NMYxQZNTguFXCuxjHTzfmEiYT
 qU9A==
X-Gm-Message-State: AOAM530Hl7Oyio8ZT2svDcfxkYkA2KtEXZYpPJLKsA/UEhkjzACujL5A
 4/zolZtO3DQPaRgpyJt8pxo=
X-Google-Smtp-Source: ABdhPJxIv82bYEfW2FtkSgcrkkPmEi4YuJBSF8dFVeltzkVrfDT63RtTSW0Z+cHfYdd1Ew7+iTp9bQ==
X-Received: by 2002:ac2:490b:: with SMTP id n11mr14054883lfi.491.1614758491002; 
 Wed, 03 Mar 2021 00:01:31 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id b25sm2360395lff.268.2021.03.03.00.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:01:30 -0800 (PST)
Subject: Re: [PATCH v2 2/3] mtd: core: add nvmem-partitions compatible to
 parse mtd as nvmem cells
To: Ansuel Smith <ansuelsmth@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-3-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <e1182d56-441e-c827-6b95-d756720054a1@gmail.com>
Date: Wed, 3 Mar 2021 09:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210216212638.28382-3-ansuelsmth@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_080236_094032_04A8A27F 
X-CRM114-Status: GOOD (  12.72  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTYuMDIuMjAyMSAyMjoyNiwgQW5zdWVsIFNtaXRoIHdyb3RlOgo+IFBhcnRpdGlvbnMgdGhh
dCBjb250YWlucyB0aGUgbnZtZW0tcGFydGl0aW9ucyBjb21wYXRpYmxlIHdpbGwgcmVnaXN0ZXIK
PiB0aGVpciBkaXJlY3Qgc3Vib25vZGVzIGFzIG52bWVtIGNlbGxzIGFuZCB0aGUgbm9kZSB3aWxs
IGJlIHRyZWF0ZWQgYXMgYQo+IG52bWVtIHByb3ZpZGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
c3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+CgpUZXN0ZWQtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCgpJIGFwcGxpZWQgdGhpcyBwYXRjaCBvbiB0b3Agb2Yg
dGhlOgpbUEFUQ0hdIG10ZDogcGFyc2Vyczogb2ZwYXJ0OiBsaW1pdCBwYXJzaW5nIG9mIGRlcHJl
Y2F0ZWQgRFQgc3ludGF4CgpJIHN1Y2Nlc2Z1bGx5IHVzZWQgTlZNRU0gY2VsbCBkZWZpbmVkIGlu
IGJvb3Rsb2FkZXIgbXRkIHBhcnRpdGlvbiBmb3IKcmVhZGluZyBkZXZpY2UgTUFDIGFkZHJlc3Mu
CgpwYXJ0aXRpb25zIHsKCWNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CgkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKCSNzaXplLWNlbGxzID0gPDE+OwoKCXBhcnRpdGlvbkAwIHsKCQljb21w
YXRpYmxlID0gIm52bWVtLXBhcnRpdGlvbnMiOwoJCWxhYmVsID0gImJvb3Rsb2FkZXIiOwoJCXJl
ZyA9IDwweDAgMHgxMDAwMDA+OwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxz
ID0gPDE+OwoJCXJhbmdlcyA9IDwwIDB4MCAweDEwMDAwMD47CgoJCWJhc2VfbWFjX2FkZHI6IG1h
Y0AxMDZhMCB7CgkJCXJlZyA9IDwweDEwNmEwIDB4Nj47CgkJfTsKCX07Cn0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
