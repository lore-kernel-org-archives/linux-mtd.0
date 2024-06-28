Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFED4C2BBCA
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QolBfWnV8l1PnfZA6h+GUBXq727LyCvAsLlsUCaNmsQ=; b=ZQRBF8N7GRXsCD
	OcjttqD9W77QWx69FNH4AUFaYZRnCUyIeFWL7bam3T6KYN94uZMaxL7OR8L5H+3NJ9dH1oKMV88zU
	TfySatJejiIb9nlXw5jWTjgnGDSA1wnS7YIUWeQecmpE5KFNtrT+mTP0cCrTnSogZZkaSmLxjxO1K
	zFbmo0UoSLKMxwTaZ1dCbvOxtwUBAKCw8qZ8RYAF2pkMRDsK5VMuJrvTuDx/psUF9R+Z52zwp+pVi
	1dyabpaz64Ch6cQIGK1TQaKUQUV85KNccDb+U0pEeVS+8UBL6ClhZarJWx8OGiMPCCaL9ekzeTZFY
	Kmk/fJTHxDlnYahAbamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8DN-0000000DJgT-48Jc;
	Fri, 28 Jun 2024 09:48:21 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN8DK-0000000DJff-0BEu
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 09:48:20 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6b590e36a8dso1945766d6.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 02:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719568096; x=1720172896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9ul7sciE4TWD5ZCzRMXkQo/BW8Bk2N6jU2ho5gBxDc=;
        b=iraEJDF6ayguUXXHtQVPBrqRtiDgSGihzpC+tpBztQhtUHPmK3mItXCCxw8brBoRi4
         B09B8YCWIrZUM0Blyq5EkjCxmt37P+FunAxNJhvZXLjVaiRQK7Sw5b7GRhnShr1sNEr9
         qbiR87wTUT7pEFWaJwEHmFp37RqzQEof2aKKiA55QeR5gMuyIuahFkAGFVjPgKlF8YHz
         lWkXLFxOI8p59auQPh4oDEyoEcRMfM5Z5xEsT48mrFhsJdb87K3uQqIY787W7fuHk4j+
         JL+l/PU6J5peBxCj+ep6p/raykVVCv8cTapLOOdsyRjUH25cx8CY7lMzi/RncLq+/xIa
         Wu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568096; x=1720172896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9ul7sciE4TWD5ZCzRMXkQo/BW8Bk2N6jU2ho5gBxDc=;
        b=uHUOkE61CTHBy9pyHjmLO27f82XWMT9EFlbtqipSW0dd5Ca81RCYZaqJAK+q5sHenl
         DwOumL/x0wNEwYSG6dN/N0XJNo7KQJAQqu/JfTk3hJKcIPD9STMSzXEkeLZmB+v7C5u1
         hhRunOEHhRv0XvlpN5sFT8thWJhW+uKbTERe9lJTVxYuOr4MHlEQTsqbFobj08164Nd8
         xCrXCttqAma9+94VvVnQC00cX2kVXRoZcenaPhrCRUrjN+RyEUGzLKF5Y3GzLahkWG8Q
         45qfWH0mQFfWRmW9kng0bCjw43ImXT9LS991NrPjt821C1rfzsxSI4PKfF7oGeriQpLQ
         wEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4589FdVM+zsKR3yN77hAcXqE4h8CS6VcBEQbdsgFt6NhaPtTj+uoW8osF9/x/yz86pmA3mGKZVaHPGRFr7phtQEc6bVOfdJBqE4Dylg==
X-Gm-Message-State: AOJu0Ywmwgr2tMy8BRB1z2mgcum9Q4+O/NHUayFAsb1MRlIwCKqBcYEP
	55+osJgDEbWwMtsju5Cr529ZBPzqnWSsaZLohmXZaVt5Wlr90tveDLi2+m46L7aC/Kn/aoW3UYE
	tiT0JyDZLMmG3q1JwFZnnKY1X7NIvm1ZURpOV/Q==
X-Google-Smtp-Source: AGHT+IGKbXGa8tFRoUBtX9jPFSaA/HXwNQUkn5EBHWhOJnFoUnmXEc3piUEvQv5r8Xh65vaIT9hG5Yzp9EElL8Q42qY=
X-Received: by 2002:a05:6214:230d:b0:6b5:468e:d413 with SMTP id
 6a1803df08f44-6b5468ed608mr190751986d6.40.1719568096583; Fri, 28 Jun 2024
 02:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com> <20240621103019.783271f4@xps-13>
 <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com> <20240624083900.14e38d82@xps-13>
In-Reply-To: <20240624083900.14e38d82@xps-13>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 28 Jun 2024 11:48:05 +0200
Message-ID: <CAG+cZ06j4XACKtgwkTyjK0jhFTt+-EYTN+qFKO20ow3sjK84BA@mail.gmail.com>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_024818_265046_0FC35177 
X-CRM114-Status: GOOD (  24.77  )
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

T24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgODozOeKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiBJIGRvbid0IHNlZSBhbnkgY2hhbmdlIHJl
Z2FyZGluZyB0aGUgTkFORCBjb250cm9sbGVyIG5vZGUgaW4gdGhlIGRldmljZQo+ID4gPiB0cmVl
LCBpcyB0aGVyZSBhbnkgZGVwZW5kZW5jeSB3aXRoIG90aGVyIHBhdGNoZXMgZnJvbSB0aGUgc2Ft
ZSBwYXRjaHNldAo+ID4gPiBvciBtYXkgSSBhcHBseSB0aGlzIGRpcmVjdGx5IHRvIG5hbmQvbmV4
dD8KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBNaXF1w6hsCj4gPgo+ID4gWWVzLCB0aGlzIHBh
dGNoIGRlcGVuZHMgb24gIlt2NCwwNC8xMF0gQVJNOiBkdHM6IGxwYzMyeHg6IEFkZCBtaXNzaW5n
Cj4gPiBkbWEgYW5kIGkycyBwcm9wZXJ0aWVzIgo+ID4gd2hpY2ggd2lsbCBiZSBzcGxpdHRlZCBp
bnRvIHR3byBvciBtb3JlIHNlcGFyYXRlIHBhdGNoZXMgcGVyIHJlcXVlc3QKPiA+IGluIHRoZSBj
b21tZW50cy4KPiA+IEknZCBsaWtlIHRvIGtlZXAgZHJpdmVyIGNoYW5nZXMgYW5kIGNvcnJlc3Bv
bmRpbmcgY2hhbmdlcyBpbiBEVFMgaW4KPiA+IHRoZSBzYW1lIHBhdGNoCj4gPiBidXQgSSd2ZSBt
YWRlIGEgc2VwYXJhdGUgcGF0Y2ggZm9yIERUUyBwZXIgcmVxdWVzdCBmcm9tIHYyIG9mIHRoZSBw
YXRjaCBzZXQuCj4KPiBUaGVzZSBjaGFuZ2VzIHdvbid0IGJlIGFwcGxpZWQgdG8gdGhlIHNhbWUg
dHJpZXMgc28gdGhleSBtdXN0IGJlIHNwbGl0Lgo+Cj4gU28gSSB3aWxsIG5vdCB0YWtlIHRoaXMg
cGF0Y2ggZm9yIHRoZSBuZXh0IG1lcmdlIHdpbmRvdyBhbmQgaW5zdGVhZAo+IHdpbGwgdGFrZSBp
dCBmb3IgdGhlIG9uZSBhZnRlciwgaWYgdGhlIERUIHBhdGNoZXMgaGF2ZSBiZWVuIGFwcGxpZWQu
Cj4gUGxlYXNlIHBpbmcgbWUgYXQgLXJjMSBhZ2FpbiBpZiB0aGUgRFQgcGF0Y2hlcyBoYXZlIGdv
bmUgdGhyb3VnaC4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpIaSBNaXF1w6hsLCBwbGVhc2UgY2hl
Y2sgdjUgb2YgdGhlIHBhdGNoLCBJJ3ZlIGFkZGVkIGZhbGxiYWNrIGlmIGEgRE1BIGNhbid0IGJl
CnJlcXVlc3RlZCB1c2luZyBEVCwgdGhpcyBpcyBiYWNrd2FyZCBjb21wYXRpYmxlIHdpdGggcGxh
dGZvcm0gZGF0YSBhbmQgbm8KbG9uZ2VyIGRlcGVuZHMgb24gdGhlIERUIGNoYW5nZXMuCmh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyNDA2
MjcxNTAwNDYuMjU4Nzk1LTExLXBpb3RyLndvanRhc3pjenlrQHRpbWVzeXMuY29tLwoKLS0KUGlv
dHIgV29qdGFzemN6eWsKVGltZXN5cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
