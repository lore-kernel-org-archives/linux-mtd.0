Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D1BC77B7C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FU7n36VUGUB/FjDPQtw2qF+7RFOJ793wSu2f2c6LcE=; b=zoJ65Gh/2b8qk8
	PSVkWH4pIKuac0rQFGClCvMaQMj71WnltVwg5WFEV1CMwT+qBtE7dofMN1NBV5DfnijvYh5IJVmrO
	L9K4AtvkEfzPOdPQ9Ffa7VxZjqo9cdW5BYi9hPbtcMOMDnNiSfV7h/FMaX1+QcqC69hrn+WKlU36F
	q17NkedRliI010/Kcdyc7NO/wur/D/bm/8S6gEci0GSW5C+tH/p62dHOK+MY+Kz8VH/dkG7UuQHrW
	Ky1yRp4meTAjHNsEjzBYSbX1IsG3CpJSoMLJh1jvDuX5Ki9S5HtRsrn9yokPLQz+9oKY1QDxchFXK
	Xp29yTu/EEAp38POvOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKBl-0000000DyOU-0hfw;
	Thu, 19 Jun 2025 18:40:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIYg-0000000De6z-49mC
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 16:56:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-748feca4a61so415302b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Jun 2025 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750352174; x=1750956974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZFj2hZSu69/Xm4e2yViIRqT1PyZ1iV0LU+WA8TFzkg=;
        b=X/pa0wSQgtmtxB/yO2GHeXK3jde/UHsIy0ygd55h0V54pNkIggI1PyxsFrSP8j7pZ9
         PNzFRjGUrkuhFCLronsB0jTeedaA0C+W7DRwuLFvusyTXuvZkYPbpJAo4WmSc1qfT4Fw
         FbjFus23gJj6MwqKQt+fPm0fyJ+wBhQsoW0hMtMeinutqcGCKkoXmJIZmuWpBGAr1HYE
         mtW9AJ8jKooYgDkuKnZF9lPHR1RqZ+SN9aQ0ydFiwyy2F1gOHQUIEZhnW7cCJkgBuqdX
         71Nlg4qvq199XfmEvriMPwCuh8Vg2Bh+GRPRM6ws+k07S0leQ4pXjj1g5qzmUy49BlvO
         Nu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352174; x=1750956974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZFj2hZSu69/Xm4e2yViIRqT1PyZ1iV0LU+WA8TFzkg=;
        b=GYVSoa92LidhkVSlpIssCvKXGsiPdSodl72Z+NLDBqToPP/zz418xsHeAGwXfPp23J
         YWWIgdFY75BgPicMtabH3thuA4Gu6qFIbzMJJAfP50uFRykReh5xxDAyvsjrzCqrj615
         N3Rz9uRFuPLucR6AGwCVduX4TVtdn0ERN/I7iMLNYTzrDFZsy6AoyJDiMjQL33oYTzeG
         0hJsTShv0HrXFDTtDyjX/+lj0imJygU3O+YtX9D+TPJOvrlijPcioWovQ/CWNLESjKhV
         NUW/LmvO91ErE2ey7eY0kg5Gl3rylx0gCKXmxx8ymJUyMkdoE4wibUIuEjjy8XdpDv0f
         Ghaw==
X-Forwarded-Encrypted: i=1; AJvYcCW6gpr2BFhzpC4YMjmaB41KpIt3bU/56/IBliVoQU2XSrN/dyIEAdtoPbIvutmgXLjdNYvqaFfy94U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6Z8yq/qFnmF/pj9e3TChQ+zMAwDkEVy82U8hNsmdIzrDbfHfv
	iW+b0hmvzZKwFrGIaPAnOIU1B38TnU1qIs5FpLIaRuEJ1wi91BbiC8hv6kShCseNkl3Hc/HhU+8
	YTnMdESuNPfNVG/FiuIzxRAEidpfYT80=
X-Gm-Gg: ASbGnctXttbhn0wxtcwC+Lm+KYFpJqMHngF4Est9uRinDpmpJ3h9Cr45yf0Kb2LzP4m
	FEaylLhHBYS2o7CWJB+PsVYmD1J1xOVlDQQYH1il0llIXWEpvZ4v4lFh54E//XpmAxeJr12Fw+b
	CmT9WIGYFjfH5HjT3gaq6E4w69z8+Ty+msGpCNJv6oqCxTJGKEqxYqEnX4
X-Google-Smtp-Source: AGHT+IF74Fq6moaGRUvTQSSo9JJWwKFNHtJAwpPdbNWUWgZdA6/z4R2uRfsfynwAEcENaM4gsIe9+SeHJYNdemRcFFM=
X-Received: by 2002:a17:90b:57d0:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-313f1ca08d8mr34670264a91.11.1750352173741; Thu, 19 Jun 2025
 09:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <5c7ad4dc-a80b-488a-87aa-ecd6389e86c8@ti.com> <20250619140003.103637-1-amadeus@jmu.edu.cn>
 <87zfe3zney.fsf@bootlin.com>
In-Reply-To: <87zfe3zney.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 20 Jun 2025 00:56:03 +0800
X-Gm-Features: AX0GCFuiyfEsP5K27W2CJYYcTvHo2_-d1lWfrF1_wWlnDCQC46BMx4P_Gj5PUjw
Message-ID: <CAAyq3SaSYMed-NrHHu0UCyphnxGwdb9YJpQkmoX3Us6=K31erg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: spi-nand: macronix: disable continuous read for MX35LFxGE4AD
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, vigneshr@ti.com, gch981213@gmail.com, 
	richard@nod.at, linux-mtd@lists.infradead.org, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_095615_032151_90C8472F 
X-CRM114-Status: GOOD (  29.66  )
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
IDIwMjXlubQ25pyIMjDml6Ug6YCx5LqUIOS4iuWNiDEyOjUw5a+r6YGT77yaCj4KPiBIZWxsbywK
Pgo+ICsgQ2hlbmcgTWluZyBmcm9tIE1hY3Jvbml4Cj4KPiBPbiAxOS8wNi8yMDI1IGF0IDIyOjAw
OjAzICswOCwgQ2h1a3VuIFBhbiA8YW1hZGV1c0BqbXUuZWR1LmNuPiB3cm90ZToKPgo+ID4gSGks
Cj4gPgo+ID4+IFBsZWFzZSBjYyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyBmb3IgYWxs
IHBhdGNoZXMgYW5kIHF1ZXJpZXMKPiA+PiByZWxhdGVkIHRvIE1URCBzdWJzeXN0ZW1zLgo+ID4+
IFJ1biAuL3NjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIG9uIHRoZSBwYXRjaCBmb3IgbW9yZSBp
bmZvcm1hdGlvbi4KPiA+Cj4gPiBTb3JyeSwgSSBmb3Jnb3QgdG8gYWRkIHRoZSBmb2xsb3dpbmcg
bWFpbGluZyBsaXN0Lgo+ID4gRG8gSSBuZWVkIHRvIHJlc2VuZCB0aGlzIHBhdGNoPwo+ID4KPiA+
PiBXaHk/IHRoaXMgZGF0YXNoZWV0IHNheXMgb3RoZXJ3aXNlIFsxXToKPiA+Pgo+ID4+IFdvdWxk
IGl0IGJlIHBvc3NpYmxlIHRoYXQgU1BJL1FTUEkgY29udHJvbGxlciBvZiBHTC5pTmV0IEdMLU1U
MzAwMAo+ID4+IGhhcyBhIGxpbWl0YXRpb24/Cj4gPgo+ID4gR0wuaU5ldCBHTC1NVDMwMDAgdXNl
cyBNZWRpYVRlayBNVDc5ODEgU29DLCB3aXRoIFNQSSBjb250cm9sbGVycwo+ID4gYmFzZWQgb24g
SVBNIGRlc2lnbi4gWzFdCj4gPgo+ID4gSSBkb24ndCBrbm93IHdoYXQgdGhlIGRpZmZlcmVuY2Ug
aXMgYmV0d2VlbiB0aGUgU1BJIGNvbnRyb2xsZXJzIG9mCj4gPiBNVDc5ODEgYW5kIHRoZSBaeW5x
IHVzZWQgaW4gY29tbWl0IFsyXS4KPiA+Cj4gPiBJbiBteSBjYXNlLCB1YmlfaW9fcmVhZCBhbmQg
ZWNjIGVycm9ycyBvY2N1cnJlZCB3aGVuIHRoZSBvcGVud3J0Cj4gPiBhdHRhY2ggdWJpIHBhcnRp
dGlvbiAoTk1CTSBoYXMgYmVlbiBkaXNhYmxlZCBbM10pOgo+ID4KPiA+IFsgICAgNy44NTIwMDBd
IHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC01IHdoaWxlIHJlYWRpbmcgMTI2OTc2
IGJ5dGVzIGZyb20gUEVCIDUxNzo0MDk2LCByZWFkIG9ubHkgMCBieXRlcywgcmV0cnkKPiA+IFsg
ICAgNy44NjUzNzRdIHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC01IHdoaWxlIHJl
YWRpbmcgMTI2OTc2IGJ5dGVzIGZyb20gUEVCIDUxNzo0MDk2LCByZWFkIG9ubHkgMCBieXRlcywg
cmV0cnkKPiA+IFsgICAgNy44Nzg3NDJdIHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9y
IC01IHdoaWxlIHJlYWRpbmcgMTI2OTc2IGJ5dGVzIGZyb20gUEVCIDUxNzo0MDk2LCByZWFkIG9u
bHkgMCBieXRlcywgcmV0cnkKPiA+IFsgICAgNy44OTIxMDRdIHViaTAgZXJyb3I6IHViaV9pb19y
ZWFkOiBlcnJvciAtNSB3aGlsZSByZWFkaW5nIDEyNjk3NiBieXRlcyBmcm9tIFBFQiA1MTc6NDA5
NiwgcmVhZCAwIGJ5dGVzCj4gPiBbICAgIDcuOTAxNzU0XSBVQklGUyBlcnJvciAodWJpMDoyIHBp
ZCA2ODcpOiB1Ymlmc19sZWJfcmVhZDogcmVhZGluZyAxMjY5NzYgYnl0ZXMgZnJvbSBMRUIgMTow
IGZhaWxlZCwgZXJyb3IgLTUKPiA+Cj4gPiBBZnRlciBkaXNhYmxpbmcgY29udGludW91cyByZWFk
LCB0aGlzIGZsYXNoIHdvcmtzIGZpbmUuCj4gPiBTbyBkZXNwaXRlIHRoZSBkYXRhc2hlZXQgc3Rh
dGluZyBzdXBwb3J0LCBJIHRoaW5rIGl0IHdvdWxkIGJlCj4gPiBiZXR0ZXIgdG8gZGlzYWJsZSBp
dCBmaXJzdCB0byBhdm9pZCBicmlja2luZyBNVDc5ODEgZGV2aWNlcwo+ID4gd2l0aCBNWDM1TEZ4
R0U0QUQgZmxhc2guCj4KPiBJIGFtIHNvcnJ5IGJ1dCBkaXNhYmxpbmcgdGhlIGZlYXR1cmUgZm9y
IGV2ZXJ5IHVzZXIgb2YgdGhlIGNoaXAgZG9lcyBub3QKPiB3b3JrIGlmIHRoZSBwcm9ibGVtIGNv
bWVzIGZyb20gdGhlIFNQSSBjb250cm9sbGVyLgo+Cj4gSSBqdXN0IGFkZGVkIENoZW5nIE1pbmcg
ZnJvbSBNYWNyb25peC4gQ2hlbmcgTWluZywgY2FuIHlvdSBjb25maXJtIHRoZXNlCj4gY2hpcHMg
c3VwcG9ydCBjb250aW51b3VzIHJlYWQ/IElzIHRoZXJlIGFueXRoaW5nIHNwZWNpZmljIGFib3V0
IHRoZW0KPiB0aGF0IG1pZ2h0IGNhdXNlIHRoaXMgYnJlYWthZ2U/CgpZZXMsIEnigJl2ZSBjb25m
aXJtZWQgZnJvbSB0aGUgZGF0YXNoZWV0cyB0aGF0IHRoZXNlIGNoaXBzIGRvIHN1cHBvcnQKY29u
dGludW91cyByZWFkLiBBZGRpdGlvbmFsbHksIEnigJl2ZSB2YWxpZGF0ZWQgdGhpcyBvbiB0aGUg
WnlucSBwbGF0Zm9ybQp3aGVuIHVzaW5nIHViaWF0dGFjaCwgdGhlIGNoaXAgb3BlcmF0ZXMgbm9y
bWFsbHkgYW5kIGNvbnRpbnVvdXMgcmVhZAp3b3JrcyBhcyBleHBlY3RlZC4KClRoYXTigJlzIHdo
eSBJIGZvbGxvd2VkIHVwIHdpdGggaGltIHRvZGF5IHRvIGNvbmZpcm0gdGhlIGV4YWN0IGV4cGVy
aW1lbnQKcHJvY2VkdXJlLiBJ4oCZZCBsaWtlIHRvIHVuZGVyc3RhbmQgaG93IHRoZSB0ZXN0IHdh
cyBjb25kdWN0ZWQgdGhhdCBsZWQgdG8KdGhlIG9ic2VydmVkIGlzc3VlLgoKPgo+IFRoYW5rcyBh
IGxvdCwKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
