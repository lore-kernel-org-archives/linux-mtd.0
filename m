Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F4BC021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 21:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAMWeop2N8l+Mo1thJIFLojZZVKLU+QBs0L3DqsW+oQ=; b=bsI6afxnpjhV04
	ohyByMGLkKGp72JEw/F5AVqy2bBgP8Q1unJcWeC5/Jn3yjP3ZhWDo4V+1G37LxkaoMNVfit692YxS
	a7EHYEO/YYTdCFBt9AHV6JCZsY9uQn6g20VL22nNu4iwEQfQI18XAhsRZXdWp9ES60r0OdpypbSJ9
	UBLYd9JK44RGLuGJqSdnGV+GY1+WU+RAtgfgoset34eRwuax5b32dvKwY4IyvGGBiLFICLzpKywcw
	fUdG7bOogmqwYVKBqPdzGK0f46cPzVC3HLBcrwd4MXifFX9kmXp1CeSN9rKFq2qpI0ML8QdJUHSDI
	q8gYA0+dCh0wSmIIcx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgRR-0000000FIMR-2Ra2;
	Mon, 24 Feb 2025 21:56:45 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgRP-0000000FIKs-06kr
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 21:56:44 +0000
Received: from [172.27.1.176] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51OLtSud926291
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 24 Feb 2025 13:55:29 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51OLtSud926291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740434140;
	bh=mGxMwUsqCeYXbcs8sKTNgKdO9jufW4HfcjmafwUUTPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oSgE83EzgtMz21WmUEJQchEwyeT2+esZ+KWZmZbpMnIxmjSCdKOx7GMtZxtUeuMOb
	 fgxnAP0u+Y7y7qHCRMk2WcPKmHLTS78FSVtYi1r9YtWWKWmJMaiWD3YBVh2jDp2mLE
	 b4BwNub50V8/SEH4tYhg05YnoQDCB66CtxEkgQaSBfQ7RVrhMZ+1NyaFvNQPX6ebJZ
	 edcSTvvAUxlRBSvSoOL6AdT8ofMrNm5Y9/gATbzcdh9cEMD7Xwc6nw3oGlJ+LZeFzO
	 M1iDUz4IaabvYD7h6G8g48ODoiaZf6CPS3zzYla0PFymyTZ7CDau1zbDFk0AveyIiH
	 IGBE0vCJdvVzg==
Message-ID: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
Date: Mon, 24 Feb 2025 13:55:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
To: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
        tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
        mingo@kernel.org
Cc: alistair@popple.id.au, linux@rasmusvillemoes.dk,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_135643_067868_AD4A5C34 
X-CRM114-Status: UNSURE (   9.12  )
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

T24gMi8yNC8yNSAwNzoyNCwgVXJvcyBCaXpqYWsgd3JvdGU6Cj4gCj4gCj4gT24gMjMuIDAyLiAy
NSAxNzo0MiwgS3Vhbi1XZWkgQ2hpdSB3cm90ZToKPj4gUmVmYWN0b3IgcGFyaXR5IGNhbGN1bGF0
aW9ucyB0byB1c2UgdGhlIHN0YW5kYXJkIHBhcml0eTgoKSBoZWxwZXIuIFRoaXMKPj4gY2hhbmdl
IGVsaW1pbmF0ZXMgcmVkdW5kYW50IGltcGxlbWVudGF0aW9ucyBhbmQgaW1wcm92ZXMgY29kZQo+
PiBlZmZpY2llbmN5Lgo+IAo+IFRoZSBwYXRjaCBpbXByb3ZlcyBwYXJpdHkgYXNzZW1ibHkgY29k
ZSBpbiBib290ZmxhZy5vIGZyb206Cj4gCj4gIMKgIDU4OsKgwqDCoCA4OSBkZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAlZWJ4LCVlc2kKPiAgwqAgNWE6
wqDCoMKgIGI5IDA4IDAwIDAwIDAwwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW92wqDCoMKgICQweDgs
JWVjeAo+ICDCoCA1ZjrCoMKgwqAgMzEgZDLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB4b3LCoMKgwqAgJWVkeCwlZWR4Cj4gIMKgIDYxOsKgwqDCoCA4OSBmMMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAlZXNpLCVlYXgKPiAgwqAg
NjM6wqDCoMKgIDg5IGQ3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW92
wqDCoMKgICVlZHgsJWVkaQo+ICDCoCA2NTrCoMKgwqAgNDAgZDAgZWXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzaHLCoMKgwqAgJXNpbAo+ICDCoCA2ODrCoMKgwqAgODMgZTAgMDHC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbmTCoMKgwqAgJDB4MSwlZWF4Cj4gIMKg
IDZiOsKgwqDCoCAzMSBjMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhv
csKgwqDCoCAlZWF4LCVlZHgKPiAgwqAgNmQ6wqDCoMKgIDgzIGU5IDAxwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3ViwqDCoMKgICQweDEsJWVjeAo+ICDCoCA3MDrCoMKgwqAgNzUg
ZWbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBqbmXCoMKgwqAgNjEgPHNi
Zl9pbml0KzB4NTE+Cj4gIMKgIDcyOsKgwqDCoCAzOSBjN8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNtcMKgwqDCoCAlZWF4LCVlZGkKPiAgwqAgNzQ6wqDCoMKgIDc0IDdm
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgamXCoMKgwqDCoCBmNSA8c2Jm
X2luaXQrMHhlNT4KPiAgwqAgNzY6Cj4gCj4gdG86Cj4gCj4gIMKgIDU0OsKgwqDCoCA4OSBkOMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAlZWJ4LCVlYXgK
PiAgwqAgNTY6wqDCoMKgIGJhIDk2IDY5IDAwIDAwwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW92wqDC
oMKgICQweDY5OTYsJWVkeAo+ICDCoCA1YjrCoMKgwqAgYzAgZTggMDTCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzaHLCoMKgwqAgJDB4NCwlYWwKPiAgwqAgNWU6wqDCoMKgIDMxIGQ4
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeG9ywqDCoMKgICVlYngsJWVh
eAo+ICDCoCA2MDrCoMKgwqAgODMgZTAgMGbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhbmTCoMKgwqAgJDB4ZiwlZWF4Cj4gIMKgIDYzOsKgwqDCoCAwZiBhMyBjMsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ0wqDCoMKgwqAgJWVheCwlZWR4Cj4gIMKgIDY2OsKgwqDC
oCA3MyA2NMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGphZcKgwqDCoCBj
YyA8c2JmX2luaXQrMHhiYz4KPiAgwqAgNjg6Cj4gCj4gd2hpY2ggaXMgZmFzdGVyIGFuZCBzbWFs
bGVyICgtMTAgYnl0ZXMpIGNvZGUuCj4gCgpPZiBjb3Vyc2UsIG9uIHg4NiwgcGFyaXR5OCgpIGFu
ZCBwYXJpdHkxNigpIGNhbiBiZSBpbXBsZW1lbnRlZCB2ZXJ5IHNpbXBseToKCihBbHNvLCB0aGUg
cGFyaXR5IGZ1bmN0aW9ucyByZWFsbHkgb3VnaHQgdG8gcmV0dXJuIGJvb2wsIGFuZCBiZSBmbGFn
Z2VkIApfX2F0dHJpYnV0ZV9jb25zdF9fLikKCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfY29u
c3RfXyBib29sIF9hcmNoX3Bhcml0eTgodTggdmFsKQp7Cglib29sIHBhcml0eTsKCWFzbSgiYW5k
ICUwLCUwIiA6ICI9QGNjbnAiIChwYXJpdHkpIDogInEiICh2YWwpKTsKCXJldHVybiBwYXJpdHk7
Cn0KCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfY29uc3RfXyBib29sIF9hcmNoX3Bhcml0eTE2
KHUxNiB2YWwpCnsKCWJvb2wgcGFyaXR5OwoJYXNtKCJ4b3IgJWgwLCViMCIgOiAiPUBjY25wIiAo
cGFyaXR5KSwgIitRIiAodmFsKSk7CglyZXR1cm4gcGFyaXR5Owp9CgpJbiB0aGUgZ2VuZXJpYyBh
bGdvcml0aG0sIHlvdSBwcm9iYWJseSBzaG91bGQgaW1wbGVtZW50IHBhcml0eTE2KCkgaW4gCnRl
cm1zIG9mIHBhcml0eTgoKSwgcGFyaXR5MzIoKSBpbiB0ZXJtcyBvZiBwYXJpdHkxNigpIGFuZCBz
byBvbjoKCnN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfY29uc3RfXyBib29sIHBhcml0eTE2KHUx
NiB2YWwpCnsKI2lmZGVmIEFSQ0hfSEFTX1BBUklUWTE2CglpZiAoIV9fYnVpbHRpbl9jb25zdF9w
KHZhbCkpCgkJcmV0dXJuIF9hcmNoX3Bhcml0eTE2KHZhbCk7CiNlbmRpZgoJcmV0dXJuIHBhcml0
eTgodmFsIF4gKHZhbCA+PiA4KSk7Cn0KClRoaXMgcGlja3MgdXAgdGhlIGFyY2hpdGVjdHVyYWwg
dmVyc2lvbnMgd2hlbiBhdmFpbGFibGUuCgpGdXJ0aGVybW9yZSwgaWYgYSBwb3BjbnQgaW5zdHJ1
Y3Rpb24gaXMga25vd24gdG8gZXhpc3QsIHRoZW4gdGhlIHBhcml0eSAKaXMgc2ltcGx5IHBvcGNu
dCh4KSAmIDEuCgoJLWhwYQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
