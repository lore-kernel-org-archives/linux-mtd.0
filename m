Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D94C9830E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjPyzVImLUmtk93VidpDOyGVA6zSKdO6YQm2/Zq6jQ4=; b=46e9AR1WmM7EM1
	O4+2b3ccnZwE0kcSzmDMPlgZJxnIWd4qAdjOMkWNyzbd4h8qG2hNayc0wqWhRBMTgMvXpJMZtATj6
	ip34Gu5hKYUWHysryoIeqDPQOnMJIHFvgLBYB+5SrvZ5kNpQmRtDR9sUEz02ukqdTqdnvZB/O0dcK
	yf552JFoz2jE/RB7gHlu4xnK5vhNxiSCUDzj5N8MHvY5kkbxZBgikJYg6bzGSUrLJq7UYZUOjZQVf
	LOacyWoQ13N4KecOBpPA6tzLJPn1s4gbaVvZmVLbOYh1rfZ2D10fVvsV+kMCAExf6Cnw876dTPej5
	q+n2ltUQwEtfpjSnfhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pxb-0000000C8Dg-1ipH;
	Thu, 24 Sep 2026 20:22:27 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pxY-0000000C8D7-4418
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:22:26 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e66390995so1268815e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281343; x=1790886143; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=KwJfHzb/MrMLkfsl6qUFqy9m5q9SMJRQ1+QrPxaVetWHX+nMMVr0IDUNVGNuvR7l1x
         j9bzQKpi9kODc+3uJct/G4HqT+zGtJBvbre/C3AsY7tiKfW504aNOquFgc85vPLzzcGC
         Q82PFkBxWTK4x3mmH/yBwc7aCZ9+7FMup7tm8k7fur4m0O0Fdue9HG+ksOXHFIUgD3dd
         k3q63QBMuxHwfHZukvlCUGWkddaECF4KvT7AuKXvkvxT0Gba6kdz/mtaen1kzhdgXDlX
         hsGhqnqXxePmXNoSCXMTby/lF3TDjoY1HmAvyYRMjgfIBSx2t14gKwTsr8yx8B7qflzY
         sXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281343; x=1790886143;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=0oaEE8efN5Zcpx5tesG9PJA9RWOcnCCb2cw7f1ScALDfCn6QnGbDySAvPSM8YeZO8u
         7rsnz3EKWpWl5+lMHQoBOX57jLHnMQ1G04GKZd2A49g0CutfgrBw9ICDeXd2Ta22Iekh
         0OOb/Flzd86xQsJ6psqtZpZc3i2gwhVemOOMX/ReQJYRMnGJwvaMNJ7WG5FmgVmxfilu
         ozVMNXbBYeZNf6yLPscY2uQk3FpeMNOT3hYXS1bFiixTQEVL06nWDdy1JqsO01ot6+FG
         sMGsvVQwJFLX1abumOIHMYWnZNL65b7pG9PrQxU245UIWHR0pD+UdZ65kH5WyELwnATV
         76sA==
X-Forwarded-Encrypted: i=1; AKwUvByG4IsCds1o1ITdHLBfGJrYws4w2BvxbVrU2Vc60ET2vjsLbG8G65UqMNOK4oGkvfKt6XPnTkE8a08=@lists.infradead.org
X-Gm-Message-State: AFuF++nvvibdb9CWThMYTroAoObXgOb+mmmKPeoTIRUOtEhZoa8yI7l3
	aVQC1x1cYkm5Sedv6vMCeXW8Ysn/KS+ZvfQJXSLjzDaeGKz8cYmwMQi8
X-Gm-Gg: AYBFou0BVmfJqdE5CTPTJa2yc1exj1d6664u8odhPi2RznoaQC71jvFpykgZUEoZVja
	CA8bDxrlQ+y9euhkBV+HmzJ9eoNKptu4peQZzmHKHo9aRAKQmY5KajPrCFBswyo++nrnBC4+9Ff
	j8wV2sqhnqgLmXxakxBrj7xm1xgX9WT0kUMRdQQfSEKcTDZMlPfYtiFqnDV6B3ZdXtoiLJcHLn2
	8qH4sbxFdoMCHd58KxqC8DOcF7eQMMik1EaoxAEhxvKAzdMEqkymmTI/7v1T2GXkwSo5rZFD5QG
	dut5pio0Vxo6jW18qGIr11IIEl1cf4jzSlrH/5USngWUD39SFGHJzmh0hBhkZVT8cG7DdS7QBs6
	APk36/grzhqD5A4Q5Xl0g7PUNVmkSv1RmIJI645Fqb/FFYyz6Fpz/41j5//Hm3XlCmrCt5iYUTL
	X1T/ZfljlCjz8M+6Jk/wb0tEHtISB9YoDLwRBgl/njwgOm0JcfRRPdUygqn5B+SimIuSsw30hDw
	1Ytp7UhFrp66DyHDIWShwRGDzgX085uB8AbgA==
X-Received: by 2002:a05:600d:486:20b0:49f:e941:e26 with SMTP id 5b1f17b1804b1-49ff06b2f01mr1636645e9.4.1790281342890;
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b6108sm3413815e9.8.2026.09.24.13.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Message-ID: <bebf5c3e-74c9-4355-b4da-294a87549d38@gmail.com>
Date: Thu, 24 Sep 2026 22:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
Content-Language: hu
To: sashiko-reviews@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
 <20260924200931.6ED351F00893@smtp.kernel.org>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260924200931.6ED351F00893@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_132225_022499_39C180A9 
X-CRM114-Status: GOOD (  20.04  )
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

MjAyNi4gMDkuIDI0LiAyMjowOSBrZWx0ZXrDqXNzZWwsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcg
w61ydGE6Cj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZp
ZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Cj4gLSBbTWVkaXVtXSBt
dGQ6IHJhd25hbmQ6IHFjb206IG1pc21hdGNoIGJldHdlZW4gY29tbWl0IG1lc3NhZ2UgYW5kIGZ1
bmN0aW9uIHByZWZpeAo+IC0tCj4gCj4gY29tbWl0IGE4MzYwN2U2M2VjNTM0MjlkYzQyNTI2MjA5
M2VlZjlkZWUzYmZkNGUKPiBBdXRob3I6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgo+
IAo+IG10ZDogcmF3bmFuZDogcWNvbTogbWFrZSBjaGVja19mbGFzaF9lcnJvcnMoKSBtb3JlIGdl
bmVyaWMKPiAKPiBUaGUgZnVuY3Rpb24gZ2V0cyBhIHFjb21fbmFuZF9ob3N0IHBvaW50ZXIgYXMg
YSBwYXJhbWV0ZXIgYnV0IGl0IGlzCj4gb25seSB1c2VkIHRvIGV4dHJhY3QgdGhlIG5hbmQgY29u
dHJvbGxlcidzIHByaXZhdGUgc3RydWN0dXJlIGZyb20gdGhhdC4KPiBJbiBvcmRlciB0byBtYWtl
IHRoZSBmdW5jdGlvbiBtb3JlIGdlbmVyaWMsIGNoYW5nZSB0aGUgZGVjbGFyYXRpb24gdG8KPiBn
ZXQgYSBxY29tX25hbmRjX2NvbnRyb2xsZXIgcG9pbnRlciBkaXJlY3RseSwgYW5kIHVwZGF0ZSB0
aGUgY2FsbGVycwo+IGFjY29yZGluZ2x5Lgo+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4+IGluZGV4IGQ3NjQyZGIyZTJkZjEuLjEyYmZiMTRjZDlhMzcgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMKPj4gQEAgLTQ0OSwxMCArNDQ5LDkgQEAgc3RydWN0IHJlYWRfc3Rh
dHMgewo+PiAgfTsKPj4gIAo+PiAgLyogcmVhZHMgYmFjayBGTEFTSF9TVEFUVVMgcmVnaXN0ZXIg
c2V0IGJ5IHRoZSBjb250cm9sbGVyICovCj4+IC1zdGF0aWMgaW50IGNoZWNrX2ZsYXNoX2Vycm9y
cyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhvc3QsIGludCBjd19jbnQpCj4+ICtzdGF0aWMgaW50
IHFjb21fbmFuZGNfY2hlY2tfZmxhc2hfZXJyb3JzKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxl
ciAqbmFuZGMsCj4+ICsJCQkJCSBpbnQgY3dfY250KQo+PiAgewo+IAo+IFtTZXZlcml0eTogTWVk
aXVtXQo+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCB0aGVyZSBpcyBhIG1pc21hdGNoIGJldHdlZW4g
dGhlIGNvbW1pdCBtZXNzYWdlIGFuZAo+IHRoZSBhY3R1YWwgZnVuY3Rpb24gcmVuYW1pbmcuCj4g
Cj4gVGhlIGNvbW1pdCBtZXNzYWdlIHN0YXRlcyB0aGUgZnVuY3Rpb24gd2lsbCB1c2UgdGhlICJx
cGljX25hbmRjIiBwcmVmaXg6Cj4gIldoaWxlIGF0IGl0LCBhbHNvIGNoYW5nZSB0aGUgZnVuY3Rp
b24gbmFtZSB0byB1c2UgYSAncXBpY19uYW5kYycgcHJlZml4LiIKPiAKPiBIb3dldmVyLCB0aGUg
Y29kZSBjaGFuZ2VzIHRoZSBuYW1lIHRvIHFjb21fbmFuZGNfY2hlY2tfZmxhc2hfZXJyb3JzLCB1
c2luZwo+IHRoZSAicWNvbV9uYW5kYyIgcHJlZml4IGluc3RlYWQuCj4gCj4gQ291bGQgdGhlIGNv
bW1pdCBtZXNzYWdlIGJlIHVwZGF0ZWQgdG8gbWF0Y2ggdGhlIGNvZGUsIG9yIHNob3VsZCB0aGUK
PiBmdW5jdGlvbiBiZSBuYW1lZCBxcGljX25hbmRjX2NoZWNrX2ZsYXNoX2Vycm9ycz8KPiAKCk1h
eSBiYWQsIHRoZSBjb21taXQgbWVzc2FnZSBpcyB3cm9uZyBvZiBjb3Vyc2UuIEkgd2lsbCBmaXgg
aXQgaW4gdGhlIG5leHQKdmVyc2lvbiwgYWxzbyBpbiB0aGUgdGhlIG90aGVyIHBhdGNoZXMuCgot
R2Fib3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
