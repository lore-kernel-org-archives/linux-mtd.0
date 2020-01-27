Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4D2C32771
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 11:13:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468D4214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 11:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDlpzkvx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRTW1asu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468D4214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpnTyKwdRuoOP627iNR8uU4uiCY4jmw2I07Q0k3Fog4=; b=BDlpzkvxCVX7JF
	GHtDqpQdVc3ZAzzG30j8xiqb68z86mzGGld+gAU5zDOSb45Kj5rDZvX2zwCePvf/gaQyAjaM09qaL
	ZTFgkNPxZatcY/jIQZq05s2cKiouJTE4vsij2R66vhbAfz9ixZyoaihaw4H5uXKQLaT5q9sOoV5Ea
	GyBDpM4gSmYScTDSQdKkJCK02y2yzg0SFK0oq+AbYjw8BaOJIvz+Kp//ei/KDxPIehCgwmJLg5wmI
	1RSvacKFH0enUKdqI2c1Xnto8+pthqPP31p1RYn1W1G1RC5tancpL4RbRHyd4M7sYzpt0DpJm/msf
	jXmk1YrwkK95nuaZOFyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw2Kr-0001NY-RY; Mon, 27 Jan 2020 11:13:41 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw2Kp-0001Mu-2Y
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 11:13:40 +0000
Received: by mail-io1-xd2c.google.com with SMTP id h8so9502256iob.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 03:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V8vcT4YutXP/sUVywb1o6Lueba1AoRIlFBsljNK2Njg=;
 b=pRTW1asuIxRmEZ63mWYQ0ZPDEnlJvQJ9HpWNQDOlMmfz5CVodxrFlyZ+pVIxRdjlBV
 tBBWjW4ZspC6Z/cHJ12ItGu7NsgT5A14ryUR5wjSRbZ6o0aHewOqt7dlW0HsmC90ZmSY
 C2w2u0lVm0KGd+8iJrfemyT5qAnPCiRjsp2fcCdEDRyM7YEF3L/lttvGZx3pfSfpEj5Z
 AFqAa69pjhOCdpqbDmX6ypWBC28gNSp8qq6Irmsecd826Y4+S/4R+AWPuN07CyIXX+hr
 kzqJqxuvUMf/ruO93NoY8QP4cVClmgqUeVoANHK3svG3oDHhB/9RDFaCPipHScyViQ++
 5YMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V8vcT4YutXP/sUVywb1o6Lueba1AoRIlFBsljNK2Njg=;
 b=eZEoCQPaqEfkQTQNjEW1g1c0LGQsA28lH0Pz827Dr5ZaDW3tk433r5YlsxLau2XrT0
 J3S4YhYybUgpVrLU2ORf0VF6mh7ifTUz4qPiEMezUqiqXr1R9M6ayi21e+M5QeAfQT21
 VjFA6j3HQMBLKKSyrbbhuG5hDQkUSodSqXszSrjaz2IIxWJ8u+TJvs3cQNnjhz07xW0G
 HHRMMG7CPaq+y5qaiY8JHJ+CvfgHZwO/uyJBVXCVKam3//jJoPwaVacFBIDh0T30LT9w
 nLeYxYC54V/KzSKt4lvgpD8DZv3kEUlQwK0w84i5iw2JYUnmFS2mpdw4cw2nez1LBxom
 M1Yw==
X-Gm-Message-State: APjAAAWpWiBCoTbzzDn0NojPR5Yb5albglaZ5NGRYjFEmPDdVXBhtH2A
 RyiTE0ge1J884I5yGeFJ2cXdDihAlLkkm3SKBhM=
X-Google-Smtp-Source: APXvYqxhQhBDORo21vvjLKLPPdQ+QuNpuXzHFA0a22MbXlMEnaLFmBq4MjY0nHP/lhRg6Lnr43X9Ii91cHLINS6NrS4=
X-Received: by 2002:a6b:6e18:: with SMTP id d24mr12342010ioh.301.1580123618152; 
 Mon, 27 Jan 2020 03:13:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 27 Jan 2020 03:13:37
 -0800 (PST)
In-Reply-To: <emb3e01e23-7511-48c8-9229-85a767ab359c@andys-imac.leeshillfarm.local>
References: <CAA=hcWRQmXa4_hh3KzKmqeaEkGsbdTEimsPjh=tZWribMkM0dA@mail.gmail.com>
 <CAA=hcWRwi_EsMD2OBzVWtyX_SPJf05vqc09zhQzFdguKi0k=FA@mail.gmail.com>
 <emb3e01e23-7511-48c8-9229-85a767ab359c@andys-imac.leeshillfarm.local>
From: JH <jupiter.hce@gmail.com>
Date: Mon, 27 Jan 2020 22:13:37 +1100
Message-ID: <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
Subject: Re: [yocto] lost busybox mysteriously
To: Andy Pont <andy.pont@sdcsystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_031339_142323_82167A88 
X-CRM114-Status: GOOD (  16.27  )
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
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5keSwKClRoYW5rcyBmb3IgdGhlIHJlc3BvbnNlLgoKT24gMS8yNy8yMCwgQW5keSBQb250
IDxhbmR5LnBvbnRAc2Rjc3lzdGVtcy5jb20+IHdyb3RlOgo+IEpIIHdyb3RlLi4uCj4KPj5UaGF0
IHRoZSBzYW1lIHByb2JsZW0gb2YgbWlzc2luZyBidXN5Ym94IHdhcyBub3QganVzdCBvY2N1cnJl
ZCBkdXJpbmcKPj50aGUgZGV2aWNlIHJ1bm5pbmcgaW4gdGhlIG1pZGRsZSBvZiBvcGVyYXRpb24s
IGl0IHdhcyBhbHNvIG9jY3VycmVkCj4+ZHVyaW5nIGJvb3RpbmcgaW1hZ2UgZnJvbSBOQU5ELCBJ
IHNhdyBzZXZlcmFsIHRpbWVzIHRoYXQgdGhlIGZpcnN0IGFuZAo+PnNlY29uZCBjeWNsZXMgb2Yg
Ym9vdGluZyBpbWFnZSBmcm9tIE5BTkQgd2VyZSB3b3JraW5nIHdlbGwsIHRoZW4gc29tZQo+PmZv
bGxvd2luZyBib290aW5nIHByb2Nlc3Mgd291bGQgYmUgY3Jhc2hlZCBieSBtaXNzaW5nIGJ1c3li
b3gsIHRoZW4KPj5jb3VsZCBub3QgcnVuIHdob2xlIHNoZWxsIGNvbW1hbmRzLiBJIGhhdmUgYmVl
biBwb25kZXJpbmcgaWYgaXQgY291bGQKPj5iZSBjYXVzZWQgYnkgTkFORCBpc3N1ZSBvciBuZXR3
b3JrIHZpcnVzIC8gZmlzaHk/IEFwcHJlY2lhdGUgYW55Cj4+Y2x1ZXMuCj4gVGhlIGZpcnN0IHN0
ZXAgaXMgZm9yIHVzIHRvIHVuZGVyc3RhbmQgd2hhdCDigJxtaXNzaW5n4oCdIG1lYW5zPyAgSGF2
ZSB5b3UKPiBnb3QgYW55IG1lY2hhbmlzbSAoVS1Cb290LCBTRCBjYXJkIGJvb3QsIGV0Yy4pIHRo
YXQgd2lsbCBhbGxvdyB5b3UgdG8KPiBtb3VudCBhbmQgbG9vayBhdCB0aGUgY29udGVudHMgb2Yg
dGhlIE5BTkQgZmlsZSBzeXN0ZW0/CgpNZWFucyB0aGF0IGJ1c3lib3ggd2FzIG5vdCB0aGVyZSBh
bnltb3JlLCBpdCBteXN0ZXJpb3VzbHkgbG9zdCwgYWxsCnNoZWxsIGNvbW1hbmRzIHdvdWxkIG5v
IGxvbmdlciBhdmFpbGFibGUuIEl0IGNhbm5vdCB0byBydW4gbW91bnQgb3IKYW55IHNoZWxsIGNv
bW1hbmRzLiBUaGVyZSB3YXMgdHdvIHNjZW5hcmlvcyB3aGVuIHRoYXQgaGFwcGVuZWQ6CgotIElu
IHRoZSBtaWRkbGUgb2YgcnVubmluZywgdGhlIGRldmljZSBhbGwgb2YgY2VydGFpbiBjb3VsZCBu
b3QgcnVuCnNoZWxsIGNvbW1hbmRzIGFuZCBmYWlsZWQgbXlzdGVyaW91c2x5CgotIER1cmluZyB0
aGUgdS1ib290IGJvb3Rpbmcga2VybmVsIHByb2Nlc3MsIHRoZXJlIHdlcmUgZnVsbCBlcnJvcnMg
b2YKZmFpbGluZyBzaGVsbCBjb21tYW5kcy4gTGV0IG1lIG1ha2UgaXQgY2xlYXIsICB0aGF0IGJv
b3RpbmcgZXJyb3IgZGlkCm5vdCBvY2N1ciBpbiB0aGUgZmlyc3Qgb3Igc2Vjb25kIGtlcm5lbCBi
b290aW5nIGFmdGVyIHRoZSBuZXcgaW1hZ2UKaW5zdGFsbGF0aW9uLCBpdCBoYXBwZW5lZCBpbiB0
aGUgZm9sbG93aW5nIGtlcm5lbCBib290aW5nLCBidXQgdGhlcmUKd2FzIG5vdGhpbmcgdG8gZGVs
ZXRlIGJ1c3lib3ggYWNjaWRlbnRhbGx5LCBidXN5Ym94IHdhcyBqdXN0Cm15c3RlcmlvdXNseSBk
aXNhcHBlYXJlZC4gQmVjYXVzZSBJIGNvdWxkIG5vdCBydW4gbHMsIEkgZGlkIG5vdCBrbm93Cmlm
IHRoZXJlIGFyZSBvdGhlciB0aGluZ3MgbWlzc2luZy4gSWYgeW91IGFzayBob3cgSSBjb3VsZCBr
bm93IHRoZQpidXN5Ym94IHdhcyBtaXNzaW5nLCBJIHJhbiB0aGUgekltYWdlLWluaXRyYW1mcyB0
byBib290IHRoZSBsaW51eCBpbgpSQU0sIHRoZW4gbW91bnQgdGhlIHViaTAgdG8gZmluZCAgb3V0
IGJ1c3lib3ggd2FzIGdvbmUuCgoKPiBJZiB5b3UgbG9vayBhdCB0aGUgL2JpbiBkaXJlY3Rvcnkg
KGxzIC1sYSAvYmluL2J1c3kqKSB3aGF0IGRvIHlvdSBzZWU/Cj4gSGF2ZSB0aGUgZmlsZXMgYmVl
biBkZWxldGVkPyBUcnVuY2F0ZWQ/IFplcm8gbGVuZ3RoPwoKQ291bGQgbm90IHJ1biBscyBvciBh
bnkgc2hlbGwgY29tbWFuZHMgd2hlbiB0aGUgYnVzeWJveCB3YXMgbWlzc2luZy4KCj4gV2hhdCBm
aWxlIHN5c3RlbSBhcmUgeW91IHVzaW5nIG9uIHRoZSBOQU5EIGZsYXNoPyAgSG93IGFyZSB0aGUg
ZGV2aWNlcwo+IGJlaW5nIHJlc2V0IGR1cmluZyB0aGUgdmFyaW91cyBib290IGN5Y2xlcz8gIElm
IGl0IGlzIGEgaGFyZHdhcmUgcmVzZXQKPiB0aGVuIHNvbWUgZmlsZSBzeXN0ZW1zIGFyZSBsZXNz
IHJlc2lsaWVudCB0byBpdCB0aGFuIG90aGVycyBidXQgSSB3b3VsZAo+IGV4cGVjdCBpbiB0aGF0
IGNhc2UgbW9yZSBmdW5kYW1lbnRhbCBib290IGlzc3Vlcy4KClVCSUZTLCBtb3N0IGRldmljZSBy
ZXNldCBvciBib290IGN5Y2xlcyB3ZXJlIGNhbGxpbmcgaGFsdCBvciByZWJvb3QsCmJ1dCBpdCBz
b21ldGltZSBpdCBjb3VsZCBqdXN0IHVzZSBwb3dlciBjeWNsZS4KClRoYW5rIHlvdS4KCktpbmQg
cmVnYXJkcywKCi0gamgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
