Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710E6E7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hyb+DfS4zWq8qrPt1khohASVbiBN+VBFsycnb6BM0c0=; b=twJYUTZUV4sOg4
	DwzOmFA87glUpu0TxyRFuhNNpPI+iNaJr911XjbJBPeBpvMG6/bIk4jX+bPr7X+YxI40hOfPFBxoT
	Mj1DETfGzDh/5oRu614BjwJTMlyYIpWg1tRPOc2S0r1SEp2HTRQKrqNR/RRfMvFQfhZ/vlKe0s88c
	vO6F59Mg7WtWg00qgC8k8VvtR1JrYviYI1fLv0aQR4J7QtsvTEB2F47grn23tNGRYpiUoW4lzLK2x
	9uRo9WT2CpYCpHpKqY1Ar028CnBN3mQjrfpKqTosJoc+Z3mSntLKcu8goBfH8SjJENRwB3/Uw+8QC
	L7k62MoCFebSip+7WdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNB5x-0000000A5lz-1T5Z;
	Mon, 16 Dec 2024 13:25:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNB5u-0000000A5lB-1LB5
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 13:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734355504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3BXmug3cMgsWrywfp7kCnQ1W3PdSHlKqSu3Fl23GiYI=;
	b=HW87vg9ufEwfCTdf3bQzeokGPJ4X2wHlOwIt9fkOdvsMgyZsvjy/EUxyWGB7NjK0CWnZWx
	JbA0P6z/FlqUyWkYX3TkVTs2zqXmjfTahWOmO+k01kj1ed/G0O9P+De+HZe4OJlNAVagI7
	gz859ETzX4z7eScmpQdp9DJVZZPtQJc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-it7LKk1GNE-jSV4RJquEZQ-1; Mon, 16 Dec 2024 08:22:48 -0500
X-MC-Unique: it7LKk1GNE-jSV4RJquEZQ-1
X-Mimecast-MFC-AGG-ID: it7LKk1GNE-jSV4RJquEZQ
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467b645935fso37186661cf.3
        for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 05:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355367; x=1734960167;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BXmug3cMgsWrywfp7kCnQ1W3PdSHlKqSu3Fl23GiYI=;
        b=hneENOI48/H9l2iQWcVfR0z0UnvhBZjbLU/zqt+9sLchIQfYcHiyMarvBYW2DMzzO2
         pZXiUuHQ8XkFPsUeYmAfL0hNjN/Pm0hBejAB5K/VQMbfSpILUKsfI3EXVHth29SCp1Y2
         FUnBstpi1/yKeQzcNGwLY7euWLl47tRgVLEd0dFEqfDPFRKBc9N2S61ZDGRPVal6MqcU
         Pu0Njtp9MHI/aAoosNdOqP+hj7Jsdk/rSExgxug0t/DgS/lN92Fud8NqFcS64T+69nbG
         cNjPNvQ//f33ML8ckovviRMpV2N484RZF0XGQYZcdR6jRiQMZetf4wHiKKccf05t2yNT
         fRcA==
X-Gm-Message-State: AOJu0Yy33rrgCW47yaC+X5Mi2dt6s5P1QTfm4mQ7M90yt+09ZQM9FwbK
	2eQsMuBQxwYcGCmFqxXRfeRivelCrFApE5PjFN/F7Qq3eDB8OzIvzENORS16Pfr6+8XeJWqKdqB
	8sWicBSYNYN51cML27MTukv46OgIwFFEe9TVP9V7T2GHm+AYIG8d6sxi6Hz6/CIkI0M/6BYw=
X-Gm-Gg: ASbGncswe7ADp1HiPdRcsR9jw1oxEEZDS/7+W+t1r4gvfge7MWWFfPFX306m39ZxR7v
	laWgXXVTR2GlGZQVH/eRxto2S2YUcyn6Pd5WaFYOCqpEjx/mF2pd+zoPhIqWAupcTBgC7eBP3jo
	pPKcUEpXMATwOmc9w0nNQcuWlIwU0ySl3v8WUzcQJWEhQpfqtT5DtX1pmZeXJa4HpAbTW2NmzZE
	lk+sfou7qxIfp/3xVYGdJKwHU5T9bcaUkjrnxPnht1zPrS+uM0dnOJOVgWKKGjyUsYk6mg1uokj
	jZfi7111ssHAfB6I
X-Received: by 2002:a05:622a:91:b0:467:67db:ef71 with SMTP id d75a77b69052e-467a586dbb9mr249710271cf.50.1734355367449;
        Mon, 16 Dec 2024 05:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf1IbLXmgSZrKq31FFk/oJCjUYtVNJvJFkqYZ8rP3l7xP4GJ4uoqdmnSVXtmJCR5k5HP3Phw==
X-Received: by 2002:a05:622a:91:b0:467:67db:ef71 with SMTP id d75a77b69052e-467a586dbb9mr249709881cf.50.1734355367133;
        Mon, 16 Dec 2024 05:22:47 -0800 (PST)
Received: from t14s.localdomain (c-76-28-97-5.hsd1.ma.comcast.net. [76.28.97.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e8195csm27601701cf.57.2024.12.16.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:22:46 -0800 (PST)
Message-ID: <322b0d817a7244dbfa81ed98c94eb3283285fe1b.camel@redhat.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add w25q01jv flash chip
From: David Malcolm <dmalcolm@redhat.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>, gcc-patches@gcc.gnu.org
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Date: Mon, 16 Dec 2024 08:22:45 -0500
In-Reply-To: <Z2AOeyPwYWaam_lX@monster.localdomain>
References: <Z2AOeyPwYWaam_lX@monster.localdomain>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rcmuPrpF-Nile8XShMSpv0KTmMftBJ7NJ1-0QTvLmVs_1734355368
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_052506_425043_6A98A0E2 
X-CRM114-Status: GOOD (  10.28  )
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

T24gTW9uLCAyMDI0LTEyLTE2IGF0IDExOjI2ICswMDAwLCBXaWxrZW4gR290dHdhbHQgd3JvdGU6
Cj4gQWRkIFdpbmJvbmQgVzI1UTAxSlYgMTI4IE1pQiBTUEkgTk9SIGZsYXNoIGNoaXAsIHZlcmlm
aWVkIHdvcmtpbmcgb24KPiB0aGUKPiBaeW5xLTcwMDAgcGxhdGZvcm0gUVNQSSBjb250cm9sbGVy
LiBUaGUgZmxhc2ggY2hpcCBoYXMgcXVpdGUgaGlnaAo+IHJlYWQKPiBzcGVlZHMgKGFib3V0IDYw
KyBNaUIvcyksIGJ1dCBlcmFzaW5nIGlzIHZlcnkgc2xvdy4gVGhlIHNsb3cgZXJhc2luZwo+IGlz
Cj4gYnkgZGVzaWduLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdpbGtlbiBHb3R0d2FsdCA8d2lsa2Vu
LmdvdHR3YWx0QHBvc3Rlby5uZXQ+Cj4gLS0tCj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJv
bmQuYyB8IDYgKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCkRp
ZCB5b3UgbWVhbiB0byBzZW5kIHRoaXMgdG8gZ2NjLXBhdGNoZXNAZ2NjLmdudS5vcmc/ICBUaGlz
IGFwcGVhcnMgdG8KYmUgYSBwYXRjaCBmb3IgdGhlIGtlcm5lbC4KCkRhdmUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
