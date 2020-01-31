Return-Path: <SRS0=9794=3U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2120AC33CB2
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 11:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E721020705
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 11:39:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PbTUarSp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOAbXq94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E721020705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owWvCgsfe9yT0pEjE8oiCMAIFt4ZwQhoTONK2QuHEMY=; b=PbTUarSpICayJW
	82gNUbtmw1vlPl157a9sWHEqFTavJWT6HPcfXH7dfk+83SrfYeKKUOKFTHzA2LvS5O9mPUe4NdfM8
	vY0+RaBpUB/IerYgsf9PmJSWQMrtFwMkysCoTxRjUWPrZWShtZVrZa4uXVS1NmIctzHcyxrd6Z2Ip
	rIQVCV3fxfGMWTKimusyih3/vAylxEQ9LPfJkRa7hDlK4zOTs0w0R9k20w9XyMmRMLetY8apZi9UL
	TktJENE8OBxAUMaOuzxXFYi75p6vB+shDPg4nPVCc9jSmsurgZDvDWKZpIR+Ra88VK0RrhD4EV8p2
	CkQ+7apIBwgrT+WbYhtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixUe4-0005Pl-Tm; Fri, 31 Jan 2020 11:39:32 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixUe1-0005Om-7v
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2020 11:39:30 +0000
Received: by mail-pj1-x1044.google.com with SMTP id q39so2712742pjc.0
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2020 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WmrfKAtR6rlTIfiY5AkUEXZDNoeTvIvDZR49xG7X0iM=;
 b=oOAbXq94h9YRyz91+sD53WjDW5+ZTgL4fU3l4NGlBC34eguYDGLrLljKAcBtUe9dWG
 Na9LB3tCn5njql68CWeLjEQsAs+tOD0MNTyirMjslz7cvY42+Rx5FYhzhYcQEBEqTAA2
 tryYjvxrcGIZd1J9/ctgSwG9LwAMspXDNxIsW+uV9oam70ILayFwgxIsrUsYNEfsB1qX
 QzxHovB1fotXB3Fmr2QDheJzL0DdKwo2F+q4d27NDLGH77HfqC4cbPvJO9kF5wwTfiEc
 dJher5NP8RB0cmHj2rUg+7tttDDy31Eog8MZvbG4orkQ1FTqIeo2YhPbVAJtbgYgkxF9
 I3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WmrfKAtR6rlTIfiY5AkUEXZDNoeTvIvDZR49xG7X0iM=;
 b=oUNM0QTP8qyP+8P5BqgH92ok+Qtxz38dUbSJOyJQCxkJYZa0n1hOa/tKns6QfenG3/
 R6oZGBslBJh7u17lp/V4zyYBRd0dJytW5vYvlqvInGAYCD5skahl1wscKoXfwQpB6/vS
 zXonBu3Tc9e0MfF6UxmPv356OeeqXzzNDs6L9V3QqQhjrcGMJmdLrDoSjbx7U0GGUKFU
 xTPxDG37RuOc/uuEGOzNemndMpRm8jSziOWHyTld7VdKV9P+2ONsHbI/6Jcpx7HHbXqf
 s9G/faw3nhiYIBKyYStZfup2GeWWpX8t6F750NRMeavXikP5CbYDx948L6mHk+CJwLUZ
 f1uA==
X-Gm-Message-State: APjAAAU7uLjEzPwYs0bjLKzQI6K0A/Mw2Iweokcj6GwehDt39eDnc38f
 13LYO6bWWOWxtMXWrHATBtiUraPa3cP5+UARFTQ=
X-Google-Smtp-Source: APXvYqxuTmsJhpjXYt1mZREUpJKBkFxJkHMZdboNze2B6ebKELDLMxrXGF0WRVRt8pH69iyQQgLvjPT1IjciSQu9PFw=
X-Received: by 2002:a17:902:b116:: with SMTP id
 q22mr9561021plr.255.1580470767774; 
 Fri, 31 Jan 2020 03:39:27 -0800 (PST)
MIME-Version: 1.0
References: <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
 <20200110193119.GI32742@smile.fi.intel.com>
 <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
 <20200113114256.GH3897@sirena.org.uk>
 <6dd45da9-9ccf-45f7-ed12-8f1406a0a56b@huawei.com>
 <20200113140627.GJ3897@sirena.org.uk>
 <CAHp75VfepiiVFLLmCwdBS0Z6tmR+XKBaOLg1qPPuz1McLjS=4Q@mail.gmail.com>
 <20200113142754.GL3897@sirena.org.uk>
 <20200113143403.GQ32742@smile.fi.intel.com>
 <0252a76d-7e2b-2c70-8b1b-0d041d972098@huawei.com>
In-Reply-To: <0252a76d-7e2b-2c70-8b1b-0d041d972098@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jan 2020 13:39:19 +0200
Message-ID: <CAHp75Ve=ZwJe2XV8Y1UN6sMe1ZHOBwUtRUD=aGqhR4Gc7BNUcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: John Garry <john.garry@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_033929_309585_45A72D2F 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: Jiancheng Xue <xuejiancheng@hisilicon.com>, chenxiang66@hisilicon.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tudor.ambarus@microchip.com, Linuxarm <linuxarm@huawei.com>,
 linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 liusimin4@huawei.com, Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMTI6MDggUE0gSm9obiBHYXJyeSA8am9obi5nYXJyeUBo
dWF3ZWkuY29tPiB3cm90ZToKPgo+IE9uIDEzLzAxLzIwMjAgMTQ6MzQsIEFuZHkgU2hldmNoZW5r
byB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDEzLCAyMDIwIGF0IDAyOjI3OjU0UE0gKzAwMDAsIE1h
cmsgQnJvd24gd3JvdGU6Cj4gPj4gT24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMDQ6MTc6MzJQTSAr
MDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4+PiBPbiBNb24sIEphbiAxMywgMjAyMCBh
dCA0OjA3IFBNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+PiBP
biBNb24sIEphbiAxMywgMjAyMCBhdCAwMTowMTowNlBNICswMDAwLCBKb2huIEdhcnJ5IHdyb3Rl
Ogo+ID4+Pj4+IE9uIDEzLzAxLzIwMjAgMTE6NDIsIE1hcmsgQnJvd24gd3JvdGU6Cj4gPj4KPiA+
Pj4+Pj4gVGhlIGlkaW9tYXRpYyBhcHByb2FjaCBhcHBlYXJzIHRvIGJlIGZvciBpbmRpdmlkdWFs
IGJvYXJkIHZlbmRvcnMKPiA+Pj4+Pj4gdG8gYWxsb2NhdGUgSURzLCB5b3UgZG8gZW5kIHVwIHdp
dGggbXVsdGlwbGUgSURzIGZyb20gbXVsdGlwbGUKPiA+Pj4+Pj4gdmVuZG9ycyBmb3IgdGhlIHNh
bWUgdGhpbmcuCj4gPj4KPiA+Pj4+PiBCdXQgSSBhbSBub3Qgc3VyZSBob3cgYXBwcm9wcmlhdGUg
dGhhdCBzYW1lIGFwcHJvYWNoIHdvdWxkIGJlIGZvciBzb21lIDNyZAo+ID4+Pj4+IHBhcnR5IG1l
bW9yeSBwYXJ0IHdoaWNoIHdlJ3JlIHNpbXBseSB3aXJpbmcgdXAgb24gb3VyIGJvYXJkLiBNYXli
ZSBpdCBpcy4KPiA+Pgo+ID4+Pj4gSXQgc2VlbXMgdG8gYmUgcXVpdGUgY29tbW9uIGZvciBJbnRl
bCByZWZlcmVuY2UgZGVzaWducyB0byBhc3NpZ24KPiA+Pj4+IEludGVsIElEcyB0byBub24tSW50
ZWwgcGFydHMgb24gdGhlIGJvYXJkICh3aGljaCBpcyB3aGVyZSBJCj4gPj4+PiBiZWNhbWUgYXdh
cmUgb2YgdGhpcyBwcmFjdGljZSkuCj4gPj4KPiA+Pj4gQmFzaWNhbGx5IHZlbmRvciBvZiBjb21w
b25lbnQgaW4gcXVlc3Rpb24gaXMgcmVzcG9uc2libGUgZm9yIElELCBidXQKPiA+Pj4gaXQgc2Vl
bXMgdGhleSBzaW1wbGUgZG9uJ3QgY2FyZS4KPiA+Pgo+ID4+IEFGQUlDVCBhIGxvdCBvZiB0aGUg
dGltZSBpdCBzZWVtcyB0byBiZSB0aGF0IHdob2V2ZXIgaXMgd3JpdGluZwo+ID4+IHRoZSBzb2Z0
d2FyZSBlbmRzIHVwIGFzc2lnbmluZyBhbiBJRCwgdGhhdCBtYXkgbm90IGJlIHRoZSBzaWxpY29u
Cj4gPj4gdmVuZG9yLgo+ID4KPiA+IC4uLndoaWNoIGlzIGVmZmVjdGl2ZWx5IGFidXNpbmcgdGhl
IEFDUEkgSUQgYWxsb2NhdGlvbiBwcm9jZWR1cmUuCj4gPgo+ID4gKEFuZCB5ZXMsIEludGVsIGl0
c2VsZiBkaWQgaXQgaW4gdGhlIHBhc3Qg4oCUIHNlZSBiYWRseSBjcmVhdGVkIEFDUEkgSURzCj4g
PiAgIGluIHRoZSBkcml2ZXJzKQo+ID4KPgo+IEhpIE1hcmssCj4KPiBBYm91dCB0aGlzIHRvcGlj
IG9mIEFDUEkgaGF2aW5nIG5vIG1ldGhvZCB0byBkZXNjcmliZSBkZXZpY2UgYnVzd2lkdGggaW4K
PiB0aGUgcmVzb3VyY2UgZGVzY3JpcHRvciwgaXQgbWF5IGJlIGFuIGlkZWEgZm9yIG1lIHRvIHJh
aXNlIGEgVGlhbm9jb3JlCj4gZmVhdHVyZSByZXF1ZXN0IEAgaHR0cHM6Ly9idWd6aWxsYS50aWFu
b2NvcmUub3JnLwo+CgpUaGUgMTkuNi4xMjYgZGVzY3JpYmVzIHRoZSBTUEkgcmVzb3VyY2UsIGlu
IHBhcnRpY3VsYXI6CgotLS04PC0tLTg8LS0tCkRhdGFCaXRMZW5ndGggaXMgdGhlIHNpemUsIGlu
IGJpdHMsIG9mIHRoZSBzbWFsbGVzdCB0cmFuc2ZlciB1bml0IGZvcgp0aGlzIGNvbm5lY3Rpb24u
IF9MRU4gaXMgYXV0b21hdGljYWxseQpjcmVhdGVkIHRvIHJlZmVyIHRvIHRoaXMgcG9ydGlvbiBv
ZiB0aGUgcmVzb3VyY2UgZGVzY3JpcHRvci4KLS0tODwtLS04PC0tLQoKSXMgaXQgd2hhdCB5b3Ug
YXJlIGxvb2tpbmcgZm9yPyAoQXMgZmFyIGFzIEkga25vdyBtb3N0IG9mIHRoZQpmaXJtd2FyZXMg
c2ltcGxlIGFidXNlIHRoaXMgZmllbGQgYW1vbmcgb3RoZXJzKQoKPiBUaGVyZSBzZWVtcyB0byBi
ZSBhbiBhdmVudWUgdGhlcmUgZm9yIHJhaXNpbmcgbmV3IGZlYXR1cmVzIGZvciB0aGUgc3BlYy4K
PiBJIChvciBteSBvcmcpIGNhbid0IHBhcnRpY2lwYXRlIGluIEFXU0cuCgpCdXQgaGF2ZSB5b3Ug
cmVhZCAxOS42LjEyNj8KCj4gSSB3b3VsZCBoYXZlIG5vIGNvbmNyZXRlIHByb3Bvc2FsIGZvciBz
cGVjIHVwZGF0ZSBmb3Igbm93LCB0aG91Z2guCj4gSG9wZWZ1bGx5IG90aGVycyB3aXRoIG1vcmUg
ZXhwZXJ0aXNlIGNvdWxkIGNvbnRyaWJ1dGUuCgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5
IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
