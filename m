Return-Path: <SRS0=UES7=CM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A15C433E2
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 05:35:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71CA2072A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 05:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KR4fRkpj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiKBxH0q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71CA2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B35UFidIYAPbqfmolLkwRtsKz4vW8ZdShRGT3DOdekM=; b=KR4fRkpjMelSEKuMi4a5+RAPu
	saupXyrqPVhJ8PjeLwAUIOSefs+OxYtgIEwXLVmkI86Kp6tST95Nv3XVdInSTo11eXPJ0O1NXJtnx
	WqvC41uDiR1sMVdsxFKOkKh10EdEdCFPiuI9E72JgB8flukGCHCgVfRb13D5ck/q13u6XErMaaR5i
	TH/+CjtCQ5T+RXUEWtdP3CTZ151NM1V5kJ0vp9t1IXEWjn+1F/IqGJBPvbHXpjIeUIVdx59B9MMyQ
	fY2l9/iYpwRf3jp6Bte2ywAHZFdCfeLPf8zJm3ytWg//gcUO665DLsgdtuiSYsvaBpEx6wNtP5V2F
	np3eH/wyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhsk-0000ag-Do; Thu, 03 Sep 2020 05:33:58 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDhsi-0000aI-D2
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2020 05:33:57 +0000
Received: by mail-il1-x142.google.com with SMTP id t16so1352759ilf.13
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2020 22:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hbAn/DuSytUoZ4bnWOTooy1Jwy2EiovsNUAVVfmZyT8=;
 b=QiKBxH0qgYXnarSechP09RxYOvHETv92EDhNvqiQDR/hWhxOQ/XMJ7DLXJvLT8gluW
 Na+AgOc/oZ7wQls8i5GXSVpmu2h5mRvSl5PK8yWt9K8w/TAliTM3WN4oZZSxROlsiePw
 OkWkg7Zz9HwaVvnFOvyCbZt6aOyNV1F64EaBpQ8cNAi4Sjw2upbotB1lB7F8S2Bd3H6N
 gk8QrrOzNqVf1LLT7y/Ra1XFdKytgRuIdGWbDvT7u3GdOz/NRss+oiHIG7UvTFI1bdiY
 kTAPKAyoO/YbsN+NCPP4zrDYq+IWixT0ko93w4V4ZdcOudtH9KLpxQ0393+R+otU5Bu5
 rVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hbAn/DuSytUoZ4bnWOTooy1Jwy2EiovsNUAVVfmZyT8=;
 b=q1C4vyqzNgK07dmG3ijgrIXEzfyJUPQG/asfmpKzpdbpT3x01OxohesDAkMQWdJul4
 EzONxKhVEAXZZx4WVornXAgAiTRMfqi8SiX2LFmDz7H9i2s6RO9oahw6CEe5oNUToNzT
 Bx5BArgJiRvJUTdpSgkWF+km0IbjAhJTkV4yGLzVQ29lQpJE/e7Ug3nfbgQr0mZ6dt5T
 C1pngqWoASQPX7WJQbFniQ60xBVtt15WMtYUXVGt+PS+O1FzmNAhx8iJPL1dddVuDzXB
 /ei2RJvnHRXaZH3DHJDm/xs7/ysHi4vWlPRCowRm6GvEauk4ybu5Wshknt9BzyryitYK
 dU9Q==
X-Gm-Message-State: AOAM532S4SgIPnGAGKq/QP6F2LT3lE3m507Vw+Td88Dq5M9EG4aFeDz5
 VWWLpG1RzemacxF+nFKeK81CTrLCC2ULsadacw==
X-Google-Smtp-Source: ABdhPJw2pDB/owo6HbOCQqIECdqSc5hn9kcbwOpNHpk2vGeztzks4ZmKvBwvVty5HXcY39Sq2ey1AdoiGPuriJ6Xxcw=
X-Received: by 2002:a92:cccb:: with SMTP id u11mr1700021ilq.54.1599111234396; 
 Wed, 02 Sep 2020 22:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
 <CAO8h3eE2ZzffbAC_pk+uDwxMtmPWbkHCXnxvXz-hLujueH3jFQ@mail.gmail.com>
 <47b73fec-7af2-98f8-776e-f9a8660bd219@hisilicon.com>
In-Reply-To: <47b73fec-7af2-98f8-776e-f9a8660bd219@hisilicon.com>
From: =?UTF-8?Q?Matthias_Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Date: Thu, 3 Sep 2020 07:33:42 +0200
Message-ID: <CAO8h3eEYVxzSp1eK6f8z=cnO=hpwq1o47JgnhkWpiLfLYPdtQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Yicong Yang <yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_013356_484790_71CC56B7 
X-CRM114-Status: GOOD (  22.25  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gRG8uLCAzLiBTZXB0LiAyMDIwIHVtIDA1OjA0IFVociBzY2hyaWViIFlpY29uZyBZYW5nCjx5
YW5neWljb25nQGhpc2lsaWNvbi5jb20+Ogo+Cj4gSGkgTWF0dGhpYXMsCj4gT24gMjAyMC85LzIg
MjA6MTUsIE1hdHRoaWFzIFdlacOfZXIgd3JvdGU6Cj4gPiBIaSBWaWduZXNoCj4gPgo+ID4gQW0g
RGkuLCAxLiBTZXB0LiAyMDIwIHVtIDE2OjIwIFVociBzY2hyaWViIFlpY29uZyBZYW5nCj4gPiA8
eWFuZ3lpY29uZ0BoaXNpbGljb24uY29tPjoKPiA+PiBJJ3ZlIHRlc3RlZCB0aGUgZm9sbG93aW5n
IHBhdGNoIHdpdGggczI1ZnMxMjhzMS4KPiA+PiBJIGxlZnQgdGhlIGZsYXNoIHF1YWQgZW5hYmxl
ZCBiZWZvcmUgbWFuYWdlZCBieSBzcGktbm9yIGRyaXZlciwKPiA+PiBhbmQgaXQnbGwgc3RheSBR
RSBhZnRlciByZW1vdmVkLiBTbyBJIHRoaW5rIGl0J2xsIGFsc28gYWRkcmVzcyB0aGUgaXNzdWUK
PiA+PiBtZW50aW9uZWQuIFBsZWFzZSBoYXZlIGEgdGVzdC4KPiA+IFRoYW5rcyBmb3IgdGhlIHBh
dGNoLiBJIGNhbiBjb25maXJtIHRoYXQgY3VycmVudCA1LjktcmMzIGJyaWNrcyBteSBoYXJkd2Fy
ZQo+ID4gYW5kIHlvdXIgcGF0Y2ggb24gdG9wIG9mIGl0IGZpeGVzIHRoYXQuIFRoZXJlZm9yZQo+
ID4KPiA+IFRlc3RlZC1ieTogTWF0dGhpYXMgV2Vpc3NlciA8bS53ZWlzc2VyLm1AZ21haWwuY29t
Pgo+ID4KPiA+IEJ1dCBJIGFtIHN0aWxsIGNvbmNlcm5lZCBhYm91dCB3ZWFyaW5nIG91dCBub252
b2xhdGlsZSBRRSBiaXRzIChub3QgaW4gbXkKPiA+IGNhc2UsIGJ1dCB0aGVyZSBtYXkgYmUgb3Ro
ZXJzKSB3aGljaCBtYXkgYWxzbyBicmljayBoYXJkd2FyZSBhZnRlciBhIGxvdCBvZgo+ID4gYm9v
dHMgKGJ5IHNldCBhbmQgcmVzZXQgUUUgYml0IG9uIGV2ZXJ5IGJvb3QpLgo+ID4KPiA+IFNvLCBm
cm9tIG15IGxpbWl0ZWQgcG9pbnQgb2YgdmlldywgeW91ciBwYXRjaCBmaXhlcyBteSBwcm9ibGVt
IGJ1dCBvdmVyYWxsCj4gPiBJIHRoaW5rIHRoZSBvcmlnaW5hbCBhcHByb2FjaCBzaG91bGQgYmUg
dGhvdWdodC1vdXQgYSBiaXQgbW9yZS4KPgo+IFRoYW5rcyBmb3IgdGVzdGluZyB0aGUgcGF0Y2gu
Cj4KPiBUaGUgZHJpdmVyIHdpbGwgdHJ5IHRvIHNldCB0aGUgUUUgYml0IHdoZW4gMSkgaW4gLT5x
dWFkX2VuYWJsZSgpIGlmIFFFIGJpdCBpcyBub3Qgc2V0IGFuZAo+IDIpIHByZXZpb3VzbHkgd2l0
aG91dCB0aGlzIHBhdGNoIGluIHNwaV9ub3JfcmVzdG9yZSgpIHRvIHRyeSB0byBkaXNhYmxlIHRo
ZSBmbGFzaCBxdWFkIG1vZGUuCj4KPiBXaXRoIHRoaXMgcGF0Y2gsIGlmIHRoZSBRRSBiaXQgaXMg
b3JpZ2luYWxseSBzZXQgdGhlIGRyaXZlciB3aWxsIG9ubHkgcmVhZCBhbmQgcmVjb3JkIGl0IGFu
ZAo+IHdpbGwgbm90IGRpc2FibGUgdGhlIHF1YWQgbW9kZSBpbiBzcGlfbm9yX3Jlc3RvcmUoKS4g
V2hhdCB0aGUgZHJpdmVyIHdpbGwgZG8gaXMgdG8gcmVhZAo+IHRoZSBiaXQsIHdpdGhvdXQgdHJ5
aW5nIHRvIHNldCBvciByZXNldCBpdC4gU28gSSB0aGluayBpdCB3aWxsIG5vdCB3ZWFyIG91dCB0
aGUgdGhvc2Ugbm9udm9sYXRpbGUKPiBRRSBiaXRzLgoKSSB0aGluayBpdCB3aWxsLiBFeHBlY3Qg
YSBmbGFzaCB3aXRoIHRoZSBRRSBiaXQgbm90IHNldC4gS2VybmVsIGJvb3RzLCBzZXQgdGhlCmJp
dCB3aGljaCB3aWxsIGNhdXNlIGFuIGVyYXNlIGN5Y2xlIChzZXR0aW5nIGl0IGZyb20gMCB0byAx
KS4gT24gc2h1dGRvd24gdGhlCmJpdCBpcyByZXNldCAodHJhbnNpdGlvbiBmcm9tIDEgdG8gMCkg
d2hpY2ggd2lsbCBjYXVzZSBhIHByb2dyYW0gY3ljbGUuIFNvLApldmVyeSBib290IC0+IHNodXRk
b3duIGN5Y2xlIGNhdXNlcyBhdCBsZWFzdCBvbmUgcHJvZ3JhbS1lcmFzZSBjeWNsZSB3aGljaCB3
aWxsCndlYXIgb3V0IHRoYXQgYXJlYSBvZiB0aGUgZmxhc2guCgpTZWUgYWxzbyB0aGlzIHF1b3Rl
IGZyb20gdGhlIGRhdGFzaGVldCBvZiBGMjVGTDUxMlM6CiJOb24tdm9sYXRpbGUgYml0cyBoYXZl
IHRoZSBzYW1lIGN5Y2xpbmcgKGVyYXNlIGFuZCBwcm9ncmFtKSBlbmR1cmFuY2UKYXMgdGhlIG1h
aW4KZmxhc2ggYXJyYXkuIgoKSSBzdGlsbCB0aGluayB0aGUgcmVzZXQgb2YgdGhlIFFFIChvciBh
bnkgb3RoZXIgbm9uLXZvbGF0aWxlKSBiaXQgb24Kc2h1dGRvd24gc2hvdWxkCmJlIHByZXZlbnRl
ZCBhbmQgb25seSBhbGxvd2VkIGJ5IGV4cGxpY2l0bHkgZW5hYmxlIGl0IChlLmcuIHBlciBzeXN0
ZW0gaW4gRFQgb3IKcGVyIGZsYXNoIGluIGZsYXNoX2luZm8gc3RydWN0KS4KClJlZ2FyZHMsCk1h
dHRoaWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
