Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C734C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNJLmuCoDHExlhh7o6nvb4W9FsHVWkrp6BjABOMfTXs=; b=HQrCK4rsiWDeXz
	VidaZJQUuJZDoGNmjur+CU53aLSty4Gpfl4awJ9DiUlg85GCTap8tOShgC9wlkpYIT2Tsj1GzpCJ2
	r6D0sN5Ujw8f18D7/ZGEPHZzyio0KgEE8a/gH7Xd9na1hjo6dJk4O7j2TIULnhsSPK79vlGPEgaFN
	XoeJj0xMbeIkbbqO6M7W20wilCSXNq78KKufdowomo5DEnHdHEPq5ZLDW/AYU4JKOR08FlolRnJ0X
	eCChL7QNvPg5gVKGb8Ym2M1eNWi4Ys84smlnoqDEQjF33FhKGo9bqw2J+ot6oQCLF4uJSdrETl92W
	YRFSugAvCqxPYAkEHn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phFtK-00FnJq-2e;
	Tue, 28 Mar 2023 20:26:02 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phFtH-00FnIh-0m;
	Tue, 28 Mar 2023 20:26:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id cn12so54688291edb.4;
        Tue, 28 Mar 2023 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680035154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkSy08zqM2zZxZOkgvIi8R7ExZAWcEvUoUyAS1rq5JQ=;
        b=Um4uOHv/S1TSdbjkUeCbMtfNzZZFRXj5Q9VfxhZyXta/iNIBUWXaPV4il8S8bQw4OS
         szNrHMqkFdypw/JzinGECZCCQTZ+DXhE1kEQrxnLgIZ30CN0p6tfhBFjanxpXzikiiHe
         iU9eXyAI+pjn+kvL00reGFwH02OpXfaAPsPG5e3AivhCghe8QMRsrUV7rs+zVv/ds4Xl
         kd37qn8YQdB8+TkMVC1KPmQDWcyoTqFUBhaIUiGNbCyzqmogC4xO0KmPFFguK6Jooj9m
         V9gwuEqCzeCQaAyMo6WC149qoIsKQM+cFW+3dT81hwQ6izVoM+GUUR2YnPNEQ3vvtKSU
         rIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680035154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkSy08zqM2zZxZOkgvIi8R7ExZAWcEvUoUyAS1rq5JQ=;
        b=d80pJVeh5eXsOTX0jijWHuB2tUlBSDKARrcXH+pog+Cxggs3ZKXkWP5yhGu2++1LzZ
         h5zELmZrvHwrVXVZT5ywim96nZqdOrM/SEZm/amotwQxO0FEBdK7Gau6ST/SrUPIdtan
         jd8e2kBz5NacM+Q9S7xTSW35ZZzAqlvHHsNoMROM6i5mWMniJAoglpcXhEC93Fu+ILHD
         +kDphuhRre/52sS4enrao2D+8LefUm9GsPhmntJcwYueG3NtB6hOydFUXQ2rtTfgr0Q7
         mGT5srXOLvXKUbha8QTu71tYStujV88RMhhdTrxnT7Kthgar/PN8Ds+D/sbpXxQMwMoC
         Nq1A==
X-Gm-Message-State: AAQBX9fOuYWNr0rf5pRpc+xtmeBhHezdhrbYnf2QbtmAr1cgskB3E/gL
	o5AwWArY5RiRuGokkq413C8s5f4sFzOCbRX04pw=
X-Google-Smtp-Source: AKy350ZF5kb7lMfzE9/11IZUnbilw2ckELhzoAd91nvfhFzqEdjkUvnL+UvHXZHo2AZ2x4gf242lYLuUFVzsXNPmAu0=
X-Received: by 2002:a50:c055:0:b0:502:227a:d0dc with SMTP id
 u21-20020a50c055000000b00502227ad0dcmr7794046edd.4.1680035154468; Tue, 28 Mar
 2023 13:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
 <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
 <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru> <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
 <20230328185001.5661132b@xps-13> <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
In-Reply-To: <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 28 Mar 2023 22:25:43 +0200
Message-ID: <CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command word
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Liang Yang <liang.yang@amlogic.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	Yixun Lan <yixun.lan@amlogic.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@sberdevices.ru, oxffffaa@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_132559_318693_BEC03133 
X-CRM114-Status: GOOD (  15.63  )
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

SGkgQXJzZW5peSwKCk9uIFR1ZSwgTWFyIDI4LCAyMDIzIGF0IDg6MznigK9QTSBBcnNlbml5IEty
YXNub3YKPGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ClsuLi5dCj4gPgo+ID4gQnkg
dGhlIHdheSBhbnkgcmVhc29uIG5vdCB0byBoYXZlIENjJ2VkIHN0YWJsZT8KPgo+IFNvcnJ5LCB3
aGF0IGRvIFlvdSBtZWFuPyBJJ3ZlIGluY2x1ZGVkIGxpbnV4LW10ZCBtYWlsaW5nIGxpc3RzLCB0
aGVyZSBpcwo+IG9uZSBtb3JlIGxpc3QgZm9yIG10ZCByZXZpZXdzPyBJIHdpbGwgYXBwcmVjaWF0
ZSBpZiBZb3UgY2FuIHBvaW50IG1lCiJzdGFibGUiIHR5cGljYWxseSByZWZlcnMgdG8gdGhlIHN0
YWJsZSB0cmVlIHdoZXJlIGZpeGVzIGZvciBhbHJlYWR5CnJlbGVhc2VkIGtlcm5lbCB2ZXJzaW9u
cyBhcmUgbWFpbnRhaW5lZC4KV2hlbiBNaXF1ZWwgYXBwbGllcyB0aGUgcGF0Y2ggaXQgd2lsbCBl
aXRoZXIgbGFuZCBpbiB0aGUgbmV4dCAtcmMgb2YKdGhlIGN1cnJlbnQgZGV2ZWxvcG1lbnQgY3lj
bGUgKHR5cGljYWxseSBhcHBsaWVzIHRvIGZpeGVzIC0gY3VycmVudGx5CjYuMy1yYzUpIG9yIC1y
YzEgb2YgdGhlIG5leHQga2VybmVsIHZlcnNpb24gKHR5cGljYWxseSBhcHBsaWVzIHRvIG5ldwpm
ZWF0dXJlcywgY2xlYW51cHMsIGV0Yy4gLSBjdXJyZW50bHkgNi40LXJjMSkuCgpMZXQncyBzYXkg
eW91IGFyZSBmaXhpbmcgYSBidWcgbm93IGJ1dCB3YW50IHRoZSBmaXggdG8gYmUgaW5jbHVkZWQg
aW4KNi4xIExUUyAobG9uZyB0ZXJtIHN0YWJsZSkgb3Igb3RoZXIgc3RhYmxlIHJlbGVhc2UuCklu
IHRoaXMgY2FzZSBpdCdzIHJlY29tbWVuZGVkIHRvIENjIHRoZSBtYWludGFpbmVycyBvZiB0aGUg
c3RhYmxlCnRyZWVzIGFzIHBhcnQgb2YgeW91ciBwYXRjaCwgc2VlIFswXS4KVGhhdCB3YXkgb25j
ZSB0aGUgY29tbWl0IHdpdGggeW91ciBmaXggaGl0cyBMaW51cyBUb3J2YWxkcyBsaW51eCB0cmVl
Cml0IHdpbGwgYmUgYmFja3BvcnRlZCBieSB0aGUgc3RhYmxlIHRlYW0gd2l0aGluIGEgZmV3IGRh
eXMgKGFzc3VtaW5nCm9mIGNvdXJzZSB0aGF0IHRoZSBwYXRjaCBhcHBsaWVzIGNsZWFubHkgdG8g
b2xkZXIgdmVyc2lvbnMsIGlmIG5vdAp0aGV5J3JlIG5vdGlmeWluZyB5b3UpLgpOb3RlOiBldmVu
IHdpdGhvdXQgQ2MnaW5nIHRoZSBzdGFibGUgbWFpbnRhaW5lcnMgeW91ciBjb21taXQgbWF5IGJl
CmJhY2twb3J0ZWQgKHNlbWktYXV0b21hdGljYWxseSkgaWYgaXQgaGFzIGEgRml4ZXMgdGFnIGFu
ZCB0aGUgc3RhYmxlCm1haW50YWluZXJzIGZpbmQgeW91ciBjb21taXQuIEJ1dCBteSB1bmRlcnN0
YW5kaW5nIGlzIHRoYXQgaXQncwplYXNpZXN0IGZvciB0aGVtIGlmIHRoZXkncmUgZXhwbGljaXRs
eSBDYydlZCBvbiB0aGUgcGF0Y2guCgpJIGhvcGUgdGhpcyBtYWtlcyBzZW5zZS4gSWYgbm90OiBk
b24ndCBoZXNpdGF0ZSB0byBhc2suCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xNS9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVs
ZXMuaHRtbCNvcHRpb24tMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
