Return-Path: <SRS0=Dlpg=BJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F1AC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 14:10:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CBA206D8
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 14:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g1tjkkTT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61CBA206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLSykET+2ppJfkq7fOg0V8e/ynEZ8Dydq9Z+cFPfjmc=; b=g1tjkkTTEEByWUEU97vbBf6Ya
	zWs/I0DnPbyM9jsKNSLfE5xfivYPd+Vh+aC2Eiq18imovD1FIiaJ1kqNNTbJBcSKsVaaLDzxTE+i6
	DHftKy8he+M9thbwfrq3B3TyHfqdta0BJigSYtHDM1SI0//EdkOIux0IXun4S+DqRs1D/S/nAFubr
	q0uK03GKm9BDkKlx84Ryhekwb8Vm+rzqHtwBLRfmJsYwv1dd/p6+n53Q4kKAnYxe+y+785DkJCLJ8
	2wz9VzKWMO7B+z4nPoH/Q2Ay0I50cyDIs/PRPp/GtdA0y605DkiyHi7JV/+mLr7aX8t3XRsDxo0Dw
	zpB12GNJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k19Fg-0001mB-A2; Thu, 30 Jul 2020 14:09:44 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k19Fd-0001iX-2a
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2020 14:09:42 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MUog3-1kABp01C0v-00QnKC for <linux-mtd@lists.infradead.org>; Thu, 30 Jul
 2020 16:09:27 +0200
Received: by mail-qt1-f179.google.com with SMTP id k18so20364774qtm.10
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jul 2020 07:09:25 -0700 (PDT)
X-Gm-Message-State: AOAM533JQhX6uDe1KwpZcbRwSUankR3SYN5UaSm4dW1bXp326vaY5Jpr
 2qWwK5PkVq3cSDZ3tDAtx8nduSYp2wvH00ieF3Y=
X-Google-Smtp-Source: ABdhPJyi9kI9tH2eVgfgqkCmMA+l204uFszK+oAlVJwFl1iWmPPCUPIZeVt8CBeEBpdFXQKzYRq+C/Bcofig8C3dcDg=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr3126506qtq.7.1596118164881;
 Thu, 30 Jul 2020 07:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
 <20200726071723.GB441916@kroah.com>
 <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
 <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
 <CAFmMkTExBY3V_Ghej7Bzjatg+vFtWq3UZmKzjAiEoR9EqnFN9Q@mail.gmail.com>
 <CAFmMkTEO7VNKJeYz2uoHsS-yN_aY8UuiQ2GcCq9NyAD5481ZGA@mail.gmail.com>
 <20200730053108.GA3861609@kroah.com>
 <CAFmMkTHXjfG7zMr0i_h65PvjAe4opPgvzdABH8W1EUGOmcA4Zg@mail.gmail.com>
In-Reply-To: <CAFmMkTHXjfG7zMr0i_h65PvjAe4opPgvzdABH8W1EUGOmcA4Zg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jul 2020 16:09:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2SN3pdXV8=0jXfrsz8L64yV46fEM4zrSXfA25QK0GNuA@mail.gmail.com>
Message-ID: <CAK8P3a2SN3pdXV8=0jXfrsz8L64yV46fEM4zrSXfA25QK0GNuA@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Daniel Gutson <daniel@eclypsium.com>
X-Provags-ID: V03:K1:/pNBbIvatG1xWDjN0c0EaMwUSb1x6d7jmo68dZvA4Xi7ubIHHJD
 mmMAmBQHpPICtGj67x96vjWnNnMVvo9Do9y7zfTY9zSoSODCJWJwtPgRcJbFDyd5Vj/mbge
 oTOgGUgxr/k9qSoncyHOq/urkX4fXip9bTuLLYF2wrQfhsmIw0a/qJ0v+LPA2HeOUuK6qJ/
 WjaLOSAU7xcFyNak2DHbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IjYkaNB9ChQ=:VWR+hIyiJaOP0cKPBZwUGv
 T7/hz+XlJO9iqonx0jToRb35JpbNzWEst0GiKfBn129cHRSmi8Ff5UAdQptvdlNk8li6uvwv2
 6HcD6J2j2B8oPrxLNElP/vd3JHk2VWpkQNYi1z5z2Q3ZEmZfg+EKyr92olgRPPaCzhUvtAKq4
 88xyVfLaDbRH4CKz7Zo9WhladB8SJeNysCJ8RPZB3NIe7A2Y11BTUF4QbHT06cQCZsSTe36x/
 vkiDUJJkGSKVusJDhxNIg0+PCYfKNmASO3cUK3VPhONz+vSvU+hqtRjyp+ApbDI9YvTPQlCYD
 s48hyPaos8n3/i4c/IoslHOD6jROTA5soNsnctO3/v5dekMxLFTgXqJG2NoQGob8hPQw0dCk0
 V4fEHyy5BYdTllZ9P30wwuzBmJfIdDT1cwNKZNvqJfpj/5wozP3fsTB4gBH71Xlt/sLNJlhN8
 n51zo2FBXQhH8bh79MbCFHCyjPzoT4B/Ejn1srAMzWk0/j38SqDYN/RlcahI9/FR+0IPe/Dxp
 qvt3TfRCmZgGIMRbyu8WdPq+vTNyiIbhrOo/tT9x0WJC1rNx+vYEuSIYqqTAsyyssp/Eamln7
 wGMIKDheUTpHs2hX9EvvTT5vFpcVVDD+TNreR3fgEmYPKVuTNqz5z1JDL5LyS7GWEHMml2CYr
 Eo6bZ/Il4lx9eeyhwGPrQxLvVSzTzLNf0LemTnbbvEIy3S3uK8hyxp3sH3+Smv5C3fiY5m33v
 xNmAYWK7EoSuCrUeC9iLopIhOD8T3B4DJ6YV/1r95INSanw784FdZhW3XZPQrZ4qvHhol+yRk
 yiApKtXPjG7dWR1/yarYst8vLTTnd+C3D3HCVr/HPFpspz7lSKryUg5PbfCzbo+tK9oA5qiFs
 B5gm+opgTJ2dyOfSNQp07sFrhApUaWU+lAUilWlQENXHXQBucRsfLRf2lrw6LSTuY459WHXQq
 RrF0X5hchMQgeh8JoshNowIL69O5Sd6/F1RmpzqDw8MMKd8UeMqme
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_100941_345006_B8B1C9CD 
X-CRM114-Status: GOOD (  18.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMjoyMSBQTSBEYW5pZWwgR3V0c29uIDxkYW5pZWxAZWNs
eXBzaXVtLmNvbT4gd3JvdGU6Cj4gRWwganVlLiwgMzAganVsLiAyMDIwIDI6MzEgYS4gbS4sIEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IGVzY3JpYmnDszoK
Pj4KPj4gQWdhaW4sIG1vZHVsZSBwYXJhbWV0ZXJzIGFyZSB3b3JraW5nIG9uIGEgcGVyLWNodW5r
LW9mLWNvZGUgYmFzaXMsIHdoaWxlCj4+IHlvdSB3YW50IHRvIHdvcmsgb24gYSBwZXItZGV2aWNl
IGJhc2lzLAo+Cj4KPiBJIHRoaW5rIHRoZXJlIGlzIGEgbWlzdW5kZXJzdGFuZGluZy4gIFdoYXQg
SSB3YW50IGlzIHRvIGNvbnRyb2wgKHR1cm4gb24gb3Igb2ZmKSBpcyBhIHZlcnkgc3BlY2lmaWMg
Y29kZSBzbmlwcGV0IHRoYXQgcHJvdmlkZXMgdGhlICJmdW5jdGlvbmFsaXR5IiBvZiB0cnlpbmcg
dG8gdHVybiB0aGUgY2hpcCB3cml0YWJsZS4gVGhlIHJlc3Qgb2YgdGhlIGRldmljZSBkcml2ZXIg
aXMgZmluZS4KPiBJIGFzc3VtZSB0aGF0IHRoZSBvbmUgdGhhdCBkb2Vzbid0IHVuZGVyc3RhbmQg
aXMgbWUuCj4KCkkgbG9va2VkIGF0IHRoZSBzb3VyY2UgY29kZSBhZ2FpbiBhbmQgZm91bmQgdGhh
dCB0aGUgZXhpc3RpbmcgbW9kdWxlCnBhcmFtZXRlciBhcHBsaWVzIHRvIGJvdGggdGhlIHBsYXRm
b3JtIGFuZCBwY2kgZGV2aWNlIGZyb250LWVuZHMsIGJvdGgKb2Ygd2hpY2ggZ28gdGhyb3VnaAoK
ICAgICAgICAvKiBQcmV2ZW50IHdyaXRlcyBpZiBub3QgZXhwbGljaXRseSBlbmFibGVkICovCiAg
ICAgICAgaWYgKCFpc3BpLT53cml0ZWFibGUgfHwgIXdyaXRlYWJsZSkKICAgICAgICAgICAgICAg
IGlzcGktPm5vci5tdGQuZmxhZ3MgJj0gfk1URF9XUklURUFCTEU7CgpTZXR0aW5nIHRoZSBQQ0kg
ZGV2aWNlIHdyaXRhYmxlIGluIGhhcmR3YXJlIG1ha2VzIGl0IHBvc3NpYmxlIHRvCmFjdHVhbGx5
IHdyaXRlIHRvIGl0ICpvbmx5KiBpZiB0aGUgbW9kdWxlIHBhcmFtZXRlciBpcyBhbHNvIHNldCB0
byAnMScuCk9uZSBtaWdodCBkaXNhZ3JlZSB3aXRoIHRoYXQgZGVzaWduLCBidXQgSSBkb24ndCB0
aGluayB5b3VyIHBhdGNoCndvdWxkIG1ha2UgaXQgYW55IGJldHRlciwgaXQganVzdCBtZWFucyBv
bmUgd291bGQgaGF2ZSB0byBzZXQKdHdvIG1vZHVsZSBwYXJhbWV0ZXJzIGluc3RlYWQgb2Ygb25l
LgoKICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
