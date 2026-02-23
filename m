Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D17E98DEB
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 05:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8N1FAjm3MAIC8lkGhT+JH3qYrWyipbXzDeAFBKoet8=; b=tgCCF02layBJmq
	oUEzc3GmemFFdjxuiVvgPRgypBA7y9ywwKemvE0vrQIQClcjGr4Lmo0LSlADM4xmiSWMdfo2HrHHm
	ugPVuXcNqnOO4ehi+qn1VQak0PGqLeBqtFfZIf0L1P0mZ7yKfLPpnZz5Q9fg84p8WDE6s59QOBWGj
	Ww4TWSu324ld5L4L40cySz/+TbH/otobHedpkvoNVYQe9pprLZ7a1ZgikqChNs5RLU046Qn9Z7j7R
	fqF/hnNivpdf/KPxjwMMblQxCbkiEDcxSCH7Q9UQiXGZrvIbSTcyndgqvwrIlk5B80ANJ0gd7k7NH
	FL4fGRVe3SkFaL7TjmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuOqp-0000000HGJ0-0Fat;
	Mon, 23 Feb 2026 05:51:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuOqk-0000000HGId-1cCv
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 05:51:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2aaf43014d0so27428165ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 22 Feb 2026 21:51:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771825876; cv=none;
        d=google.com; s=arc-20240605;
        b=R+CN1k73VjCkpGujseisJlm31IraEF1FwgIVX4sKK6oF2pNAGR7pEJC2LmfqENlCuS
         bjP5zJc29Pdf/3h2A8uEIQtLUULdigS+c2dhF4fyXlKUC909vOhQrfP9WHFK8QoLh7UC
         Cvdzqd/ztsAHLBJDcHKdWykgf+U+tNgFkaZtG1D5C3UGY2iNI3DgfOzH4Wwqczhd5yNu
         AWIsbGhxWdpKvsNVK8Cty+XHzqcE2ldOWYUB2/v4WP8tDAgux9Lg73sayencB3/OAZSi
         K8CISD5zbmPaClx3CDa9Nti6lAHVqFpZaDQoPBmLhzeaAMf1XXIHfSs0VuvoTB4mmOyn
         e3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qxPLT6FJUuQxpXNq9IQlk3p36a8mKIJlTKN3Ee1ugFE=;
        fh=BKDVcqGrAbCuddlQ8sYB7Mp41y4a2KqYHC4lQCqnkgs=;
        b=KL1lCxpHhxwT+X8PWR+AkFdggEqqXNIK1SYFd9EvOKIsqKJ/swuKKIRR4lU0fp2ge+
         AOXSymNCe9hullPYPCYrphL4ZN6X8uTu1myXki3eJEzZpHDs9FhdL9oOkwhurityfRti
         KugGaTbM7Dk5l5/8cQi4SnODR9ecKlknWsnBygo71funPZTAsrv4U9LbK0h3djZmgNrz
         koHg29Kq6kA2aexP5pg65Nyt1LD4otsCEKw+6ELjcPWcGylMktGZl0fM7aJpzmC9bMP4
         aksRTun6pesEoAb5bGvigYnzf+Az6Tev26kWmIq2lEWcMNx+LFXB5RJ7tMyxMSYXwXHA
         CLcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771825876; x=1772430676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxPLT6FJUuQxpXNq9IQlk3p36a8mKIJlTKN3Ee1ugFE=;
        b=SSCGSpigs6pYIrrjXqnkBxus1p3O5Eby7oQ5N8ZlWTXtA+sIlf8eoy5vAF5JPyDDo0
         JOqFmg8m9hGIa1WhUfalFIJCE3Xp0Q9nJz3gh9UqhVG62KUnCCfpsujcXNNKg2s5QfaF
         L1zin1R5Bz9iTWaICggbWdLkCj9f7X6RNsbsNvIzmIF92j5aseKlvk0Q6FfhQOv5UssU
         18clI2xqF5bYHxMKnd3ndiy/s37sPsrA/N2nlfSD9aT3zSSUFcImRDE8KgC4N1clEjr4
         85Bb/MoJBnets2d3aEwZ5YZXX2P+R76Wq+yIJ1kauOhnRC3g/atleNtwfnosQuKLwNlM
         0U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771825876; x=1772430676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qxPLT6FJUuQxpXNq9IQlk3p36a8mKIJlTKN3Ee1ugFE=;
        b=lhY0e/f/RaMtzN1M+0GGyljzEpijnp7bmChVBdQHPgVdgGD1ftWzS+hVi/HBBOZhih
         zHObjPDCngU1cl8Sj5fmNA1d+2r2OuUgLAMSYlcwI230QNqwy+kVHRQW7psRZ6Hcvrgd
         9gM/wn7IoZ1JlXhWYXu/uQ1yBsNLP3PwCpu2KuZ/wB7cggakc8BZYYVyejWNSlwV2TN6
         GUoo6x9/5/YPI6cWGyWZG2QcZxvd1FSUS5zmFf4Rgx0P0M3tN6QRHBI6H9T20JBD5YCv
         XukSxGXbZeWutlRy1IAjG+8u8YSlWJudmYSmz38RPGnpBdPg4giB0e9DBi842wY8H4Su
         8zNg==
X-Forwarded-Encrypted: i=1; AJvYcCUTq9IJdK41v4LgdePmfc6DIDUYAJ4B6gmfEo2EP3AMExwYUNEdck4ckcW6ljk0rjGJERljy/ym+rQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy97XHcEp7b8wvYoy5yR5FZyudUzYBorcSDCyTwf2EosxqJ1jsS
	A0GHE7PLGM8R2QZqk2lBJ8M2Z11DhAOhJeqDDUF2nHynhWo0LVGFWJoalPF6bZsnyONwNVgfRKr
	Vu31uxqe5oPdUYIe+bPLP4yIC0v1SZq0=
X-Gm-Gg: ATEYQzzPQoXU0MG3xtZj2jOcuyAo05ao/gaH+MVuWdLXvtg7U0LsQ0/pkCM63bQnBDs
	d5ixAyJiDTm3ar3zLRaM+hVxYoo8PDeW7E3rF0BMEnPBpzBHhjJhMwyMmWNCcxwfvtVVuYxpPUK
	aErKEPkhxRvU2vUrVNmy1oHD1nvTtY5Baadj/RB/xm7t3m/xkogFGQkUiRTw8+sbTz9ObaebNPd
	PSxSlzrkFDdZ62beab0BvJvUUBweCeY22rSZwpYGUNiNFcuw0Kl50u/5M/CRyyz5lVwb2Ry0Ldq
	nirZvf0=
X-Received: by 2002:a17:902:cf4c:b0:2a9:5b48:2b50 with SMTP id
 d9443c01a7336-2ad743e281bmr77336595ad.3.1771825876496; Sun, 22 Feb 2026
 21:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20260211100553.907585-1-linchengming884@gmail.com>
 <20260211100553.907585-2-linchengming884@gmail.com> <20260212-white-numbat-of-variation-cde4ae@quoll>
In-Reply-To: <20260212-white-numbat-of-variation-cde4ae@quoll>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 23 Feb 2026 13:49:23 +0800
X-Gm-Features: AaiRm513jeFJBTQ3DT7B0x2d4MCAUMYdvvOiqa_qqFxhHg0EGa152Y0bd04BJsg
Message-ID: <CAAyq3SZGfm+3e2cXTKqKBrgk0eb+f5ytCw_49-k=0ipZbqKHoQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: spinand: Add randomizer
 enable/disable properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, Tianling Shen <cnsztl@gmail.com>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_215118_445098_E62ED37D 
X-CRM114-Status: GOOD (  12.32  )
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

SGkgS3J6eXN6dG9mLAoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiDmlrwg
MjAyNuW5tDLmnIgxMuaXpemAseWbmyDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBPbiBXZWQsIEZl
YiAxMSwgMjAyNiBhdCAwNjowNTo1MVBNICswODAwLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQt
Y2hpcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNo
aXAueWFtbAo+ID4gaW5kZXggNjA5ZDRhNGRkZDgwLi4yZmNiYzRiNzNlOTUgMTAwNjQ0Cj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY2hpcC55YW1s
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY2hp
cC55YW1sCj4gPiBAQCAtNjcsNiArNjcsMTQgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICB0aGUg
c2VjdXJlIHJlZ2lvbnMgcHJlc2VudC4KPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDY0LW1hdHJpeAo+ID4KPiA+ICsgIG5hbmQtcmFuZG9taXplci1l
bmFibGU6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBFbmFibGUgdGhlIHJhbmRvbWl6ZXIgZmVhdHVy
ZS4KPiA+ICsgICAgdHlwZTogYm9vbGVhbgo+ID4gKwo+ID4gKyAgbmFuZC1yYW5kb21pemVyLWRp
c2FibGU6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBEaXNhYmxlIHRoZSByYW5kb21pemVyIGZlYXR1
cmUuCj4gPiArICAgIHR5cGU6IGJvb2xlYW4KPgo+IFJlYWQgYWdhaW4gZmVlZGJhY2sgZnJvbSBN
aXF1ZWwgLSB0d28gRVhDTFVTSVZFIHByb3BlcnRpZXMuIFlvdSBtaXNzCj4gIm5vdCIgd2l0aCAi
cmVxdWlyZWQiOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDExODE2MzIwOC5H
QTExNzkxOS1yb2JoQGtlcm5lbC5vcmcvCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcgYW5kIHRo
ZSByZWZlcmVuY2UgbGluay4KCkkgdW5kZXJzdGFuZCBub3cuIEkgd2lsbCBhZGQgdGhlICJub3Qi
IHdpdGggInJlcXVpcmVkIiBjb25zdHJhaW50cyB0bwpwcm9wZXJseSBlbmZvcmNlIHRoZSBtdXR1
YWwgZXhjbHVzaXZpdHkgZm9yIHRoZXNlIHR3byBwcm9wZXJ0aWVzLgpUaGlzIHdpbGwgYmUgdXBk
YXRlZCBpbiB0aGUgdXBjb21pbmcgdjYuCgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+
CgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
