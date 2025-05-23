Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFBFC54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 18:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPce2gQqmSOe3wxtZNX9bMw7Dt3RGIA+aXchPhiodsk=; b=BvOZtRjb+BsZ8b
	S9hCEQKvKQKla6H6EvMTRX3IHc0zjuG4U20Xa9lwAeHQVP4b3vqf/Lc8SOYpTYsktJie6dqv2ohKI
	oyMfsQ3MiD3zMnaYzx8T6sIZErysw9IQe48xZIgFdTgPG92+Es6gaAy1oniPh9Ed9WrAAS9LHIqMP
	ifoqLb22f5f7CbDlB9XkQa2PeAe5vNfJGAOy9IdPmd3pZaYduJm1kgVsuCGbYjHTIN9IBn+uGlVxH
	B+JYkLyZhXInddJV00dXAcZBFh0jwdbpd+QxZLOP1wtYZ/fonLY38pSMKQ0AN9gEIOB4QYeRcq038
	3vgwsXOWbZJONUSp+Ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWpq-00000004dUW-1dD3;
	Fri, 23 May 2025 18:09:34 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWpm-00000004dTn-2zU9
	for linux-mtd@lists.infradead.org;
	Fri, 23 May 2025 18:09:32 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so79422a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 23 May 2025 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748023769; x=1748628569; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PSAm/dz4qE3w58GPb642xKbKrw4osSp9d6WGa3IFOc=;
        b=AfVicm4HWyptd++NipTfbTBIheJq/54nrq8aS50IU31xDdm59f1Uy9whUBpuOHf6bD
         oTXPcRQM7zKyrKIzmhMSsFQJinaUCQBxlKpxvxkcSKm9lP/Su6Zfbl3x+LnPWglGGgrm
         8f+UTmYWhu4JO+RnG7zHlCrlPHhsoy32XS2BOA7yRGVdfbCYYdhpgyMCtSRCkfkPVUNR
         DjsQaWu545xKCwyFP/gcQKRfsx7aRR9K4l7qkD15WEDB7oA7lDq1zvH1a/OwqgRj7aW9
         Ggdg+dbIB5LRX/L81rLZDsnzc6sx5sAFGtXUXiNgwak/XsScxH1Ngr32ISElME0NNGd/
         GqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023769; x=1748628569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PSAm/dz4qE3w58GPb642xKbKrw4osSp9d6WGa3IFOc=;
        b=otPhKC5/jJ2u/o7FBazNZkchkGRV0V5tfR8WMaNxzZWHPxCdt5Bz1kebl/2vPFuoiI
         CheDQ8ixg+Pe14wl4XSZQzvPHLudzay1qa/XYuJTawgBh/P6be+GWeK+1IH3N8dqv/vp
         q0YomuMokfjiKAGtwCyfd/igxg+NeWUGkzJpja9v0hpENcpIFSvI6ClvQNYer/hBAK+k
         e5EG35xgEYNZIhW/bEFoMmIygJ8owrLevVXkTlVK47Ux633aHBiONDw2KtgNc2EFs53H
         ZhZ2ZEqj4Gt17jHC7DW8/qrjskXXbEvDVJFqdGn5+ZhXWJfQEbt8Vm1Dl6n/2nOAXs7i
         HxPg==
X-Gm-Message-State: AOJu0YzDaqt7McKdignQhmnAENdGgTCfrhOq4DO1RPsZblEexmvO8AEW
	+iDij8R1f+h2MpnhXrW0y7Xo/1L6bLt4XLTYusBHd9dru4wjYiZw4xyqXgoEsn1Nm3MFVDPTycc
	lMF0tgAJp9EvWKgKw01IHCs/GmPr8J0I=
X-Gm-Gg: ASbGncsFSWr/KM/23pgN0j+fKNAhd8AlzM1fRIHy1OExqMGv4LT3H+I4fBbYTZL1Uug
	SR5Cx4Et6jEQFNvMYpSh/W01tYaDifl4h+pW95Wz6zagVNl/9nZidjC4FrJvUR7JteCAGr/AKnP
	27xwSCkhzESe7Rhr3pSogLBd8ty/wod2t4lFo0d+h3CHC/LaLNVooaxSq+WcsKOzDtYA==
X-Google-Smtp-Source: AGHT+IEhdWBRRXcbHG9nhqMGxviXTWnxY5rMQJCfRX7t4KBkxl1C8mVIhgTCDvIHp+BcGZXaQC7Hhr9HVhliQGJKb4U=
X-Received: by 2002:a17:90b:4c0e:b0:310:8d73:c54b with SMTP id
 98e67ed59e1d1-3110f0f1340mr78082a91.8.1748023769328; Fri, 23 May 2025
 11:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250521080325.581366-1-noltari@gmail.com> <87wma74ceh.fsf@bootlin.com>
In-Reply-To: <87wma74ceh.fsf@bootlin.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Fri, 23 May 2025 20:08:56 +0200
X-Gm-Features: AX0GCFsjrJL9r_aUrdKh5hSAxN7Sfdl5PHDMGUlP9_F21fDnjANEA-PzRnYV5Xc
Message-ID: <CAKR-sGeUGpUFBf_Zvg=7ro0EpGKy0dQVF58mAQt27YX+79qv1A@mail.gmail.com>
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, dregan@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com, 
	rafal@milecki.pl, computersforpeace@gmail.com, kamal.dasu@broadcom.com, 
	dan.beygelman@broadcom.com, william.zhang@broadcom.com, 
	frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com, 
	richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	jaimeliao.tw@gmail.com, kilobyte@angband.pl, jonas.gorski@gmail.com, 
	dgcbueu@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_110930_755170_558C3E27 
X-CRM114-Status: GOOD (  24.51  )
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

SGkgTWlxdcOobCwKCkVsIHZpZSwgMjMgbWF5IDIwMjUgYSBsYXMgMTY6NDIsIE1pcXVlbCBSYXlu
YWwKKDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPikgZXNjcmliacOzOgo+Cj4gT24gMjEvMDUv
MjAyNSBhdCAxMDowMzoyNSArMDIsIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBDb21taXQgM2M4MjYwY2U3NjYzICgibXRkOiByYXduYW5k
OiBicmNtbmFuZDogZXhlY19vcCBpbXBsZW1lbnRhdGlvbiIpCj4gPiByZW1vdmVkIGxlZ2FjeSBp
bnRlcmZhY2UgZnVuY3Rpb25zLCBicmVha2luZyA8IHY1LjAgY29udHJvbGxlcnMgc3VwcG9ydC4K
PiA+IEluIG9yZGVyIHRvIGZpeCBvbGRlciBjb250cm9sbGVycyB3ZSBuZWVkIHRvIGFkZCBhbiBh
bHRlcm5hdGl2ZSBleGVjX29wCj4gPiBpbXBsZW1lbnRhdGlvbiB3aGljaCBkb2Vzbid0IHJlbHkg
b24gbG93IGxldmVsIHJlZ2lzdGVycy4KPiA+Cj4gPiBGaXhlczogM2M4MjYwY2U3NjYzICgibXRk
OiByYXduYW5kOiBicmNtbmFuZDogZXhlY19vcCBpbXBsZW1lbnRhdGlvbiIpCj4gPiBTaWduZWQt
b2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+ID4g
UmV2aWV3ZWQtYnk6IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDIyMiArKysrKysr
KysrKysrKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMTUgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPiA+Cj4gPiAgdjU6IGFkZCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBNaXF1
w6hsIFJheW5hbDoKPiA+ICAgLSBNZW50aW9uIGFuZCBleHBsYWluIGxlZ2FjeSBpbiBuYXRpdmVf
Y21kX2NvbnYuCj4gPiAgIC0gRU9QTk9UU1VQUCBpbnN0ZWFkIG9mIEVJTlZBTCBmb3IgaW5zdHIt
PnR5cGUgZWxzZS4KPiA+ICAgLSBJbXBsZW1lbnQgbWlzc2luZyBjaGVja19vbmx5IGZ1bmN0aW9u
YWxpdHkuCj4gPgo+ID4gIHY0OiBhZGQgY2hhbmdlcyByZXF1ZXN0ZWQgYnkgSm9uYXMgR29yc2tp
Ogo+ID4gICAtIEFkZCBtaXNzaW5nIGJyZWFrcyBpbiBicmNtbmFuZF9leGVjX2luc3RydWN0aW9u
c19sZWdhY3kuCj4gPiAgIC0gUmVzdG9yZSBtaXNzaW5nIHJldCBhc3NpZ25tZW50IGluIGJyY21u
YW5kX2V4ZWNfb3AuCj4gPgo+ID4gIHYzOiBhZGQgY2hhbmdlcyByZXF1ZXN0ZWQgYnkgRmxvcmlh
biBhbmQgb3RoZXIgaW1wcm92ZW1lbnRzOgo+ID4gICAtIEFkZCBhc3NvY2lhdGl2ZSBhcnJheSBm
b3IgbmF0aXZlIGNvbW1hbmQgY29udmVyc2lvbi4KPiA+ICAgLSBBZGQgZnVuY3Rpb24gcG9pbnRl
ciB0byBicmNtbmFuZF9jb250cm9sbGVyIGZvciBleGVjX2luc3RyCj4gPiAgICAgZnVuY3Rpb25h
bGl0eS4KPiA+ICAgLSBGaXggQ01EX0JMT0NLX0VSQVNFIGFkZHJlc3MuCj4gPiAgIC0gRHJvcCBO
QU5EX0NNRF9SRUFET09CIHN1cHBvcnQuCj4gPgo+ID4gIHYyOiBtdWx0aXBsZSBpbXByb3ZlbWVu
dHM6Cj4gPiAgIC0gVXNlIHByb3BlciBuYXRpdmUgY29tbWFuZHMgZm9yIGNoZWNrcy4KPiA+ICAg
LSBGaXggTkFORF9DTURfUEFSQU0vTkFORF9DTURfUk5ET1VUIGFkZHIgY2FsY3VsYXRpb24uCj4g
PiAgIC0gUmVtb3ZlIGhvc3QtPmxhc3RfYWRkciB1c2FnZS4KPiA+ICAgLSBSZW1vdmUgc2VjdG9y
X3NpemVfMWsgc2luY2UgaXQgb25seSBhcHBsaWVzIHRvIHY1LjArIGNvbnRyb2xsZXJzLgo+ID4g
ICAtIFJlbW92ZSBicmNtbmFuZF93cCBzaW5jZSBpdCBkb2Vzbid0IGV4aXN0IGZvciA8IHY1LjAg
Y29udHJvbGxlcnMuCj4gPiAgIC0gVXNlIGogaW5zdGVhZCBvZiBpIGZvciBmbGFzaF9jYWNoZSBs
b29wLgo+ID4KPgo+IC4uLgo+Cj4gPiArc3RhdGljIGludCBicmNtbmFuZF9jaGVja19pbnN0cnVj
dGlvbnNfbGVnYWN5KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlvbiAq
b3ApCj4gPiArewo+ID4gKyAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyOwo+
ID4gKyAgICAgdW5zaWduZWQgaW50IGk7Cj4gPiArICAgICB1OCBjbWQ7Cj4gPiArCj4gPiArICAg
ICBmb3IgKGkgPSAwOyBpIDwgb3AtPm5pbnN0cnM7IGkrKykgewo+ID4gKyAgICAgICAgICAgICBp
bnN0ciA9ICZvcC0+aW5zdHJzW2ldOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBzd2l0Y2ggKGlu
c3RyLT50eXBlKSB7Cj4gPiArICAgICAgICAgICAgIGNhc2UgTkFORF9PUF9DTURfSU5TVFI6Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgY21kID0gbmF0aXZlX2NtZF9jb252W2luc3RyLT5jdHgu
Y21kLm9wY29kZV07Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGNtZCA9PSBDTURfTk9U
X1NVUFBPUlRFRCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAg
ICAgY2FzZSBOQU5EX09QX0FERFJfSU5TVFI6Cj4gPiArICAgICAgICAgICAgIGNhc2UgTkFORF9P
UF9EQVRBX0lOX0lOU1RSOgo+Cj4gTm8gTkFORF9PUF9EQVRBX09VVF9JTlNUUj8KCkFGQUlLLCB0
aGUgbGVnYWN5IGZ1bmN0aW9ucyB3ZXJlIG9ubHkgdXNpbmcgaXQgZm9yCk5BTkRfQ01EX1NFVF9G
RUFUVVJFUywgd2hpY2ggd2UgZG9uJ3Qgc3VwcG9ydDoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZh
bGRzL2xpbnV4L2Jsb2IvYzg2YjYzYjgyZmRlNGY5NmVlOTRkZGU4MjdhNWYyOGZmNWFkZWI1Ny9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jI0wxOTIyLUwxOTM4CgpUaGUg
b3RoZXIgdXNlcyBJIGNvdWxkIGZpbmQgYXJlIGFscmVhZHkgY292ZXJlZCBieSBvdXIKY2hpcC0+
ZWNjLnJlYWQvd3JpdGUgZnVuY3Rpb25zLgoKSW4gYW55IGNhc2UgSSd2ZSB0ZXN0ZWQgdGhlIHBh
dGNoIGZvciByZWFkaW5nLCBlcmFzaW5nIGFuZCB3cml0aW5nIHRoZQpOQU5EIGFuZCBzbyBmYXIg
SSBoYXZlbid0IGZvdW5kIGFueSB1bnN1cHBvcnRlZCBlcnJvciBhcGFydCBmcm9tCk5BTkRfQ01E
X0dFVF9GRUFUVVJFUyB3aXRoIGEgTWFjcm9uaXggTkFORCBpbiB0aGUgU2VyY29tIEg1MDAtcwoo
QkNNNjMyNjgpLgpJIGJlbGlldmUgaXQncyB1c2VkIGZvciB1bmxvY2tpbmcgdGhlIE5BTkQsIHdo
aWNoIGlzbid0IG5lZWRlZCBpbiB0aGF0IGRldmljZS4KCj4KPiA+ICsgICAgICAgICAgICAgY2Fz
ZSBOQU5EX09QX1dBSVRSRFlfSU5TVFI6Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gPiArICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FT1BOT1RTVVBQOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArCj4g
PiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4KPiBSZXN0IGxndG0uCj4KPiBUaGFua3MsCj4gTWlx
dcOobAoKQmVzdCByZWdhcmRzLArDgWx2YXJvLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
