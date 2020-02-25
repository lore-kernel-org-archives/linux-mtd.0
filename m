Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71947C35DF9
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 09:25:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C43A21556
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 09:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7F8vVx9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CXwcLfxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C43A21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sf7gsFo/GWOUqiQ1IsyjR54xhMPDqLIF7p1RWIQUKLA=; b=f7F8vVx9nmnrcf
	7OtQzBTILjqVfocvwnSodVK2pguFtkLDSZmr7zNS7sqj3vdbPJBoiUlaEiRd5GZWI4GpX8xb/hk4j
	DoLt6pL/bC1jIjFwvfmChPAEuPJvjprADJI+oVco0LRDqq5XR+aN7uMcby118O39MZ4Kr8OtBOc3G
	5WoQfu9Ii+jBtyU5uaafsjZH8JG/ZOznA6AnUqbzOpifXvqiKoGfIV9EWkbjTvM/VK/Glt5IC/Fkr
	cSemFB56A9EcWO4Bzz8/mVEBLYA4WHhVWC8ApcYt4M6tvA1lUhgPXa9o5aPTbgzNr2i5e2DBHMCO4
	+axle7rvGbO4/EX3NDMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6WT1-0000ZI-AV; Tue, 25 Feb 2020 09:25:27 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6WSw-0000YH-Dz
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 09:25:26 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200225092518epoutp01d1f67f67bc0a5db95bb1323824b210ab~2mvob_3FO0992709927epoutp012
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2020 09:25:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200225092518epoutp01d1f67f67bc0a5db95bb1323824b210ab~2mvob_3FO0992709927epoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582622718;
 bh=xx9FVbxqVW2d5T9MZlmmGqmGNMhEHzcIlxFt6Kp8Bcg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CXwcLfxQgTBuVykW3zI8jAKOb4wr9F5DK2IpIGTmU/mj5/wL5+Tx0+twiUlvnJt91
 CAfNCOIevAI/0JueYFvEXqA/tiAfrX8En3BShCgL+kzFvv98sITBxGH7CEiLvxNdN7
 RODENO3PwDJMkesiJWxIgslvJdsyBGvzA+8jeoE4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200225092517epcas1p1af4c14abe0ec07995db484158914e8ac~2mvoI4LUP1495914959epcas1p1h;
 Tue, 25 Feb 2020 09:25:17 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.161]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48RYSD6GWRzMqYkX; Tue, 25 Feb
 2020 09:25:16 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 32.13.57028.CF7E45E5; Tue, 25 Feb 2020 18:25:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200225092516epcas1p35047a5029f7a01440f825a8daa8c1a08~2mvnCSKEV2253922539epcas1p3H;
 Tue, 25 Feb 2020 09:25:16 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200225092516epsmtrp2c2fe1eefe4991f0d3712d5220f7197a4~2mvnBgCUn1012210122epsmtrp2n;
 Tue, 25 Feb 2020 09:25:16 +0000 (GMT)
X-AuditID: b6c32a35-4f3ff7000001dec4-56-5e54e7fcddb7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C8.31.06569.CF7E45E5; Tue, 25 Feb 2020 18:25:16 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200225092516epsmtip18a428e782dadef3749b1917675f6a9c9~2mvm49fjc0200402004epsmtip1d;
 Tue, 25 Feb 2020 09:25:16 +0000 (GMT)
Message-ID: <e8f1b9fe0eec19d884c21b4cdd3f893c5b82c61f.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Date: Tue, 25 Feb 2020 18:25:16 +0900
In-Reply-To: <2047987.JN3mLKOXZX@localhost.localdomain>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e1ud5u1us7Sk0StCwaKj805vT2MwIrB/EMyCA0fF3eZ0l7c
 u1n2T1lmEiVGaTRLJGZaqZlZTU18USvNsughZVL2AmlqL0nUattd5H/nHD7f3/ec8zsSTF6O
 h0sKzDaGNdNGEg8S3uqPjI2Z/7wrW9k+qqYWzk8KqM7Dl8SUZ7BFTH11bqX+DE2Lt4q07Y43
 Yu0N50Ht6K86pHWP3BZoe7pK8DRRpnFzPkPrGVbBmPMs+gKzIZnUpeek5GgSlaoY1QYqiVSY
 aROTTG5LTYvZUWD0epOKQtpo95bSaI4j47ZsZi12G6PIt3C2ZJKx6o1WldIay9Emzm42xOZZ
 TBtVSmW8xkvmGvPHBnqQ9TO+f6byHn4InRUdR1IJEAlQUuUWHkdBEjnhQnCurFfAJ98QTHQ0
 i32UnJhBcHpI+E9R6l7AeKgLQeP9T4FkHEFx/zGBj5IRWnhxdRb54hBCB9XlHtwX40QUjMy1
 +r1XEFugYbjTz2PEBpj53eBnhEQEuB/U++tSIgleH3sp5p2jwTNQ7u1C4n0/GBZcIbx0LRy5
 We3vAYgeHD465wP8NhhrLkN8HAIT7rZAPRy+T3bhfMxB++VTYl5cgmC83hmA1DDpacJ8ZhgR
 Cdc64vjyOmifu4B442Uw+fOEyIcAIYOyUjmPkPDlbUlgWQDD708GVq2F3mKPmN9VpQBmf09j
 FUjh+D+OY9E4jv/GtQi7gkIZK2cyMJzKqlr8wa3If4tRGhc68yi1DxESRC6VQVd6tlxEF3JF
 pj4EEoxcIdOhndlymZ4uOsCwlhzWbmS4PqTxLvsUFr4yz+K9bLMtR6WJV6vVVEJiUqJGTYbJ
 3mVEZssJA21j9jKMlWH/6QQSafghlLW7aUZPlTfoml6N1LAnh59GJ9U9nF29pmNNc6hLtrK+
 JiK0zHlwfqP0qOzJretzR+wVez7QU6szfq1fXnlxLW5IDbamDFatWnK2W1chSHbQ8XfiDmQu
 2VfaFna38VlWg1TaMtXpWu4oqjWMyh/n/khUpBffLMibeL6JbQrq3k6RpJDLp1VRGMvRfwHR
 ivwyoQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnO6f5yFxBt+myln8nfOOyWJ30zJ2
 i7enN7BbfFziYPH/7Ad2B1aPnbPusntsXlLvcefHUkaP4ze2M3kc2NvCFsAaxWWTkpqTWZZa
 pG+XwJVx79QBxoLnbBXfph5ja2CcztrFyMkhIWAi0Xb8L3MXIxeHkMBuRomVjb+YIBISEo92
 fmHpYuQAsoUlDh8uhqh5wCjR+ekhG0gNr4CHxLXVPxlBbGEBb4nZfW/B4mwCWhI3fm8CWyAi
 YCex4sJusJnMApYS3/6tAKthEVCVOH5yOVicU8Bc4nb7dXaIBTOZJL7NPscI0aAp0br9NzvE
 QToSb0/1gR3EKyAo8XeHMESJvETz1tnMExgFZyHpmIVQNQtJ1QJG5lWMkqkFxbnpucWGBUZ5
 qeV6xYm5xaV56XrJ+bmbGMHBrqW1g/HEifhDjAIcjEo8vBJ7g+OEWBPLiitzDzFKcDArifB6
 MwbFCfGmJFZWpRblxxeV5qQWH2KU5mBREueVzz8WKSSQnliSmp2aWpBaBJNl4uCUamCc5XRU
 L6/2t2booyMSDb/45wQkVedvFvs3XXzeK/7LRZEHnBNeJouyGn5ovMHFszfgscClJU5NblI6
 yWW3ZS3SoyweXXM80O3SdcisnK+piJ/7dv0e43Bl2xsz/u16NeVS3LFZIdN320Yzl63dceXP
 ByurZ6uXNXGmZ6duP/RnzqlTa8qmb7BRYinOSDTUYi4qTgQAXW9CcnICAAA=
X-CMS-MailID: 20200225092516epcas1p35047a5029f7a01440f825a8daa8c1a08
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200225082024epcas1p2781b52ea5a743e16d3a1824a4289fcd1
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <9aaabe654603679dffdbf4c57bcfe0ff@walle.cc>
 <21102931.kdR8orL0iI@localhost.localdomain>
 <CGME20200225082024epcas1p2781b52ea5a743e16d3a1824a4289fcd1@epcas1p2.samsung.com>
 <2047987.JN3mLKOXZX@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_012522_888445_73E789B6 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: michael@walle.cc, vigneshr@ti.com, js07.lee@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIFR1ZG9yIAoKMjAyMC0wMi0yNSAo7ZmUKSwgMDg6MjAgKzAwMDAsIFR1ZG9yLkFtYmFydXNA
bWljcm9jaGlwLmNvbToKPiBPbiBGcmlkYXksIEZlYnJ1YXJ5IDIxLCAyMDIwIDExOjMwOjIyIEFN
IEVFVCAKPiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gCj4gd3JvdGU6Cj4gPiBKdW5nc2V1
bmcsIGFyZSB0aGVyZSBhbnkgb3RoZXIgY2F2ZWF0cyB0aGF0IHlvdSBmb3VuZD8gV291bGQgeW91
Cj4gPiB3b3JrCj4gPiB0b3dhcmRzIGltcGxlbWVudGluZyB0aGlzIGdlbmVyaWMgYnAgbG9jayBw
cm9wb3NhbD8KPiAKPiBIaSwgSnVuZ3NldW5nLAo+IAo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHdl
IGNhbiBoYXZlIHRoZSBCUCBzZXJpZXMgaW5jbHVkZWQgb24gdGhpcwo+IHJlbGVhc2UuIExldCAK
PiB1cyBrbm93IHdoZW4vaWYgeW91IHBsYW4gdG8gd29yayBvbiB0aGlzIHByb3Bvc2FsIG9yIGlm
IHlvdSBuZWVkCj4gaGVscC4gTm8gCj4gcHJlc3N1cmUsIGRvbid0IGdldCBtZSB3cm9uZywgSSBq
dXN0IHdhbnQgdG8gc2NoZWR1bGUgdGhlIGJpZ2dlc3QKPiBmZWF0dXJlcy4KPiAKClNvcnJ5IGZv
ciBsYXRlIHJlc3BvbnNlLCBJIHdhcyBhIGxpdHRsZSBidXN5IHRoZXNlIGRheXMuCkkgZG9uJ3Qg
ZmVlbCB1bmRlciBwcmVzc3VyZS4gOikgSSdtIGhvbm9yZWQgdG8gaGF2ZSB0aGUgY2hhbmNlIHRv
IGRvCnNvbWV0aGluZyBmb3IgdGhlIGZlYXR1cmUuCgpJIHRoaW5rIGl0IGNvdWxkIGJlIGRvbmUg
aW4gYSB3ZWVrLiAoWW91IGFuZCBtaWNoYWVsIGFscmVhZHkgd3JvdGUgYQpsb3Qgb2YgcGFydCBv
ZiBpdC4pCgpUaGFua3MsCgo+IENoZWVycywKPiB0YQo+IAo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
