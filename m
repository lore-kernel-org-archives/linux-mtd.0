Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE02C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 17:41:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F7265228
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 17:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F7265228
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mailfence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GdBfB/GyhTjaWKKedY3gCIfRqjzG5IA2zH36tzzMzHA=; b=W0BQFqglwz5pajsh0L5aqfF2Q
	FWgFPjjY78FwCVXW7Iw5lWAvZAOKH8GQ70B4WD4rToKapQxJ0c4rlyr2iBxWOYLYWx9yN06AfpQI0
	Us5acvH0y64Jj5Gk54RgFaUulz8KF582gHJ0COA+5w5z5i6o4E+9SM41af8IjpEs8a9IIMVeL2zlO
	VRB6l+kd+R9m76lwK7BDtq/qNFqojitbgqOs32VDf9Sf8eR0d2qF0UCZWbU0Mh0RMPzGO5Yfx1pvc
	I2BOIcLOS48alz1zRU7jYCgJx2UUk0qL6a+7K1d/CFhWG/giMCsEQzEjPPuZojl2uEbppxHSaKPke
	6WZE5ERHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJsY-001TrG-Ur; Mon, 08 Mar 2021 17:41:15 +0000
Received: from wilbur.contactoffice.com ([212.3.242.68])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJsU-001ToG-7F
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 17:41:12 +0000
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
 by wilbur.contactoffice.com (Postfix) with ESMTP id 94657214F;
 Mon,  8 Mar 2021 18:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615225266; 
 s=20210208-e7xh; d=mailfence.com; i=sandberg@mailfence.com;
 h=Date:From:Reply-To:To:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 l=4633; bh=zNaKsWExsWcyXULaTzsbtGI5WdtBIurtO3l5p739G/o=;
 b=JtJ8leuh8IY/0TsxCUhZbjiWxRKVRyQNfEJ5ez5bBRzpjmYUQx6sTnA5uyB5+4hR
 ebbUE7sSjAWpmwAQ2GSlSoOvEsN6W1HjAJnSHsru/ntyt5Re/fqN5Sr9FTnogehaLaS
 e0ll7WeDlq9qOe25EMuG4TdLEOMLsWRVKDgMi4fWpzu9a1LNz+F8mtZE5C1u/+s3DLb
 ycZ1qSn02HG3fDT+4fS1Q/oG5iR4jdEVc/DLZmksz8/FABnUyq9jbfFkkqdJYAJxkJA
 CCqKFivSUKmfuZYeS2iBSMUZV/V4je+naQwM+dt9PvEPn/xhPzI8CWxf31fnPh8gkfl
 yHERd44NTQ==
Date: Mon, 8 Mar 2021 18:41:03 +0100 (CET)
From: Mauri Sandberg <sandberg@mailfence.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Message-ID: <1251364892.33403.1615225263124@ichabod.co-bxl>
In-Reply-To: <13b22fce-e98c-2835-f164-ead1b7b6f1d7@ti.com>
References: <20210223170052.963927-1-sandberg@mailfence.com>
 <13b22fce-e98c-2835-f164-ead1b7b6f1d7@ti.com>
Subject: Re: [PATCH] mtd: chips: AMD chip 0x2201 - write words not buffers
MIME-Version: 1.0
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:250217426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_174110_407939_E9DB0ED8 
X-CRM114-Status: GOOD (  32.56  )
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
Reply-To: Mauri Sandberg <sandberg@mailfence.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QXBvbG9naWVzIGZvciB0aGUgZXRpcXVldHRlIG1pc3Rha2VzLiBJdCdzIHRoZSBmaXJzdCBwYXRj
aCBJIGFtIHN1Ym1pdHRpbmcuCkFuc3dlcnMgdG8gY29tbWVudHMgaW5saW5lLgoKPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gRnJvbTogVmlnbmVzaCBSYWdoYXZl
bmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+IFNlbnQ6IE1vbiBNYXIgMDggMDY6NDc6NTcgQ0VUIDIw
MjEKPiBUbzogTWF1cmkgU2FuZGJlcmcgPHNhbmRiZXJnQG1haWxmZW5jZS5jb20+LCA8bGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbXRkOiBjaGlw
czogQU1EIGNoaXAgMHgyMjAxIC0gd3JpdGUgd29yZHMgbm90IGJ1ZmZlcnMKPiAKPiAKPiBIaSwK
PiAKPiBPbiAyLzIzLzIxIDEwOjMwIFBNLCBNYXVyaSBTYW5kYmVyZyB3cm90ZToKPiA+IENGSSBm
bGFzaCBtZW1vcnkgZHJpdmVyIGNtZHNldF8wMDAyIHVzZXMgYnVmZmVycyBmb3Igd3JpdGUgb3Bl
cmF0aW9ucy4KPiA+IFRoYXQgZG9lcyBub3Qgd29yayB3aXRoIEFNRCBjaGlwIHdpdGggaWQgMHgy
MjAxIGFuZCB3ZSBtdXN0IHJlc29ydCB0bwo+ID4gd3JpdGluZyB3b3JkIHNpemVkIGNodW5rcyBv
bmx5Lgo+ID4gCj4gCj4gV2hpY2ggZmxhc2ggaXMgdGhpcz8gRG8geW91IGhhdmUgZGF0YXNoZWV0
IGZvciB0aGUgc2FtZS4KQXBwZWFycyB0byBiZSBhIFMyOUdMMjU2TiBnaXZpbmcgaGl0cyBhcyBT
cGFuc2lvbiBhbmQgQ3lwcmVzcyBTZW1pY29uZHVjdG9yIGJlaW5nIHRoZSBtYW51ZmFjdHVyZXIu
CkRhdGFzaGVldCBpcyBhdmFpbGFibGUgdG9vLiBXaWxsIG1ha2UgYSBub3RlIG9mIHRoYXQgaW5m
by4KCkhlcmUncyB0aGUgbGluazogaHR0cHM6Ly93d3cuY3lwcmVzcy5jb20vZmlsZS8yMTk5NDEv
ZG93bmxvYWQKCj4gCj4gUGxlYXNlIGFkZCBhYm92ZSBpbmZvcm1hdGlvbiB0byB0aGUgY29tbWl0
IG1lc3NhZ2UgZm9yIGZ1dHVyZSByZWZlcmVuY2UuCj4gCj4gPiBUaGlzIHBhdGNoIGNyZWF0ZXMg
Zml4dXAgbWVjaGFuaXNtIHRoYXQgcmVuZGVycyBhIGNoaXAgdG8gdXNlIHdvcmQgc2l6ZWQKPiA+
IHdyaXRlIG9wZXJhdGlvbiBhbmQgYWRkcyB0aGF0IGFzIHRoZSBsYXN0IGl0ZW0gaW4gYSBmaXh1
cCB0YWJsZSwgc2hhZG93aW5nCj4gPiB0aGUgZW50cnkgdGhhdCBjYXVzZXMgdXNlIG9mIGJ1ZmZl
ciB3cml0ZXMuCj4gPiAKPiA+IFdpdGhvdXQgdGhlIHBhdGNoIGtlcm5lbCBsb2dzIHdpbGwgYmUg
Zmxvb2RlZCB3aXRoIGVudHJpZXMgbGlrZSBiZWxvdzoKPiA+IAo+ID4gTVREIGRvX2VyYXNlX29u
ZWJsb2NrKCk6IEVSQVNFIDB4MDFmYTAwMDAKPiA+IE1URCBkb193cml0ZV9idWZmZXIoKTogV1JJ
VEUgMHgwMWZhMDAwMCgweDAwMDAxOTg1KQo+ID4gTVREIGRvX2VyYXNlX29uZWJsb2NrKCk6IEVS
QVNFIDB4MDFmODAwMDAKPiA+IE1URCBkb193cml0ZV9idWZmZXIoKTogV1JJVEUgMHgwMWY4MDAw
MCgweDAwMDAxOTg1KQo+ID4gTVREIGRvX3dyaXRlX2J1ZmZlcl93YWl0KCk6IHNvZnR3YXJlIHRp
bWVvdXQsIGFkZHJlc3M6MHgwMWY4MDAwYS4KPiA+IGpmZnMyOiBXcml0ZSBjbGVhbiBtYXJrZXIg
dG8gYmxvY2sgYXQgMHgwMWE2MDAwMCBmYWlsZWQ6IC01Cj4gPiBNVEQgZG9fZXJhc2Vfb25lYmxv
Y2soKTogRVJBU0UgMHgwMWY2MDAwMAo+ID4gTVREIGRvX3dyaXRlX2J1ZmZlcigpOiBXUklURSAw
eDAxZjYwMDAwKDB4MDAwMDE5ODUpCj4gPiBNVEQgZG9fd3JpdGVfYnVmZmVyX3dhaXQoKTogc29m
dHdhcmUgdGltZW91dCwgYWRkcmVzczoweDAxZjYwMDBhLgo+ID4gamZmczI6IFdyaXRlIGNsZWFu
IG1hcmtlciB0byBibG9jayBhdCAweDAxYTQwMDAwIGZhaWxlZDogLTUKPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogTWF1cmkgU2FuZGJlcmcgPHNhbmRiZXJnQG1haWxmZW5jZS5jb20+Cj4gPiAtLS0K
PiAKPiAxLiBQbGVhc2UgZXhwbGljaXRseSBDQyBtYWludGFpbmVycyBmb3IgcXVpY2tlciByZXNw
b25zZS4gR2l2ZW4gdGhlCj4gYW1vdW50IG9mIHRyYWZmaWMgb24gTWFpbGluZyBsaXN0LCBpdCds
bCB0YWtlIHF1aXRlIGEgd2hpbGUgZm9yIG1lIHRvCj4gZ2V0IHRvIGEgcGF0Y2ggdGhhdCBpcyBu
b3QgYWRkcmVzcyBkaXJlY3RseSB0byBtZS4KPiAKPiBSdW4gLi9zY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsICBvbiB0aGUgcGF0Y2ggdG8gZ2V0IGxpc3Qgb2YgbWFpbnRhaW5lcnMKPiB0byBiZSBD
QydkCj4gCj4gMi4gJHN1YmplY3Qgc2hvdWxkIHN0YXJ0IHdpdGggYXBwcm9wcmlhdGUgcHJlZml4
Ogo+IAo+IAkibXRkOiBjZmlfY21kc2V0XzAwMDI6IC4uLi4iCj4gCj4gSnVzdCBydW4gZ2l0IGxv
ZyAtLW9uZWxpbmUgb24gdGhlIGZpbGUgYmVpbmcgcGF0Y2hlZCB0byBrbm93IHRoZSBjb252ZW50
aW9uLgo+IAo+IElmIHlvdSBkb24ndCBDQyB0aGUgbWFpbnRhaW5lcnMgYW5kIHVzZSB0aGUgYXBw
cm9wcmlhdGUgcHJlZml4ZXMsIGl0Cj4gd2lsbCBiZSBhIHdoaWxlIHVudGlsIEkgZ2V0IHRvIHN1
Y2ggcGF0Y2hlcy4KPiAKPiAKPiA+ICBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIu
YyB8IDggKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyBiL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiBpbmRleCBhMWYzZTEwMzFjM2Qu
LmI4YjU2NDM0MjA2MiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRz
ZXRfMDAwMi5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+
ID4gQEAgLTI3OSw2ICsyNzksMTIgQEAgc3RhdGljIHZvaWQgZml4dXBfdXNlX3dyaXRlX2J1ZmZl
cnMoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAgfQo+ID4gICNlbmRpZiAvKiAhRk9SQ0VfV09S
RF9XUklURSAqLwo+ID4gIAo+ID4gK3N0YXRpYyB2b2lkIGZpeHVwX3VzZV93cml0ZV93b3Jkcyhz
dHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+ICt7Cj4gPiArCXByX2RlYnVnKCJVc2luZyB3b3JkIHdy
aXRlIG1ldGhvZFxuIik7Cj4gPiArCW10ZC0+X3dyaXRlID0gY2ZpX2FtZHN0ZF93cml0ZV93b3Jk
czsKPiAKPiBEZWZhdWx0IGlzIGNmaV9hbWRzdGRfd3JpdGVfd29yZHMoKS4gZml4dXBfdXNlX3dy
aXRlX2J1ZmZlcnMoKSBmb3JjZXMKPiB0aGlzIHRvIGNmaV9hbWRzdGRfd3JpdGVfYnVmZmVycygp
IGlmIAljZmktPmNmaXEtPkJ1ZldyaXRlVGltZW91dFR5cCBpcwo+IG5vbiB6ZXJvLgo+IAo+IFdo
YXQgZG9lcyB0aGlzIGZpZWxkIHJlYWQgaW4gY2FzZSBvZiB5b3VyIGZsYXNoPyBTaG91bGQgYmUg
MCBpbiBjYXNlCj4gYnVmZmVyZWQgd3JpdGUgaXMgbm90IHN1cHBvcnRlZC4KSXQgZ2l2ZXMgbWUg
JzYnLiAgRGF0YXNoZWV0IGRvZXMgaW5kaWNhdGUgdGhhdCBidWZmZXIgd3JpdGVzIGFyZSBzdXBw
b3J0ZWQuCgo+IAo+ID4gK30KPiA+ICsKPiA+ICAvKiBBdG1lbCBjaGlwcyBkb24ndCB1c2UgdGhl
IHNhbWUgUFJJIGZvcm1hdCBhcyBBTUQgY2hpcHMgKi8KPiA+ICBzdGF0aWMgdm9pZCBmaXh1cF9j
b252ZXJ0X2F0bWVsX3ByaShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+ICB7Cj4gPiBAQCAtNDcw
LDggKzQ3NiwxMCBAQCBzdGF0aWMgc3RydWN0IGNmaV9maXh1cCBjZmlfZml4dXBfdGFibGVbXSA9
IHsKPiA+ICAjaWYgIUZPUkNFX1dPUkRfV1JJVEUKPiA+ICAJeyBDRklfTUZSX0FOWSwgQ0ZJX0lE
X0FOWSwgZml4dXBfdXNlX3dyaXRlX2J1ZmZlcnMgfSwKPiA+ICAjZW5kaWYKPiA+ICsJeyBDRklf
TUZSX0FNRCwgMHgyMjAxLCBmaXh1cF91c2Vfd3JpdGVfd29yZHMgfSwKPiAKPiAKPiBTaG91bGQg
YmUgd29ya2VkIGFyb3VuZCBpbiBmaXh1cF91c2Vfd3JpdGVfYnVmZmVycygpIGluc3RlYWQuIE5v
IHBvaW50Cj4gaW4gb3ZlcnJpZGluZyBtdGQtPl93cml0ZSB0byBjZmlfYW1kc3RkX3dyaXRlX2J1
ZmZlcnMoKSBhbmQgdGhlbgo+IHJldmVydGluZyBpdCBhZ2Fpbi4KPiAKPiA+ICAJeyAwLCAwLCBO
VUxMIH0KPiA+ICB9Owo+ID4gKwo+IAo+IFBsZWFzZSBkb24ndCBkbyB3aGl0ZSBzcGFjZSBmaXhl
cyBpbiB0aGUgc2FtZSBwYXRjaCBhZGRpbmcKPiBjb2RlL2ZlYXR1cmUvYnVnLWZpeAo+IAo+ID4g
IHN0YXRpYyBzdHJ1Y3QgY2ZpX2ZpeHVwIGplZGVjX2ZpeHVwX3RhYmxlW10gPSB7Cj4gPiAgCXsg
Q0ZJX01GUl9TU1QsIFNTVDQ5TEYwMDRCLCBmaXh1cF91c2VfZndoX2xvY2sgfSwKPiA+ICAJeyBD
RklfTUZSX1NTVCwgU1NUNDlMRjA0MEIsIGZpeHVwX3VzZV9md2hfbG9jayB9LAo+ID4gCj4gCj4g
UmVnYXJkcwo+IFZpZ25lc2gKCgotLcKgClNlbnQgd2l0aCBodHRwczovL21haWxmZW5jZS5jb20K
U2VjdXJlIGFuZCBwcml2YXRlIGVtYWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
