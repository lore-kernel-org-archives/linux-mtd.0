Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91D3C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsUlLWEEuKfg53TYCcVkAscTLQrlveTGyR0LSywjWOk=; b=JZvo/vujad8bM/
	Zk/V5NExPeaBojhFU04t6CRWnqoPAJf33zV7CHgwmKAmmVgrU8iJibLx8f37myaWRXpPwStWpqkmp
	m5RVnnV0hrI0VtjQo2tAo2qDPwYf1svY7Ta03EY3P8LWMEg812l1QYsgsnp7jJD93lQnlTCO79QyI
	ZS+law2eKcRR55CvImRRsNS8r1XHTM0pRxvCF1u66gLcR4lnDLomHg35S5ci9GbsJSvtcokRlI7YN
	a4SIUedhwBnD9Rp4roDISskAD8bHDMQ4lwYZMPkyH5sOPCVs7jCP6idgGi7b4CZA/RvxCCEIGwTJL
	Wd8Z/sd/mJKRsKeMoNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9t1-00000003o2y-2vqC;
	Thu, 07 Mar 2024 09:17:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9sy-00000003o0Z-0s1Y
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 09:17:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-413007fe6a3so5822035e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2024 01:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709803070; x=1710407870; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gzqqO8837G1P/dhMJFjVPLECn5ANz/m4HM5TG7NuLXk=;
        b=OsOSZ0XVJkXaqi+0OMJyiTA4fblcT41Hr+ByhKVV9RVj1vGAPXLBfxSMuybY+dUT/t
         RfVg8Vp8zKriJkrHrvfIxKTGZMy7LA0L32TeNanvFxFUh9hb9OpJpi+U5G5JAxgaJIlF
         FYPfDwFxwWwiE3xFpYkzfignWI2rgq389H/j4T5DwK/1Sjb7cDsxp3wBv9fCnDIcsM3T
         1BjRYhVRsd4TVVWLpmafnN24qFwWPQtWuwk67/3NnqS7wEUPV+R6Plzvskl/pUIk/KWM
         6smr6fk/ZXtzs+CoP4MeNuUVu8xPDQKnpj00ZvTUjuraBmEW7Qhx2esJtK8qKb2ZdqYA
         5rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709803070; x=1710407870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzqqO8837G1P/dhMJFjVPLECn5ANz/m4HM5TG7NuLXk=;
        b=N8BOT0M6u15jPz1py9VU8A4IR8BhNT0WywHITLvF5TKd/O6MkhgzxEDFhJLLcGcKJQ
         LmkZD7+XsR1u2Te25QBhH4rulnHML4DZTWwZgAj+p1PkYoOyNlKBtYlHycSh54H61LQ5
         JkT08qzEQWiKaRaOcqAlkNR3yJEBwXeJz4kxyKHAxVqIvBHpLuY3YA4FRs20zGhr0P+G
         NolbOCeYqmaGGugXfA3gcKnC78HIilOvmb0PrwwzqGeCtstmuANTvYL7slFtZvZW7H/i
         U7IEu+ZGseqJAMbyEx5i01SpRkOiRa4DpE2Oy7wjQ9Ye4akL87ggbdLxbyxVdBTAqZIE
         YeDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7IMthPzW+F7KKnwWUuXNM235RWHYTI8ObU+my2WPb7M07VOVwJfWLh8j4UyRfgpRRN0WYwdgOSqC3Tinh+uqu5qca0Fq23X4XMATa7Q==
X-Gm-Message-State: AOJu0Yyi2Ua5M4xKOEpnCkWH2hwTpZvrVorax7iXr9vyEDWGVI6G7hTa
	YhYCv84c3cC2aOc9RKHRkksbzD9+bGW01KwEfXs6vGWcAFWHzomWRS7b53p6l/U=
X-Google-Smtp-Source: AGHT+IFNRbJImoy7bq/rIW/7veLCiGFWp22d/+OEE1Oaaq9c8kZXoos4Z/RypLyxR6Ozd+0Xjud1Zg==
X-Received: by 2002:a05:600c:3b8c:b0:412:faa6:b45d with SMTP id n12-20020a05600c3b8c00b00412faa6b45dmr2403274wms.5.1709803070083;
        Thu, 07 Mar 2024 01:17:50 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id er15-20020a05600c84cf00b00412ff07df2bsm1926934wmb.37.2024.03.07.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 01:17:49 -0800 (PST)
Date: Thu, 7 Mar 2024 12:17:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH v2] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
Message-ID: <27c875fb-9507-4034-8468-c4d46c952754@moroto.mountain>
References: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org>
 <8ae44e8e-fc3d-28bd-5d1e-e900ce53529f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ae44e8e-fc3d-28bd-5d1e-e900ce53529f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_011756_277199_31037BBF 
X-CRM114-Status: GOOD (  21.92  )
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

T24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgMDk6NDU6MTNBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzIvMjggODo0NiwgRGFuaWVsIEdvbGxlIOWGmemBkzoKPiA+IEEgY29t
cGlsZXIgd2FybmluZyByZWxhdGVkIHRvIHNpemVvZihpbnQpICE9IDggd2hlbiBjYWxsaW5nIGRv
X2RpdigpCj4gPiBpcyB0cmlnZ2VyZWQgd2hlbiBidWlsZGluZyBvbiAzMi1iaXQgcGxhdGZvcm1z
Lgo+ID4gQWRkcmVzcyB0aGlzIGJ5IHVzaW5nIGludGVnZXIgdHlwZXMgaGF2aW5nIGEgd2VsbC1k
ZWZpbmVkIHNpemUuCj4gPiAKPiA+IEZpeGVzOiAzY2U0ODU4MDNkYTEgKCJtdGQ6IHViaTogcHJv
dmlkZSBOVk1FTSBsYXllciBvdmVyIFVCSSB2b2x1bWVzIikKPiA+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBHb2xsZSA8ZGFuaWVsQG1ha3JvdG9waWEub3JnPgo+ID4gLS0tCj4gPiB2MjogdXNlIHNp
emVfdCBmb3IgJ2J5dGVzX2xlZnQnIHZhcmlhYmxlIHRvIG1hdGNoIHBhcmFtZXRlciB0eXBlCj4g
PiAKPiA+ICAgZHJpdmVycy9tdGQvdWJpL252bWVtLmMgfCA1ICsrKystCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jIGIvZHJpdmVycy9tdGQvdWJpL252bWVtLmMKPiA+
IGluZGV4IGI3YTkzYzQ5NWQxNzIuLmU2OGI4NTg5YzQyNzkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL210ZC91YmkvbnZtZW0uYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvdWJpL252bWVtLmMKPiA+
IEBAIC0yMyw5ICsyMywxMiBAQCBzdHJ1Y3QgdWJpX252bWVtIHsKPiA+ICAgc3RhdGljIGludCB1
YmlfbnZtZW1fcmVnX3JlYWQodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IGZyb20sCj4gPiAgIAkJ
CSAgICAgIHZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKQo+ID4gICB7Cj4gPiAtCWludCBlcnIgPSAw
LCBsbnVtID0gZnJvbSwgb2ZmcywgYnl0ZXNfbGVmdCA9IGJ5dGVzLCB0b19yZWFkOwo+ID4gICAJ
c3RydWN0IHViaV9udm1lbSAqdW52ID0gcHJpdjsKPiA+ICAgCXN0cnVjdCB1Ymlfdm9sdW1lX2Rl
c2MgKmRlc2M7Cj4gPiArCXNpemVfdCBieXRlc19sZWZ0ID0gYnl0ZXM7Cj4gPiArCXVpbnQzMl90
IG9mZnMsIHRvX3JlYWQ7Cj4gVGhlcmUgc3RpbGwgZXhpc3QgYSB0eXBlIHRydW5jYXRpb24gYXNz
aWdubWVudCAndG9fcmVhZCA9IGJ5dGVzX2xlZnQnIGJlbG93LAo+IGFsdGhvdWdoIGl0J3Mgc2Fm
ZSBpbiBsb2dpYy4KClllYWguICBBcyB5b3Ugc2F5LCBmcm9tIGxvb2tpbmcgYXQgdGhlIGxvZ2lj
IHdlIGtub3cgaXQncyBzYWZlLgoKICAgIDQxICAgICAgICAgICAgICAgICAgaWYgKHRvX3JlYWQg
PiBieXRlc19sZWZ0KQogICAgNDIgICAgICAgICAgICAgICAgICAgICAgICAgIHRvX3JlYWQgPSBi
eXRlc19sZWZ0OwoKT2J2aW91c2x5IHRoZSBuZXcgdmFsdWUgaXMgc21hbGxlciB0aGFuIHRoZSBv
cmlnaW5hbCwgc28gaXQgbXVzdCBmaXQKd2l0aGluIGEgdTMyIHJhbmdlLi4uCgpUaGlzIGJ1ZyBo
YXMgYmVlbiBicmVha2luZyB0aGUgYnVpbGQgc2luY2UgRGVjIDE5LiAgSXQncyBmaW5lIGlmIHlv
dSdyZQphYmxlIHRvIG1hbnVhbGx5IGNyZWF0ZSB5b3VyIG93biAuY29uZmlncyB0byB3b3JrIGFy
b3VuZCBidWlsZCBicmVha2FnZS4KQnV0IGlmIHlvdSdyZSBkb2luZyBhdXRvbWF0ZWQgdGVzdGlu
ZyBhdCBzY2FsZSB0aGVuIGl0J3MgYSBzaG93IHN0b3BwZXIuCkNvdWxkIHdlIHBsZWFzZSBmaXgg
aXQuCgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
