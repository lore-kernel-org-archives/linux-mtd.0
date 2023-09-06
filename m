Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2BAEB8FB5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=minqJz9t1/DVkZmHr0djKnAE0a4DAAHYWyiF9AsARdI=; b=XRlEy7lcvMZxiE
	87yQf+UNRC2hIjYtpMRyfwXBwPSao5x5RX3NNuMAkLMtxFjhu8+uesPtCYkMQCpgONp/qAjZBxy8e
	DwxTbsECJu37MnrUdG1Tga5D+4RTsj0eptA8frGe5Hff7XgOp8iuliQTlHIgi77+ISnOaNPKFrv/H
	E3Q8ipaUuB6bL5yCfKH9c69Z4aW/SeijV8aF0KKNxnxNJvgGNDrkVqbtbUtUXJUd5CDSaeMYknXk1
	FkCoB+TH/NExWEoDDk9kjuUuosNvJlSgxTiVHoP1h/dvb+EGspoBa97s58biMxNj8wp85Y5v1Wp3m
	Hp8K+KV11tS7wCvOsf4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdojS-007tZY-13;
	Wed, 06 Sep 2023 09:21:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdojP-007tY8-1M
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 09:21:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31f4a286ae1so2192077f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 02:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693992107; x=1694596907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0TV4sjBEqmPK+GnPd3ZNR9jG/QTP5wUg7aplpOdmzc=;
        b=QdhZOQUHSsMf+JhSaW7nVEUo4HwivKt76/zZ6oKng8N7VIFPJ2ARV8xWOnqGHugsOL
         90rVOqY/Y2CpM7jzfpVQD/39asSd9C0c0Qcdv65l52I9zq3FisGblWREbQjcMmBZDBIH
         r/LWE0ol0reUFCWI+IamDKwhJqaa6WT7DtYOAuTXHHGxxWDH1vWgpL7dfd2fQ4UVx8zV
         WG9OTIWsn/2uoIQP61YhQvTdXsz/c//aQrkyZCGGDS7c9QQMO5nI2lvBlRaPFnWPwpb4
         KMlFrYdbEgF/q8em/B7VMDtZqpnexa8sKoBZHBEW09OgwKThX5UMO9S6h5PQ847Tz79D
         jHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992107; x=1694596907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0TV4sjBEqmPK+GnPd3ZNR9jG/QTP5wUg7aplpOdmzc=;
        b=Tw+ZPDusOgX8mubxGK3GxcdPY9V1g1tAQSRO61F/6HrVeiZHsF2hFHtJQkxddPX3Tp
         Xg6yITf2xiUX5Qpw4xXYuuhWaGtNEqKWL5qMV3YZk4heQ+kZt7rQafiDhFnHF0NyaMrk
         qcnA8moVat7zTHFNrGeC5ZQex+XvdZfkbbxt3dPfTzTvISWl2//WALbPiv5RduO+mwKF
         u8za88LmKTgxTBhLdpAs568D16w3vBvJLzXHPVcv8vmS+wl6gBK2yNGdbXMdzxTcmS00
         rkBJIKoCNpyxbZhQHKgcD3KwOAovCU4P97ARaA5img4UFYwWuJsxcGUgBl63bKsKSCpZ
         tWNA==
X-Gm-Message-State: AOJu0Yy4m7k2Qs9WTtuTD8fyW9BC/EyPx067M5ewBxyMOgyUQ4J4OSTr
	ESsJCXkKFKrR7zqK1cJ0GqMMiZDTyjz9FWL+4uooIqzeh4tocA==
X-Google-Smtp-Source: AGHT+IHXJfMZcyT4CkhtOD1wcFMOJf4ANhiF7/nXVMIvCy32MlCR8Y6PGro4fHb3VI4ZVNUPdKp/ISp8KUa4FUIFpmg=
X-Received: by 2002:a5d:654d:0:b0:314:34dd:aaec with SMTP id
 z13-20020a5d654d000000b0031434ddaaecmr1707317wrv.8.1693992107302; Wed, 06 Sep
 2023 02:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
 <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com> <52ba4755-ade0-4b4a-f4a2-13160bb6129b@huawei.com>
 <CAM===sQ+-2A=R_Rn4iiLyaVsBh0Y1Dp8QDeT2fevEiWCfLtmnw@mail.gmail.com>
 <212e499d-324a-d553-2a2c-35bec47195db@huawei.com> <CAM===sSTKnmRdRx-LwJ50G4P4Er8+gfQ0vznEYOsqi63_UFaQQ@mail.gmail.com>
 <c9dea479-91d3-659c-28ba-39299b27b174@huawei.com> <CAM===sRtnHxuWG__FW_KZZG0iF0ZpYs4N+wtM9XuGKTUX2scHg@mail.gmail.com>
 <5dded3ae-20ab-2f3f-d43e-10e91d4eda21@huawei.com>
In-Reply-To: <5dded3ae-20ab-2f3f-d43e-10e91d4eda21@huawei.com>
From: Leon Pollak <leon.pollak@gmail.com>
Date: Wed, 6 Sep 2023 12:21:35 +0300
Message-ID: <CAM===sSha8i7E_YSuQCuA7TRwo6wdjA7Xf8NYkeenP=SPfP4RQ@mail.gmail.com>
Subject: Re: Can't find correct configuration
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_022151_479291_B3427286 
X-CRM114-Status: GOOD (  32.25  )
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

WmhpaGFvIENoZW5nLCBwbGVhc2UsIGV4Y3VzZSBteSBzdHVwaWRpdHkuLi46LSkKVG8gdXRpbGl6
ZSB0aGVzZSA4TWlCIEkgc2V0ICItYyAyMDQ3Ii4KSSB0aG91Z2h0IHRoYXQgMjQ4TWlCLzEyNjk3
Nj0yMDQ4IGFuZCAtMSB0byBiZSBvbiB0aGUgc2FmZSBzaWRlLgpCdXQgSSBkbyBub3Qgc2VlIGFu
eSBjaGFuZ2UgaW4gdGhlIGtlcm5lbCBsb2cuClNob3VsZCBJIGFsc28gY2hhbmdlIHRoZSB1Ymlm
cy5jZmcgZmlsZSBhbmQgaW5jcmVhc2UgdGhlIHZvbF9zaXplPwoKT24gV2VkLCA2IFNlcHQgMjAy
MyBhdCAxMTo1MywgWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6
Cj4KPiDlnKggMjAyMy85LzYgMTY6MzgsIExlb24gUG9sbGFrIOWGmemBkzoKPiA+IFllcywgeW91
IGFyZSByaWdodCBhYm91dCB0aGUgc2l0dWF0aW9uLgo+ID4gTXkgcGFydGl0aW9uIGZvciBVQkkg
aXMgMjQ4TWlCLgo+ID4gU28sIHRoZSBxdWVzdGlvbiByZW1haW5zIC0gY2FuIHRoaXMgOE1CIGJl
IHV0aWxpemVkPwo+Cj4gWWVzLCBpdCBjYW4uCj4KPiA+IE9yIGFyZSB0aGV5IGFscmVhZHkgaW4g
dXNlIGJ5IFVCSSB3aGljaCBzZWVzIHBhcnRpdGlvbiBzaXplPwo+ID4KPiA+Cj4gPiBPbiBXZWQs
IDYgU2VwdCAyMDIzIGF0IDEwOjM0LCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWku
Y29tPiB3cm90ZToKPiA+Pgo+ID4+IOWcqCAyMDIzLzkvNiAxNToyNywgTGVvbiBQb2xsYWsg5YaZ
6YGTOgo+ID4+PiBJIHdvcmsgb24gZW1iZWRkZWQgZGV2aWNlLiBUaGUgcmVzdCBvZiB0aGUgTkFO
RCBpcyB1c2VkIGZvciBTUEwsCj4gPj4+IFUtQm9vdCwgVS1Cb290IGVudmlyb25tZW50IGFuZCBr
ZXJuZWwuCj4gPj4+IFdoYXQgaXMgbGVmdCBpcyAyNDhNaUIuCj4gPj4+IEkgYW0gbm90IHN1cmUg
SSBjYW4gdXNlIHRoZSB3aG9sZSBzcGFjZSBmb3IgVUJJIC0gaG93IHdpbGwgdGhlIFNQTC9VLUJv
b3Qgd29yaz8KPiA+Pgo+ID4+IERvIHlvdSBtZWFuIFVCSSBhbmQgdWJvb3QgYXJlIHB1dCBpbnRv
IHNhbWUgZmxhc2goMjU2TSk/IElmIHNvLCB5b3VyCj4gPj4gcGFydGl0aW9uaW5nIG1ldGhvZCBp
cyByaWdodC4KPiA+Pgo+ID4+IDhNKG10ZDApIC0gdWJvb3QKPiA+PiAyNDhNKG10ZDEpIC0gVUJJ
Cj4gPj4KPiA+PiBVQkkgd29uJ3QgYWNjZXNzIG10ZDAuCj4gPj4KPiA+Pgo+ID4+Pgo+ID4+PiBP
biBXZWQsIDYgU2VwdCAyMDIzIGF0IDEwOjIxLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiDlnKggMjAyMy85LzYgMTQ6NTcsIExlb24g
UG9sbGFrIOWGmemBkzoKPiA+Pj4+PiBUaG91c2FuZHMgb2YgdGhhbmtzLCBaaGloYW8gQ2hlbmch
ISEKPiA+Pj4+PiBJdCB3b3JrZWQgZXhhY3RseSBhcyB5b3Ugd3JvdGUuCj4gPj4+Pj4gVGhlIG9u
bHkgcXVlc3Rpb24gcmVtYWluZWQgaXM6Cj4gPj4+Pj4gTXkgcGFydGl0aW9uIHNpemUgaXMgMjQ4
TWlCLgo+ID4+Pj4+IEkgdGhvdWdodCB0aGF0IGxlYXZpbmcgOE1pQiAic3BhcmUnIHdpbGwgYmUg
dXNlZCBqdXN0IGZvciB0aGVzZQo+ID4+Pj4+IHJlc2VydmVkIFBFQnMsIGJ1dCBub3cgSSB1bmRl
cnN0YW5kIHRoaXMgd2FzIGluY29ycmVjdC4KPiA+Pj4+PiBTbywgbWF5IEkgdXRpbGl6ZSB0aGVz
ZSA4TWlCIGJhY2sgb3Igd2lsbCB0aGV5IHN0aWxsIGJlIHVzZWQgYnkgVUJJCj4gPj4+Pj4gZm9y
IHNvbWV0aGluZz8KPiA+Pj4+Pgo+ID4+Pj4KPiA+Pj4+IEkgYmVsaWV2ZSB5b3UgaGF2ZSB0d28g
bXRkIGRldmljZXMsIDI0OE0obXRkMCBmb3IgdWJpKSBhbmQgOE0ocmVzZXJ2ZWQsCj4gPj4+PiB3
b24ndCBiZSBhY2Nlc3NlZCBieSBVQkkpIG5vdy4gUGxlYXNlIGRvbid0IHNwbGl0IHRoZSAyNTZN
IGludG8gdHdvIG10ZAo+ID4+Pj4gZGV2aWNlcyBpZiB5b3Ugb25seSBuZWVkIDEgVUJJIGRldmlj
ZSwganVzdCBmb3JtYXQgdGhlIHdob2xlIGZsYXNoKDI1Nk0pCj4gPj4+PiBpbnRvIFVCSSwgYW5k
IFVCSSBpdHNlbGYgd2lsbCBoYW5kbGUgaXRzIHJlc2VydmF0aW9uIHdpdGhvdXQgdXNlcgo+ID4+
Pj4gaW50ZXJ2ZW5pbmcuCj4gPj4+Pgo+ID4+Pj4+IE9uIFdlZCwgNiBTZXB0IDIwMjMgYXQgMDU6
NTAsIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4+Pj4+
Pgo+ID4+Pj4+PiDlnKggMjAyMy85LzYgMTA6NDIsIFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4gPj4+
Pj4+PiDlnKggMjAyMy85LzUgMjI6NDUsIExlb24gUG9sbGFrIOWGmemBkzoKPiA+Pj4+Pj4+IEhp
Cj4gPj4+Pj4+Pj4gSGVsbG8sIGFsbC4KPiA+Pj4+Pj4+PiBJIHdpbGwgYmUgdmVyeSB2ZXJ5IHRo
YW5rZnVsIGZvciB0aGUgaGVscCB0byBmaW5kIHRoZSBjb3JyZWN0Cj4gPj4+Pj4+Pj4gY29uZmln
dXJhdGlvbiBmb3IgbXkgTkFORC4KPiA+Pj4+Pj4+PiBJIHBhc3NlZCB0aHJvdWdoIGEgbG90IG9m
IG1haWxzIGluIHRoZSBsaXN0cyBhbmQgZ29vZ2xlIGFuZCBDaGF0R1BUIC0KPiA+Pj4+Pj4+PiBu
byBzdWNjZXNzLgo+ID4+Pj4+Pj4+IEkgaGF2ZSAyNTZNQiBOQU5EIGFuZCAyNDhNQiBwYXJ0aXRp
b24gZm9yIFVCSUZTLiBJIHJ1bjoKPiA+Pj4+Pj4+PiBta2ZzLnViaWZzIC12IC1yIHJvb3RmcyAt
RiAtbSAyMDQ4IC1lIDEyNjk3NiAtYyAxOTgxIC1vIC4vdWJpZnMuaW1nCj4gPj4+Pj4+Pj4gdWJp
bml6ZSAtdiAtbyByb290ZnMuaW1nIC1tIDIwNDggLXAgMTI4S2lCIC1zIDUxMiAtTyAyMDQ4IHVi
aW5pemUuY2ZnCj4gPj4+Pj4+Pj4gLS0tLS0KPiA+Pj4+Pj4+PiBhbmQgdWJpbml6ZS5jZmcgbG9v
a3MgbGlrZToKPiA+Pj4+Pj4+PiBbdWJpZnNdCj4gPj4+Pj4+Pj4gbW9kZT11YmkKPiA+Pj4+Pj4+
PiBpbWFnZT0uL3ViaWZzLmltZwo+ID4+Pj4+Pj4+IHZvbF9pZD0wCj4gPj4+Pj4+Pj4gdm9sX3Np
emU9MjQwTWlCCj4gPj4+Pj4+Pj4gdm9sX3R5cGU9ZHluYW1pYwo+ID4+Pj4+Pj4+IHZvbF9uYW1l
PXViaV9yb290ZnMKPiA+Pj4+Pj4+PiB2b2xfYWxpZ25tZW50PTEKPiA+Pj4+Pj4+PiB2b2xfZmxh
Z3M9YXV0b3Jlc2l6ZQo+ID4+Pj4+Pj4+IC0tLS0tLQo+ID4+Pj4+Pj4+IEtlcm5lbCBjb25maWd1
cmF0aW9uICB3YXMgd2l0aCBDT05GSUdfTVREX1VCSV9CRUJfTElNSVQ9MjAuCj4gPj4+Pj4+Pj4g
YW5kIGhlcmUgaXMgdGhlIGtlcm5lbCBsb2c6Cj4gPj4+Pj4+Pj4gWyAgICAyLjY5NTY1OV0gdWJp
MDogYXR0YWNoaW5nIG10ZDQKPiA+Pj4+Pj4+PiBbICAgIDMuMzcyMzQzXSB1YmkwOiBzY2Fubmlu
ZyBpcyBmaW5pc2hlZAo+ID4+Pj4+Pj4+IFsgICAgMy4zODMwNjZdIHViaTAgd2FybmluZzogdWJp
X2ViYV9pbml0OiBjYW5ub3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcwo+ID4+Pj4+Pj4+IGZvciBiYWQg
UEVCIGhhbmRsaW5nLCByZXNlcnZlZCA0LCBuZWVkIDQwCj4gPj4+Pj4+Pj4gWyAgICAzLjQwNDMy
MF0gdWJpMDogdm9sdW1lIDAgKCJ1Ymlfcm9vdGZzIikgcmUtc2l6ZWQgZnJvbSAxOTgyIHRvCj4g
Pj4+Pj4+Pj4gMTk4MiBMRUJzCj4gPj4+Pj4+Pj4gWyAgICAzLjQxMTY2N10gdWJpMDogYXR0YWNo
ZWQgbXRkNCAobmFtZSAiRlMiLCBzaXplIDI0OCBNaUIpCj4gPj4+Pj4+Pj4gWyAgICAzLjQxNzA5
NV0gdWJpMDogUEVCIHNpemU6IDEzMTA3MiBieXRlcyAoMTI4IEtpQiksIExFQiBzaXplOgo+ID4+
Pj4+Pj4+IDEyNjk3NiBieXRlcwo+ID4+Pj4+Pj4+IFsgICAgMy40MjQwMDZdIHViaTA6IG1pbi4v
bWF4LiBJL08gdW5pdCBzaXplczogMjA0OC8yMDQ4LCBzdWItcGFnZQo+ID4+Pj4+Pj4+IHNpemUg
NTEyCj4gPj4+Pj4+Pj4gWyAgICAzLjQzMDc0MF0gdWJpMDogVklEIGhlYWRlciBvZmZzZXQ6IDIw
NDggKGFsaWduZWQgMjA0OCksIGRhdGEKPiA+Pj4+Pj4+PiBvZmZzZXQ6IDQwOTYKPiA+Pj4+Pj4+
PiBbICAgIDMuNDM3NzM0XSB1YmkwOiBnb29kIFBFQnM6IDE5OTAsIGJhZCBQRUJzOiAwLCBjb3Jy
dXB0ZWQgUEVCczogMAo+ID4+Pj4+Pj4+IFsgICAgMy40NDM4NjBdIHViaTA6IHVzZXIgdm9sdW1l
OiAxLCBpbnRlcm5hbCB2b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMKPiA+Pj4+Pj4+PiBjb3VudDog
MTI4Cj4gPj4+Pj4+Pj4gWyAgICAzLjQ1MTExN10gdWJpMDogbWF4L21lYW4gZXJhc2UgY291bnRl
cjogMS8wLCBXTCB0aHJlc2hvbGQ6IDQwOTYsCj4gPj4+Pj4+Pj4gaW1hZ2Ugc2VxdWVuY2UgbnVt
YmVyOiAxNTkwNTcwMDczCj4gPj4+Pj4+Pj4gWyAgICAzLjQ2MDI5NV0gdWJpMDogYXZhaWxhYmxl
IFBFQnM6IDAsIHRvdGFsIHJlc2VydmVkIFBFQnM6IDE5OTAsCj4gPj4+Pj4+Pj4gUEVCcyByZXNl
cnZlZCBmb3IgYmFkIFBFQiBoYW5kbGluZzogNAo+ID4+Pj4+Pj4+IFsgICAgMy40Njk1NzVdIHVi
aTA6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0ZWQsIFBJRCAxMzEKPiA+Pj4+
Pj4+PiBbICAgIDQuNjQ4NzE4XSBVQklGUyAodWJpMDowKTogYmFja2dyb3VuZCB0aHJlYWQgInVi
aWZzX2JndDBfMCIKPiA+Pj4+Pj4+PiBzdGFydGVkLCBQSUQgMTM2Cj4gPj4+Pj4+Pj4gWyAgICA0
LjY3NjY0MF0gVUJJRlMgKHViaTA6MCk6IHN0YXJ0IGZpeGluZyB1cCBmcmVlIHNwYWNlCj4gPj4+
Pj4+Pj4gWyAgIDEwLjI1MDA5OV0gVUJJRlMgKHViaTA6MCk6IGZyZWUgc3BhY2UgZml4dXAgY29t
cGxldGUKPiA+Pj4+Pj4+PiBbICAgMTAuMjY5MDQ2XSBVQklGUyAodWJpMDowKTogVUJJRlM6IG1v
dW50ZWQgVUJJIGRldmljZSAwLCB2b2x1bWUgMCwKPiA+Pj4+Pj4+PiBuYW1lICJ1Ymlfcm9vdGZz
Igo+ID4+Pj4+Pj4+IFsgICAxMC4yNzY4MzBdIFVCSUZTICh1YmkwOjApOiBMRUIgc2l6ZTogMTI2
OTc2IGJ5dGVzICgxMjQgS2lCKSwKPiA+Pj4+Pj4+PiBtaW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6
IDIwNDggYnl0ZXMvMjA0OCBieXRlcwo+ID4+Pj4+Pj4+IFsgICAxMC4yODY3OTRdIFVCSUZTICh1
YmkwOjApOiBGUyBzaXplOiAyNTAxNDI3MjAgYnl0ZXMgKDIzOCBNaUIsIDE5NzAKPiA+Pj4+Pj4+
PiBMRUJzKSwgam91cm5hbCBzaXplIDkwMjM0ODggYnl0ZXMgKDggTWlCLCA3MiBMRUJzKQo+ID4+
Pj4+Pj4+IFsgICAxMC4yOTc1NDBdIFVCSUZTICh1YmkwOjApOiByZXNlcnZlZCBmb3Igcm9vdDog
MCBieXRlcyAoMCBLaUIpCj4gPj4+Pj4+Pj4gWyAgIDEwLjMwMzQwNl0gVUJJRlMgKHViaTA6MCk6
IG1lZGlhIGZvcm1hdDogdzQvcjAgKGxhdGVzdCBpcyB3NS9yMCksCj4gPj4+Pj4+Pj4gVVVJRCBB
MTRENTg2QS0zMkUyLTQ1RDctQTA3RS1CREM0NzJGREYzMUQsIHNtYWxsIExQVCBtb2RlbAo+ID4+
Pj4+Pj4+Cj4gPj4+Pj4+Pj4gTXkgcXVlc3Rpb24gaXM6IHdoeSBkb2VzIHRoaXMgd2FybmluZyBh
Ym91dCByZXNlcnZlZCA0LCBuZWVkZWQgNDAKPiA+Pj4+Pj4+PiBhcHBlYXI/IEhvdyBjYW4gSSBz
b2x2ZSB0aGlzPwo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gU29sdXRpb246IE1vZGlm
eSB1YmluaXplLmNmZywgIHZvbF9zaXplPTI0ME1pQiAtPiB2b2xfc2l6ZT0yMzVNaUIKPiA+Pj4+
Pj4+Cj4gPj4+Pj4+PiBXaHkgZG9lcyB0aGlzIHdhcm5pbmcgYWJvdXQgcmVzZXJ2ZWQgNCwgbmVl
ZGVkIDQwIGFwcGVhcj8KPiA+Pj4+Pj4+IFRoZSBjb3VudCBvZiBiYWQgUEVCcyByZXNlcnZlZCBi
eSBVQkkgaXM6IHRvdGFsX3BlYnMobmFuZCBjaGlwKSAqCj4gPj4+Pj4+PiBDT05GSUdfTVREX1VC
SV9CRUJfTElNSVQvMTAyNCA9IDIwNDggKiAgMjAgLyAxMDI0ID0gNDAKPiA+Pj4+Pj4+IFdoZW4g
ZmFzdG1hcCBpcyBub3QgZW5hYmxlZCwgdGhlIGNvdW50IG9mIGludGVybmFsIFBFQnMgcmVzZXJ2
ZWQgYnkgVUJJCj4gPj4+Pj4+PiBpczogVUJJX0xBWU9VVF9WT0xVTUVfRUJTWzJdICsgV0xfUkVT
RVJWRURfUEVCU1sxXSArCj4gPj4+Pj4+PiBFQkFfUkVTRVJWRURfUEVCU1sxXSA9IDQKPiA+Pj4+
Pj4+Cj4gPj4+Pj4+PiBUb3RhbCBQRUJzIGZvciBVQkkgaXMgMTk5MChnb29kIFBFQnM6IDE5OTAp
LCB0aGUgbWF4IGNvdW50IG9mIHVzZXIKPiA+Pj4+Pj4+IHZvbHVtZSBQRUJzIGlzIDE5OTAgLSA0
MCAtIDQgPSAxOTQ2Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSW4gdWJpbml6ZS5jZmcsIHZvbF9zaXpl
PTI0ME1pQiwgdGhlIGNvdW50IG9mIHVzZXIgdm9sdW1lIFBFQnMgaXMoc2VlCj4gPj4+Pj4+PiB1
YmluaXplLmMgaW4gbXRkdWl0bHMpOiB2aV9zaXplICsgKGxlYl9zaXplIC0gMSkgLyBsZWJfc2l6
ZQo+ID4+Pj4+Pj4gdmlfc2l6ZSA9IDI0ME0gPSAyNDAgKiAxMDI0ICogMTAyNAo+ID4+Pj4+Pj4g
bGViX3NpemUgPSAxMjhLIC0gMksoZWMpIC0gMksodmlkKSA9IDEyNCAqIDEwMjQKPiA+Pj4+Pj4+
IHJlc3VsdCA9IDE5ODIKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBTbyB0aGVyZSBhcmUgMTk5MCAtIDE5
ODIgLSA0ID0gNCBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nLAo+ID4+Pj4+Pj4g
d2hpY2ggaXMgbGVzcyB0aGFuIDQwLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFdoZW4gd2Ugc2V0ICB2
b2xfc2l6ZT0yMzVNaUIsIHRoZSBjb3VudCBvZiB1c2VyIHZvbHVtZSBQRUJzIGlzOiAoMjM1ICoK
PiA+Pj4+Pj4+IDEwMjQgKiAxMDI0ICsgMTI0ICogMTAyNCAtIDEpIC8gKDEyNCAqIDEwMjQpID0g
MTk0MQo+ID4+Pj4+Pj4gMTk5MCAtIDQgLSA0MCA9IDE5NDYsIGZpbmFsbHkgbWF5YmUgdGhlcmUg
aXMgbWVzc2FnZSBmcm9tIGtlcm5lbCBsaWtlCj4gPj4+Pj4+PiAiKCJ1Ymlfcm9vdGZzIikgcmUt
c2l6ZWQgZnJvbSAxOTQxIHRvIDE5NDYgTEVCcyIuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEFjdXRhbGx5
LCB0aGUgJ3ZvbF9zaXplJyBpbiB1YmluaXplLmNmZyBtZWFucyB0aGUgc2l6ZSBvZiBkYXRhIG9u
Cj4gPj4+Pj4+IHZvbHVtZShleGNsdWRlIHZpZC9lYyksIG5vdCB0aGUgc2l6ZSBvZiB2b2x1bWUo
aW5jbHVkZSB2aWQvZWMpLgo+ID4+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gLgo+ID4+Pj4+Cj4gPj4+
Pgo+ID4+Pgo+ID4+PiAuCj4gPj4+Cj4gPj4KPiA+Cj4gPiAuCj4gPgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
