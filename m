Return-Path: <SRS0=tlyf=UP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D924C31E50
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jun 2019 13:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5020A2133D
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jun 2019 13:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ylt9PNpp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jqh/7GCN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5020A2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8+AyGAGB7+B0OllOUPwBEItUe3TDo4WtYQ7+XKtzQY=; b=Ylt9PNpptYRotb
	Xh7vlc+g2Yk+x8+zXtFjEleCVNRFa5TP1H+oQeY/vtTUL7MaKsLEvgX/22QxsVeSghlmBPMTOpudq
	mJ4Fuh7QCn0oZZSqQ13djGfvmMJGfFYM9mfGkX7+RPs1e9h19NKale3rNmVyPxn9As0lNkjt0ZSBN
	8Mg4K6c51Uz0ElFJTNoTt4emrhqrELbf45Ke8u/TnX2+1Q9ABzJvqqFfczuv3N+fl52mfCPYtj4jP
	rlSb2w7WqgoWzJ+cN3mMhq+u7NycDS22BoogOc5LmZ1u7Jg7baXd2ENGpYy4sIlgZAqRv2YM8LmSL
	WGL8Q1TmQhcx764nNpYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcVRG-00016q-7c; Sun, 16 Jun 2019 13:43:18 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcVRA-00016W-QY
 for linux-mtd@lists.infradead.org; Sun, 16 Jun 2019 13:43:14 +0000
Received: by mail-lf1-x144.google.com with SMTP id z15so4624948lfh.13
 for <linux-mtd@lists.infradead.org>; Sun, 16 Jun 2019 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DXWZ5UexIRmyYBBuMtlnLVrDXtCKcTUdxpXDAAOej+g=;
 b=Jqh/7GCNsbS9Rm7Op/IcbqbEAR0Hah0BL8OWuNuB7Zn5tie4O8zgUxR2hgU+cGtujY
 cy512hrMBnuXvStpN8IYc3o+880f1MYC63uz3Mtqi3C3Ptnk1iMjqKYwMN7QyXpj9yNx
 j8gu1AwmQMrgQosW+nNLOgYFPUF8jqJoIrlvoDLCjq5gAdkkCA6w+d5LvsWs+EH4ymoc
 F3hSoE4HlB1VFHVsCa/2kMwKm27kmd1y7J7Nrm7WpcdVbEdMtLM9Zie9UcldNysdyjIi
 4AZRwKDZ/d5BqJ/qhptizaTt1ilVwa1svjpBIoovZ9Nz6nIxh66UomuYzKwXB1snNabJ
 vZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DXWZ5UexIRmyYBBuMtlnLVrDXtCKcTUdxpXDAAOej+g=;
 b=HX29BFxd93E0B3zBXOWD6hX0PMzzKUmhM0gD18PGJgsymRmpb1MUgsQUzLu/Xdnb0D
 tRiHvqzWFXntQ3OzfKx1to4QEokKbN8NH9mTocWWkc89LxI5Km6U7Mlc+66TcbvqfK44
 ekhOohr0X8v+IG2VO9ukZaD38ydshd0GOt+W9RGaM0/C05psYlAB6CoSKPXMQ1vJlHQG
 soEG2WXzqDUJcObL8oSkwHVxvz+Pwske+zFHeHGkiLQtNuvpCQBY9U8xluhpw93UkECJ
 oKhz4tdTW6kfjTLZv0GFhyvl9uz9wNAyCVAgnkgUVyVDSWlm4bdPs7g7DNQzIRSmP/oA
 b7aA==
X-Gm-Message-State: APjAAAU29sy9y8sUY50kG+Ivjm8uWr8rb8sEDSrHPmqQra41Z/vB3mQG
 0/RPGCGlLlWCeOHhRqdjbEMpTuB1
X-Google-Smtp-Source: APXvYqwIJUYGhAV4LJMP9F0yUkW3PLBdZZBvaMA/cMwvm7NvnZ0q2khKahtU1sAs6kewCVnMBDirsA==
X-Received: by 2002:a19:24d5:: with SMTP id
 k204mr22338825lfk.190.1560692590570; 
 Sun, 16 Jun 2019 06:43:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru.
 [91.79.162.197])
 by smtp.googlemail.com with ESMTPSA id y15sm1301596lfg.43.2019.06.16.06.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Jun 2019 06:43:09 -0700 (PDT)
Subject: Re: [v3 1/2] mtd: nand: Add Cadence NAND controller driver
To: Piotr Sroka <piotrs@cadence.com>, linux-kernel@vger.kernel.org
References: <20190614150638.28383-1-piotrs@cadence.com>
 <20190614150956.31244-1-piotrs@cadence.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd96bd1b-e944-e95d-31c9-6dd1d0b5720f@gmail.com>
Date: Sun, 16 Jun 2019 16:42:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190614150956.31244-1-piotrs@cadence.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_064312_887366_CE2DBFAF 
X-CRM114-Status: GOOD (  22.63  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Burton <paul.burton@mips.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MTQuMDYuMjAxOSAxODowOSwgUGlvdHIgU3Jva2Eg0L/QuNGI0LXRgjoKCkNvbW1pdCBkZXNjcmlw
dGlvbiBpcyBtYW5kYXRvcnkuCgo+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFNyb2thIDxwaW90cnNA
Y2FkZW5jZS5jb20+Cj4gLS0tCgpbc25pcF0KCj4gKwo+ICsvKiBDYWRuZW5jZSBOQU5EIGZsYXNo
IGNvbnRyb2xsZXIgY2FwYWJpbGl0aWVzIGdldCBmcm9tIGRyaXZlciBkYXRhLiAqLwo+ICtzdHJ1
Y3QgY2FkZW5jZV9uYW5kX2R0X2RldmRhdGEgewo+ICsJLyogU2tldyB2YWx1ZSBvZiB0aGUgb3V0
cHV0IHNpZ25hbHMgb2YgdGhlIE5BTkQgRmxhc2ggaW50ZXJmYWNlLiAqLwo+ICsJdTMyIGlmX3Nr
ZXc7Cj4gKwkvKiBJdCBpbmZvcm1zIGlmIGFnaW5nIGZlYXR1cmUgaW4gdGhlIERMTCBQSFkgc3Vw
cG9ydGVkLiAqLwo+ICsJdTggcGh5X2RsbF9hZ2luZzsKPiArCS8qCj4gKwkgKiBJdCBpbmZvcm1z
IGlmIHBlciBiaXQgZGVza2V3IGZvciByZWFkIGFuZCB3cml0ZSBwYXRoIGluCj4gKwkgKiB0aGUg
UEhZIGlzIHN1cHBvcnRlZC4KPiArCSAqLwo+ICsJdTggcGh5X3Blcl9iaXRfZGVza2V3Owo+ICsJ
LyogSXQgaW5mb3JtcyBpZiBzbGF2ZSBETUEgaW50ZXJmYWNlIGlzIGNvbm5lY3RlZCB0byBETUEg
ZW5naW5lLiAqLwo+ICsJdTggaGFzX2RtYTsKClRoZXJlIGlzIG5vIG5lZWRlZCB0byBkZWRpY2F0
ZSA4IGJpdHMgdG8gYSB2YXJpYWJsZSBpZiB5b3Ugb25seSBjYXJlIGFib3V0IGEgc2luZ2xlCmJp
dC4gWW91IG1heSB3cml0ZSB0aGlzIGFzOgoKYm9vbCBoYXNfZG1hIDogMTsKCltzbmlwXQoKPiAr
c3RhdGljIHN0cnVjdAo+ICtjZG5zX25hbmRfY2hpcCAqdG9fY2Ruc19uYW5kX2NoaXAoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCkKPiArewo+ICsJcmV0dXJuIGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1
Y3QgY2Ruc19uYW5kX2NoaXAsIGNoaXApOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0Cj4gK2Nk
bnNfbmFuZF9jdHJsICp0b19jZG5zX25hbmRfY3RybChzdHJ1Y3QgbmFuZF9jb250cm9sbGVyICpj
b250cm9sbGVyKQo+ICt7Cj4gKwlyZXR1cm4gY29udGFpbmVyX29mKGNvbnRyb2xsZXIsIHN0cnVj
dCBjZG5zX25hbmRfY3RybCwgY29udHJvbGxlcik7Cj4gK30KCkl0J3MgYmV0dGVyIHRvIGlubGlu
ZSBleHBsaWNpdGx5IHN1Y2ggY2FzZXMgYmVjYXVzZSB0aGV5IHdvbid0IGdldCBpbmxpbmVkIHdp
dGggc29tZQprZXJuZWwgY29uZmlndXJhdGlvbnMsIGxpa2UgZW5hYmxlZCBmdHJhY2luZyBmb3Ig
ZXhhbXBsZS4KCj4gK3N0YXRpYyBib29sCj4gK2NhZGVuY2VfbmFuZF9kbWFfYnVmX29rKHN0cnVj
dCBjZG5zX25hbmRfY3RybCAqY2Ruc19jdHJsLCBjb25zdCB2b2lkICpidWYsCj4gKwkJCXUzMiBi
dWZfbGVuKQo+ICt7Cj4gKwl1OCBkYXRhX2RtYV93aWR0aCA9IGNkbnNfY3RybC0+Y2FwczIuZGF0
YV9kbWFfd2lkdGg7Cj4gKwo+ICsJcmV0dXJuIGJ1ZiAmJiB2aXJ0X2FkZHJfdmFsaWQoYnVmKSAm
Jgo+ICsJCWxpa2VseShJU19BTElHTkVEKCh1aW50cHRyX3QpYnVmLCBkYXRhX2RtYV93aWR0aCkp
ICYmCj4gKwkJbGlrZWx5KElTX0FMSUdORUQoYnVmX2xlbiwgZGF0YV9kbWFfd2lkdGgpKTsKPiAr
fQo+ICsKPiArc3RhdGljIGludCBjYWRlbmNlX25hbmRfd2FpdF9mb3JfdmFsdWUoc3RydWN0IGNk
bnNfbmFuZF9jdHJsICpjZG5zX2N0cmwsCj4gKwkJCQkgICAgICAgdTMyIHJlZ19vZmZzZXQsIHUz
MiB0aW1lb3V0X3VzLAo+ICsJCQkJICAgICAgIHUzMiBtYXNrLCBib29sIGlzX2NsZWFyKQo+ICt7
Cj4gKwl1MzIgdmFsOwo+ICsJaW50IHJldCA9IDA7Cj4gKwo+ICsJcmV0ID0gcmVhZGxfcG9sbF90
aW1lb3V0KGNkbnNfY3RybC0+cmVnICsgcmVnX29mZnNldCwKPiArCQkJCSB2YWwsICEodmFsICYg
bWFzaykgPT0gaXNfY2xlYXIsCj4gKwkJCQkgMTAsIHRpbWVvdXRfdXMpOwoKQXBwYXJlbnRseSB5
b3UgZG9uJ3QgY2FyZSBhYm91dCBoYXZpbmcgbWVtb3J5IGJhcnJpZXIgaGVyZSwgaGVuY2UKcmVh
ZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQoKS4KCj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWRldl9l
cnIoY2Ruc19jdHJsLT5kZXYsCj4gKwkJCSJUaW1lb3V0IHdoaWxlIHdhaXRpbmcgZm9yIHJlZyAl
eCB3aXRoIG1hc2sgJXggaXMgY2xlYXIgJWRcbiIsCj4gKwkJCXJlZ19vZmZzZXQsIG1hc2ssIGlz
X2NsZWFyKTsKPiArCX0KPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50
IGNhZGVuY2VfbmFuZF9zZXRfZWNjX2VuYWJsZShzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwgKmNkbnNf
Y3RybCwKPiArCQkJCSAgICAgICBib29sIGVuYWJsZSkKPiArewo+ICsJdTMyIHJlZzsKPiArCj4g
KwlpZiAoY2FkZW5jZV9uYW5kX3dhaXRfZm9yX3ZhbHVlKGNkbnNfY3RybCwgQ1RSTF9TVEFUVVMs
Cj4gKwkJCQkJMTAwMDAwMCwKPiArCQkJCQlDVFJMX1NUQVRVU19DVFJMX0JVU1ksIHRydWUpKQo+
ICsJCXJldHVybiAtRVRJTUVET1VUOwo+ICsKPiArCXJlZyA9IHJlYWRsKGNkbnNfY3RybC0+cmVn
ICsgRUNDX0NPTkZJR18wKTsKPiArCj4gKwlpZiAoZW5hYmxlKQo+ICsJCXJlZyB8PSBFQ0NfQ09O
RklHXzBfRUNDX0VOOwo+ICsJZWxzZQo+ICsJCXJlZyAmPSB+RUNDX0NPTkZJR18wX0VDQ19FTjsK
PiArCj4gKwl3cml0ZWwocmVnLCBjZG5zX2N0cmwtPnJlZyArIEVDQ19DT05GSUdfMCk7CgpBbmQg
aGVyZS4uIGxvb2tzIGxpa2UgdGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlIG1lbW9yeSBiYXJyaWVz
LCBoZW5jZSB1c2UgdGhlIHJlbGF4ZWQKdmVyc2lvbnMgb2YgcmVhZGwvd3JpdGVsLiBTYW1lIGZv
ciB0aGUgcmVzdCBvZiB0aGUgcGF0Y2guCgo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRp
YyB2b2lkIGNhZGVuY2VfbmFuZF9zZXRfZWNjX3N0cmVuZ3RoKHN0cnVjdCBjZG5zX25hbmRfY3Ry
bCAqY2Ruc19jdHJsLAo+ICsJCQkJCSAgdTggY29ycl9zdHJfaWR4KQo+ICt7Cj4gKwl1MzIgcmVn
Owo+ICsKPiArCWlmIChjZG5zX2N0cmwtPmN1cnJfY29ycl9zdHJfaWR4ID09IGNvcnJfc3RyX2lk
eCkKPiArCQlyZXR1cm47Cj4gKwo+ICsJcmVnID0gcmVhZGwoY2Ruc19jdHJsLT5yZWcgKyBFQ0Nf
Q09ORklHXzApOwo+ICsJcmVnICY9IH5FQ0NfQ09ORklHXzBfQ09SUl9TVFI7Cj4gKwlyZWcgfD0g
RklFTERfUFJFUChFQ0NfQ09ORklHXzBfQ09SUl9TVFIsIGNvcnJfc3RyX2lkeCk7Cj4gKwl3cml0
ZWwocmVnLCBjZG5zX2N0cmwtPnJlZyArIEVDQ19DT05GSUdfMCk7Cj4gKwo+ICsJY2Ruc19jdHJs
LT5jdXJyX2NvcnJfc3RyX2lkeCA9IGNvcnJfc3RyX2lkeDsKPiArfQo+ICsKPiArc3RhdGljIHU4
IGNhZGVuY2VfbmFuZF9nZXRfZWNjX3N0cmVuZ3RoX2lkeChzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwg
KmNkbnNfY3RybCwKPiArCQkJCQkgICAgdTggc3RyZW5ndGgpCj4gK3sKPiArCXU4IGksIGNvcnJf
c3RyX2lkeCA9IDA7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IEJDSF9NQVhfTlVNX0NPUlJfQ0FQ
UzsgaSsrKSB7Cj4gKwkJaWYgKGNkbnNfY3RybC0+ZWNjX3N0cmVuZ3Roc1tpXSA9PSBzdHJlbmd0
aCkgewo+ICsJCQljb3JyX3N0cl9pZHggPSBpOwo+ICsJCQlicmVhazsKPiArCQl9Cj4gKwl9CgpJ
cyBpdCBhIGVycm9yIGNhc2Ugd2hlbiBpID09IEJDSF9NQVhfTlVNX0NPUlJfQ0FQUz8KCj4gKwly
ZXR1cm4gY29ycl9zdHJfaWR4Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGNhZGVuY2VfbmFuZF9z
ZXRfc2tpcF9tYXJrZXJfdmFsKHN0cnVjdCBjZG5zX25hbmRfY3RybCAqY2Ruc19jdHJsLAo+ICsJ
CQkJCSAgICB1MTYgbWFya2VyX3ZhbHVlKQo+ICt7Cj4gKwl1MzIgcmVnID0gMDsKPiArCj4gKwlp
ZiAoY2FkZW5jZV9uYW5kX3dhaXRfZm9yX3ZhbHVlKGNkbnNfY3RybCwgQ1RSTF9TVEFUVVMsCj4g
KwkJCQkJMTAwMDAwMCwKPiArCQkJCQlDVFJMX1NUQVRVU19DVFJMX0JVU1ksIHRydWUpKQo+ICsJ
CXJldHVybiAtRVRJTUVET1VUOwo+ICsKPiArCXJlZyA9IHJlYWRsKGNkbnNfY3RybC0+cmVnICsg
U0tJUF9CWVRFU19DT05GKTsKPiArCXJlZyAmPSB+U0tJUF9CWVRFU19NQVJLRVJfVkFMVUU7Cj4g
KwlyZWcgfD0gRklFTERfUFJFUChTS0lQX0JZVEVTX01BUktFUl9WQUxVRSwKPiArCQkgICAgbWFy
a2VyX3ZhbHVlKTsKPiArCj4gKwl3cml0ZWwocmVnLCBjZG5zX2N0cmwtPnJlZyArIFNLSVBfQllU
RVNfQ09ORik7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgY2FkZW5j
ZV9uYW5kX3NldF9za2lwX2J5dGVzX2NvbmYoc3RydWN0IGNkbnNfbmFuZF9jdHJsICpjZG5zX2N0
cmwsCj4gKwkJCQkJICAgIHU4IG51bV9vZl9ieXRlcywKPiArCQkJCQkgICAgdTMyIG9mZnNldF92
YWx1ZSwKPiArCQkJCQkgICAgaW50IGVuYWJsZSkKPiArewo+ICsJdTMyIHJlZyA9IDA7Cj4gKwl1
MzIgc2tpcF9ieXRlc19vZmZzZXQgPSAwOwoKUGxlYXNlIGRvbid0IGluaXRpYWxpemUgdmFyaWFi
bGVzIGlmIG5vdCBuZWNlc3NhcnkuIFlvdSBjb3VsZCBhbHNvIHdyaXRlIHRoaXMgaW4gYQpzaW5n
bGUgbGluZS4KCgl1MzIgc2tpcF9ieXRlc19vZmZzZXQsIHJlZzsKClNhbWUgZm9yIHRoZSByZXN0
IG9mIHRoZSBwYXRjaC4KCj4gKwlpZiAoY2FkZW5jZV9uYW5kX3dhaXRfZm9yX3ZhbHVlKGNkbnNf
Y3RybCwgQ1RSTF9TVEFUVVMsCj4gKwkJCQkJMTAwMDAwMCwKPiArCQkJCQlDVFJMX1NUQVRVU19D
VFJMX0JVU1ksIHRydWUpKQo+ICsJCXJldHVybiAtRVRJTUVET1VUOwo+ICsKPiArCWlmICghZW5h
YmxlKSB7Cj4gKwkJbnVtX29mX2J5dGVzID0gMDsKPiArCQlvZmZzZXRfdmFsdWUgPSAwOwo+ICsJ
fQo+ICsKPiArCXJlZyA9IHJlYWRsKGNkbnNfY3RybC0+cmVnICsgU0tJUF9CWVRFU19DT05GKTsK
PiArCXJlZyAmPSB+U0tJUF9CWVRFU19OVU1fT0ZfQllURVM7Cj4gKwlyZWcgfD0gRklFTERfUFJF
UChTS0lQX0JZVEVTX05VTV9PRl9CWVRFUywKPiArCQkgICAgbnVtX29mX2J5dGVzKTsKPiArCXNr
aXBfYnl0ZXNfb2Zmc2V0ID0gRklFTERfUFJFUChTS0lQX0JZVEVTX09GRlNFVF9WQUxVRSwKPiAr
CQkJCSAgICAgICBvZmZzZXRfdmFsdWUpOwo+ICsKPiArCXdyaXRlbChyZWcsIGNkbnNfY3RybC0+
cmVnICsgU0tJUF9CWVRFU19DT05GKTsKPiArCXdyaXRlbChza2lwX2J5dGVzX29mZnNldCwgY2Ru
c19jdHJsLT5yZWcgKyBTS0lQX0JZVEVTX09GRlNFVCk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30K
PiArCj4gKy8qIEZ1Y250aW9ucyBlbmFibGVzL2Rpc2FibGVzIGhhcmR3YXJlIGRldGVjdGlvbiBv
ZiBlcmFzZWQgZGF0YSAqLwoKcy9GdWNudGlvbnMvRnVuY3Rpb24vLCBwbGVhc2UgdXNlIHNwZWxs
Y2hlY2tlci4gSSdkIGFsc28gcmVjb21tZW5kIHRvIHN0YXJ0IGFsbApzaW5nbGUtbGluZSBjb21t
ZW50cyB3aXRoIGEgbG93ZXIgY2FzZSAoYW5kIHdpdGhvdXQgYSBkb3QgaW4gdGhlIGVuZCkgYmVj
YXVzZSBpdCBpcyBhCm1vcmUgY29tbW9uIHN0eWxlIGluIHRoZSBrZXJuZWwgYW5kIGlzIGEgYml0
IGVhc2llciBmb3IgdGhlIGV5ZXMuCgpbc25pcF0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
