Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAA5CEF142
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OotwwJJ97XZHX6kLIIiqdd2Un9Yt+eS1kuF/tgMHw4=; b=qQWgKxUY1EICvH
	8uRJLx+PJ+Cxu6Lpg19dL8dsyNxhDxxNpjYYGJQKwL160p57bTnfKTrh0Uy+hjuPgg+QPHpugxMxt
	ZX/CbHOQTPq2hFpBPZMQS+VrCKnETSyKxGF+zzmCgSl/NkFncirw94/sWkRiJNAbYhf+E6wYP0vwY
	ThCPv549Lfu49oK3oIl6d9hEsMyijorU+6YQjTcVfYPRVwRzTmR9KaXN+JwOt125pXbBV1BEQemO9
	S63KMYB1vzYVfNLPPB8eaTsXp4Rd7zZgQlGSdopwM3Iy963pAZ4TP4zLPT6mZTGoKN+wrSR1/s/2n
	8EPNKaFQj/KxbKzyyfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6R0-00000005Hj5-0AS5;
	Tue, 08 Oct 2024 09:23:14 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Nz-00000005Gt2-1Xhs
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 09:20:08 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3280673a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2024 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728379206; x=1728984006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrmdMSex1KBje39KnEqSABRjqAAs6DDZ2LNbXrU83Ac=;
        b=XrM5VSbfN4ZjqI99tJSkY2CsZqLkWyvqs553XJ83/ogoB2l5x0UTOGwHe4I3iXthzG
         A7vqvq62bJukVPW3A5jdRd8AD7VLV5d4JFM5AO06DT30DRV+ocTlyzNYLNbgYX7xezJy
         HTLToF5xttox2VJOUZyK4W/2K9std+P4Kw4q/P6fcKywUCe5trWNZzII/xbJ31V7yORM
         w70623p/MeVZZxgJm5oeIEOxA6XkOH11D69WrwJQZ1Z90hFLVzxScRnLjC5eirvczoZk
         XSHtwOwUKfBR2F0e1OHJErjECTQwG4AHdHQfkRg0CeW7E/+uCMYelY/YmHGPEJRZCtdQ
         02uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379206; x=1728984006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrmdMSex1KBje39KnEqSABRjqAAs6DDZ2LNbXrU83Ac=;
        b=uysTc/nVw6M50ztMOGGt2cle3epIzcIaJVnQlkLEQVxSQOjO5UX8iaSbOjN+e6jzFA
         +BJNYP1VJ1gbn/WpJdW89lIrI5HukpDhm7FMO1QvataqUUxm0eerdUWMET/HlEn7uV7P
         k9huGI4eSwg+ESPr+EKT8khaiJ0r03N8W5+NxPw9vwZwHmmqr0WknMGxFDdm3Zk93VEg
         gTZOP5WhgSjcj/A6ceP+tEh3Hk6guNEtaDilGiHWqvTIRlIlcefLTavtt2WmLJR4SIQ7
         F/U9pOL7p+fSzI8SeMUTyod7irs9y2ZeeDmFL68IqF80EcXqhqkMih7DAiCjrEeEG2VJ
         Jqxw==
X-Forwarded-Encrypted: i=1; AJvYcCVex5BHBh3qhVyqTFQsj0HYjQEuz60FObnnRmFpZUg/Ejv3TYdPHysSg2bisdSK8a7YN33YLeV2P5s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWOI6M1N+THMlIseQ/0EP15HAYp8IZ8rQJuyxtOkxjUTc5icD+
	OttVt9bXHSXhjxcPxGIaLB6R736HvhwT+cORxGJ8QdsKXJdNTNHQhqSfEj/TKRS/tVrQHUmiU4x
	gZ/HZGL2aH+Aus6aNGMYlGpPh8nw=
X-Google-Smtp-Source: AGHT+IHbkrcEU7U04Uln5CeM3L2bwnIGinU3Vn8RCYcY9uAZyZ6pQVpfxiExYiAJXhYhCkB67Jxx8xbPkcq5tnHDUvo=
X-Received: by 2002:a17:90a:4a8c:b0:2e2:8f1e:f5ea with SMTP id
 98e67ed59e1d1-2e28f1efc06mr624055a91.1.1728379206453; Tue, 08 Oct 2024
 02:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240905055333.2363358-1-linchengming884@gmail.com>
 <20240905055333.2363358-2-linchengming884@gmail.com> <20241001114039.67bab21e@xps-13>
 <CAAyq3SbP4kSW47ZaT7V9ZzeHauj_EwfU5GPipZjNK6j69qm7Vw@mail.gmail.com>
 <20241007103331.55f37dcb@xps-13> <CAAyq3SaZKMqJrv7caVwO0+u+nk8JWZ8qTRHdUqQOfQhx9gBF7Q@mail.gmail.com>
 <20241008105523.1647f2ca@xps-13>
In-Reply-To: <20241008105523.1647f2ca@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 8 Oct 2024 17:19:42 +0800
Message-ID: <CAAyq3SZv__sJhc5aQ7AUCYKpumu79hq=1ci-wekM9PgghM9zuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nand: Add fixups for read retry
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_022007_431287_DF751A65 
X-CRM114-Status: GOOD (  23.78  )
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
IDIwMjTlubQxMOaciDjml6Ug6YCx5LqMIOS4i+WNiDQ6NTXlr6vpgZPvvJoKPgo+IEhpLAo+Cj4g
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDggT2N0IDIwMjQgMTQ6MjU6
MjUgKzA4MDA6Cj4KPiA+IEhpIE1pcXVlbCwKPiA+Cj4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiDmlrwgMjAyNOW5tDEw5pyIN+aXpSDpgLHkuIAg5LiL5Y2INDoz
M+Wvq+mBk++8mgo+ID4gPgo+ID4gPiBIaSBDaGVuZyBNaW5nLAo+ID4gPgo+ID4gPiA+ID4gPiBA
QCAtMzI1LDcgKzM3Myw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1hY3Jv
bml4X3NwaW5hbmRfdGFibGVbXSA9IHsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiA+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPiA+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxheW91dCwK
PiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBteDM1bGYxZ2U0
YWJfZWNjX2dldF9zdGF0dXMpKSwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBteDM1bGYxZ2U0YWJfZWNjX2dldF9zdGF0dXMpLAo+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgU1BJTkFORF9GSVhVUFMoJnJlYWRfcmV0cnlfZml4dXBzKSksCj4gPiA+
ID4gPiA+ICAgICAgIFNQSU5BTkRfSU5GTygiTVgzNVVGMUdFNEFDIiwKPiA+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9E
VU1NWSwgMHg5MiwgMHgwMSksCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICBOQU5EX01F
TU9SRygxLCAyMDQ4LCA2NCwgNjQsIDEwMjQsIDIwLCAxLCAxLCAxKSwKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJIGV4cGVjdCBhIHBhdGNoIHRhcmdldGluZyB0aGUgY29yZSBmaXJzdCwgYW5kIHRoZW4g
dGhlIGNoYW5nZXMgaW4gdGhlCj4gPiA+ID4gPiBNYWNyb25peCBkcml2ZXIuCj4gPiA+ID4KPiA+
ID4gPiBHb3QgaXQsIHNvIGRvIHlvdSBwcmVmZXIgdGhhdCB3ZSBzd2l0Y2ggdG8gdXNpbmcgZmxh
Z3MgaW5zdGVhZD8KPiA+ID4KPiA+ID4gTm90IG5lY2Vzc2FyaWx5LCBkaWQgST8KPiA+ID4KPiA+
ID4gLi4uCj4gPiA+Cj4gPgo+ID4gVXNpbmcgYSBmbGFnIGluc3RlYWQgb2YgZml4dXBzIGFsbG93
cyB0aGlzIHBhdGNoIHRvIHRhcmdldCB0aGUgY29yZSBmaXJzdCwKPiA+IGFuZCByZWR1Y2VzIGNo
YW5nZXMgaW4gdGhlIE1hY3Jvbml4IGRyaXZlci4KPgo+IFByb3Bvc2Ugd2hhdCBldmVyIHlvdSB0
aGluayBpcyBiZXN0LiBZb3UgY2FuIGFsc28gbG9vayBhdCBob3cgaXQgaXMKPiBkb25lIGluIHJh
dyBOQU5ELiBCdXQgYWx3YXlzIGluY2x1ZGUgdGhlIGNvcmUgY2hhbmdlcyBmaXJzdCwgcGxlYXNl
Lgo+IEl0IGlzIG5vdCByZWxhdGVkIHRvIGhvdyB5b3UgaW1wbGVtZW50IGl0Lgo+CgpUaGFuayB5
b3Ugc28gbXVjaCBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIHdpbGwgZW5zdXJlIHRoZSBjb3JlIGNo
YW5nZXMgYXJlCmFkZHJlc3NlZCBmaXJzdCwgYXMgeW91IG1lbnRpb25lZC4gQWxzbywgSSBkaWQg
cmVmZXIgdG8gaG93IGl0J3MgZG9uZSBpbiByYXcKTkFORCB3aGVuIHdvcmtpbmcgb24gdGhpcyBw
YXRjaC4gSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIGd1aWRhbmNlIGFuZCB3aWxsCmRlZmluaXRl
bHkga2VlcCB5b3VyIHdvcmRzIGluIG1pbmQuCgo+ID4KPiA+ID4gPiA+ID4gICAgICAgY29uc3Qg
c3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyICptYW51ZmFjdHVyZXI7Cj4gPiA+ID4gPiA+ICAg
ICAgIHZvaWQgKnByaXY7Cj4gPiA+ID4gPiA+ICsgICAgIGludCByZWFkX3JldHJpZXM7Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gQW55IHJlYXNvbiB0byBrZWVwIHRoaXMgdmFyaWFibGUgc2lnbmVkPwo+
ID4gPiA+Cj4gPiA+ID4gTm8sIHdlIGNhbiBzaW1wbHkgY2hhbmdlIGZyb20gaW50IHRvIHU4Lgo+
ID4gPgo+ID4gPiBKdXN0IHVuc2lnbmVkIGludCBpcyBmaW5lLgo+ID4gPgo+ID4KPiA+IFN1cmUs
IHRoYW5rcyEKPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gTWlxdcOobAo+ID4KPiA+IFRoYW5rcywK
PiA+IENoZW5nIE1pbmcgTGluCj4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5n
IE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
