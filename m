Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ACE60A260B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=INstyM4J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPAAGSzT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GK+knIe60Lymbydj79WTY0Eyr3YHxEjZ3FkftkBAfyU=; b=INstyM4JTITxD9RVcmkhFgH2Sv
	bwmvOt0QowgpMfqIMi9PGovY7lltP5m5B4FLDA3jZTZpX8N6hKzpKSTQtgUFXMrP1rgW9usORf/gS
	/6k+CSmyqN9UNfI3TpU8VDa1NFQIV8t+6XeT94Jm7ZI2Y2XhJN2Dn9V1ij3lEp8Xv8jFDlaWLTDSZ
	z7ozehCWVRmj5tP1+PupBX5KIiYud/EyxJs2dmDUZt1aPAImQx87+wi2niklUvR9O9eUyGKKJdtYr
	QrgF/YvzqXdEPP947AK71Zq5p5WTWYeMDoPjV9ICIQlFLEucbp7p2O144yW6CVWzzK0239bSUovXn
	NnyKwTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyYP-0000000BPZw-44PS;
	Thu, 19 Nov 2026 09:35:41 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyYN-0000000BPYa-0t4a
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:35:41 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-74ab99038afso1203954137.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 01:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795080938; cv=none;
        d=google.com; s=arc-20260327;
        b=nYULQDvGdMtnYvnk57ix4at6CW4hDX3oJ9JYuaYmJ+dHLrrQsc8pEaL8z72nE7ayv0
         TcOhBXhEFhO6VioaJEDGXx3kc6NVaNZ2BhS8OGf8Fr1s0OFeVwiWFTxxzOsXNgQmavD4
         GLOvN36IaFgiXKUnzNiNb8p0Y+vO5l/oqexny7wtryF3HKSHdvR7vEMM8HyX+Xr66yOO
         IHPFkOkqlAMfSUtsdnaAkY97aV4JLqf+kbhd08NY96GWYXFFhXBWthKwQSIqiPYlJXPr
         xmpU63+Ux59DJU1h1Gzd0IGZOLIg/YBn5x26UHQ5tkXhEMewgiO3471EDjfrPWvlfmww
         ufrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQ5drq+cXIVqaOh2ZOnKiQMvAcJvt7/Sbd1bQ0YgK38=;
        fh=sPZgObB2ag2sG1CcSFPa1mb3XaA3UeAyjudIcppH/Pw=;
        b=eyhamGXac5GigY5g2NbWaDFOq0QpBZCMNjcsdQI4sVdLP/yyqEOWqufVk7mjJ0620A
         l3vm5ZEyqr5ie/dLrfV3do+9vIYm0gRmi7+8E9/YuDQC4z/8Otj6nvvXxK2NV4Ek2qMe
         mfoP+RPUe0TG+bLRgFbDPHVOq1gNlplGSfZsfssXsIRp36NqdQ/EwhiDrYOyJAYzdASr
         TpTbKmgR90VOCRKPqP3CxBsDrMzmeVV7IICAU1tUAm1JBHiuTpSIb3SUtoD27lF007dP
         CNfWuR+uRTiL6iFaU2iQH9/DTAZ/w4Mro7k6fU32JKzWAMdeXGwR8HvrxdesD2wsH3Ua
         hOwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080938; x=1795685738; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQ5drq+cXIVqaOh2ZOnKiQMvAcJvt7/Sbd1bQ0YgK38=;
        b=zPAAGSzTqAXVC3KLsKgdN30SNCnoNIKhNw7gXzTTUOSbGNE1sTh857YvMjm+73MeOQ
         6CKYl0/NuS/XszdLuFEp9h8iBhqnXleRKVy4To1MZh4PrXIwLCKiLps4hFsfj5Dhl9DW
         lvlA7YyGrFzVyoYqswLVF2C9LWYZSgPpFhIiavM8OCEk6utw0OipZhr0fRlCKkw5Kx1r
         +/D2CvaMsNcck9YjR2+YhM45f0MwRSAIiAmSjRR0Vpg5d2M1RZhkiRhuBbKpQzX75f4K
         WxC/isMG2oVCdT/NfSa0+H/DCIsGwHscAP9XhTdm0GM7j/KZ6JRX+IlUwN1WWrNw1RJ4
         QusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080938; x=1795685738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQ5drq+cXIVqaOh2ZOnKiQMvAcJvt7/Sbd1bQ0YgK38=;
        b=A4WA8Eapi79ZW5rOgRjPODquHHDGT4hgGTUVdHOISbLxkYLezwM6i6FqE9OjwmPUWf
         +lkN2UpKYQLOMuIeHD5ir4Hvh5oktr0ePUZ7oNReSylSdtr8oKhFvXeGIJsMRJGmm2fs
         nEvQJAxtM5YsHsHAIzKNTzlCc7HH1ZfwE/kAQYfysdjianAyy/d0rXgh/CpACcD0bhua
         jqEdn0lPtgwyrfksRqvA8rqfMtyeGzYA64s9HNSy4H2tfVkZNL/Y2k/nizKw/5DzWDS3
         7E4GT25Yen0h1193DrxmebqAYwoNC/0D9dV7o+OSececd/VIl/a4w2ooLKWHkVVEf1KS
         y5Ww==
X-Forwarded-Encrypted: i=1; AL+hErFD9r/J1qxMhpcpx+N0hi2/TXTOpKlU+uPowQnqASbiwePmqYHRz8IpaVlhszzDxcbNfguc1/hhYKc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/kyfUEw5FNxthbS4VFxtdw8TgrY64CBmzePi5mqehDrdJNnNQL
	7e34UtG8A8m8VCS8VutDsN0WrSHBG1ywEoAVHOINm1mBj5SlzL9Kqs7SzlABoY/WDI4Tu8oQr5o
	W97DFyKhrWaATI7IepKnGuirZyGR8gD8=
X-Gm-Gg: AYBFou3tjLeksAUqXrbC83hF6UmVfdXJZXFciM/OP0ntYb+PtsqgRAE0Hhp6fvACKbT
	kq20RcEgZcuNToljo9vqKER7YtpN64UeaJrXx3cazqcgv3eBOYHJF3zEcpBZiq1RZ8Hk0P3Yfcu
	aKWbpBq+QLOO+25lvv+bF3lYoqAIwmlTfDiAFjsVnChT2FXIi1mqr4Q+afQ+gz3mI2v2EqM71f4
	/jB2njBcJk9YOsmVMrhGk92fPIY7LW6Fp369y3v9cmbBBEH58tGwA54ncFbhlEVDpn2SRcBysGR
	PSzgC+tPRAyS8Eu/Xpxfw6m8twqbdE1j5VALhD+wb6dLmSGcWBnkUO3rwG4kY2fTq+V3bmSLrUt
	yPO3qOPqz4UVu8tyrA9vXuxBGuxiWHTFWzaJS+XKHpAP+rDNP5AAwdM6OODO0vCZQBNmXl9nl3E
	vZqT0jSyFLY6J9hrYHcC9mxGHIV5RdzMxkisoWWZvO/cqxZWf7ubJFZ2HxO8j+Ba6CacyuOCxyB
	c0jdG6tjhAlChkWo5KqEOf8lfb0I+c=
X-Received: by 2002:a05:6102:2c8d:b0:7cc:22f0:830a with SMTP id
 ada2fe7eead31-7d6ba3e5b4fmr2201358137.8.1795080937706; Thu, 19 Nov 2026
 01:35:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
 <87fqwyjwvk.fsf@bootlin.com> <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
 <87ld6pfc75.fsf@bootlin.com>
In-Reply-To: <87ld6pfc75.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 02:35:26 -0700
X-Gm-Features: Aa3M54rC2lbm9zvZQ_bRZwrXSK6-7XBYP8YuUPFJyW9y45aSx0Pn8h9Thei6ZvU
Message-ID: <CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	"Artem B. Bityuckiy" <dedekind@infradead.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013539_262505_60A5CEBD 
X-CRM114-Status: GOOD (  37.44  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMTozOOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMTgvMTEvMjAyNiBhdCAxMjoxMToxOSAt
MDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gT24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMjo0NeKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMDMvMTEvMjAyNiBhdCAy
Mjo1MjozOSAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3
cm90ZToKPiA+Pgo+ID4+ID4gY3JlYXRlX2JidCgpIHJldHVybnMgYW4gZXJyb3IgaWYgcmVhZGlu
ZyBhIGJhZC1ibG9jayBtYXJrZXIgZmFpbHMsCj4gPj4KPiA+PiBUaGlzIHNlbnRlbmNlIGRvZXMg
bm90IG1lYW4gYW55dGhpbmcuCj4gPj4KPiA+PiA+IGJ1dAo+ID4+ID4gY2hlY2tfY3JlYXRlKCkg
aWdub3JlcyB0aGF0IHJlc3VsdC4gSXQgY2FuIGFzc2lnbiB2ZXJzaW9uIDEgdG8gdGhlCj4gPj4K
PiA+PiBUaGF0J3MgYWxzbyB1bmNsZWFyLgo+ID4KPiA+IEl0J3MganVzdCBzdGF0aW5nIHdoZXJl
IGFuIHVuY2hlY2tlZCByZXR1cm4gZXhpc3RzIGFsb25nIHdpdGggdGhlCj4gPiBwb3RlbnRpYWwg
Y29uc2VxdWVuY2VzIG9mIGNvbnRpbnVpbmcgd2l0aG91dCBjaGVja2luZyB0aGUgcmV0dXJuLgo+
ID4gQXQgbGVhc3QgdGhhdCB3YXMgaG93IEkgcmVhZCBpdC4KPiA+Cj4gPiBJcyB0aGlzIGNvbW1p
dCBtZXNzYWdlIHBocmFzaW5nL3N0eWxlIHdlaXJkIG9yIHNvbWV0aGluZz8KPgo+IFNlZSBqdXN0
IGJlbG93IG9uZSBleGFtcGxlOgo+Cj4gPj4gPiBpbmNvbXBsZXRlIFJBTSB0YWJsZSBhbmQgd3Jp
dGUgaXQgdG8gdGhlIHByaW1hcnkgYW5kIG1pcnJvcgo+ID4+bG9jYXRpb25zLgo+Cj4gInRoZSBw
cmltYXJ5IGFuZCBtaXJyb3IgbG9jYXRpb25zIiAtPiB0aGlzIGlzIGEgZGV0YWlsLCB0aGF0J3Mg
bm90IHdoYXQKPiBtYXR0ZXJzLgo+Cj4gPj4gPiBVbnNjYW5uZWQgZmFjdG9yeS1iYWQgYmxvY2tz
IHRoZW4gYXBwZWFyIGdvb2QgaW4gdGhlIHBlcnNpc3RlZAo+ID4+ID4gdGFibGVzLgo+ID4+Cj4g
Pj4gSGVyZSBpcyBhIHByb3Bvc2FsIHdoaWNoIEkgYmVsaWV2ZSBtYWtlcyBtb3JlIHNlbnNlOgo+
ID4+Cj4gPj4gbXRkOiByYXduYW5kOiBhYm9ydCBCQlQgY3JlYXRpb24gb24gc2NhbiBmYWlsdXJl
Cj4gPj4KPiA+PiBjcmVhdGVfYmJ0KCkgY2FuIGZhaWwgb24gYSBub24tRUNDIE9PQiByZWFkIGVy
cm9yLCBsZWF2aW5nIHRoZSBSQU0gQkJUCj4gPj4gcGFydGlhbGx5IHBvcHVsYXRlZC4gSXQgaXMg
cHJlZmVyYWJsZSB0byBiYWlsIG91dCBlYXJseSByYXRoZXIgdGhhbiBidW1wCj4gPj4gdGhlIHRh
YmxlIHZlcnNpb25zIGFuZCB3cml0ZSBpbmNvbXBsZXRlIHByaW1hcnkgYW5kIG1pcnJvciB0YWJs
ZXMsIHdoaWNoCj4gPj4gd291bGQgbWFyayB0aGUgdW5zY2FubmVkIGZhY3RvcnktYmFkIGJsb2Nr
cyBhcyBnb29kLgo+ID4KPiA+IFBlcnNvbmFsbHkgSSB0cnkgdG8gYXZvaWQgdGVybWlub2xvZ3kg
bGlrZSAicHJlZmVyYWJsZSIgd2hlbgo+ID4gZGVzY3JpYmluZwo+Cj4gWWVzLCBmaW5lLgo+Cj4g
PiBjb2RlIGJlaGF2aW9yIHRoYXQncyBjbGVhcmx5IHdyb25nLCBhcyAicHJlZmVyYWJsZSIgdG8g
bWUgYXQgbGVhc3Qgd2Vha2x5Cj4gPiBpbXBsaWVzIHRoYXQgdGhlIGNvZGUgaXNzdWUgYmVpbmcg
Zml4ZWQgY291bGQgYmUgbW9yZSBvZiBhIHN0eWxlIGlzc3VlCj4gPiByYXRoZXIgdGhhbiBhIGNv
cnJlY3RuZXNzIGlzc3VlLgo+ID4KPiA+IFRvIG1lIGJvdGggY29tbWl0IG1lc3NhZ2VzIHNlZW0g
dG8gYmUgZXF1YWxseSB1bmRlcnN0YW5kYWJsZS4KPiA+Cj4gPj4KPiA+PiA+IFByb3BhZ2F0ZSB0
aGUgc2NhbiBmYWlsdXJlIGJlZm9yZSBjaGFuZ2luZyB0YWJsZSB2ZXJzaW9ucyBvciB3cml0aW5n
Cj4gPj4gPiBlaXRoZXIgY29weS4gS2VlcCBleHBsaWNpdCBOQU5EX0JCVF9DUkVBVEVfRU1QVFkg
aW5pdGlhbGl6YXRpb24gdW5jaGFuZ2VkLgo+ID4+ID4KPiA+PiA+IEZpeGVzOiBlZWFkYTI0ZGE4
YmQgKCJbTVREXSBOQU5EOiBSZWFkIG9ubHkgT09CIGJ5dGVzIGR1cmluZyBiYWQgYmxvY2sgc2Nh
biIpCj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4KPiA+Pgo+ID4+IEkgd291bGQgcHJlZmVyIGlmIHlvdSBjb3VsZCB3cml0ZSB5
b3VyIG93biBjb21taXQgbG9ncywgZ2l2aW5nIHVzIG1vcmUKPiA+PiBjb25maWRlbmNlIG9uIHRo
ZSB3b3JrIHRoYXQgaGFzIGJlZW4gYXNrZWQuIFlvdSBjYW4gdXNlIGFuIExMTSB0bwo+ID4+IGlt
cHJvdmUvZW5oYW5jZSBpdCBvYnZpb3VzbHkuCj4gPgo+ID4gVG8gYmUgaG9uZXN0IEkndmUgbmV2
ZXIgYmVlbiBncmVhdCBhdCB3cml0aW5nIGNvbW1pdCBtZXNzYWdlcyBpbgo+ID4gZ2VuZXJhbCBh
bmQgaGF2ZSBnb3R0ZW4gYSBsb3QgbW9yZSBjb21wbGFpbnRzIGFib3V0IGNvbW1pdCBtZXNzYWdl
cwo+ID4gbWlzc2luZyBpbXBvcnRhbnQgZGV0YWlscyBwcmlvciB0byB1c2luZyBMTE0ncy4gSSBj
YW4gYmFyZWx5IHRlbGwgdGhlCj4KPiBGb3IgbWUgdGhlIGNvZGUgaXMgZ2V0dGluZyBiZXR0ZXIg
YnV0IHRoZSBjb21taXQgbG9ncyBhcmUgdW5jbGVhci4gU29tZQo+IGRldGFpbHMgd2hpY2ggZG9u
J3QgbmVlZCAoaW1vKSB0byBiZSB3cml0dGVuIGFyZSB0aGVyZSwgYW5kIHRoZSBiaWcKPiBwaWN0
dXJlIGlzIG9mdGVuIG1pc3Npbmcgb3Igbm90IGNsZWFybHkgc3RhdGVkIGJlZm9yZSB0aGUgZGV0
YWlscy4KPgo+IERvbid0IGdldCBtZSB3cm9uZywgdXNpbmcgYW4gTExNIHRvIHJlZmluZS9yZXdv
cmQvcmVvcmdhbml6ZSBpcyBmaW5lLAo+IGJ1dCBsZXR0aW5nIHRoZSBMTE0gd3JpdGUgaXQgZW50
aXJlbHkgaXMgbm90IHdvcmtpbmcgd2VsbC4KCkkgZ3Vlc3MgdGhlIGlzc3VlIGlzIHRoYXQgSSBv
ZnRlbiBkb24ndCBoYXZlIHRoZSBiZXN0IHVuZGVyc3RhbmRpbmcKb2Ygd2hhdCB0aGUgYmlnIHBp
Y3R1cmUgdGhhdCBuZWVkcyBleHBsYW5hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2VzCmlzIHNv
bWUgb2YgdGhlIHRpbWUsIGlmIEkgZGlkIHRoZW4gSSB3b3VsZCB0aGVuIGp1c3QgaW5zdHJ1Y3Qg
dGhlIExMTSB0bwptYWtlIHRob3NlIGVkaXRzIHdoZW5ldmVyIEkgcmV2aWV3IHBhdGNoZXMgYmVm
b3JlIHNlbmRpbmcgdGhlbS4KCkkgdGhpbmsgSSBqdXN0IGRvbid0IGhhdmUgZ29vZCBpbnR1aXRp
b24gd2hlbiBpdCBjb21lcyB0byBwcmVkaWN0aW5nIHdoYXQgaXMKaW1wb3J0YW50IHRvIGV4cGxh
aW4gaW4gY29tbWl0IG1lc3NhZ2VzLgoKPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
