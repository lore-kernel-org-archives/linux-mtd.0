Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C3C5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVxOtLw1x9frAoDZTWGdmtxWnJXQ/QXtHZdQQI3BuXs=; b=G8mCqiS6HeM/Bw
	OAyVTbU2K9XYhsae12RB9fdqRbHe66d/ADEUpcpMG9L7AvsLOSh4rT2shF9dfQeYNEjEBn5xamBz/
	mL6BjyDLoYut28iR+U3bxGCvVVtdJSGYZOFuP2Rm/HF2aU995isd3Nu+v0O61yAj4X/Bbn8GrzYh6
	UkSPiDZeKFKbrNlI0vwPHJXmmB76kB0hsBZ23n7MlD1SVt5G3WoGpKgMUdUAjcoRtk1QGYhPAyGqM
	wb4IxLpeNrPagFwC0aYhelOiefiuTrn3VBxWdhPCLxhlrK2p5jRrmFSDeGLsimSwiN/aDHCZ7jlu1
	iQHQbpHq9Al+zS0I5tWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvp6-0000000F5DH-2SuJ;
	Tue, 11 Aug 2026 23:23:56 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvp3-0000000F5Cd-3p8G
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 23:23:55 +0000
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=WfwfkO6T;
	dkim-atps=neutral
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 8329173F
	for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 08:23:47 +0900 (JST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so1509887a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 16:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786490626; x=1787095426; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poCJy7EhTAZaAcqpQDKZJc01iAhjKgRkc0yZroaBdLs=;
        b=WfwfkO6T+ayGslkzMfPlpLEid6GJ1YMKJcNdFI8uZWN2NfOutnAuJSpFuQUUj9lf5L
         z2qwPw/Inlx9u5X0pN6adVJxomFxHh1B8SKbZE2ilDRonoitDrraxm3ZYyP2Ojfn9XZq
         qmmzHI2+eGkah9in7uUpD0xHt5r7xIo3iQb4L07+X1vy0jTAOzB1z+/ETpHfS2npUP/R
         o8pNASOB8+rbiasNNam61kIj4EyUW5hsyNxJNx1FzAhsKyW8VLeFjW70RKxD4h+OFEjd
         E86T+nRzLs/9f75aCW2YjwQVmusZp8rz5IniWsRl0EXjUYcRuMMRWOQQpSSr/Cm1MY5E
         o/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786490626; x=1787095426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=poCJy7EhTAZaAcqpQDKZJc01iAhjKgRkc0yZroaBdLs=;
        b=NwsivLI3VQt7A0maoikWn1ztao0VMD6AHswH82x7M58mw1XlqCMJim0ROTJqrUVvJN
         lIcFpLHhIdGj5ewpUJso/QHLZ/2R32GN+gzWfdpOzszZx7CEI6GyHeq+W6XbbsGXDu15
         bC39KTPDtLaQLQm68eegaTjDwOm7H8dkXGoRo4qqcOdKlTvc4aT8iQObupQkuXJlRPr+
         ubgTLl5KbDsUsE4kK5NsDQeOuXoyw0WVGBDLsQEfmDpEZkvQnd24MOccfAvqmZRw2phz
         7/rm4qnsw2CD32xJOiQw/oB2FL1FnyBnfd5a/zfnBEbUEJ0KYPl1aGl7YSj2PZdrTjyL
         VH9w==
X-Forwarded-Encrypted: i=1; AHgh+RpZHwHW/ynTcqMOePBIEDXAkDCWc4DaMGk5vB9qXS/9d23lKc+1zs2QBi4CtC80omziU4We4fhw6Zw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+7i6I9l2mVW276y7kdGOP2Z3fkKuZkXUiQ6YldC8BLMGDan4P
	PgPg2jDqiJVoG2rYEfOQ5SIolYN9p2nKhBcrgc04cwIDjVw80e1idBdC2ZOFyg4asQm8B73w9oz
	YGUdv0QWdqhpA71MQQQTk0IGCsrGdUdtY9sFf+LN8LjMym25mg6/HqsjL4QnTQHSshaSlLAxc/V
	y5
X-Gm-Gg: AR+sD10A+8l+TLd2S4XrBfZqzV3yg9J5IiCAIbb2165FOVBnPjUtmBo1fz30Ke/XiN9
	m5AniEQwS/rpIK9Ctycb2C+/+5jPWFXZTjonrz6app72LsHdD3nstJ30d6spufeRG+ZFOeqDvP+
	Hjqb1/v2lIRNY2BDS3SDr3ZM4/k0aLpvu07bcUgXvgyFoN+aRSpZrxpfxLA6BsYZSv64gW0Ur18
	DCZ+IlneDEgJZKdWoi97eBTJM/LSm4lesSYvMQU9My50GoGprEpLU/FA/Hvt7OfHe1wSthxzPru
	aAvUxCYqViJST+yQ1SAijJWC/qYEB2XR9D6itb5c5sJn2/1ZbIhDdfLB0c4Issh26RJ12NwTaH5
	7Ak4thi9Hs+VJSnjgn9oGSun1V5F8JkrFs8mQKboOai122xeE
X-Received: by 2002:a17:90b:6cd:b0:390:b3c5:e2c9 with SMTP id 98e67ed59e1d1-39302bce9e4mr159107a91.17.1786490626366;
        Tue, 11 Aug 2026 16:23:46 -0700 (PDT)
X-Received: by 2002:a17:90b:6cd:b0:390:b3c5:e2c9 with SMTP id 98e67ed59e1d1-39302bce9e4mr159077a91.17.1786490625706;
        Tue, 11 Aug 2026 16:23:45 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-392fe4a8c05sm260990a91.2.2026.08.11.16.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:23:44 -0700 (PDT)
Date: Wed, 12 Aug 2026 08:23:33 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	tudor.ambarus@linaro.org, s-k6@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 1/2] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <anuu9USjU4GXBMC3@atmark-techno.com>
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
 <20260807064339.1632249-2-md.alam@oss.qualcomm.com>
 <anmLsPcXRk0VAQSW@atmark-techno.com>
 <ansYUoNKJyDQ+6f2@hu-mdalam-blr.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ansYUoNKJyDQ+6f2@hu-mdalam-blr.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_162354_180071_01B0CF79 
X-CRM114-Status: GOOD (  21.21  )
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

TWQgU2FkcmUgQWxhbSB3cm90ZSBvbiBUdWUsIEF1ZyAxMSwgMjAyNiBhdCAwNjoxMDo1MFBNICsw
NTMwOgo+ID4gSSBhZ3JlZSB3aXRoIE1pcXXDqGwgdGhhdCB5b3VyIHBhdGNoIGxvb2tzIG9kZCwg
eW91IHdyb3RlCj4gPiA+ICsJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMTI4LCA2NCwgMjA0
OCwgNDAsIDEsIDEsIDEpLAo+ID4gYnV0IHRoZSBlcmFzZSBibG9ja3MgYXJlIDI1NksgbG9uZyBz
byBpdCBzaG91bGQgYmUKPiA+ICsJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwg
MjA0OCwgNDAsIDEsIDEsIDEpLAoKKEkgbWlzcmVtZW1iZXJlZCBOQU5EX01FTU9SRygpIGZpZWxk
cywgdGhlIDI1NiBpcyBpbmRlZWQgdGhlIE9PQiBhcmVhCnNpemUgYXMgeW91IHBvaW50ZWQgb3V0
OyB0aGUgZXJhc2UgYmxvY2tzIHdlcmUgYWxyZWFkeSBjb3JyZWN0IGF0IDY0CnBhZ2VzID0gMjU2
S0Igc28gd2hpbGUgdGhlIHNldHRpbmdzIHdlcmUgd3JvbmcgdGhpcyBtaWdodCBhY3R1YWxseSBu
b3QKYmUgdmlzaWJsZSBhdCBhbGwgaW4gcXVpY2sgdGVzdGluZzsgc29ycnkpCgo+ID4gRldJVywg
SSd2ZSBjb25maXJtZWQgaXQgd29ya3Mgd2l0aCB0aGUgZm9sbG93aW5nIGRpZmYgKGF0IGxlYXN0
IHVwIHRvCj4gPiB0aGUgcG9pbnQgb2YgY3JlYXRpbmcgYW4gdWJpIHZvbHVtZSBhbmQgYm9vdGlu
ZyBmcm9tIGl0KTsgaGFwcHkgdG8gc2VuZAo+ID4gdGhpcyBhcyBhIHBhdGNoIGlmIHRoaXMgaGFz
IGluZGVlZCBub3QgYmVlbiB0ZXN0ZWQKPgo+IFRoaXMgZGV2aWNlIHdhcyBzdXBwb3J0ZWQgaW4g
b3VyIGRvd25zdHJlYW0gdHJlZSBhbmQgd2FzIHRlc3RlZCB0aGVyZS4gSQo+IHBpY2tlZCB0aGF0
IHBhdGNoIGFuZCBwb3N0ZWQgaXQgdXBzdHJlYW0gYXNzdW1pbmcgdGhlIGNvbmZpZ3VyYXRpb24g
d2FzCj4gYWxyZWFkeSBjb3JyZWN0Lgo+IFRoZSBgMTI4YCBpbjoKPiBOQU5EX01FTU9SRygxLCA0
MDk2LCAxMjgsIDY0LCAyMDQ4LCA0MCwgMSwgMSwgMSkKPiB3YXMgbXkgbWlzdGFrZS4gSXQgc2hv
dWxkIGluZGVlZCBiZSBgMjU2YCwgbWF0Y2hpbmcgdGhlIDQwOTYgKyAyNTYgcGFnZQo+IGxheW91
dCBpbiB0aGUgVzI1TjA0TFcgZGF0YXNoZWV0Lgo+IFBsZWFzZSBnbyBhaGVhZCBhbmQgcG9zdCB5
b3VyIHRlc3RlZCBwYXRjaC4gSSBkbyBub3QgY3VycmVudGx5IGhhdmUgdGhpcwo+IGRldmljZSBh
dmFpbGFibGUgdG8gcmV0ZXN0IHRoZSB1cHN0cmVhbSB2ZXJzaW9uLgoKT2ssIGxldCBtZSBkbyBz
b21lIHNsaWdodGx5IG1vcmUgdGhvcm91Z2ggY2hlY2tzIGFuZCBjbGVhbiB1cCBhIGJpdCBhbmQK
SSdsbCBzZW5kIGEgdjIgbGF0ZXIgdGhpcyB3ZWVrL2Vhcmx5IG5leHQgd2VlawoKVGhlIGNvbnRp
bnVvdXMgcmVhZCBmZWF0dXJlIGFsc28gZGVmaW5pdGVseSBpcyBpbnRlcmVzdGluZyB0byBtZSBh
bmQKSSdsbCBiZSB0ZXN0aW5nIGl0IGxhdGVyLCBidXQgaXQncyAianVzdCIgYSBwZXJmb3JtYW5j
ZSBpbXByb3ZlbWVudCBzbwpJJ2xsIGJlIHRha2luZyBhIGJpdCBsb25nZXI7IEknbGwgY29tZSBi
YWNrIHdpdGggZWl0aGVyIGEgcGF0Y2ggb3IKcXVlc3Rpb25zIGhvcGVmdWxseSBieSBuZXh0IG1v
bnRoIGlzaAoKVGhhbmtzLAotLSAKRG9taW5pcXVlCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
