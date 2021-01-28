Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB94C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:37:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7043660235
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7043660235
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=znc8XzqJTiFi4Y+SNgeyvCZY0XjwxkqiC0OXTNc7nkQ=; b=rEx1TCEFkp3qNLD9p0YdTcYMi
	JD++rbCklDP/faZm3eIR30YMVDR2wg88TgUBYONut9lQ4fP7YZXVVPCTe9MTXatTxhn0DR5PSvltc
	qkjJ/dDt7ZIKPqB/Sip5LvhzZO5XPkrqjO/6EZP0aO6c2aHovSp4AQ4TB8DOGvTWfV3DSQyqUL/Fp
	jS43z+ZfOi1F2I2xLKkHxkSc/fxzu4jdI0K/uzPSVc7TvNW+eZ5/qAvbZ6/Hh3y04eu7EpfqvaZST
	smlq433p57nNq8k8zBFTGJuga30b4z7ZHB7D8+89MJpfh/4a8xxRRUZlxSY0ZwUjSfwB7J7bhmCOM
	AICVIqaNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l54ee-0003kH-ED; Thu, 28 Jan 2021 10:36:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l54ec-0003jO-27
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 10:35:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 190so3886984wmz.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2021 02:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=43KYCUmznBg1aLXgElRow3rtSV/DV08PP+fwP8DERqg=;
 b=id9CMiQokMgq6PRLW+YylYZiwH9zvFIN0bkjsx2/sM829Svgz28D6BeMN+L6KsNuuN
 3KnXNLVdAZ3Lwutj76Ex3aYPKII9FKEzoc/sexsAepP4g7jOyeXXIpqzJBeiwDgDvtT8
 Jb9EN7ecFLwrfmGG3ZpxAZKZNcGV9QFIw+X1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=43KYCUmznBg1aLXgElRow3rtSV/DV08PP+fwP8DERqg=;
 b=RRaKHsq3/Hsm988SZ/OKdpikpTnKUUGesaiiaeswZFhNqagMrbOfoU+O1OCfWJ84+i
 pXXOK5v/2aHsrXy8fDPfbz5i1F/0jZZXQdFUnUD56aDqhhXAPYiYuWWvcwZdVdWjDvYf
 c8mqCIguTCV2toZHhYx3zQ9ugAm/2Y9cj7V8GBmUgX1BOLJQJ0WIflbJzpIZ9LEjTc71
 Temrz3WhRmi3To2sRETH9zuHYojPRNWvlkPkji0g8fTetsoKU7iuPG5iSwfw7F5TgIP8
 Qla88TBOyZ+DoCH84KQEEXS7ujJZZ9Qr4CmzyKTPDjqMtvTWTwDoAwz7CeN8A6rnOY0J
 PiHQ==
X-Gm-Message-State: AOAM533d7ykuDHqSN64kxk9/5emFfq68U2hYOFjRQ2ZGORNOWbTeLUkG
 YgEafbKe9kEh5U4bdbZpGJ0HkIMkeTcMk0N+CRMHaA==
X-Google-Smtp-Source: ABdhPJwRa+77Pdri1QW/oMAlDvqxFJ2Wovz8lcTFA7mL037dn/rZMgI3V35xPYCMVgSSjwCdcWIyein/w5PGU0G0Pog=
X-Received: by 2002:a1c:e407:: with SMTP id b7mr8061775wmh.46.1611830156517;
 Thu, 28 Jan 2021 02:35:56 -0800 (PST)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
 <53cb8db7-bcf8-ee7c-84ee-59a14a04aad9@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <20210128112627.1429b02a@xps13>
In-Reply-To: <20210128112627.1429b02a@xps13>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 28 Jan 2021 11:35:45 +0100
Message-ID: <CAOf5uwk9J8sKV8OvSvsMUJtZMSo0wFp=-eZ7NRp6Rp0ZTauMMw@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_053558_411178_E82FFFA9 
X-CRM114-Status: GOOD (  22.00  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKCk9uIFRodSwgSmFuIDI4LCAyMDIxIGF0IDExOjI2IEFNIE1pcXVlbCBSYXluYWwKPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgTWljaGFlbCwKPgo+IE1pY2hhZWwg
TmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGUg
b24KPiBUaHUsIDI4IEphbiAyMDIxIDEwOjQ1OjI5ICswMTAwOgo+Cj4gPiBIaSBHcmVnCj4gPgo+
ID4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMjo1MCBBTSBHcmVnIFVuZ2VyZXIgPGdlcmdAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEJvcmlzLAo+ID4gPgo+ID4gPiBPbiAxMi84
LzE5IDU6MzEgcG0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIDEyIEF1
ZyAyMDE5IDEyOjUwOjM2ICsxMDAwCj4gPiA+IFtzbmlwXQo+ID4gPiA+IEhtLCBDVFJMMSBpcyBp
ZGVudGljYWwuIENhbiB5b3UgZHVtcCBhbGwgcmVncyBhdCB0aGUgYmVnaW5uaW5nIGFuZCBhdAo+
ID4gPiA+IHRoZSBlbmQgb2YgdGhvc2UgZnVuY3M/Cj4gPiA+Cj4gPiA+IEhlcmUgaXMgYSBtb3Jl
IGNvbXBsZXRlIGR1bXAgb2YgcmVnaXN0ZXJzLiBUcmFjZSBwb2ludHMgYXJlIGF0Cj4gPiA+IGVu
dHJ5IGFuZCBleGl0IG9mIHRoZSByZXNwZWN0aXZlIGZ1bmN0aW9ucyBpbiB0aGUgZGlmZmVyZW50
Cj4gPiA+IGtlcm5lbCB2ZXJzaW9ucy4gUmVnaXN0ZXIgZHVtcGluZyBjb2RlIGlzIGlkZW50aWNh
bCBmb3IgYm90aC4KPiA+ID4KPiA+ID4KPiA+ID4gTGludXggdmVyc2lvbiA0LjE2LjAgKGdlcmdA
Z29vYmVyKSAoZ2NjIHZlcnNpb24gNC44LjMgKEdDQykpICMxMCBUdWUgQXVnIDEzIDEwOjI0OjI4
IEFFU1QgMjAxOQo+ID4gPiAuLi4KPiA+Cj4gPiBJIHJhbiBhbiBvdmVybmlnaHQgcmVib290IHBy
b2Nlc3Mgb24gbGludXgtNC4xOS55IHRhZzogdjQuMTkuMTY5IGFuZAo+ID4gSSdtIG5vdCBhYmxl
IHRvIHJlcHJvZHVjZSB1cCB0byBub3cuCj4gPgo+ID4gRG8geW91IGhhdmUgYW4gdXBkYXRlIGZy
b20geW91ciBzaWRlPwo+Cj4gUGVyaGFwcyB0aGlzIHBhdGNoIFsxXSB3YXMgYmFja3BvcnRlZCB0
byB2NC4xOS4xNjkgKEkgZGlkbid0IGNoZWNrKSBidXQKPiBpdCBtaWdodCBoYXZlIGZpeGVkIHRo
ZSBETUEgaXNzdWUgeW91IHdlcmUgc2VlaW5nLCBhdCBsZWFzdCBpbiB0aGUKPiByZWNlbnQga2Vy
bmVsIHZlcnNpb25zLgoKSXQncyBub3QgdGhlcmUgYW5kIHNob3VsZCBub3QgZ28gYmVjYXVzZSB0
aGlzIHBhdGNoIGZpeGVzIGFub3RoZXIKcmVncmVzc2lvbi4gIEFwcGx5Cml0IG1lYW5zIGFwcGx5
IGFueXdheSBib3RoLgpJIHdpbGwgZGVjb2RlIHRoZSByZWdpc3RlcnMgb24gdGhvc2UgdGhyZWFk
IGFuZCBjaGVjayB0aGUgZGlmZmVyZW5jZQoKTWljaGFlbAoKPgo+IFsxXSBtdGQ6IHJhd25hbmQ6
IGdwbWk6IEZpeCB0aGUgcmFuZG9tIERNQSB0aW1lb3V0IGlzc3VlCj4KPiBUaGFua3MsCj4gTWlx
dcOobAoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkFtYXJ1bGEgU29sdXRpb25z
IEJWCkNPTyBDby1Gb3VuZGVyCkNydXF1aXVza2FkZSA0NyBBbXN0ZXJkYW0gMTAxOCBBTSBOTApU
LiArMzEoMCk4NTExMTkxNzIKTS4gKzM5KDApMzQ3OTEzMjE3MApbYGFzXSBodHRwczovL3d3dy5h
bWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
