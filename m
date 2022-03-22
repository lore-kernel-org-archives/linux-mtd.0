Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE359C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VH6agsgwNJbiDjYKLYmpW1kME8d2Nf+uWcN7cH/8Cx8=; b=oKm2GJobDvFLTr
	AUr0Y4DACksdNHQaTidRlG1xxhdgdK2ddToCwT/mZRFNc29MVxMTehbg56ofddjkkT7i9EW1J96mb
	eWH24C0ze7uWwcFD27uDUe0fOvMuvdwYd6N2rTN6LUoFJwkeZNNOC/fie5UMdxPaKzeoAbaTCASDF
	ZbPVIhRgRb+dWkZFFOEa2D6WwHRAPABn7/2Bsae+HQskd9lRxa+DHfd4BMIZ9RimSk/9i/GWG6qlC
	/ZXdLE0Xm5PPT2lqX6WdukG5jDiip/1ww0I8iBjTJbGFq4/gh0o3rKjGWw0ibEM3G/pWGp1KF5vKN
	TV/GKwCmXvWM9NfRY3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWihG-00BnQf-GC; Tue, 22 Mar 2022 17:53:30 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWihD-00BnPB-UA
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 17:53:29 +0000
Received: by mail-lf1-x129.google.com with SMTP id h7so13635000lfl.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2022 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:from:to:cc
 :references:in-reply-to:content-transfer-encoding;
 bh=0b8r6ieeMoRC4E/Lns9qd36mewE4LZhV+L3FK8Qu+Ns=;
 b=qJPu7FcYLsJN4FD4okbx/psp1gM/MOVPxR+VNmcuEoNb4hPzhiuGUzV+8rOcTSJy4q
 uU7Xfv9VZlSQ8rRiAIY8MfDNmvY+fIMO++0QGxhOLD4z/QI+vjjKD5Gf006F52MpngZs
 U6frYpQY/idBEBkC0XasSdhKfsSIGvm0d0t/4zXQjhENQ6cyue7D+59Uc3C0JCR93C6K
 VYDGhDxjeW+fLOiVtyDv78L2EtqgdGRueTboJ6rRTHXBWUDGRlOKO963G5Gu6AyShTDV
 1DdYEMPGh1lqn91Mcb78+CqtzQF3JQ9OJNf7dty/suUkVrgLfW4fm1rAUAApfzVIxqTQ
 eS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=0b8r6ieeMoRC4E/Lns9qd36mewE4LZhV+L3FK8Qu+Ns=;
 b=PQG6NeLtCDfWQ4XxpEYcsLfsp+k+A+3gbgianmduDlsRV258R7Y+3wKWolffCwZnOD
 Fnd1kzUrdlj+fY3nSSLdYhjrDjOVmOW5m3SWPeF4O+leRXaFzuJRKjF4D4eCSRYOfkHC
 e+E8XkkTLlhkBt6IlAoYeOZ8oq2YjNDTRaUZdx89r+/ZQW/vEHoMW0tklue2A1gRIJVp
 Qp56ckIHl2sW1ZC1M92nudBZ44A4skF4FaScgobX2AQNR/xMjdiU33R+SLTKoj4l5kRl
 o1Lh0oNUUG0AOU+F5IBFoZw3/62m+N/1IE1vuCwR+wiRg0v2+VowMsm14ZxPu/Xt6mSL
 Lvow==
X-Gm-Message-State: AOAM533OaogF52iZ1nfUVcToL+v4NkfyVCoIth8v0GoIp6v9P+GwDM9L
 vbQacWuFg1kcYNYKnLqtKN8=
X-Google-Smtp-Source: ABdhPJzyYEfpehpAfBZgPYg5I52DkmABsIBfWygYhGzkVtRzNlbw7f5aXiJh59vds+aAU5UMIKAbHA==
X-Received: by 2002:a05:6512:230f:b0:44a:2282:8e41 with SMTP id
 o15-20020a056512230f00b0044a22828e41mr10795460lfu.582.1647971603293; 
 Tue, 22 Mar 2022 10:53:23 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 l4-20020a2e8344000000b00247e3be2e3csm2527643ljh.123.2022.03.22.10.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 10:53:22 -0700 (PDT)
Message-ID: <e3bc0832-efef-9e92-3b17-df8cc731b533@gmail.com>
Date: Tue, 22 Mar 2022 18:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: ECC errors after UBI writes with brcmnand (Northstar with v6.1
 controller)
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <d8a2fc04-b05a-bec9-cd56-ef7d73d904a9@gmail.com>
In-Reply-To: <d8a2fc04-b05a-bec9-cd56-ef7d73d904a9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_105328_009790_D6B6913D 
X-CRM114-Status: GOOD (  17.88  )
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

T24gMTguMDMuMjAyMiAxOTowMiwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE15IHByb2JsZW0g
aXMgdGhhdCB1YmlmcyBjb21wbGFpbnMgYWJvdXQgRUNDIGVycm9ycy4gSSBzcGVudCBzb21lIHRp
bWUKPiBkZWJ1Z2dpbmcgaXQgYW5kIGl0IHNlZW1zIHRoYXQ6Cj4gMS4gSW5pdGlhbGx5IGFsbCBi
bG9ja3Mgd3JpdHRlbiBieSBib290bG9hZGVyIGNhbiBiZSByZWFkIGZpbmUKPiAyLiBGZXcgYmxv
Y2tzIHdyaXR0ZW4gYnkgdWJpZnMgLT4gdWJpIC0+IGJyY21uYW5kIGNhbid0IGJlIHJlYWQgYmFj
awo+IAo+IHViaTAgZXJyb3I6IHViaV9pb193cml0ZTogUmVhZCBiYWNrIDkwIEZBSUxFRCBmcm9t
ICJ1YmkiIGF0IG9mZnNldCAweDYxODAwIG9mIGxlbmd0aCAyMDQ4OiAtNzQKPiB1YmkwIGVycm9y
OiB1YmlfaW9fd3JpdGU6IFJlYWQgYmFjayA5MiBGQUlMRUQgZnJvbSAidWJpIiBhdCBvZmZzZXQg
MHg4MTgwMCBvZiBsZW5ndGggMjA0ODogLTc0Cj4gdWJpMCBlcnJvcjogdWJpX2lvX3dyaXRlOiBS
ZWFkIGJhY2sgOTcgRkFJTEVEIGZyb20gInViaSIgYXQgb2Zmc2V0IDB4YTE4MDAgb2YgbGVuZ3Ro
IDIwNDg6IC03NAo+IHViaTAgZXJyb3I6IHViaV9pb193cml0ZTogUmVhZCBiYWNrIDc1NiBGQUlM
RUQgZnJvbSAidWJpIiBhdCBvZmZzZXQgMHhlZTQ4MDAgb2YgbGVuZ3RoIDIwNDg6IC03NAo+IHVi
aTAgZXJyb3I6IHViaV9pb193cml0ZTogUmVhZCBiYWNrIDg0MCBGQUlMRUQgZnJvbSAidWJpIiBh
dCBvZmZzZXQgMHhlZTUwMDAgb2YgbGVuZ3RoIDIwNDg6IC03NAo+IHViaTAgd2FybmluZzogdWJp
X2lvX3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDY4IGJ5dGVzIGZy
b20gUEVCIDExOToyMTk0NCwgcmVhZCBvbmx5IDY4IGJ5dGVzLCByZXRyeSAoYWRkcjoweGVlNTVi
OCkKPiB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hp
bGUgcmVhZGluZyA2OCBieXRlcyBmcm9tIFBFQiAxMTk6MjE5NDQsIHJlYWQgb25seSA2OCBieXRl
cywgcmV0cnkgKGFkZHI6MHhlZTU1YjgpCj4gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDogZXJy
b3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjggYnl0ZXMgZnJvbSBQRUIgMTE5OjIx
OTQ0LCByZWFkIG9ubHkgNjggYnl0ZXMsIHJldHJ5IChhZGRyOjB4ZWU1NWI4KQo+IHViaTAgZXJy
b3I6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2OCBi
eXRlcyBmcm9tIFBFQiAxMTk6MjE5NDQsIHJlYWQgNjggYnl0ZXMKCkkgZGlkIGEgYml0IG9mIGV4
dHJhIGRlYnVnZ2luZyBhbmQgSSdsbCB0cnkgdG8gcHJvdmlkZSBzb21lIGV4dHJhCmluZm9ybWF0
aW9uIHRob3VnaCBub3RoaW5nIGV4Y2l0aW5nLgoKCkZXSVc6IE9wZW5XcnQgMTUuMDUgKGNvcnJl
Y3Q6IHllYXIgMjAxNSkgdXNlZCBhIHBvcnQgb2YgTkFORCBkcml2ZXIgZnJvbQp0aGUgQnJvYWRj
b20ncyBTREsuIEkgd2FzIHdvbmRlcmluZyBpZiBpdCBtYXkgYmVoYXZlIGFueSBkaWZmZXJlbnQu
CgpGaXJzdCBJIGJvb3RlZCB0aGF0IGFuY2llbnQgT3BlbldydCAxNS4wNSB3aXRoIGtlcm5lbCAz
LjE4IG9uIE5ldGdlYXIKUjYyNTAgKEJDTTQ3MDgpIGFuZCBkdW1wZWQgRUNDIGxheW91dC4gU2Fk
bHkgbm90aGluZyB1bmV4cGVjdGVkIGhlcmU6CnRoYXQgZHJpdmVyIHVzZWQgdGhlIHNhbWUgRUND
IGxheW91dCBhbmQgdXBzdHJlYW0gYnJjbW5hbmQuCgpPT0IgRUNDIGxheW91dDoKb2Zmc2V0OiAy
IGxlbmd0aDogMTQKb2Zmc2V0OiAxOCBsZW5ndGg6IDE0Cm9mZnNldDogMzQgbGVuZ3RoOiAxNApv
ZmZzZXQ6IDUwIGxlbmd0aDogMTQKCk9PQiBmcmVlIGJ5dGVzOgpvZmZzZXQ6IDEgbGVuZ3RoOiAx
Cm9mZnNldDogMTYgbGVuZ3RoOiAyCm9mZnNldDogMzIgbGVuZ3RoOiAyCm9mZnNldDogNDggbGVu
Z3RoOiAyCgpUaGVuIEkgdmVyaWZpZWQgdGhhdCB0aGUgYW5jaWVudCAvIGRvd25zdHJlYW0gLyBw
b3J0ZWQgTkFORCBkcml2ZXIKc3VmZmVycyBmcm9tIHRoZSBzYW1lIEVDQyBlcnJvcnMgYXMgcmVw
b3J0ZWQgaW4gdGhpcyBlLW1haWwgdGhyZWFkLgoKRGVhZCBlbmQgOigKCgpJIHRlc3RlZCBrZXJu
ZWxzIDQuMSwgNC4xNCwgNC4xOSwgNS40IGFuZCA1LjEwIHdpdGggVUJJICYgdXBzdHJlYW0KYnJj
bW5hbmQgZHJpdmVyLiBUaGV5IGFsbCBzdWZmZXIgZnJvbSBFQ0MgZXJyb3JzLgoKCkZpbmFsbHkg
SSByZWFsaXplZCBzb21ldGhpbmcgYSBiaXQgbW9yZSBpbnRlcmVzdGluZy4gSSd2ZSBhIGZvbGxv
d2luZwpjdXN0b20gaW5pdC5kIHNjcmlwdDoKCiMgY2F0IC9ldGMvaW5pdC5kL1MzOW5ldHdvcmsK
IyEvYmluL3NoCm1hY2hpbmU9IiQoY2F0IC9wcm9jL2RldmljZS10cmVlL2NvbXBhdGlibGUgfCB0
ciAnXDAnICdcdCcgfCBjdXQgLWYgMSkiCmludGVyZmFjZXM9Ii91c3IvbG9jYWwvZXRjL25ldHdv
cmsvaW50ZXJmYWNlcy4kbWFjaGluZSIKWyAtZiAiJGludGVyZmFjZXMiIF0gJiYgY3AgIiRpbnRl
cmZhY2VzIiAvZXRjL25ldHdvcmsvaW50ZXJmYWNlcwoKKGl0IGNvcGllcyBkZXZpY2Ugc3BlY2lm
aWMgbmV0d29yayBjb25maWcgZnJvbSAvdXNyLyB0byAvZXRjL25ldHdvcmsvKQoKV2l0aCB0aGF0
IGluaXQuZCBzY3JpcHQgZXhlY3V0ZWQgb24gYm9vdCBJIGdldCA5IEVDQyBlcnJvcnMgbGlrZToK
dWJpX2lvX3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDY4IGJ5dGVz
IGZyb20KCldpdGhvdXQgaXQgSSBnZXQgMCBlcnJvcnMgd2hpbGUgYm9vdGluZy4gQWxzbyBjb3B5
aW5nIHJpZ2h0IGZpbGUgZnJvbQovdXNyLyB0byAvZXRjL25ldHdvcmsvIG1hbnVhbGx5IC0gYWZ0
ZXIgaW5pdCBjb21wbGV0aW9uIC0gZG9lc24ndCBjYXVzZQpFQ0MgZXJyb3IuCgpEb2VzIGl0IG1l
YW4gVUJJIHVzZXMgTkFORCBkaWZmZXJlbnRseSBkdXJpbmcgZmlyc3QgYm9vdCwgd2hlbiB0aGVy
ZQphcmVuJ3QgcGxlbnRseSBvZiBlbXB0eSAoZXJhc2VkKSBibG9ja3M/IERvZXMgaXQgcGFjayBk
YXRhIGluIGV4aXN0aW5nCmJsb2NrcyBtb3JlIGFnZ3Jlc3NpdmVseT8KCgpObyBtYXR0ZXIgaWYg
SSBoYXZlIG15IGluaXQuZCBzY3JpcHQgb3Igbm90IEkgY2FuIGFsd2F5cyBzZWUgRUNDIGVycm9y
czoKMS4gT25lIEVDQyBlcnJvciB3aGlsZSByZWFkaW5nIHJvb3RmcyBmb3IgdGhlIGZpcnN0IHRp
bWUKMi4gNSBFQ0MgZXJyb3JzIGFmdGVyIGV4ZWN1dGluZyAicmVib290IgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
