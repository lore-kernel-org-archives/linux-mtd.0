Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DD8EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7Yv74zrGooj3mn1UdOgJaluy+WwdKaHwZ+D6WaGoSg=; b=CcVl8fZ6Bc3XUY
	MUj3ZfQHiFrtwdxl7UWwGT/GLeLLa8D/aJuxIDwtkGHPV2FF2F62727/9BmZVQX4XvE0OYsWxipBd
	KaZxDbVe2vq4amLUjRBBSXOz52IZfnKKTtmjwR06EOPeJZ8XtWDJpXVTGQ4I83F4ps85vxJ24jBje
	T1dHBYIbax2DVv/ZPabYa6B9tIQIHKaef38iMKqkla/qSHiHZPyNGIZZoj8JCMDPWrV6xafMDIKk3
	OQGYzaGAcgs2eD06bGVjHoPV5FMqKfJsM1d9xXhvyH0h1xqFsbEtDPYFeeMZmD/CA+76AhpI4jdfX
	7dEuvJu+yzAACSFD86Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLPdx-004K91-35;
	Mon, 17 Jul 2023 14:56:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLPdW-004K6V-0b
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 14:55:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbf1b82de7so28609545e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689605740; x=1692197740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gT2DYDTpnAFnNYyEQcqTiu2i3X3T+MGg0Z63l02++rg=;
        b=PHdBt9yo+D08RNLarLzz/eUDPES9dhqrUDYOH2haLxPq+WPplKDEFuqstG0Vo69nmH
         CJOIHW8b7VFoapcbxA/n1gxfg4YdwJ6zd+Qk31NwLNQD2umJ3XW9I3JNCA6hMnS39ewH
         3aukdVH9slQpSCsGfxkA36K2l7jXZpvEeZmAeMhQNLtRtgSZ6pTERi30DZNLQznS2Meo
         XBJqTaDL5/jJ51WoBO5tMFT3eV4sRH7GLiMFOzlZbyLOTO3UkW7Mcda5sqGFzzRpKIQ5
         Sjem37zLs+frU8hu0DUL7Ms/2+Kfkzb8z4M3kinSv3z+IdX/uPjSH/MYMads9O3eoCzj
         W4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689605740; x=1692197740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gT2DYDTpnAFnNYyEQcqTiu2i3X3T+MGg0Z63l02++rg=;
        b=N9YE5ddLGM7fOQciVN4jzqUSCIAxpeaROHWd3CsVZAe4DktjBUky/8A8WFlzyYf5FX
         CyupGUVhnimepHGBj0JYmHCSDrhXaDXsa6hopWK2GQ5hyTMhPOsBqgy3QPK72+FRxa3F
         yEZL3TGJoLWde8IGRA64mJy1kK0Dza1Wl8LA2fsqGyOsq+24XAVz+B4AjLET/fO+WqF7
         T9kIpDwDeeHrIxv88SqO80hNHMs+VrsTcM9/qisQnEYGA2Rnu4TAYSzrQB+iAi3kn5FI
         fgQTqVkvbe1BCkRz6unjIvQxr3J/otDBFGjyhLqJJ1FRDN4ah3jllCgSrMB066508BT5
         3hHQ==
X-Gm-Message-State: ABy/qLYIzS6j/Lt6uvbKHqqdWmFtBpyNcbTitAhkET0XiTY3Zc5sVIh3
	I47MmdleiBoUJHn8aKsB9M2K4w==
X-Google-Smtp-Source: APBJJlEQ54Sjj9XLgH7wIfAJn3L7LkzPoqvEcn6oWOCmVaqCb51v8vPoshPaARK9S6v6/AYrCN9D+g==
X-Received: by 2002:a05:600c:3c82:b0:3fa:821e:1fb5 with SMTP id bg2-20020a05600c3c8200b003fa821e1fb5mr8928242wmb.5.1689605739647;
        Mon, 17 Jul 2023 07:55:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id y4-20020a1c4b04000000b003fbc0a49b57sm13007wma.6.2023.07.17.07.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 07:55:39 -0700 (PDT)
Message-ID: <55cb3917-0d4d-c209-d2f6-b92e62312f2b@linaro.org>
Date: Mon, 17 Jul 2023 15:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: mtd: spi-nor: flash_info db overhaul
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
References: <28d2e2f6f607cc14419ef996d9b624bc@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <28d2e2f6f607cc14419ef996d9b624bc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_075543_088224_EB0E796D 
X-CRM114-Status: GOOD (  38.15  )
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

CgpPbiA3LzE3LzIzIDE0OjUxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+IEknbSBw
bGFubmluZyB0byBkbyBhIG1ha2VvdmVyIG9mIGhvdyB0aGUgaW4ta2VybmVsIGZsYXNoIGRhdGFi
YXNlIG9mCj4gdGhlIFNQSS1OT1IgcGFydHMgYXJlIHJlcHJlc2VudGVkLiBJdCBhbGwgc3RhcnRl
ZCB3aXRoIHRoZSBxdWVzdCBmb3IKPiBkcm9wcGluZyB1bm5lZWRlZCBwcm9wZXJ0aWVzIGxpa2Ug
c2l6ZSBhbmQgc2VjdG9yX3NpemUgZm9yIG5ld2VyCj4gZmxhc2hlcyB3aGljaCBhbHJlYWR5IGNv
bnRhaW5zIHNlbGYgZGVzY3JpYmluZyB0YWJsZXMgd2l0aGluIHRoZSBmbGFzaAo+IGl0c2VsZiA6
KQo+IAo+IFNvb24gYWRkaXRpb25hbCBkcmF3YmFja3MgKG9yIG1heWJlIGxlZ2FjeSBmZWF0dXJl
cyA6KSB3ZXJlIGRpc2NvdmVyZWQ6Cj4gwqAqIHRoZSBTTk9SX0lEcyBhcmUgaGFyZGNvZGVkIHRv
IGVpdGhlciAzIG9yIDYgYnl0ZXMuIEJ1dCB3aXRoIHRoZSBkYXduCj4gwqDCoCBvZiBjb250aW51
YXRpb24gY29kZXMsIHRoZXNlIElEcyBoYXZlIGEgZmxleGlibGUgbGVuZ3RoLgo+IMKgwqAgRnVu
IGZhY3QsIHdlIGhhdmUgb25lIGZsYXNoIHdpdGggYSBjb3JyZWN0IGNvbnRpbnVhdGlvbiBjb2Rl
LAo+IMKgwqAgImlzMjVjZDUxMiIgd2l0aCBpZCAweDdmOWQyMCwgMHg3ZjlkIGlzIHRoZSB2ZW5k
b3IgaWQgYW5kIDB4MjAgdGhlCj4gwqDCoCBkZXZpY2UgaWQsIHdoaWNoIGlzIGp1c3Qgb25lIGJ5
dGUgZm9yIHRoaXMgZmxhc2guIEZpcnN0LCBJIHRob3VnaCB0aGF0Cj4gwqDCoCB3YXMgYSBtaXN0
YWtlLCBidXQgYWN0dWFsbHkgaXQgaXMgaW4gbGluZSB3aXRoIHRoZSBkYXRhc2hlZXQuIEFwcGFy
ZW50bHksCj4gwqDCoCB0aGUgdmVuZG9yIGlzIGFmcmFpZCBvZiBzcGkgY29kZSB3aGljaCBvbmx5
IHN1cHBvcnRzIDMgaWQgYnl0ZXMgOikgVGhlCj4gwqDCoCBzYW1lIGlzIHRydWUgZm9yICJwbTI1
bHEwMzIiLgo+IMKgKiBhbGwgdGhlIG1hY3JvcyBjb250YWluIGEgdHJhaWxpbmcgY29tbWEsIGFu
ZCB0aHVzIHRoZSB0cmFpbGluZyBjb21tYQo+IMKgwqAgaXMgb21pdHRlZCBpbiB0aGUgZmxhc2gg
ZGIgd2hpY2ggbWFrZXMgaXMgc29tZXdoYXQgaW5jb25zaXN0ZW50IGlmIHlvdQo+IMKgwqAgYWxz
byB3YW50IHRvIHVzZSBub24tbWFjcm8gZW50aXJlcywgbGlrZSAiLmZpeHVwcyA9IGZpeHVwLCIK
PiDCoCogbWFjcm9zIHdoaWNoIGp1c3QgcmV0dXJucyB0aGVpciBhcmd1bWVudCwgZS5nLgo+IMKg
wqAgI2RlZmluZSBOT19TRkRQX0ZMQUdTKHgpIC5ub19zZmRwX2ZsYWdzID0gKHgpLAo+IMKgKiBu
ZXdlciBmbGFzaGVzIG9ubHkgbmVlZCB0aGUgaWQsIGEgbmFtZSBhbmQgc29tZSBmbGFncywgdGh1
cyBJTkZPKCkKPiDCoMKgIGhhcyBhIGxvdCBvZiBlbXB0eSBmaWVsZHMsCj4gwqAqIG5ld2VyIGZs
YXNoZXMgbmVlZCB0byBleHBsaWNpdGx5IHNwZWNpZnkgUEFSU0VfU0ZEUC4KPiAKPiBHb2FscyBJ
J2QgbGlrZSB0byBhY2hpZXZlOgo+IMKgKiBmaXJzdCBhbmQgZm9ybW9zdCwgbmV3IGZsYXNoIGVu
dHJpZXMgc2hvdWxkIGJlIGFzIHNsaW0gYXMgcG9zc2libGUsCj4gwqAqIHRoZSBpZCBzaG91bGQg
aGF2ZSBhIGZsZXhpYmxlIGxlbmd0aCwKPiDCoCogc2FtZSAoY29uc2lzdGVudCkgZm9ybWF0IGZv
ciBsZWdhY3kgZmxhc2ggZW50cmllcyBhbmQgbmV3ZXIgb25lcywKPiDCoCogbm8gb3ZlcnVzZSBv
ZiBtYWNyb3MKPiAKPiAKPiBIZXJlIGFyZSBzb21lIG9sZCBleGFtcGxlczoKPiB7ICJtdDI1cWwy
NTZhIizCoCBJTkZPNigweDIwYmExOSwgMHgxMDQ0MDAsIDY0ICogMTAyNCzCoCA1MTIpCj4gwqDC
oMKgwqBOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1Jf
UVVBRF9SRUFEKQo+IMKgwqDCoMKgRklYVVBfRkxBR1MoU1BJX05PUl80Ql9PUENPREVTKQo+IMKg
wqDCoMKgTUZSX0ZMQUdTKFVTRV9GU1IpCj4gfSzCoCAvLyAoMSkKPiB7ICJuMjVxMjU2YXgxIizC
oCBJTkZPKDB4MjBiYjE5LCAwLCA2NCAqIDEwMjQswqAgNTEyKQo+IMKgwqDCoMKgTk9fU0ZEUF9G
TEFHUyhTRUNUXzRLIHwgU1BJX05PUl9RVUFEX1JFQUQpCj4gwqDCoMKgwqBNRlJfRkxBR1MoVVNF
X0ZTUikKPiB9LMKgIC8vICgyKQo+IHsgIncyNXE1MTJud3EiLCBJTkZPKDB4ZWY2MDIwLCAwLCAw
LCAwKQo+IMKgwqDCoMKgUEFSU0VfU0ZEUAo+IMKgwqDCoMKgT1RQX0lORk8oMjU2LCAzLCAweDEw
MDAsIDB4MTAwMCkKPiB9LCAvLyAoMykKPiB7ICJ3MjVxMTI4IiwgSU5GTygweGVmNDAxOCwgMCwg
NjQgKiAxMDI0LCAyNTYpCj4gwqDCoMKgwqBQQVJTRV9TRkRQCj4gwqDCoMKgwqBGTEFHUyhTUElf
Tk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIpCj4gwqDCoMKgwqBOT19TRkRQX0ZMQUdTKFNF
Q1RfNEspCj4gfSwgLy8gKDQpCj4gCj4gSGVyZSdzIHRoZSAoaWRlYSBvZiB0aGUpIGZpbmFsIHZl
cnNpb246Cj4gewo+IMKgIC5pZCA9IFNOT1JfSUQoMHgyMCwgMHhiYSwgMHgxOSwgMHgxMCwgMHg0
NCwgMHgwMCksCj4gwqAgLm5hbWUgPSAibXQyNXFsMjU2YSIsCj4gwqAgLnNpemUgPSBTWl8zMk0s
Cj4gwqAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElf
Tk9SX1FVQURfUkVBRCwKPiDCoCAuZml4dXBfZmxhZ3MgPSBTUElfTk9SXzRCX09QQ09ERVMsCj4g
wqAgLm1mcl9mbGFncyA9IFVTRV9GU1IsCj4gfSAoMSkKPiB7Cj4gwqAgLmlkID0gU05PUl9JRCgw
eDIwLCAweGJiLCAweDE5KSwKPiDCoCAubmFtZSA9ICJuMjVxMjU2YXgxIiwKPiDCoCAuc2l6ZSA9
IFNaXzMyTSwKPiDCoCAubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEsgfCBTUElfTk9SX1FVQURfUkVB
RCwKPiDCoCAubWZyX2ZsYWdzID0gVVNFX0ZTUiwKPiB9ICgyKQo+IHsKPiDCoCAuaWQgPSBTTk9S
X0lEKDB4ZWYsIDB4NjAsIDB4MjApLAo+IMKgIC5uYW1lID0gIncyNXE1MTJud3EiLAo+IMKgIC5v
dHBfb3JnID0gU05PUl9PVFBfT1JHKDI1NiwgMywgMHgxMDAwLCAweDEwMDApLAo+IMKgIC8vIG9y
IG1heWJlIGp1c3QgLm90cCA9IFNOT1JfT1RQKCksCgpJIGxpa2UgU05PUl9PVFAuCgo+IH0gKDMp
Cj4gewo+IMKgIC5pZCA9IFNOT1JfSUQoMHhlZiwgMHg0MCwgMHgxOCksCj4gwqAgLm5hbWUgPSAi
dzI1cTEyOCIsCj4gwqAgLnNpemUgPSBTWl8xNk0sCj4gwqAgLmZvcmNlX3NmZHAgPSB0cnVlLAo+
IMKgIC5mbGFncyA9IFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiwKPiDCoCAubm9f
c2ZkcF9mbGFncyA9IFNFQ1RfNEssCj4gfSwgLy8gKDQpCj4gCj4gVGhlIGZ1bGwgdGVtcGxhdGUg
d291bGQgYmU6Cj4gewo+IMKgLmlkID0gU05PUl9JRCgpLAo+IMKgLm5hbWUgPSAsCj4gwqAuc2l6
ZSA9ICwgLy8gd2lsbCByZXBsYWNlIG5fc2VjdG9ycwo+IMKgLnNlY3Rvcl9zaXplID0gLCAvLyBp
ZiAwLCBTWl82NEsgaXMgYXNzdW1lZCwgb3RoZXJ3aXNlIGhhcyB0byBiZSBzZXQKPiDCoC5uX2Jh
bmtzID0gLCAvLyBpZiAwLCAxIGlzIGFzc3VtZWQsIG90aGVyd2lzZSBoYXMgdG8gYmUgc2V0Cj4g
wqAucGFnZV9zaXplID0gLCAvLyBpZiAwLCAyNTYgaXMgYXNzdW1lZCwgb3RoZXJ3aXNlIGhhcyB0
byBiZSBzZXQKPiDCoC5hZGRyX25ieXRlcyA9ICwgLy8gYWRkcl9uYnl0ZXMgaXMgYWxyZWFkeSBz
cGVjaWFsLCBzZWUgc3BpX25vcl9zZXRfYWRkcl9uYnl0ZXMoKQo+IMKgLmZsYWdzID0gLAo+IMKg
Lm5vX3NmZHBfZmxhZ3MgPSAsCj4gwqAubWZyX2ZsYWdzID0gLAo+IMKgLm90cF9vcmcgPSBTTk9S
X09UUF9PUkcoKQo+IMKgLmZpeHVwcyA9IC4KPiDCoC5maXh1cF9mbGFncyA9ICwKPiDCoC5mb3Jj
ZV9zZmRwID0gLCAvLyBzZWUgYmVsb3chCj4gfQo+IAo+IFRoZSBvbmx5IG1hbmRhdG9yeSBmaWVs
ZCBpcyAuaWQgYmVjYXVzZSB0aGF0IGlzIHRoZSBrZXkgaW50bwo+IHRoZSBkYiBlbnRyeS4gT2Yg
Y291cnNlLCB3aXRoIHRoZSBkYXduIG9mIHRoZSBnZW5lcmljIHNwaSBmbGFzaAo+IGRyaXZlciwg
YW4gZW50cnkgd2l0aCBubyBhZGRpdGlvbmFsIGZsYWdzIGRvZXNuJ3QgbWFrZSBhbnkgc2Vuc2Uu
Cj4gVGhlcmVmb3JlLCBJJ2QgZXhwZWN0IGFuIGVudHJ5IHRvIGhhdmUgYXQgbGVhc3QgLipmbGFn
cyBvcgo+IC5vdHBfb3JnIHNldC4KClJpZ2h0LCB0aGUgZ29hbCBpcyB0byBkZWZpbmUgYSBmbGFz
aCBieSBuYW1lLCBpZCwgYW5kIGV2ZXJ5dGhpbmcgZWxzZSB0aGF0CmNhbid0IGJlIGRpc2NvdmVy
ZWQgd2hlbiBwYXJzaW5nIFNGRFAuCgo+IAo+IEFsdGVybmF0aXZlbHksIHRoZSBzZWNvbmQga2V5
IGlzIHRoZSBuYW1lIGZvciBsZWdhY3kgZmxhc2hlcyB3aGljaAo+IGFyZSBsb29rZWQgdXAgYnkg
dGhlIG5hbWUgaW5zdGVhZCBvZiB0aGUgaWQuIElmIHdlIGV2ZXIgbmVlZCB0bwo+IHJlc29ydCB0
byBpbmRpdmlkdWFsIERUIGNvbXBhdGlibGVzLCBJJ2QgdXNlIGEgbmV3IC5jb21wYXRpYmxlIGVu
dHJ5Cj4gZm9yIHRoYXQgbGlrZSBldmVyeXdoZXJlIGVsc2UgaW4gdGhlIGtlcm5lbC4KPiAKPiBP
bmUgd29yZCBvbiAucGFyc2Vfc2ZkcCAoQFR1ZG9yIHRoaXMgaXMgbmV3LCBzbyBsZXQgbWUga25v
dykuIEJlY2F1c2UKPiBJIHdhbnQgbmV3IGVudHJpZXMgYXMgc2xpbSBhcyBwb3NzaWJsZSBhbmQg
SSBleHBlY3QgdGhhdCBhbGwgbmV3IGZsYXNoZXMKPiB3aWxsIHN1cHBvcnQgU0ZEUCwgSSdkIGxp
a2UgdG8gZ2V0IHJpZCBvZiB0aGUgbWFuZGF0b3J5Cj4gIi5wYXJzZV9zZmRwID0gdHJ1ZSIgbGlu
ZS4gVGhlIGZpcnN0IGlkZWEgd2FzIHRvIGp1c3QgaW52ZXJ0IHRoZSBsb2dpYwo+IGFuZCBoYXZl
IGEgLm5vX3NmZHAgd2hpY2ggd2lsbCBuZWVkIHRvIGJlIHNldCB0byB0cnVlIGZvciBhbGwgdGhl
IG9sZAo+IGZsYXNoZXMuIEJ1dCBJIHRoaW5rIHdlIGNhbiBkbyBiZXR0ZXIuIFdlIGNhbiBhc3N1
bWUgdGhhdCBlYWNoIGVudHJ5Cj4gd2l0aCAuc2l6ZSAhPSAwIChvciAubl9zZWN0b3JzIGluIHRo
ZSBvbGQgZm9ybWF0KSB3aWxsIGltcGxpY2l0bHkgYmUKPiAiLm5vX3NmZHAgPSB0cnVlIiAob3Ig
cGFyc2Vfc2ZkcCA9IGZhbHNlIGluIHRoZSBvbGQgZm9ybWF0KS4gVGhlcmUgaXMKCnRoZSBhc3N1
bXB0aW9uIHdpbGwgd29yayBpbmRlZWQuCgo+IG9mIGNvdXJzZSBvbmUgZXhjZXB0aW9uIHRvIHRo
aXMgcnVsZS4gRmxhc2hlcyB3aXRoIHRoZSBzYW1lIElEIHdoZXJlCj4gb25lIHN1cHBvcnRzIFNG
RFAgYW5kIG9uZSBkb2Vzbid0LiBJbiB0aGUgZW5kIHRoZSBvdXRjb21lIGlzIHRoZSBzYW1lLAo+
IHdlIG5lZWQgdG8gZm9yY2UgU0ZEUCBwYXJzaW5nIGV2ZW4gaWYgLnNpemUgbm9uLXplcm8uIFRo
dXMgZm9yIHRoaXMKPiBjYXNlLCB3ZSBuZWVkIGEgLmZvcmNlX3NmZHAgPSB0cnVlIGVudHJ5LiBT
ZWUgYWxzbyBleGFtcGxlICg0KSBhYm92ZS4KPiAKSSB3b3VsZG4ndCBpbnRyb2R1Y2UgYSBuZXcg
bWVtYmVyIGp1c3QgZm9yIGV4Y2VwdGlvbnMuIEhvdyBhYm91dCBzZXR0aW5nCi5wYXJzZV9zZmRw
ID0gdHJ1ZSBhdCBkZWZpbml0aW9uIG9ubHkgaW4gdGhpcyBjYXNlIGFuZCBhZGQgYSBjb21tZW50
IG9uCnRvcCBvZiBpdCBzYXlpbmcgdGhhdCB3ZSBmb3JjZSBzZmRwIHBhcnNpbmcgdG8gZGlmZmVy
ZW50aWF0ZSBiZXR3ZWVuIHRoZQpmbGFzaGVzLgoKPiBJJ3ZlIGFscmVhZHkgaGFkIGEgdGFsayB3
aXRoIFR1ZG9yIGFib3V0IHRoYXQgdG9waWMuIERvZXMgYW55b25lIGVsc2UKPiBoYXZlIHRob3Vn
aHRzIG9uIGl0Pwo+IAoKSSBjb25maXJtIHRoYXQgSSBhZ3JlZSB3aXRoIHRoZSBjaGFuZ2VzIHBy
b3Bvc2VkLgoKQ2hlZXJzLAp0YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
