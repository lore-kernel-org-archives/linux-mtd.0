Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA74C52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMjYiMRqvOHg8m7ljqgqGoityMrdieDEHxed3JDeTz4=; b=CNF6S49RPoyjgP
	9Ci5s4HoU0DqHECs9cPdKiuzdTmOzMuqewjmzJWVwyB4yVNu8MsJvseJ1BmgFwljFBMFkuUS33ExM
	/TM2bmAO5rUiOCPRnSGoxssrdSwdnDE0PVl4Q7DGlzK5JDP8jAX4fMqE0nOjrZDmrqjsYSd+7wScH
	+YivzVi3PaEAHLnW6YVTfHY4vMB9G3kkJK8XIggV+RhgPu5O8Mv9WDmrL788lZKho2fXNOJn6e85y
	jKDZ0t6DjkZwlPkDvD56QGTN9Gr3G5lh4+CC9ucOZJAi0w5H7uPiJBYwawvuwCt20EN8j5cBb11n6
	tbjVGUySl3IlzGykMRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRe2-0000000HVsP-0xpD;
	Mon, 12 Aug 2024 09:47:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRd3-0000000HVa1-0npz;
	Mon, 12 Aug 2024 09:46:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fd65aaac27so34244115ad.1;
        Mon, 12 Aug 2024 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723455976; x=1724060776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUxh3YwlPzmy+PcO3DHdAzw/4G592svoiNiI2B6pc4k=;
        b=lPmkJMZMhvDq7hCW3jsvdK2PX6/iCOCiWCgDMZMU0Et4wBOSsqlAIj471vBAUdbeDf
         yENpm8yu/gPmcDbj3zJNyqRdn1KNDesEfmAd9d4D4tI6bYEGZfz800u1cvAZFy18Pa2y
         h0iaUWUnDkYYq8RlHsRvpa9bmuv+fyUzuncwim+Y8elgJMuS3e7T1bCqMucYeuqSUYeQ
         xT89wzXpUnWXgoXgfXvscsPwl3ItiC7vjAtZaOwMvfBmxNBmZBUnp6JWviswZFvnr1Up
         5i5npdDTgceJQIxgcJl+KYTdhRRbSAdjE8xhBMaN7f/xyUsuVfSPmsUvOXerj/Vpl8dL
         xkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723455976; x=1724060776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUxh3YwlPzmy+PcO3DHdAzw/4G592svoiNiI2B6pc4k=;
        b=cNw0/HMSnUPNl+ZvkNASxzrGSbKz3mLIGX9ZOTDQoAukmLTtMtyorQ67chii/upC3E
         LV8qNGyrtGrdjLaKpFxZOGXWCXwG+serGNDUuwKhVFzKz8+GUIAd2sU3iB7M1/VYTHeB
         3nhwDZNNPpRlaoaPU2LEGpsht01Hamhz0L+39FO7CkTh9Y5i3BbEjGSDjSLAZRf9SXYx
         YVmnafCq+/qR88TS6jmgREIW2lfZcBi+r9o+qS519BaH7eyS6x3Mrbxzc2IZ1iDjNERN
         ttua7krjp32QvWXR4USvFJl4IsJBc5cY5Q2dz3jece7WWqjfuXGEMakY4YJlfokKKIgA
         oq7g==
X-Forwarded-Encrypted: i=1; AJvYcCUwHby2Bkk3K6i4ksGO91lnmg4F99suKWh55eSi82uTmUIttqpAOs83O40YDzTS7or6puWJR3lYuOU++iv3W9VMu8mm/A4NR/WopyZttA==
X-Gm-Message-State: AOJu0Yw7XC8i+pQ3Q+amXS3UnCIMG0ktIFzNmWIXViJ3LTxru2QDPfgy
	c/+Iua6cqq+yxChAnvAXnb0CpiqPC/Ne6Qi7qAMZxNtI7JjRrewY
X-Google-Smtp-Source: AGHT+IEhL4arKcRb/xw7OVPVg6BiQe2H2AJSFtWsVZ5BkuWfnuoclUhY2oj8Zy9Gy/7Hw/+kdf10Dg==
X-Received: by 2002:a17:902:ea01:b0:1fb:8e29:621f with SMTP id d9443c01a7336-200ae567dd3mr136423225ad.16.1723455976170;
        Mon, 12 Aug 2024 02:46:16 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9b17dasm34061725ad.137.2024.08.12.02.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:46:15 -0700 (PDT)
Message-ID: <b9f9cbae-c4d8-420e-865b-e0f48dfa9667@gmail.com>
Date: Mon, 12 Aug 2024 17:46:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton
 MA35 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-3-hpchen0nvt@gmail.com>
 <06d627d5-947c-4da4-826a-76033386b575@kernel.org>
 <3b7b629e-0085-4821-932c-e89faad15c1a@gmail.com>
 <33ae3c93-81cb-491c-a5b3-239c7c413eb3@kernel.org>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <33ae3c93-81cb-491c-a5b3-239c7c413eb3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_024617_256021_B7875FE9 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

RGVhciBLcnp5c3p0b2YsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKCgpPbiAyMDI0Lzgv
MTIg5LiL5Y2IIDA1OjEzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDEyLzA4LzIw
MjQgMTE6MTAsIEh1aS1QaW5nIENoZW4gd3JvdGU6Cj4+Pj4gKwo+Pj4+ICsvKiBOQU5ELXR5cGUg
Rmxhc2ggQkNIIEVycm9yIERhdGEgUmVnaXN0ZXJzICovCj4+Pj4gKyNkZWZpbmUgTUEzNV9ORklf
UkVHX05BTkRFQ0NFRDAJKDB4OTYwKQo+Pj4+ICsjZGVmaW5lIE1BMzVfTkZJX1JFR19OQU5ERUND
RUQxCSgweDk2NCkKPj4+PiArI2RlZmluZSBNQTM1X05GSV9SRUdfTkFOREVDQ0VEMgkoMHg5Njgp
Cj4+Pj4gKyNkZWZpbmUgTUEzNV9ORklfUkVHX05BTkRFQ0NFRDMJKDB4OTZDKQo+Pj4+ICsjZGVm
aW5lIE1BMzVfTkZJX1JFR19OQU5ERUNDRUQ0CSgweDk3MCkKPj4+PiArI2RlZmluZSBNQTM1X05G
SV9SRUdfTkFOREVDQ0VENQkoMHg5NzQpCj4+Pj4gKwo+Pj4+ICsvKiBOQU5ELXR5cGUgRmxhc2gg
UmVkdW5kYW50IEFyZWEgUmVnaXN0ZXJzICovCj4+Pj4gKyNkZWZpbmUgTUEzNV9ORklfUkVHX05B
TkRSQTAJCSgweEEwMCkKPj4+PiArI2RlZmluZSBNQTM1X05GSV9SRUdfTkFORFJBMQkJKDB4QTA0
KQo+Pj4+ICsKPj4+PiArI2RlZmluZSBTS0lQX1NQQVJFX0JZVEVTCTQKPj4+PiArCj4+Pj4gKy8q
IEJDSCBhbGdvcml0aG0gcmVsYXRlZCBjb25zdGFudHMgYW5kIHZhcmlhYmxlcyAqLwo+Pj4+ICtl
bnVtIHsKPj4+PiArCWVCQ0hfTk9ORSA9IDAsCj4+Pj4gKwllQkNIX1Q4LAo+Pj4+ICsJZUJDSF9U
MTIsCj4+Pj4gKwllQkNIX1QyNCwKPj4+PiArCWVCQ0hfQ05UCj4+Pj4gK30gRV9CQ0hBTEdPUklU
SE07Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgY29uc3QgaW50IGdfaTMyQkNIQWxnb0lkeFtlQkNIX0NO
VF0gPSB7QkNIX1Q4LCBCQ0hfVDgsIEJDSF9UMTIsIEJDSF9UMjR9Owo+Pj4+ICtzdGF0aWMgc3Ry
dWN0IG5hbmRfZWNjbGF5b3V0X3VzZXIgbWEzNV9uYW5kX29vYjsKPj4+IFdoeSB0aGlzIGlzIGZp
bGUtc2NvcGU/Cj4+IEkgd2lsbCByZW1vdmUgdGhlIGBzdGF0aWNgLgo+IE5vLCB3aHkgdGhpcyBj
YW5ub3QgYmUgaW5zdGFuY2UgZGVwZW5kZW50PyBRdWljayBsb29rcyBzYXlzIGl0IGNvdWxkLgo+
IEFuZCBzaG91bGQuCgpJIHdpbGwgYWRkIHRoaXMgdmFyaWFibGUgdG8gdGhlIG1hMzVfbmFuZF9p
bmZvIHN0cnVjdHVyZS4KCgoKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgpCZXN0IHJl
Z2FyZHMsCgpIdWktUGluZyBDaGVuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
