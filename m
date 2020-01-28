Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BBCC33CB3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 06:25:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A4DE205F4
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 06:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcLl7Itp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t8PThJNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A4DE205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xjjr/iLDr8VPfQCkaGLW29dPlrKlBO9aZvpTXO0nGsM=; b=hcLl7ItpWvAtbU
	f7akV4kOMtFbjm3ryViEJR8IWpa3y2HmSXP0WOJcD+BWniWlW7mARR36ieSpjqWbp5SQ0UsVS3F82
	Rt+fS/rzbGrkxC4+U3oWz3Pg9Mt+zwDMgP7wj+yZBTJUX38GpcdDr7w3/v6qah4gFo6QL58UDmBRw
	0oJJkRZBX0zWdInJah5DqdE4veVZCD+9h/1+aYp3cW6f6QJSI5xsGsoCBByjueovYp5cH7yzFMwi2
	tUtub2d7irBdeA5ompU297qVzFpnlDUokRx0sq7ZURTQhs9uqTljIfBZ5taD91ZfbFZR5VG2LShM7
	ywkv9PiLIxJNv3ojHUEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwKJb-0001d6-71; Tue, 28 Jan 2020 06:25:35 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwKJX-0001ca-RK
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 06:25:33 +0000
Received: by mail-io1-xd2f.google.com with SMTP id t26so12988041ioi.13
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 22:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K/jdq6tpZHwG0Rqhvb/QrWB27nnZRReDB1vtxSpHIZs=;
 b=t8PThJNeo6jE0ymluR2dt3G9Mjc3VkwIgwmqgXLwtlOBTnpAUGvKGyB+tYgi69hasJ
 Vtr4Vggj9fz4Os1wrBrBK1ruq+H2peziIysbu1D3tS5Aw3pu8qHPw90Cyive1+FJjDxa
 tBSNz4Mrc/GoHXmx/Z70o+dyIKmScwa0xjljqhNLorEXGmQyEH8MV+QFDbTWNv5zYV+W
 KQCDwo2vlXxsFL6O16/Bm63mfIXEndH6l8G8xStOsZcFAxHvSB4fQutxz52usptB7mZI
 Ul9an1pjEvG/rq9Mo/M5N6GSLY9wPqc5/u5H2Hw3O2kaMwur+8iuCnvGMMG5OfVi/254
 z8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K/jdq6tpZHwG0Rqhvb/QrWB27nnZRReDB1vtxSpHIZs=;
 b=FoMGKtNTMJx62uiOeb4vi+4OBi/CvZDG+88FdTWMu21zkWNhXzeUwkUCZKWvEFwMXF
 93lUsgENSI2eU303yNLOEpN7H7NlMCAcQN6CBUEFLoEwOeRPJ1jm83VbsBHUG7AbcIPr
 jSiKG1loTmzbGmBWEk8UKEpiyEHlwxVAsQRndLueseYP+5CYvLO34Qrlfzy+EyBSXTcc
 z8/QNZ4gjLEHpj3DRGgh1TJjGdzz5AR+1SIjb17LrnlXfBcbXNW9PACEml4lW4r8QSLN
 +qMyR3gM69i0XJRSHwG7cQA6j4RUSZs5pbcgddiqT79+UkjDaTDZvxt1DxBra88/1Hnc
 N5XA==
X-Gm-Message-State: APjAAAVLmA71k82eN/Jj9C0VYMXFXSCo0DxR658U9FAlTw8Q1I9fH0+9
 feqiMj1Ca0MxD8xNNKIpZv1Dw2bYuqnXP7xuzy8=
X-Google-Smtp-Source: APXvYqyUwtKwdVKOxQpRxh/wA/rGMshRTD6gcKBzTHZSFXVZZBaFFYLwiTZzXq7LZsy5oW1uup7vHju+yM2m9Mc05RQ=
X-Received: by 2002:a02:6055:: with SMTP id d21mr17127557jaf.21.1580192730380; 
 Mon, 27 Jan 2020 22:25:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 27 Jan 2020 22:25:29
 -0800 (PST)
In-Reply-To: <20200127120638.2jpgvedxecwgwz6u@qschulz>
References: <CAA=hcWRQmXa4_hh3KzKmqeaEkGsbdTEimsPjh=tZWribMkM0dA@mail.gmail.com>
 <CAA=hcWRwi_EsMD2OBzVWtyX_SPJf05vqc09zhQzFdguKi0k=FA@mail.gmail.com>
 <emb3e01e23-7511-48c8-9229-85a767ab359c@andys-imac.leeshillfarm.local>
 <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
 <20200127120638.2jpgvedxecwgwz6u@qschulz>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 28 Jan 2020 17:25:29 +1100
Message-ID: <CAA=hcWSXrBKX=EbF5KHkWxmWQ+6Tcqvv4exxbWUOniDR6EDiRQ@mail.gmail.com>
Subject: Re: [yocto] lost busybox mysteriously
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_222531_911424_B04434EA 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: connman <connman@lists.01.org>,
 Yocto discussion list <yocto@yoctoproject.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andy Pont <andy.pont@sdcsystems.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8yNy8yMCwgUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHN0cmVhbXVubGltaXRl
ZC5jb20+IHdyb3RlOgo+IEhpIEpILAo+Cj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTA6MTM6
MzdQTSArMTEwMCwgSkggd3JvdGU6Cj4+IEhpIEFuZHksCj4+Cj4+IFRoYW5rcyBmb3IgdGhlIHJl
c3BvbnNlLgo+Pgo+PiBPbiAxLzI3LzIwLCBBbmR5IFBvbnQgPGFuZHkucG9udEBzZGNzeXN0ZW1z
LmNvbT4gd3JvdGU6Cj4+ID4gSkggd3JvdGUuLi4KPj4gPgo+PiA+PlRoYXQgdGhlIHNhbWUgcHJv
YmxlbSBvZiBtaXNzaW5nIGJ1c3lib3ggd2FzIG5vdCBqdXN0IG9jY3VycmVkIGR1cmluZwo+PiA+
PnRoZSBkZXZpY2UgcnVubmluZyBpbiB0aGUgbWlkZGxlIG9mIG9wZXJhdGlvbiwgaXQgd2FzIGFs
c28gb2NjdXJyZWQKPj4gPj5kdXJpbmcgYm9vdGluZyBpbWFnZSBmcm9tIE5BTkQsIEkgc2F3IHNl
dmVyYWwgdGltZXMgdGhhdCB0aGUgZmlyc3QgYW5kCj4+ID4+c2Vjb25kIGN5Y2xlcyBvZiBib290
aW5nIGltYWdlIGZyb20gTkFORCB3ZXJlIHdvcmtpbmcgd2VsbCwgdGhlbiBzb21lCj4+ID4+Zm9s
bG93aW5nIGJvb3RpbmcgcHJvY2VzcyB3b3VsZCBiZSBjcmFzaGVkIGJ5IG1pc3NpbmcgYnVzeWJv
eCwgdGhlbgo+PiA+PmNvdWxkIG5vdCBydW4gd2hvbGUgc2hlbGwgY29tbWFuZHMuIEkgaGF2ZSBi
ZWVuIHBvbmRlcmluZyBpZiBpdCBjb3VsZAo+PiA+PmJlIGNhdXNlZCBieSBOQU5EIGlzc3VlIG9y
IG5ldHdvcmsgdmlydXMgLyBmaXNoeT8gQXBwcmVjaWF0ZSBhbnkKPj4gPj5jbHVlcy4KPj4gPiBU
aGUgZmlyc3Qgc3RlcCBpcyBmb3IgdXMgdG8gdW5kZXJzdGFuZCB3aGF0IOKAnG1pc3NpbmfigJ0g
bWVhbnM/ICBIYXZlIHlvdQo+PiA+IGdvdCBhbnkgbWVjaGFuaXNtIChVLUJvb3QsIFNEIGNhcmQg
Ym9vdCwgZXRjLikgdGhhdCB3aWxsIGFsbG93IHlvdSB0bwo+PiA+IG1vdW50IGFuZCBsb29rIGF0
IHRoZSBjb250ZW50cyBvZiB0aGUgTkFORCBmaWxlIHN5c3RlbT8KPj4KPj4gTWVhbnMgdGhhdCBi
dXN5Ym94IHdhcyBub3QgdGhlcmUgYW55bW9yZSwgaXQgbXlzdGVyaW91c2x5IGxvc3QsIGFsbAo+
PiBzaGVsbCBjb21tYW5kcyB3b3VsZCBubyBsb25nZXIgYXZhaWxhYmxlLiBJdCBjYW5ub3QgdG8g
cnVuIG1vdW50IG9yCj4+IGFueSBzaGVsbCBjb21tYW5kcy4gVGhlcmUgd2FzIHR3byBzY2VuYXJp
b3Mgd2hlbiB0aGF0IGhhcHBlbmVkOgo+Pgo+PiAtIEluIHRoZSBtaWRkbGUgb2YgcnVubmluZywg
dGhlIGRldmljZSBhbGwgb2YgY2VydGFpbiBjb3VsZCBub3QgcnVuCj4+IHNoZWxsIGNvbW1hbmRz
IGFuZCBmYWlsZWQgbXlzdGVyaW91c2x5Cj4+Cj4+IC0gRHVyaW5nIHRoZSB1LWJvb3QgYm9vdGlu
ZyBrZXJuZWwgcHJvY2VzcywgdGhlcmUgd2VyZSBmdWxsIGVycm9ycyBvZgo+PiBmYWlsaW5nIHNo
ZWxsIGNvbW1hbmRzLiBMZXQgbWUgbWFrZSBpdCBjbGVhciwgIHRoYXQgYm9vdGluZyBlcnJvciBk
aWQKPj4gbm90IG9jY3VyIGluIHRoZSBmaXJzdCBvciBzZWNvbmQga2VybmVsIGJvb3RpbmcgYWZ0
ZXIgdGhlIG5ldyBpbWFnZQo+PiBpbnN0YWxsYXRpb24sIGl0IGhhcHBlbmVkIGluIHRoZSBmb2xs
b3dpbmcga2VybmVsIGJvb3RpbmcsIGJ1dCB0aGVyZQo+PiB3YXMgbm90aGluZyB0byBkZWxldGUg
YnVzeWJveCBhY2NpZGVudGFsbHksIGJ1c3lib3ggd2FzIGp1c3QKPj4gbXlzdGVyaW91c2x5IGRp
c2FwcGVhcmVkLiBCZWNhdXNlIEkgY291bGQgbm90IHJ1biBscywgSSBkaWQgbm90IGtub3cKPj4g
aWYgdGhlcmUgYXJlIG90aGVyIHRoaW5ncyBtaXNzaW5nLiBJZiB5b3UgYXNrIGhvdyBJIGNvdWxk
IGtub3cgdGhlCj4+IGJ1c3lib3ggd2FzIG1pc3NpbmcsIEkgcmFuIHRoZSB6SW1hZ2UtaW5pdHJh
bWZzIHRvIGJvb3QgdGhlIGxpbnV4IGluCj4+IFJBTSwgdGhlbiBtb3VudCB0aGUgdWJpMCB0byBm
aW5kICBvdXQgYnVzeWJveCB3YXMgZ29uZS4KPj4KPj4KPj4gPiBJZiB5b3UgbG9vayBhdCB0aGUg
L2JpbiBkaXJlY3RvcnkgKGxzIC1sYSAvYmluL2J1c3kqKSB3aGF0IGRvIHlvdSBzZWU/Cj4+ID4g
SGF2ZSB0aGUgZmlsZXMgYmVlbiBkZWxldGVkPyBUcnVuY2F0ZWQ/IFplcm8gbGVuZ3RoPwo+Pgo+
PiBDb3VsZCBub3QgcnVuIGxzIG9yIGFueSBzaGVsbCBjb21tYW5kcyB3aGVuIHRoZSBidXN5Ym94
IHdhcyBtaXNzaW5nLgo+Pgo+Cj4gL2Jpbi9scyAtbGEgL2Jpbi9idXN5KiA/Cj4KPiBNYXliZSBz
b21ldGhpbmcgaXMgbWVzc2luZyB3aXRoIHRoZSBQQVRIIGVudmlyb25tZW50IHZhcmlhYmxlLiBP
cgo+IHNvbWV0aGluZyBpcyByZW1vdmluZyB0aGUgc3ltbGlua3MgZnJvbSBzb21lIGJpbmFyaWVz
IHRvIGJ1c3lib3guCgpObywgY291bGQgbm90IHJ1biAvYmluL2xzIGFzIGl0IHdhcyAgbGlua2Vk
IHRvICAvYmluL2J1c3lib3gubm9zdWlkLAp0aGUgL2Jpbi9idXN5Ym94Lm5vc3VpZCB3YXMgZGFt
YWdlZCBmb3Igc29tZSByZWFzb24uCgo+PiA+IFdoYXQgZmlsZSBzeXN0ZW0gYXJlIHlvdSB1c2lu
ZyBvbiB0aGUgTkFORCBmbGFzaD8gIEhvdyBhcmUgdGhlIGRldmljZXMKPj4gPiBiZWluZyByZXNl
dCBkdXJpbmcgdGhlIHZhcmlvdXMgYm9vdCBjeWNsZXM/ICBJZiBpdCBpcyBhIGhhcmR3YXJlIHJl
c2V0Cj4+ID4gdGhlbiBzb21lIGZpbGUgc3lzdGVtcyBhcmUgbGVzcyByZXNpbGllbnQgdG8gaXQg
dGhhbiBvdGhlcnMgYnV0IEkgd291bGQKPj4gPiBleHBlY3QgaW4gdGhhdCBjYXNlIG1vcmUgZnVu
ZGFtZW50YWwgYm9vdCBpc3N1ZXMuCj4+Cj4+IFVCSUZTLCBtb3N0IGRldmljZSByZXNldCBvciBi
b290IGN5Y2xlcyB3ZXJlIGNhbGxpbmcgaGFsdCBvciByZWJvb3QsCj4+IGJ1dCBpdCBzb21ldGlt
ZSBpdCBjb3VsZCBqdXN0IHVzZSBwb3dlciBjeWNsZS4KPj4KPgo+IElJUkMsIFVCSUZTIGlzIHNh
ZmUgZnJvbSBwb3dlciBjeWNsZXMuCgpHb29kIHRvIGtub3cuIFRoYW5rIHlvdS4KCj4gUXVlbnRp
bgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
