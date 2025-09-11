Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4737CAC587
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRuz+v0PdUTiR67HDzgiLFH3hrjNY3MrwU0a7+N1PYY=; b=gZd8g5ocdB4gAb
	bBOipNibpA92Q1yFny1ItE0RiXNiy9cw0firYtVP5QcxeufAg61duWX1Pj2d0Yq5g7mM7YZusc7Bm
	2oAeq2azPb2BS8KdViVdM+LUu1DLf+wlNUFrhXsTW1sFI2Cnl3aNvOQCBOYVfTc5AWC1YHtJCfDUc
	LS4FvMnfQyCAsq3V8xCgz+/f7tGlAiPhoUYAb10m4OkSHGwrK9we2POMzMIiMKA1tNncwRdyDT11t
	IbaRsTA/mdqwhjiBMr8KiZkUdrhgSGGZjAHoycBtpoF5FjZbo19qTMhnPfyhY0U1EuZxXOqM6mgOD
	44aRB9tOgqxj59Avuijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbiX-00000001Tej-3RQf;
	Thu, 11 Sep 2025 07:27:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbiV-00000001TdY-1AKH
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 07:27:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7725de6b57dso516866b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2025 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757575658; x=1758180458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IxiYNCciyhdbcX0Wp57UVsdWd/rQlfFnyOYCGJ7WZc=;
        b=ITrLhZmU7SA+WQ9kN1bO9neZPif45QqL6t96AOy9IXDPnzOKShvlHJDZy1RBne7HXC
         1ConmiTdy2CFczkwDvb+ff/zGDpd9YUz3vNcyfP5I5Oe3KFdiw01IjtVq3yazQ8L2nST
         PULI2Mi/1XJu30sRmNcd58Yy5iWsiYQu/ijAf4WjgV5iZNN/53JWekkJW9ocX39taQDJ
         3HeTx2PViEpDWcB1Rsr5O9nCXdOaLDnQdpAUrNtfhLqTFcgnW6bZiS+xU0bTn1E8yVPa
         I/xp0pXvnKLH4CQuI6zx3qliXfULr+Pr3LuWbLCSqIA7PJB+i2lZq7qm3vfblcWtpR7O
         ufOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757575658; x=1758180458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IxiYNCciyhdbcX0Wp57UVsdWd/rQlfFnyOYCGJ7WZc=;
        b=Coe88h/ed7y3q0CswmsnoBC5Reb1aQRJXt2Q4HGVOuKJoFPuyU56pyoqV3f7Fr4Qte
         VBlz5Qn5r8HqYLxjJJidn/+fJwXR2APjiIdcZZF75NOpMMAh8kMKcczyefic2DHV2akx
         Rdcs875i3Yq2SguluD9OSXfcjOVbL9WfwSh9GiRGQYTHxJVB8aKFNrSJSTDzvnnlj8iB
         Ex/CVBl7RNafU35e3AUEwrWT8ikFw3fXaYnCsxrbzIFaaWAce4LkYd4PndMEnUSQnwzd
         koV1Jti2E6LfSES2gcTmGLHvBFE9+zfR9HpzcYl1guBW1dsMrxtPoiBN/aOHn6TwRvua
         MovA==
X-Forwarded-Encrypted: i=1; AJvYcCWUPn8bi8jhYQcN0wTjFelwmagecpsq+SVdhYcLgG6peJLwo58nPov+LHO7n7PhhXnSeiffisrDN14=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTcUGFqS78JVaI0lNd5RPGUsYoCmoKtudMCdo0y66aKKalk7iY
	48ucJ2h4A5ivnViLhH7FPeMvFdfduaIjUu41EjlLZ2BrEU/ILSqINozC5N3T/OSb2SHsRBJ+Ao/
	qei39h4zWgs5hyxD0k8jSrPODbFMfPcw=
X-Gm-Gg: ASbGnct8h4OLxDV2teHkJOBqh2AqGciZmGTB4y/j4UUPC20pSC9oxkPbynbWPiWCdpI
	O7ipTYF+8aSn7iqwHePYLaX+VBDfL/SNeUr9oRs9MmLGfmCScmvD/H7AhSx+/FHYkRWRXvU+ci3
	eZ43l0gtGNfzFGaJ0/Mbyt2Q1393dlHhYUX+1guvkGhCjfMJlYXusR1MwLcNVz5Cp3XldjrsRCn
	czTxSttkChdF7crAcUk7NUdCm9mlwcePZqOgZYFZv4Mz6itSoEhDjOILbq27aG/NHQHuu3+7FQe
	BnJWfw==
X-Google-Smtp-Source: AGHT+IEK3FOFAc8CqBrE58Q0X7qAvx6ovvpjHhcP/WLfd4cTYoJu3yF9/cNaQzZZzEySVQZ/WcetUbyqA5DJPZOt0Ts=
X-Received: by 2002:a05:6a21:8906:b0:254:b352:64a9 with SMTP id
 adf61e73a8af0-254b380a9b4mr20835704637.21.1757575658285; Thu, 11 Sep 2025
 00:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250910030301.1368372-1-linchengming884@gmail.com>
 <20250910030301.1368372-2-linchengming884@gmail.com> <87wm66d67k.fsf@bootlin.com>
In-Reply-To: <87wm66d67k.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 11 Sep 2025 15:24:35 +0800
X-Gm-Features: Ac12FXxQbMqgBdhf8vRv10u0KG0v6L4LrQmY9Oat7o2VyF5BcMBJZNy0FdPHeho
Message-ID: <CAAyq3SbXiPUjZE7OCAe1=uw4h82bFN7DSU4bLx1dhKe_XFtu=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add
 enable-randomizer-otp property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tudor.ambarus@linaro.org, mmkurbanov@salutedevices.com, 
	Takahiro.Kuwano@infineon.com, pratyush@kernel.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_002739_324164_FC4ECC59 
X-CRM114-Status: GOOD (  30.80  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQ55pyIMTDml6Ug6YCx5LiJIOS4i+WNiDU6MTDlr6vpgZPvvJoKPgo+IEhlbGxvIENo
ZW5nIE1pbmcsCj4KPiBPbiAxMC8wOS8yMDI1IGF0IDExOjAyOjU5ICswOCwgQ2hlbmcgTWluZyBM
aW4gPGxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGcm9tOiBDaGVuZyBN
aW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IEFkZCBhIG5ldyBib29s
ZWFuIHByb3BlcnR5ICJlbmFibGUtcmFuZG9taXplci1vdHAiIHRvIGVuYWJsZSB0aGUKPiA+IHJh
bmRvbWl6ZXIgZmVhdHVyZSBvbiBzdXBwb3J0ZWQgU1BJLU5BTkQgZGV2aWNlcy4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+
ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFu
ZC55YW1sIHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Nw
aS1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1u
YW5kLnlhbWwKPiA+IGluZGV4IDc3YTg3MjdjNy4uNDMyYmM3OWU5IDEwMDY0NAo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC55YW1sCj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnlhbWwK
PiA+IEBAIC0yMSw2ICsyMSwxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICBkZXNjcmlwdGlvbjog
RW5jb2RlIHRoZSBjaGlwLXNlbGVjdCBsaW5lIG9uIHRoZSBTUEkgYnVzCj4gPiAgICAgIG1heEl0
ZW1zOiAxCj4gPgo+ID4gKyAgZW5hYmxlLXJhbmRvbWl6ZXItb3RwOgo+Cj4gVGhpcyBpcyBhIE5B
TkQgd2lkZSBmZWF0dXJlLCBzbyB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIGEgcHJlZml4LCBzdWNo
IGFzCj4gIm5hbmQsIi4KPgo+IE5vdywgd2hhdCBhYm91dCB0aGlzICJvdHAiIHN1ZmZpeD8gTWFu
eSAoaWYgbm90IGFsbCkgY2hpcHMgaGF2ZSBhCj4gdm9sYXRpbGUgc2V0dGluZyBmb3IgdGhhdC4g
QWJvdXQgdGhlIG5hbWluZywgIm90cCIgb2Z0ZW4gcmVmbGVjdHMgdG8gdGhlCj4gT1RQIGFyZWEs
IHdoaWNoIGlzIG5vdCB3aGF0IHlvdSBpbXBseSBoZXJlLCBhcyB5b3Ugd2FudCB0byBpbnNpc3QK
PiAocmlnaHRmdWxseSkgb24gdGhlIGZhY3QgdGhhdCB0aGlzIGZlYXR1cmUgY2Fubm90IGJlIGRp
c2FibGVkLgoKWWVzLCBteSBpbnRlbnRpb24gaXMgdGhhdCBvbmNlIHRoZSByYW5kb21pemVyIGZl
YXR1cmUgaXMgZW5hYmxlZCwgaXQKc2hvdWxkIG5vdCBiZSBkaXNhYmxlZCBhZ2Fpbi4gWW91IGFy
ZSBjb3JyZWN0IHRoYXQgdGhpcyBiaXQgZG9lcyBub3QKYmVsb25nIHRvIHRoZSBPVFAgYXJlYSwg
YnV0IHJhdGhlciB0byB0aGUgdjIgdm9sYXRpbGUgcmVnaXN0ZXIuIFRoZSB2Mgp2b2xhdGlsZSBy
ZWdpc3RlciBoYXMgYSBkZWZhdWx0IHZhbHVlIHRoYXQgY2FuIGJlIGNoYW5nZWQgdGhyb3VnaCBh
CnNwZWNpYWwgT1RQIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgcHJvZ3JhbSBvcGVyYXRpb24uIFJl
Z2FyZGluZyB0aGUKIm90cCIgc3VmZml4LCBJIHdpbGwgcmVtb3ZlIGl0IHRvIGF2b2lkIG1pc3Vu
ZGVyc3RhbmRpbmcuCgo+Cj4gQWxzbywgdGhpcyBpcyBhIHBlci1jaGlwIGNvbmZpZ3VyYXRpb24s
IHdoaWxlIEkgd291bGQgaGF2ZSB3ZWxjb21lZCBhCj4gcGVyLXBhcnRpdGlvbiBjb25maWd1cmF0
aW9uLiBJIGNhbiBlYXNpbHkgaW1hZ2luZSB0d28gY2FzZXM6Cj4KPiAtIFRoZSBib290IFJPTSwg
Zm9yIGxvbmdldml0eSBwdXJwb3NlcywgZXhwZWN0cyB0aGUgZmlyc3QgYmxvY2tzCj4gICBjb250
YWluaW5nIHRoZSBib290bG9hZGVyIHRvIGJlIHNjcmFtYmxlZC4gSG93ZXZlciB0aGUgcmVzdCBv
ZiB0aGUKPiAgIHN5c3RlbSBkb2VzIG5vdCByZWFsbHkgY2FyZSBhbmQgZGlzYWJsZXMgcmFuZG9t
aXphdGlvbi4KPgo+IC0gVGhlIGJvb3QgUk9NIGlzIG5vdCBjYXBhYmxlIG9mIGRlLXNjcmFtYmxp
bmcsIGhvd2V2ZXIgdGhlIHJlc3Qgb2YgdGhlCj4gICBzeXN0ZW0gcmVsaWVzIG9uIHRoZSAocHJv
YmFibHkpIG1vcmUgcm9idXN0IHNjcmFtYmxpbmcgZmVhdHVyZS4KPgo+IEluIGJvdGggY2FzZXMg
YSBjaGlwIHdpZGUgdmFyaWFibGUgaXMgbm90IHJlbGV2YW50LgoKVGhlIHNjcmFtYmxpbmcgYW5k
IGRlc2NyYW1ibGluZyBhcmUgaGFuZGxlZCBieSB0aGUgTkFORCBmbGFzaCBoYXJkd2FyZQppdHNl
bGYuIFRoZXJlZm9yZSwgdGhlIGJvb3QgUk9NIGRvZXMgbm90IG5lZWQgdG8gc3VwcG9ydCBhIGRl
c2NyYW1ibGluZwpmZWF0dXJlLgoKSW4gdGhlIGNhc2Ugb2YgTWFjcm9uaXggcGFydHMsIHRoZSBy
YW5kb21pemVyIGlzIGNvbnRyb2xsZWQgdGhyb3VnaCBhCmNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIs
IGFuZCBvbmNlIGl0IGlzIGVuYWJsZWQgaXQgY292ZXJzIHRoZSBlbnRpcmUgY2hpcAoobWFpbiBh
bmQvb3Igc3BhcmUgZGVwZW5kaW5nIG9uIHRoZSByYW5kb3B0IGJpdCkuIFRoZXJlIGlzIG5vIGhh
cmR3YXJlCm1lY2hhbmlzbSB0byBlbmFibGUgaXQgb25seSBvbiBjZXJ0YWluIHJhbmdlcy4KCj4K
PiBUaGUgZmFjdCB0aGF0IGl0IGlzIGEgb25lLXRpbWUgZmVhdHVyZSBtYWtlcyBpdCBldmVuIGhh
cmRlciB0byBmaXQgaW50bwo+IHNvbWV0aGluZyBnZW5lcmljLgo+CgpUaGlzIGlzbid0IGEgdHJ1
ZSBvbmUtdGltZSBwcm9ncmFtbWluZyBmZWF0dXJlLiBJdHMgZGVmYXVsdCB2YWx1ZSBjYW4gYmUK
Y2hhbmdlZCB0aHJvdWdoIGEgc3BlY2lmaWMgcHJvY2VkdXJlLgoKUGxlYXNlIHJlZmVyIHRvIHBh
Z2UgMjkgYW5kIHBhZ2UgNTEgb2YgdGhlIGRhdGFzaGVldCBmb3Igc3BlY2lmaWMKcHJvY2VkdXJl
IGFuZCBkZXRhaWxzLgpMaW5rOiBodHRwczovL3d3dy5teGljLmNvbS50dy9MaXN0cy9EYXRhc2hl
ZXQvQXR0YWNobWVudHMvOTAzNi9NWDM1TEY0RzI0QUQsJTIwM1YsJTIwNEdiLCUyMHYxLjQucGRm
Cgo+IEhvdyBkbyB5b3UgdGhpbmsgdGhlc2UgY29uc3RyYWludHMgY291bGQgZml0IHdpdGggeW91
ciBuZWVkcz8gQ2FuIHlvdQo+IHBsZWFzZSBleHBsYWluIGFnYWluIChzb3JyeSBmb3IgdGhlIHJl
cGV0aXRpb24pIHdoYXQgTWFjcm9uaXggY2hpcHMgaGF2ZQo+IHRoZSB2b2xhdGlsZSBjYXBhYmls
aXR5IGFuZCB3aGljaCBvbmVzIGRvIG5vdD8KCk1hY3Jvbml4IGNoaXBzIHRoYXQgc3VwcG9ydCB0
aGUgcmFuZG9taXplciBmZWF0dXJlIGFyZSBWMiB0eXBlIHJlZ2lzdGVycy4KCj4KPiBUaGFua3Ms
Cj4gTWlxdcOobAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
