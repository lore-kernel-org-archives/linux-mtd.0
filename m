Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7E7C25B48
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liuhZNOQZGMfG0gWni2ZN0Dca7cIuDFVDPgW6VNcP1k=; b=C2N9ZmMSkTbB6+
	QW/f6roxIGakldAh7nibxCUF5OwSnGNRsUT59aS/lmRG9gF1KMD/pTdZSYPQJP60vecCQSUtPV7cx
	2ljP/FeKxDYoUiqUyJ7AtbhSuYczZCLvkeYFz/jjyje5KeRgqBQv3iIDOYHuE0tMnxOzDplEKkWjx
	2Fvor3nlo5l89LopXvXTg/UawNmWR5dS/n7UeAfdXNvSc4uSibnw3B/8Po3NreN8mnpp/gYeRgdxP
	aL9u77z9fJhwuCv+mUumx/Q0oBKvWh+vPenT1StSd0qB1kUPvPMZ1LEJ2BoFc8pzQ1M20QcWkMZHx
	hEL3ms1PnLcTtX68jtFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxIq-00E8Sn-1I;
	Thu, 26 Oct 2023 10:09:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxIn-00E8RO-08
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 10:09:23 +0000
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 59CAD406D3
	for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698314953;
	bh=yVpX8CL6o5DmvaeUJSfyJmDacrR2aNsv8UsIqu8d7TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Y3f0h2mI2OvgQMPBdPRuuam1GxzmDEZIpbxJQwqINz49LpESoE04vWit/yb305Zpr
	 jPphAsc3c8KvL6UPbwxxrEgrk77E9goReLP8xQ++abqOgCqlezYXs34vXEsDLSgkWy
	 6or0IVUxn2ce/8OWYU/VjW8ll1s02g0bioggg4xUv3Jg94yLXLBcKDZucD7THACZrZ
	 ESL89IwIB5K3p9IbhqIIP8cN34RFEOpSZmSqlH3uGmKwJ+1oc266BjB1O5vHsD6unG
	 HYRJly2Tu0teXzLUvPn6zozZVPFDq1/3JBxPn/uIONsdfIBRgtArzTrS4swRPHnCfh
	 kgHCI3R69t/Hw==
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-da07b5e6f75so1621307276.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 03:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698314948; x=1698919748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVpX8CL6o5DmvaeUJSfyJmDacrR2aNsv8UsIqu8d7TU=;
        b=Err21Ui+xZMnx+C0yhBFUiT545DWRcuRrJsPHAkYtN1T2SnZlDsUzA3mOHOOA8zJDT
         ScO0u4C266niGDtqAhmwlRSzoRz+jvAfilFqjUVesx5g/BpR284QWBHQAESuX27KMDee
         cTUI/2ZN1ulnZgVn/zKGAdkIoHwYidjCeQLAE0xgjTvAHZlxhp1jYPv9O5YgRIMZsKjy
         QDzN4mSuSDMRTbHBAzOTyTIgkC6Z7xFLJoTUndsjl7cnyzhQ4OdK0xOM7toEzpjXY96Z
         XPUk4JAFv3clxkQTMFEDiAvB1DoDjdnn/mflMTBMp65LPozQjFhDHXUCNoY7Rc2xWdf+
         UC2A==
X-Gm-Message-State: AOJu0YwMCV24a25PWxDHHMNvaA0eXS6CpSfC+1x7bfIiQEZ5UC8ov1DK
	F8JA9Plz0RIoqErPw554kQsJaRBJHlywXqBVF6TsuiYfSbQfMQDb/iglP7OsCQNm74MzimGrWpE
	BG5/dK3EhtlVzHnTTZyLFOtnpUE06fAfqUIWXeaJNlVbiabvAS8qXlrXZTpeLLI65rb2ufA==
X-Received: by 2002:a25:41d2:0:b0:d9c:fdc7:632c with SMTP id o201-20020a2541d2000000b00d9cfdc7632cmr3466417yba.21.1698314947948;
        Thu, 26 Oct 2023 03:09:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIDb847ZCAjDIAVlTecREh4iwiNarhki3PIESweqv0q4Yk66ziCj26/rqPI+wOUsEiCv70OWqm4zHNn7CYYtM=
X-Received: by 2002:a25:41d2:0:b0:d9c:fdc7:632c with SMTP id
 o201-20020a2541d2000000b00d9cfdc7632cmr3466396yba.21.1698314947647; Thu, 26
 Oct 2023 03:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231026012017.518610-1-acelan.kao@canonical.com> <F56F4D7D-1264-41E1-9CE7-5DA410A22D73@walle.cc>
In-Reply-To: <F56F4D7D-1264-41E1-9CE7-5DA410A22D73@walle.cc>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 26 Oct 2023 18:08:54 +0800
Message-ID: <CAFv23QmHvvib=E3RPtGXN-jAT9dXuZ6_-62xy0OjBYGRmrFPwg@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Improve reporting for software reset failures
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_030921_227928_40DC16C1 
X-CRM114-Status: GOOD (  23.91  )
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

TWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4g5pa8IDIwMjPlubQxMOaciDI25pelIOmA
seWbmyDkuIvljYgyOjI45a+r6YGT77yaCj4KPiBBbSAyNi4gT2t0b2JlciAyMDIzIDA0OjIwOjE3
IE9FU1ogc2NocmllYiBBY2VMYW4gS2FvIDxhY2VsYW4ua2FvQGNhbm9uaWNhbC5jb20+Ogo+ID5G
cm9tOiAiQ2hpYS1MaW4gS2FvIChBY2VMYW4pIiA8YWNlbGFuLmthb0BjYW5vbmljYWwuY29tPgo+
ID4KPiA+V2hlbiB0aGUgc29mdHdhcmUgcmVzZXQgY29tbWFuZCBpc24ndCBzdXBwb3J0ZWQsIHdl
IG5vdyByZXBvcnQgaXQKPiA+YXMgYW4gaW5mb3JtYXRpb25hbCBtZXNzYWdlKGRldl9pbmZvKSBp
bnN0ZWFkIG9mIGEgd2FybmluZyhkZXZfd2FybikuCj4gPlRoaXMgYWRqdXN0bWVudCBoZWxwcyBh
dm9pZCB1bm5lY2Vzc2FyeSBhbGFybSBhbmQgY29uZnVzaW9uIHJlZ2FyZGluZwo+ID5zb2Z0d2Fy
ZSByZXNldCBjYXBhYmlsaXRpZXMuCj4gPgo+ID5TaWduZWQtb2ZmLWJ5OiBDaGlhLUxpbiBLYW8g
KEFjZUxhbikgPGFjZWxhbi5rYW9AY2Fub25pY2FsLmNvbT4KPgo+IE5BSy4gWW91IHN1cmVseSBt
aXNzZWQgbXkgY29tbWVudHMgb24gdGhlIHByZXZpb3VzIHZlcnNpb24uCgpIaSBNaWNoYWVsLAoK
SXQncyBzdHJhbmdlIHRoYXQgSSBkaWRuJ3QgcmVjZWl2ZSB5b3VyIGZpcnN0IHJlcGx5LCBhbmQg
SSBqdXN0CmNoZWNrZWQgaXQgZnJvbSB3ZWIgYXJjaGl2ZVsxXS4KSSBxdW90ZSB5b3VyIG9waW5p
b25zIGFuZCByZXBseSB0aGVtIGJlbG93LgoKPiBJdCBib3RoZXJzIG1lIHRoYXQgd2UgdXNlIEVO
T1RTVVBQIGhlcmUuIFdlIHNob3VsZCByZWFsbHkgdXNlCj4KPiBFT1BOT1RTVVBQLgo+IFRoZSBj
b3JlIHVzZXMgRU9QTk9UU1VQUCBldmVyeXdoZXJlIGV4Y2VwdCBmb3IgdGhlIGludGVsIHRoaW5n
cy4KPgo+IFBsZWFzZSBoYXZlIGEgbG9vayBhdCBjaGFuZ2luZyB0aGF0IHRvIEVPUE5PVFNVUFAu
IFNlZSBhbHNvOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC84NWY5YzQ2Mi1j
MTU1LWRjMTctZGM5Ny0zMjU0YWNmYTU1ZDJAbWljcm9jaGlwLmNvbS8KWWVzLCB0aGlzIGhhcyBi
ZWVuIGRvbmUgaW4gdjMKCj4gSSdtIG5vdCBzdXJlIHRoaXMgaXMgaGVscGZ1bC4gSXQncyBvbmx5
IHRoZSBpbnRlbCBTUEkgY29udHJvbGxlciB3aGljaAo+IGRvZXMgbWFnaWMgdGhpbmdzIChpbnN0
ZWFkIG9mIGp1c3QgaXNzdWluZyBvdXIgY29tbWFuZHMpLiBNaWthLCBkbyB5b3UKPiBrbm93IHdl
dGhlciB5b3VyIGNvbnRyb2xsZXIgd2lsbCBkbyBhIHJlc2V0IG9uIGl0J3Mgb3duPyBJIHByZXN1
bWUgc28sCj4gYmVjYXVzZSBBRkFJUiB5b3UgaGF2ZSBzb21lIGtpbmQgb2YgaGlnaCBsZXZlbCBj
b250cm9sbGVyIHdoaWNoIGFsc28KPiBkb2VzCj4gU0ZEUCBwYXJzaW5nIGFuZCByZWFkIG9wY29k
ZSBoYW5kbGluZyBvbiB0aGVpciBvd24uCk1pa2EncyByZXBsaWVkIHlvdSwKYW5kIEkgdGhpbmsg
ZXZlbiBpZiBpbnRlbCBTUEkgY29udHJvbGxlciBkbyB0aGUgbWFnaWMgdGhpbmdzLCB0aGUKZXJy
b3IgbWVzc2FnZSBpcyBzdGlsbCBhbm5veWluZy4KCj4gSSdkIGxlYXZlIHRoYXQgYXMgaXMsIGJl
Y2F1c2UgaG93IGFyZSB0aGUgY2hhbmNlcyB0aGF0IHRoZSBmaXJzdCBvbmUgaXMKPiBzdXBwb3J0
ZWQgYW5kIHRoZSBzZWNvbmQgY29tbWFuZCwgaXNuJ3Q/Cj4gV2hlbiB3b3JraW5nIHdpdGggdGhl
IGludGVsIGNvbnRyb2xsZXIsIHdlJ2xsIHJldHVybiBlYXJseSBhZnRlciB0aGUKPiBmaXJzdCBz
cGlfbWVtX2V4ZWNfb3AoKS4KWWVzLCB0aGlzIGhhcyBiZWVuIGRvbmUgaW4gdjMuCgpBbmQgdGhl
biBJIGNoZWNrZWQgYWdhaW4gYW5kIGZvdW5kIHlvdSBoYXZlIHJlcGxpZWRbMl0gdGhlIHYzIHBh
dGNoCmFuZCBJIHN0aWxsIGRpZG4ndCByZWNldmllIHRoYXQgb25lLCB0b28uCk5vdyBJIGdvdCB5
b3VyIHBvaW50LCB3aWxsIHJldmlzZSBteSBwYXRjaCBhbmQgc3VibWl0IHY1IHNvb24uClRoYW5r
cy4KCjEuIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzEwMjQwNzQzMzIuNDYyNzQx
LTEtYWNlbGFuLmthb0BjYW5vbmljYWwuY29tL1QvI203ZTVlNzg3MjE1MWE5MTNkNWZlMjc0ZmMy
MGI3OTgxYmQxMGRkMDlmCjIuIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzEwMjUw
MzA1MDEuNDkwMzU1LTEtYWNlbGFuLmthb0BjYW5vbmljYWwuY29tL1QvI3UKPgo+IC1taWNoYWVs
Cj4KPiA+LS0tCj4gPnYyLiBvbmx5IGxvd2VyIHRoZSBwcmlvcml0eSBmb3IgdGhlIG5vdCBzdXBw
b3J0ZWQgZmFpbHVyZQo+ID52My4gcmVwbGFjZSBFTk9UU1VQUCB3aXRoIEVPUE5PVFNVUFAgYW5k
IGNoZWNrIHRoZSBmaXJzdCBjb21tYW5kIG9ubHkKPiA+djQuIG1vdmUgdGhlIHZlcnNpb24gaW5m
b3JtYXRpb24gYmVsb3cgdGhlICctLS0nIGxpbmUKPiA+LS0tCj4gPiBkcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYyB8IDUgKysrKy0KPiA+IGRyaXZlcnMvc3BpL3NwaS1tZW0uYyAgICAgIHwgMiAr
LQo+ID4gMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Pgo+ID5kaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210
ZC9zcGktbm9yL2NvcmUuYwo+ID5pbmRleCAxYjBjNjc3MGMxNGUuLjQyZTUyYWY3NjI4OSAxMDA2
NDQKPiA+LS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+KysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMKPiA+QEAgLTMyNTIsNyArMzI1MiwxMCBAQCBzdGF0aWMgdm9pZCBz
cGlfbm9yX3NvZnRfcmVzZXQoc3RydWN0IHNwaV9ub3IgKm5vcikKPiA+Cj4gPiAgICAgICByZXQg
PSBzcGlfbWVtX2V4ZWNfb3Aobm9yLT5zcGltZW0sICZvcCk7Cj4gPiAgICAgICBpZiAocmV0KSB7
Cj4gPi0gICAgICAgICAgICAgIGRldl93YXJuKG5vci0+ZGV2LCAiU29mdHdhcmUgcmVzZXQgZmFp
bGVkOiAlZFxuIiwgcmV0KTsKPiA+KyAgICAgICAgICAgICAgaWYgKHJldCA9PSAtRU9QTk9UU1VQ
UCkKPiA+KyAgICAgICAgICAgICAgICAgICAgICBkZXZfaW5mbyhub3ItPmRldiwgIlNvZnR3YXJl
IHJlc2V0IGVuYWJsZSBjb21tYW5kIGRvZXNuJ3Qgc3VwcG9ydDogJWRcbiIsIHJldCk7Cj4gPisg
ICAgICAgICAgICAgIGVsc2UKPiA+KyAgICAgICAgICAgICAgICAgICAgICBkZXZfd2Fybihub3It
PmRldiwgIlNvZnR3YXJlIHJlc2V0IGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gPiAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+ICAgICAgIH0KPiA+Cj4gPmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktbWVtLmMgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+aW5kZXggZWRkNzQzMGQ0YzA1Li45
M2I3N2FjMGI3OTggMTAwNjQ0Cj4gPi0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+ID4rKysg
Yi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+QEAgLTMyMyw3ICszMjMsNyBAQCBpbnQgc3BpX21l
bV9leGVjX29wKHN0cnVjdCBzcGlfbWVtICptZW0sIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpv
cCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Cj4gPiAgICAgICBpZiAoIXNwaV9t
ZW1faW50ZXJuYWxfc3VwcG9ydHNfb3AobWVtLCBvcCkpCj4gPi0gICAgICAgICAgICAgIHJldHVy
biAtRU5PVFNVUFA7Cj4gPisgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+Cj4g
PiAgICAgICBpZiAoY3Rsci0+bWVtX29wcyAmJiBjdGxyLT5tZW1fb3BzLT5leGVjX29wICYmICFz
cGlfZ2V0X2NzZ3Bpb2QobWVtLT5zcGksIDApKSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IHNw
aV9tZW1fYWNjZXNzX3N0YXJ0KG1lbSk7Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
