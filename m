Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CCFC3DA58
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSBeQu9QXwH6v1FqkKInjJv6NPVnxWoH3Q6n0mL2nhI=; b=f8Y3gBrykWzfA7
	DYESqCnIepuDuACO+AHC9hib8NlNqIMy1r1MtgGLqtpHxpFUgks+0Evp04y67659lZqeu6jgyQSml
	gn3Z4rjrnvqZm5riHW6eHZ+el6QjuTA1K+DK+DhwDJBABc82Urqb84dOIibOETzsvob2oe3EflUpo
	fkOwf1HqvVcD/dLKNS13Nu0X4CeiU3V6Hv6WHJFO9VJCNrG5/Dzp7YjSsCj+aXOaUNLTxuj8vJ2T2
	HqZO3Zi5v7o2X7z7ckws1P9cRPrGQtTgnsawTfCJprLXVYB5SNXWI6VQ9xb+Sv4KvweYJoXAOvuCk
	t0lrWNoiucll7CYW2KuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWgcl-006ry4-1T;
	Thu, 17 Aug 2023 17:17:31 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWgcj-006rxZ-1L
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 17:17:30 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-34ba9d6561aso173615ab.2
        for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2023 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692292640; x=1692897440;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSGKblR3OXJrnjJWxLl6H+gcDsbsJZ3wuLzAauLCVPY=;
        b=pdbMCorYR90h1GxmM0EvND2ko9AWC4J/xp5mGuhJiLdSspKz4KwBjGLqFQtps7D40q
         28rOpmKZB/3WFdHJQDiOWybkeAs6EGCooYG8PQ/iYhTQXaNsQgrtPjnJFe4XJoNivl04
         QTnwZprpvC8GeG9Khycx5aFD9KUimbHCcXd8vTG8OfAwboZleROqNqvCKR1PIC01OxRv
         dlpNTp+w2oCiOUezCwAEiLAAxvk/kFc1MTXPKOtFBdMrrmbvviLWAHdND9yLOV3LP41C
         nymR7MGKEFwGWX2ujj397xl7RyXFUOnjFXB8GVSHoT1041w3Wc2bQwebaaoI0vtpovkx
         lfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692292640; x=1692897440;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSGKblR3OXJrnjJWxLl6H+gcDsbsJZ3wuLzAauLCVPY=;
        b=KMw7mpVE2R/DqV+uGBIBREmuSWG7+ql33UyuJQPnSh+meDGwvsfocWn3GE5Q0Kzmkn
         4JtN6076Qeoz4Tv4/pz3bs3DLk51g76xRhuiXgqHvcNO7BN+k3oALQfXXojwYnhv5MqT
         Z5puFq8SGgCgfJGNlXN+qVIhb0vYj6rT3zUyH4WOTmY/auSZzSzDGLsL8xnCr6QA/Cxr
         aC9e3kGlxQ612qFeHmny6jkd/uF/rcsXp52RWT132yGqlXB+FL8vFgKBSPjkR47VpFrO
         edPSdei9wmCuqk/fqwFykKHr/3Zisp8pQKXw4TAk3eF7ay6FGlg6gvysx+fYIToPfS2E
         SF7Q==
X-Gm-Message-State: AOJu0YzCtIGnp+PIc/93U3HhD6t6rAizfndxexHzJQ/fOVUGnP8N9ruv
	2v1kjxZanvVxhKjuxLJj+8o=
X-Google-Smtp-Source: AGHT+IGe2iegOMwHHgT19hUvVPOKArg8EKL4EEAfjjAuPARY+lm7QDpCKkqyh4qHa1l+LeWMEXtnqg==
X-Received: by 2002:a92:c249:0:b0:348:8ebc:f759 with SMTP id k9-20020a92c249000000b003488ebcf759mr239495ilo.6.1692292640636;
        Thu, 17 Aug 2023 10:17:20 -0700 (PDT)
Received: from smtpclient.apple ([103.149.144.245])
        by smtp.gmail.com with ESMTPSA id t1-20020a056e02060100b0034a9a9a2016sm3228875ils.23.2023.08.17.10.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 10:17:20 -0700 (PDT)
From: Clus Tom <ssunkkan@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] Add support for more XMC series
Date: Fri, 18 Aug 2023 01:17:06 +0800
Message-Id: <2F4A4D23-1C71-42B9-8B2C-06496F773BDA@gmail.com>
References: <abd705350b650717dbbc187815d384e7@walle.cc>
Cc: miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pratyush@kernel.org, richard@nod.at,
 tudor.ambarus@linaro.org, vigneshr@ti.com
In-Reply-To: <abd705350b650717dbbc187815d384e7@walle.cc>
To: Michael Walle <michael@walle.cc>
X-Mailer: iPhone Mail (20G75)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_101729_461030_1CDB3758 
X-CRM114-Status: GOOD (  12.06  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ClllcywgSSdtIHVzaW5nIHRoZSBsYXRlc3Qga2VybmVsLgoKCj4g5ZyoIDIwMjPlubQ45pyIMTjm
l6XvvIwwMToxMO+8jE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+IOWGmemBk++8mgo+
IAo+IO+7v0hpLAo+IAo+Pj4gWE1DIHBhcnRzIHNlZW0gdG8gaGF2ZSBTRkRQIHRhYmxlcyBhbmQg
dGhleSBzaG91bGQgd29yayBvdXQgb2YgdGhlIGJveAo+Pj4gd2l0aG91dCBhbnkgcGF0Y2hlcyB3
aXRoIHRoZSBnZW5lcmljIHNwaSBub3IgZHJpdmVyIFsxXS4gVGhlcmVmb3JlLAo+Pj4geW91IGRv
bid0IG5lZWQgYW55IGVudHJ5IGF0IGFsbC4KPj4gSSB0aGluayBpdCBpcyByZWxhdGVkIHRvIHRo
ZSBQQVJTRV9TRkRQIGZsYWcuCj4+IFRoZSBYTUMgZmxhc2ggcGFydCBzdXBwb3J0cyBTRkRQLCBz
byBpIGRvbuKAmXQgbmVlZHRvIGFkZAo+PiBOT19TRkRQX0ZMQUdTKCkgbWFjcm8uCj4gCj4gQ29y
cmVjdC4gSWYgdGhlIGZsYXNoIGlzIHdvcmtpbmcgd2l0aCBQQVJTRV9TRkRQLCBpdCBoYXMgU0ZE
UCBhbmQKPiBhbGwgdGhlIGluZm9ybWF0aW9uIG9mIHRoZSBmbGFzaF9pbmZvIHRhYmxlIGlzIHB1
bGxlZCBmcm9tIHRoZSBTRkRQCj4gdGFibGVzLCBleGNlcHQgZm9yIHRoZSBwYXJ0IG5hbWUuIFRo
ZXJlZm9yZSwgeW91IGRvbid0IG5lZWQgYW55IGVudHJ5Cj4gYXQgYWxsLiBUaGUgZmxhc2ggc2hv
dWxkIGp1c3Qgd29yayBvdXQgb2YgdGhlIGJveC4gQXJlIHlvdSB1c2luZyB0aGUKPiBsYXRlc3Qg
a2VybmVsPwo+IAo+IC1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
