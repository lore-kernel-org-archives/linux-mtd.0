Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE5EC87FCB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Aug 2025 18:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vwegx3Cyu5sIDVou7OGAMnqHD2FsnvSpRUE1K9vPvE=; b=n9UteKf01vimnB
	Nxap0iM+0CnjJraOTyXmxvlU+hAuuEB6lwneSzcl6chqAWDQj7YSCAe0SatAVFYzv1DqPLgdGOFXS
	wER3rV9TCDnN9sLIA2Mprku90Ab7N0/jqlEL9PrDqmOb+r8c2YSdDlVJl89cwIUa/mO9+u5mGQ1pg
	FAe2TPpTpGo1Jk7ka4HtxuuWUOQebGSo1VypoP0ctlZxKJHbKJR5JZfgN3Ore9kmEc5/xftRKtVR8
	+CXE7YevMtoCSIwljUcKm7TdJeG0gptPl6TvWFil/ExfEMcXCim/lqApzot2yO+beGqPdaNR9DQ3A
	zE3SAnBbdgFOWOCQ2NXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjAr-0000000G7Ly-2KdP;
	Wed, 06 Aug 2025 18:47:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujj3l-0000000G6CZ-1rV4
	for linux-mtd@lists.infradead.org;
	Wed, 06 Aug 2025 18:40:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-459e1338565so1983055e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2025 11:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754505620; x=1755110420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNr8/snCMDeN3hnWgTzW7w5ASTFc/odDoWi1wihy0vo=;
        b=fejWH9uV67HlgYMBqNfWntHiyJZEAsGDU1gMrojJ8lBquCeB4Hjl34gUM9eTIp1mnt
         CwgncPCzPvnebXqVbYwu9HgBotw948bP/Og86B/6Xore9wBI81q03o8eUm5bpIZmw+yT
         igAgoAAhkYsVsQeYUpr3S7arrLmvhlki4y4doAC9HzIN+O5z7fTRi1/iVX0iEexjz4Cc
         nwwTjc3XCXmK3GlBSFnUAjW6bgicTm3vDScudfA40rx50IaCwjmhG4ajBwoKe44fYvPA
         6Fa1Vjfe5CGM6CcRQVylXhghJQvZeeh9GHyFgtdLVpI84A/3e8SYVm2+ZucplIAw5j04
         qB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754505620; x=1755110420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNr8/snCMDeN3hnWgTzW7w5ASTFc/odDoWi1wihy0vo=;
        b=gBtMCmYdIIkO2/SkGv+D7rYQxDykhP9+XMn9p9vDhy8tswg4GKG6HyGers9Z98Bkv5
         3o1yyjEkCSR1GJSwK8NtIYxmrTJVtAg0X6aUdwUx1UShigGJyBu16hbzaujMiCWFmP7m
         AFz2/DZK0BO3JOfadJjfAPaHMY1q5eEpMsweL1WpIGtPf0iradpdwIQcqgIebIKV4fVR
         V5KgnpXeG5k3XtnxbaZ1MyHKfR/L+MmG7PybXmd3WuBUP0F31M2Znj1i5XChdwCwr0A8
         zjKBMQndBqyDluFmQ8wJKxYbmXAWo44XV7uH7d7H1YbtCOqHWxs5IFT4ILnK6BDhdaCV
         4b+w==
X-Forwarded-Encrypted: i=1; AJvYcCWe1aE5ayQ2mqYi9IlPHYyVYG3GdqsmyUsaiXJSNLFM35hOlRIXlBLsv9xawhqO1QJSA1p8G58oDjk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6oHJotgEdUUCdsgd2J52jKBHRK9azc5Gg3aXY4M8yAsQAaTeE
	ZgS+3gOsV4OlJtlTTa41A+VJiV+xzLb4PTzNRCbJV180SBT54yq6QzqEIkd6YA==
X-Gm-Gg: ASbGncuj0crT5AbmA+J+0Rb+14iF0Kj0ENKkBYjFIiDCxrFRbEbl2IlUcJHVavdjEgn
	WvG8HNuKXSnQKiDuRd10CJxzvrCRbN9YTO9qSir++bMYTjqrQzu0ICGwq0lbOmiSGj/hLIsC/vP
	dIKr+3cn7WITZxJ4FTvKzv3nUVirUd4G9XyCG9XFcI+uYEGqhL7Qq8nokCUZLUjPvTYMKk+IBCb
	sh3M+dB7HvlfGT7PeW2EG0gXxjwm+JeQaxslCbFYVc6jn9hSWluRubu7GLhEY/I7WzzbQDDZxAQ
	Hw5vbbA2dQTYQ1lBkVUddv6H054Pze5OJL+Wu21HXtQE5oXoasAB3Vx/v9QgWIYiPcLJTfeaoOl
	aC9MvJEhCAz30WBodntsjRwNtiCRoMM7phRh9j7REdciarXQWziJKwGdmialm01U=
X-Google-Smtp-Source: AGHT+IFCDKHBNM5kd667rpnROYOoMUbhrX6INHHFpN704TYBAwda9yAk9b+asOk7lKATso1Pm/Zinw==
X-Received: by 2002:a05:600c:3b1b:b0:456:43d:1198 with SMTP id 5b1f17b1804b1-459e74b8340mr30220515e9.32.1754505619467;
        Wed, 06 Aug 2025 11:40:19 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e075805csm104393635e9.4.2025.08.06.11.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 11:40:18 -0700 (PDT)
Message-ID: <25dcf103-3cd3-400a-b402-cbb5f23006c9@gmail.com>
Date: Wed, 6 Aug 2025 20:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: expose ooblayout information via sysfs
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250719-mtd-ooblayout-sysfs-v1-1-e0d68d872e17@gmail.com>
 <87tt2ley48.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87tt2ley48.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_114021_484051_52178B56 
X-CRM114-Status: GOOD (  15.00  )
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

SGkgTWlxdWVsLAoKMjAyNS4gMDguIDA2LiA4OjU3IGtlbHRlesOpc3NlbCwgTWlxdWVsIFJheW5h
bCDDrXJ0YToKPiBIZWxsbyBHYWJvciwKPiAKPiBPbiAxOS8wNy8yMDI1IGF0IDE0OjA2OjQ4ICsw
MiwgR2Fib3IgSnVob3MgPGo0Zzh5N0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiBBZGQgdHdvIG5l
dyBzeXNmcyBkZXZpY2UgYXR0cmlidXRlcyB3aGljaCBhbGxvd3MgdG8gZGV0ZXJtaW5lIHRoZSBP
T0IKPj4gbGF5b3V0IHVzZWQgYnkgYSBnaXZlbiBNVEQgZGV2aWNlLiBUaGlzIGNhbiBiZSB1c2Vm
dWwgdG8gdmVyaWZ5IHRoZQo+PiBjdXJyZW50IGxheW91dCBkdXJpbmcgZHJpdmVyIGRldmVsb3Bt
ZW50IHdpdGhvdXQgYWRkaW5nIGV4dHJhIGRlYnVnCj4+IGNvZGUuIFRoZSBleHBvc2VkIGluZm9y
bWF0aW9uIGFsc28gbWFrZXMgaXQgZWFzaWVyIHRvIGFuYWx5emUgTkFORAo+PiBkdW1wcyB3aXRo
b3V0IHRoZSBuZWVkIG9mIGNyYXZsaW5nIG91dCB0aGUgbGF5b3V0IGZyb20gdGhlIGRyaXZlcgo+
PiBjb2RlLgo+IAo+IEkgd291bGQgcHJlZmVyIGEgZGVidWdmcyBlbnRyeSwgYXMgdGhpcyBpcyBt
b3N0bHkgZm9jdXNpbmcgb24KPiBkZXZlbG9wbWVudCBhbmQgZGVidWdnaW5nIHB1cnBvc2VzLiBz
eXNmcyBoYXMgYSBzdGFibGUgQVBJLCB3aGljaCBtYWtlcwo+IGl0IGEgbGVzcyByZWxldmFudCBw
bGFjZSBpbiB0aGlzIGNhc2UuCgpTb3JyeSwgaXQgc2VlbXMgdGhhdCBJIG1pc3VuZGVyc3Rvb2Qg
dGhlIEFCSSBkb2N1bWVudGF0aW9uLgoKU2luY2UgdGhlICdzeXNmcy1jbGFzcy1tdGQnIGZpbGUg
aXMgdW5kZXIgdGhlICd0ZXN0aW5nJyBkaXJlY3Rvcnkgd2l0aGluCidEb2N1bWVudGF0aW9uL0FC
SScgSSB0aG91Z2h0IHRoYXQgaXQgY2FuIGJlIGV4dGVuZGVkIGJ5IGF0dHJpYnV0ZXMgdXNlZCBm
b3IKdGVzdGluZyBwdXJwb3Nlcy4gQWRkaXRpb25hbGx5LCB0aGUgJ29vYmF2YWlsJyBhbmQgJ29v
YnNpemUnIGF0dHJpYnV0ZXMgYXJlCmV4cG9zZWQgdmlhIHN5c2ZzLCBzbyBpdCBzZWVtZWQgdG8g
YmUgYSBsb2dpY2FsIHBsYWNlIGZvciB0aGUgbmV3IG9vYiByZWxhdGVkIG9uZXMuCgpOZXZlcnRo
ZWxlc3MsIEkgd2lsbCBjaGVjayB3aGF0IGNhbiBJIGRvIHdpdGggdGhlIGRlYnVnZnMgYmFzZWQg
YXBwcm9hY2guCgpUaGFua3MsCkdhYm9yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
