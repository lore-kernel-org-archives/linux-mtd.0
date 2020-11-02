Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C92C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 16:32:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC7822226
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 16:32:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s0SoCiG4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kY5mbNmx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFC7822226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TZSngT2PnjlDzcGg8QrMHFQWSVjd8EXLQfsSqj9OO/s=; b=s0SoCiG4ONmbYDwaq1FCts5Ml
	atGRw3o+h5MxJqjL7qHWA3iX/hod5GqaFzYmI/hRICnJ62wEtZ7ILbAEzQDW03+Hf601GUxRYv9V/
	4e+9O0QMTojxLaaJSKucbemChti+XiyLmo3ZKglwMminrf3W6TAIZzdPkirWPvuGBmGGwP7tme88u
	GWH21RSbrD5dy3ROd4kYW6kv9VSCgmbIIiPe3wr3W3gh4rj7f1Is6SKJvrJxbXZPTvizRQmdTiWv/
	tYbDZ3uFyOIekKMSwlO43MKq1506BiRwnaSlOx333o022oaGZMDSWPX1apjXVOxTmJdQ+1R0rOP2L
	P/oRget6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZck4-0002js-DU; Mon, 02 Nov 2020 16:31:36 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZcjr-0002f7-7i; Mon, 02 Nov 2020 16:31:30 +0000
Received: by mail-ed1-x544.google.com with SMTP id v4so15006825edi.0;
 Mon, 02 Nov 2020 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p2fcTDg/av4TCztE3uRH2/liGORQajJn+isGnpmMdBU=;
 b=kY5mbNmx5yYsUCy667eOxt3+IdZsjVD9gKrFGNoy2hqgQalZQTs3AeSk3vWJ5kQ2JN
 Atd1Tu//NE2Y4wDfZTpy99zYc+8UhHBP03uRgZhDOzKBqz+0U3GSi2IATShIfo2BRUdT
 ItzlZJ41MdCQUOf8LlN7ui9eSmjaeYJZkHfcBrEQUmIxesPKW9udwp2hwwFr5c2sfhUO
 w7otYYN49qCn3xTYxBFIDHRdBCywzIOMGL9RQBQOs/99bFeaG+gaVEznCwid33k9DfiV
 xGBzhP1xoifpkUj7MqIkdMy3LnoJqcxbmVX0Pc3WsbbvE/hgCYyGB+zThFVjMcCozSqZ
 r7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p2fcTDg/av4TCztE3uRH2/liGORQajJn+isGnpmMdBU=;
 b=t0/r8JwTTlpzkCzhU7HVedCDGa0TBD0K972fefm0kMBNKAQGID3ycI1pdhu0D1lI4A
 wZZByTTWuXK2b1qMVj9mmaVakP6AYcxHZ80gfR3VnLVNpwNG1yseDGbYP2kcCj9kX1OG
 ZHesyQa/0Df6DWjwL3itrFRZjj1HI9nqjXKVbdxhhLwJk+SBrjGRjh77Jxvn/Q58j63k
 pgWMCtUaLjF1zmPSGfsMprhAEk0mKSACnvf0JBMCjiJd5H4mimEMiTpcRhquBMua9fzW
 t0obhelCu/sCUOPZU1l6eS21JovoB5MNgTk8a//GV1Dq8F/6ffcf5tkVRQIKfUW2KBlb
 eFUA==
X-Gm-Message-State: AOAM532t/BLiRtiRI1HwAKIxUTLJUq2AJ/irmjXgBVxlxlpp5PRsJ2ID
 7Q0agRi3TRhvPGMsIIzsgyZQJY3CwfwYkQ==
X-Google-Smtp-Source: ABdhPJz5SCEMJfRJkGN5UBh8LBj3bCYDuwePlFY7wzirzd964nNtuX6Oo4fBvx6TOeQNE5GdH/PtxQ==
X-Received: by 2002:aa7:d709:: with SMTP id t9mr2388615edq.305.1604334681706; 
 Mon, 02 Nov 2020 08:31:21 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 rl1sm9752463ejb.36.2020.11.02.08.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:31:20 -0800 (PST)
Subject: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
From: Johan Jonker <jbx6244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>
 <e02e13a0-769d-6b73-c87e-5b7d75fd4254@rock-chips.com>
 <0b417fc2-3503-9bf6-914d-0f8b38df1914@gmail.com>
 <20201102140725.66e7dcb1@xps13>
 <5ad70fa0-05a9-e1e7-32cc-32933ff25ae9@gmail.com>
Message-ID: <803e291f-67e0-f66c-6c9e-041db1b3847c@gmail.com>
Date: Mon, 2 Nov 2020 17:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5ad70fa0-05a9-e1e7-32cc-32933ff25ae9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_113123_397698_CEDE5E00 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 Yifeng <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMi8yMCAyOjExIFBNLCBKb2hhbiBKb25rZXIgd3JvdGU6Cj4gSGksCj4gCj4gT24gMTEv
Mi8yMCAyOjA3IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBKb2hhbiwgWWlmZW5nCj4+
Cj4+IEpvaGFuIEpvbmtlciA8amJ4NjI0NEBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMiBOb3Yg
MjAyMCAxMzo1Nzo1Ngo+PiArMDEwMDoKPj4KPj4+IEhpIFlpZmVuZywKPj4+Cj4+PiBEb24ndCBw
b2tlIHdpdGggImVjYy0+Ynl0ZXMiIG9uZXMgaXQgaXMgc2V0IGluIHJrX25mY19lY2NfaW5pdCgp
LiBJdAo+Pj4gd2lsbCBub3QgYmUgbm90ZWQgYnkgdGhlIE1URCBmcmFtZSB3b3JrIG9yIHVzZXJz
cGFjZS4gSSB0aGluayB0aGVyZSdzCj4+PiBjdXJyZW50bHkgbm8gd2F5IHRvIGxldCB0aGUgdXNl
ciBrbm93IHRoYXQgYSBkaWZmZXJlbnQgRUNDIG11c3QgYmUgdXNlZC4KPj4+IE5laXRoZXIgY2Fu
IHRoZSB1c2VyIHNldCBFQ0Mgb24gdGhlIGZseS4KPj4+Cj4+PiBFeGFtcGxlIFIvVyBmbG93Ogo+
Pj4KPj4+ICAgICAgICAgbmFuZF9zZWxlY3RfdGFyZ2V0KCkKPj4+IAljaGlwLT5lY2Mud3JpdGVf
cGFnZV9yYXcoKQo+Pj4gCWNoaXAtPmVjYy53cml0ZV9wYWdlKCkKPj4+Cj4+PiBbLi5dCj4+Pgo+
Pj4gCWNoaXAtPmVjYy5yZWFkX3BhZ2VfcmF3KCkKPj4+IAljaGlwLT5lY2MucmVhZF9wYWdlKCkK
Pj4+ICAgICAgICAgbmFuZF9kZXNlbGVjdF90YXJnZXQoKQo+Pj4KPj4+IEEgd3JpdGUvcmVhZCB3
aXRoOgo+Pj4KPj4+IHJrX25mY19yZWFkX3BhZ2VfaHdlY2MoKQo+Pj4gcmtfbmZjX3dyaXRlX3Bh
Z2VfaHdlY2MoKQo+Pj4KPj4+IG9yCj4+Pgo+Pj4gcmtfbmZjX3JlYWRfcGFnZV9yYXcoKQo+Pj4g
cmtfbmZjX3dyaXRlX3BhZ2VfcmF3KCkKPj4+Cj4+PiBtdXN0IGVuZCB1cCB3aXRoIHRoZSBzYW1l
IHJlc3VsdC4gSWYgd2UgY2FuJ3QgYXJjaGl2ZSB0aGF0LCB0aGVuIHdlCj4+PiBzaG91bGRuJ3Qg
b2ZmZXIgUkFXIG1vZGUgdG8gdGhlIHVzZXIgZm9yIG5vdy4gSWYgTWlxdWVsIGFncmVlcyB5b3UK
Pj4+IHNob3VsZCBqdXN0IGdldCB0aGUgZHJpdmVyIHJlYWR5IG5vdyB3aXRob3V0IHRoZXNlIDIg
ZnVuY3Rpb25zIGFuZCByb3VuZAo+Pj4gdGhpbmdzIHVwLgo+Pgo+PiBXaGF0IGFib3V0IGp1c3Qg
bm90IHN1cHBvcnRpbmcgdGhlIEJvb3RST00gYXJlYSBpZiBpdCB3YXMgbWFya2VkCj4+ICJyZXNl
cnZlZCIgYnkgdGhlIEJSb20gaW4gdGhlIERUPwo+IAo+IFNob3VsZCB3ZSBqdXN0IGZpbGwgdGhl
IGJ1ZmZlcnMgd2l0aCAnMHhmZicgZm9yIGJvb3QgYmxvY2tzPwoKKHBhcnQgMikgOykKTXkgZmF1
bHQuLi4uCkJldHRlciB1c2U6CgogICAgaWYgKChjaGlwLT5vcHRpb25zICYgTkFORF9JU19CT09U
X01FRElVTSkgJiYKICAgICAgICAocGFnZSA8IChwYWdlc19wZXJfYmxrICogcmtuYW5kLT5ib290
X2Jsa3MpKSkgewoKCXJldHVybiAtRUlPOwoKICAgIH0KCgo+IAo+Pgo+PiBSYXcgYWNjZXNzb3Jz
IGlzIHJlYWxseSBhIG5pY2UgYW5kIGJhc2ljIGZlYXR1cmUgdGhhdCBJIHdvdWxkIGxpa2UgdG8K
Pj4gaGF2ZSBpbiBldmVyeSBuZXcgZHJpdmVyLgo+Pgo+PiBUaGFua3MsCj4+IE1pcXXDqGwKPj4K
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
