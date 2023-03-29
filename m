Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C520C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 05:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEjF1e4YoqVrdrrP1/H8ePBkjFIJtK6U9j4OdtwN7zQ=; b=NZz4fokWJv82Vh
	T/cWcaxdMSSrp0wlm/PboI7COjVukyb0Y9byhOgFsKj3D9mpfyPIoevuT4N42u41rXeU05YhinmKK
	mzLoQhLNC1TMuXNMP7JBiZONxatX8NPiAl8w6brlMODUekL/IMnZ0VZvr+GhzjtHxdBHxFb5J9FyV
	3ZwxBL3BKWzKhqYmPc+ja3MS2vqqZYXsv9ACQa1ooYRbx/mJZhmcnYxCd+YavGYyxyOP17t9UdaMb
	4eAlT+QkDgauCGdCifAkGBo6YZQCh5bR02uvaiS4noH24rmipeSLtTXlhFBaVjmI90we/NcAND/uO
	VKpGSLdGq/YNnbq49b8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phOfl-00GjT1-2G;
	Wed, 29 Mar 2023 05:48:37 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phOfi-00GjS8-1l;
	Wed, 29 Mar 2023 05:48:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id k15so8603030pgt.10;
        Tue, 28 Mar 2023 22:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680068912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBcaOKsPUBwnQ5UM5HFWFQoapedBf3IezH+GloL/PSk=;
        b=JxDxK8Oe9yIYlu/HbXIh9GiWuRZ6UqQFHWRBg1y3/NL631Ob9MiOITre5fBXIS/bhB
         sNAZ257YxS482/vOzFav2FixmIJmKHTEFAy5UaBTmdmq5e+3eTIqWqzn2bihcq61Bh6/
         /nXBKB8V/HNrw2abvsjx1oqZg+Ifik2f7nyS5sBYOGOrx5rOvAYgyfJMCMm9VIwkGCeM
         EmFK7KAWunBpTYW+MXo2Jy33tHmVba+5n3POoVYrhjjoh2R8irfuuAgw69iolUf6bviN
         5vTKk8li1ayGKYsEFPxr4/fMS0OpglBA6iPXAMxEZ9b1ESJ1lRVQyIfM8Q2PkJM2w+CU
         WGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680068912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBcaOKsPUBwnQ5UM5HFWFQoapedBf3IezH+GloL/PSk=;
        b=Rd7M6b2pJJN8FTP6eLy8vgf7BLrO9aAjrd0DB0lYC+2kL2Unqrrx1lUCDKIO5aKfKk
         KrBCHo0WhLmy+Q6tey62fIpZ+7q1Ovff0ehgwuVtJLN+yWOFQV3yaki44vgksJSF9sjB
         FpEr/iPVnxcrl3jc1HV1RbT/guRhIsw/jjjdyfGK2wRO81YxrZf+e+1bZUD2y3vUbjkM
         uxENmsHNQnnAxUdRB2WOqR/cceq/YXscRL1/u/tEvpc5TF/HefE5Y5gCf6yQENgoXEWn
         FtcUoe6rPq4B+AKPiLLyTkHYr90N3p4w4qY6PuJbuUWLYh+AFxta7eQhKCmEon8xDIYG
         1GRA==
X-Gm-Message-State: AAQBX9dT98Jl0GxouSHiVjuKnIRk6Da5y6ySR0S0XRh4UG45RI/tomkb
	raUykx9a5Ek9OQnkIGI+3eYyMGhfyfO1TGzdf44=
X-Google-Smtp-Source: AKy350ZUIheCXTvrsHHlHbBMDoipmBRP8LvOZyID02J9Cl89ekgTxs1Uj/x2iSVTjKNU2R/kDX6Xz49nVieyjifsRE0=
X-Received: by 2002:a05:6a00:1995:b0:626:2638:5a51 with SMTP id
 d21-20020a056a00199500b0062626385a51mr9467172pfl.5.1680068912547; Tue, 28 Mar
 2023 22:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
 <20230328154105.448540-9-miquel.raynal@bootlin.com> <8ade974e-eb68-f448-7ec5-91c6b636eacf@linaro.org>
 <20230328184536.33f2f023@xps-13>
In-Reply-To: <20230328184536.33f2f023@xps-13>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 29 Mar 2023 13:48:21 +0800
Message-ID: <CAAQoYRknqq7=HFAeAB=W59G5ui_t3VSt3Xa33YbXeWPtJyxQsQ@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>, 
	Jaime Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_224834_623102_8E596C70 
X-CRM114-Status: GOOD (  25.36  )
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

SGkgTWlxdWVsCgo+Cj4gSGkgVHVkb3IsCj4KPiB0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3Jv
dGUgb24gVHVlLCAyOCBNYXIgMjAyMyAxNzozMTo0NiArMDEwMDoKPgo+ID4gT24gMy8yOC8yMyAx
Njo0MSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+ID4gRGVzY3JpYmUgdGhpcyBuZXcgcGFydCBh
bmQgcHJvdmlkZSB0aGUgUldXIGZsYWcgZm9yIGl0Lgo+ID4gPgo+ID4gPiBUaGVyZSBpcyBubyBw
dWJsaWMgZGF0YXNoZWV0LCBidXQgaGVyZSBhcmUgdGhlIHNmZHAgdGFibGVzIHBsdXMgYmFzZQo+
ID4gPiB0ZXN0aW5nIHRvIHNob3cgaXQgd29ya3MuCj4gPiA+Cj4gPiA+IG14MjV1dzUxMjQ1Zwo+
ID4gPiBjMjgxM2EKPiA+ID4gbWFjcm9uaXgKPiA+ID4gNTM0NjQ0NTAwODAxMDRmZDAwMDcwMTE0
NDAwMDAwZmY4NzAxMDExYzkwMDAwMGZmMGEwMDAxMDgwMDAxCj4gPiA+IDAwZmYwNTAwMDEwNTIw
MDEwMGZmODQwMDAxMDIzNDAxMDBmZjAwMDAwMDAwMDAwMDAwMDBmZmZmZmZmZgo+ID4gPiBmZmZm
ZmZmZmU1MjA4YWZmZmZmZmZmMWYwMGZmMDBmZjAwZmYwMGZmZWVmZmZmZmZmZmZmMDBmZmZmZmYK
PiA+ID4gMDBmZjBjMjAxMGQ4MDBmZjAwZmY4Nzc5MDEwMDgyMTIwMGUyNzcwNDY3NDYzMGIwMzBi
MGY0YmRkNTVjCj4gPiA+IDAwMDAwMGZmMTAxMDAwMjAwMDAwMDAwMDAwMDA3Y2ExNDgwMDAwMDAw
MDAwODg4ODAwMDAwMDAwMDAwMAo+ID4gPiAwMDQwMGZkMWZmZjMwZmQxZmZmMzAwMDUwMDkwMDAw
NTAwYjEwMDJiMDA5NTAwMmIwMDk2NzI3MTAzYjgKPiA+ID4gNzI3MTAzYjgwMDAwMDAwMDkwYTMx
ODgyMDBjMDY5OTYwMDAwMDAwMDAwMDAwMDAwNzI3MTAwOTg3MjcxCj4gPiA+IDAwYjg3MjcxMDA5
OTAwMDAwMDAwNzI3MTAwOTg3MjcxMDBmODcyNzEwMDk5NzI3MTAwZjkwMDAwMDAwMAo+ID4gPiAw
MDAwMDAwMDAxMTUwMWQwNzI3MTA2ZDgwMDAwODY1MDAwMDAwNjAxMDAwMDAwMDAwMjAwMDEwMzAw
MDIKPiA+ID4gMDAwMDAwMDAwNjAxMDAwMDAwMDAwMDAwNzIwNjAwMDIwMDAwMDBlZWMwNjk3Mjcy
NzE3MTAwZDhmN2Y2Cj4gPiA+IDAwMGEwMDAwMTQ0NTk4ODA0MzA2MGYwMDIxZGNmZmZmCj4gPiA+
IDA0N2E4ODRjZjQ0ZDlmZmMyYTk0ZDNhYjM3YjQ4YzYzICAvc3lzL2J1cy9zcGkvZGV2aWNlcy9z
cGkwLjAvc3BpLW5vci9zZmRwCj4gPgo+ID4gd2hpY2ggaGFzaCBhbGcgd2FzIHVzZWQsIHdhcyBp
dCBzaGExPyBObyBuZWVkIHRvIHJlc3VibW5pdCBqdXN0IGZvciB0aGlzLgo+Cj4gQWN0dWFsbHkg
Z2l0IGp1c3QgaWdub3JlZCBhbGwgdGhlIGxpbmVzIHN0YXJ0aW5nIHdpdGggJyMnCj4gbGlrZSBp
ZiB0aGV5IHdlcmUgY29tbWVudHMgYW5kIEkgZGlkIG5vdCBub3RpY2UuLi4KPgo+IEkgd2lsbCBh
bWVuZCBteSBjb21taXQgbG9ncyBhbmQgcmVzZW5kLgo+Cj4gPiA+Cj4gPiA+IDYrMCByZWNvcmRz
IGluCj4gPiA+IDYrMCByZWNvcmRzIG91dAo+ID4gPiBDb3BpZWQgNjI5MTQ1NiBieXRlcyBmcm9t
IHFzcGlfdGVzdCB0byBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gKPiA+ID4gRXJhc2VkIDYy
OTE0NTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gKPiA+ID4gQ29waWVk
IDYyOTE0NTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2ggdG8gcXNwaV9y
ZWFkCj4gPiA+IDAwMDAwMDAgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZm
Cj4gPiA+ICoKPiA+ID4gMDYwMDAwMAo+ID4gPiBDb3BpZWQgNjI5MTQ1NiBieXRlcyBmcm9tIHFz
cGlfdGVzdCB0byBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gKPiA+ID4gQ29waWVkIDYyOTE0
NTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2ggdG8gcXNwaV9yZWFkCj4g
PiA+IGQyNGE5NTIzZGI4MjlhMGRmNjg4ZjM0YjhkYzc2YTEzODNiNzQwMjQgIHFzcGlfdGVzdAo+
ID4gPiBkMjRhOTUyM2RiODI5YTBkZjY4OGYzNGI4ZGM3NmExMzgzYjc0MDI0ICBxc3BpX3JlYWQK
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4
LmMgfCA0ICsrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gPiBpbmRleCA2ODUzZWM5YWU2NWQuLmI2NWQ0
MWU1Zjc0OSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5j
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gPiBAQCAtODIs
NiArODIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jvbml4X25vcl9w
YXJ0c1tdID0gewo+ID4gPiAgICAgeyAibXgyNXU1MTI0NWciLCBJTkZPKDB4YzIyNTNhLCAwLCA2
NCAqIDEwMjQsIDEwMjQpCj4gPiA+ICAgICAgICAgICAgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8
IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpCj4gPiA+ICAgICAgICAgICAg
IEZJWFVQX0ZMQUdTKFNQSV9OT1JfNEJfT1BDT0RFUykgfSwKPiA+ID4gKyAgIHsgIm14MjV1dzUx
MjQ1ZyIsIElORk9CKDB4YzI4MTNhLCAwLCAxNiAqIDEwMjQsIDEwMjQsIDQpCj4gPgo+ID4gU2Vj
dG9yIHNpemUgYW5kIG5zZWN0b3JzIHNoYWxsIGJlIGRpc2NvdmVyZWQgYXQgcGFyc2UgU0ZEUCB0
aW1lLgo+ID4gRG9lcyBJTkZPQigweGMyODEzYSwgMCwgMCwgMCwgNCkgd29yayBmb3IgeW91Pwo+
Cj4gSSdsbCBjaGVjay4KPgo+ID4KPiA+ID4gKyAgICAgICAgICAgUEFSU0VfU0ZEUAo+ID4KPiA+
IFlhYXkKPiA+Cj4gPiA+ICsgICAgICAgICAgIEZMQUdTKFNQSV9OT1JfUldXKQo+ID4gPiArICAg
ICAgICAgICBGSVhVUF9GTEFHUyhTUElfTk9SXzRCX09QQ09ERVMpIH0sCj4gPgo+ID4gSXMgU1BJ
X05PUl80Ql9PUENPREVTIGZsYWcgcmVhbGx5IG5lZWRlZD8KPgo+IEkgaGF2ZSBubyBpZGVhLCBJ
IHRvb2sgdGhhdCBmcm9tIG9sZGVyIGNvZGUuCj4KPiBKYWltZSwgd2hhdCBkbyB5b3UgdGhpbms/
CkkgdGhpbmsgVHVkb3IgaG9wZXMgdGhhdCBTRkRQIHRhYmxlIGNvdWxkIGRldGVybWluZSBob3cg
bWFueSBhZGRyZXNzIGJ5dGVzLgoKSW4gc2ZkcC5jLCAic3BpX25vcl9wYXJzZV9iZnB0IiB3aWxs
IGNoZWNrIG51bWJlciBvZiBhZGRyZXNzIGJ5dGVzIGlmCmZsYXNoIHdpdGggU0ZEUCB0YWJsZSBz
dXBwb3J0LgoKVGhhbmtzCkphaW1lCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
