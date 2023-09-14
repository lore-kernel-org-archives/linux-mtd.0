Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520EFEDE98C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wm2fEL8yf30q6/qMZHHMrMOxyXWY+yzzYJtmdAUIkLA=; b=umLrRkabzVwczR
	aEbivZkwPQ4vFwvTMwfAXwgBw+JXLRscJdWW+LNig8dKT/781wXo4u0/or9AfOizYHkzVt5XjtQq4
	0sQgpX7YahrSoNeTBnkKL0QpWsf+awjjfeKrAEZS4S40nWiwpyLCOl/+on4SSDXUA5nAGeCUXEanD
	7K3X8j5iuN3K95CRaf6RarzxoFY7arKhF+LpWaJkdOylccbXrw5I9KrCQNVF1S3ajmYqQMj+hTd3z
	OcXZ7verRDEe8CA8nI7b8+b3iWWofMcqWWobOtUdhsY1Vcpy+I69/aEm1eqRMnqDpe7SuEmGI/7SP
	AS9JBKenUhHNuKQlOHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghDU-007d8g-1S;
	Thu, 14 Sep 2023 07:56:48 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghDQ-007d7p-21;
	Thu, 14 Sep 2023 07:56:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51E4840010;
	Thu, 14 Sep 2023 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694678196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rif32sB1HbXsN5nBPsePEQZLXD9bQCbSkw3nnlsNu1A=;
	b=jNkHiYRGLgFweP826EIZpjwJs318S+vZ1Ob1VC++ZMNlR6veS72mozPyweqhOyJ6492S0M
	2mb/nroYg/bwChNbRrazpe11eTLKzsjH/fAwp3b4hFncyOCzHIZJPbbZbNA5fZ3A3x9nEg
	tVkrCrvcG1ltNeqRnbh8LuY2xCbjSIoQqdr4NUoW1HCimWVdMAXOaNMadCzoYKjjo24aeV
	uWzLWQvX+2iulDNFX7rj9+bW7VUwIolqXuSc2/UIDfJiaQkMaBf1zT5y0kqZqzRFD+Ylr0
	OBPQgup07Wq37DMeSxM3R/1GLJfeUMNNix4uGgP/UwmP/u96nIjuRK91Tip2FQ==
Message-ID: <3f175090-4c5f-4821-9155-06c4868d0489@arinc9.com>
Date: Thu, 14 Sep 2023 10:56:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: brcm_nvram: store a copy of NVRAM content
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <scott.branden@broadcom.com>
References: <20230914064922.3986-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230914064922.3986-1-zajec5@gmail.com>
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_005644_829862_AE3151C0 
X-CRM114-Status: UNSURE (   8.25  )
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

T24gMTQuMDkuMjAyMyAwOTo0OSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGRyaXZlciB1c2VzIE1NSU8g
YWNjZXNzIGZvciByZWFkaW5nIE5WUkFNIGZyb20gYSBmbGFzaCBkZXZpY2UuCj4gVW5kZXJuZWF0
aCB0aGVyZSBpcyBhIGZsYXNoIGNvbnRyb2xsZXIgdGhhdCByZWFkcyBkYXRhIGFuZCBwcm92aWRl
cwo+IG1hcHBpbmcgd2luZG93Lgo+IAo+IFVzaW5nIE1NSU8gaW50ZXJmYWNlIGFmZmVjdHMgY29u
dHJvbGxlciBjb25maWd1cmF0aW9uIGFuZCBtYXkgYnJlYWsgcmVhbAo+IGNvbnRyb2xsZXIgZHJp
dmVyLiBJdCB3YXMgcmVwb3J0ZWQgYnkgbXVsdGlwbGUgdXNlcnMgb2YgZGV2aWNlcyB3aXRoCj4g
TlZSQU0gc3RvcmVkIG9uIE5BTkQuCj4gCj4gTW9kaWZ5IGRyaXZlciB0byByZWFkICYgY2FjaGUg
YWxsIE5WUkFNIGNvbnRlbnQgZHVyaW5nIGluaXQgYW5kIHVzZSB0aGF0Cj4gY29weSB0byBwcm92
aWRlIE5WTUVNIGRhdGEgd2hlbiByZXF1ZXN0ZWQuCj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbXRkL0NBQ25hNnJ3ZjNfOVFWalljTSs4NDdiaVRYPUswRW9XWHVYY1NN
a0pPMVZ5XzV2bVZxQUBtYWlsLmdtYWlsLmNvbS8KPiBDYzogQXLEsW7DpyDDnE5BTCA8YXJpbmMu
dW5hbEBhcmluYzkuY29tPgo+IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxp
QGJyb2FkY29tLmNvbT4KPiBDYzogU2NvdHQgQnJhbmRlbiA8c2NvdHQuYnJhbmRlbkBicm9hZGNv
bS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
PgoKVGhpcyBpcyBhIGJ1ZyBmaXgsIGNvdWxkIHlvdSBhZGQgYSAiRml4ZXMiIHRhZyBzbyBpdCB3
aWxsIGJlIGJhY2twb3J0ZWQgdG8Kc3RhYmxlIHJlbGVhc2VzPwoKQXLEsW7DpwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
