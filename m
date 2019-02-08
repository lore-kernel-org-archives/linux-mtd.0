Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455CEC282DD
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9867218D2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NRb8rB+J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9867218D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dsYDYzgKcbGaKQoylnUBkxt8JFinrNf3WdtXdJeyP7Q=; b=NRb8rB+JaMI9vR
	73jCBeJs11y3DitJtxq9M6ztYOhQXjuPyk5T2N1t6d4/G98vXUiKPmj9EjbUFa7RzTfnPSHrEN9TM
	3SfyJdd3Y1jXmLVYc7SWnZJ8Tp6MjCtMwzO+S+UxbuxtyfLqQe4adZxQ5vFT9z7fp8R03D+jAsKWf
	UEcYn+R2hVLP3z5VsbtqGHtQCJR8HMU+0U2sQ+FOpr2lr7OxdeBVBl4XFn8YVDfkP9d7ZuAzI8GkS
	qEdkeDWYv/TWDMHh9IvcMBlaLYE3E1ffnwPgMP2ogGC0cbh1zg785uJeGkhJXzrUV18frumvo6Xzk
	HJ3BFX+yFKqPXtpuB/5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsAXc-0003S8-An; Fri, 08 Feb 2019 18:06:20 +0000
Received: from gateway21.websitewelcome.com ([192.185.46.109])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAXa-0003Rr-Af
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 18:06:19 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id 34097400C3C13
 for <linux-mtd@lists.infradead.org>; Fri,  8 Feb 2019 12:06:17 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sAXZgGx9F90onsAXZgf8kR; Fri, 08 Feb 2019 12:06:17 -0600
X-Authority-Reason: nr=8
Received: from [189.250.49.191] (port=57552 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1gsAXY-004Bi0-80; Fri, 08 Feb 2019 12:06:16 -0600
Date: Fri, 8 Feb 2019 12:06:15 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: cfi_cmdset_0002: Mark expected switch fall-throughs
Message-ID: <20190208180615.GA24601@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.49.191
X-Source-L: No
X-Exim-ID: 1gsAXY-004Bi0-80
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.49.191]:57552
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 13
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_100618_410923_6F7F7A4C 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cgpkcml2ZXJzL210ZC9jaGlwcy9j
ZmlfY21kc2V0XzAwMDIuYzogSW4gZnVuY3Rpb24g4oCYZ2V0X2NoaXDigJk6CmRyaXZlcnMvbXRk
L2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jOjg3MDo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBt
YXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgaWYgKG1vZGUgPT0g
RkxfUkVBRFkgJiYgY2hpcC0+b2xkc3RhdGUgPT0gRkxfUkVBRFkpCiAgICAgIF4KZHJpdmVycy9t
dGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmM6ODczOjI6IG5vdGU6IGhlcmUKICBkZWZhdWx0Ogog
IF5+fn5+fn4KZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmM6IEluIGZ1bmN0aW9u
IOKAmGNmaV9hbWRzdGRfc3luY+KAmToKZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAy
LmM6Mjc0NToxNjogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgICBjaGlwLT5zdGF0ZSA9IEZMX1NZTkNJTkc7CiAgICB+
fn5+fn5+fn5+fn5efn5+fn5+fn5+fn4KZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAy
LmM6Mjc1MDozOiBub3RlOiBoZXJlCiAgIGNhc2UgRkxfU1lOQ0lORzoKICAgXn5+fgoKV2Fybmlu
ZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKClRoaXMgcGF0Y2gg
aXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5nCi1XaW1wbGljaXQtZmFs
bHRocm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVt
YmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAyLmMKaW5kZXggNzI0MjhiNmJmYzQ3Li4wYjBhMTg3NGQzYmYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCisrKyBiL2RyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMi5jCkBAIC04NjksNiArODY5LDcgQEAgc3RhdGljIGludCBnZXRf
Y2hpcChzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwgdW5zaWduZWQg
bG9uZyBhZHIKIAkJLyogT25seSBpZiB0aGVyZSdzIG5vIG9wZXJhdGlvbiBzdXNwZW5kZWQuLi4g
Ki8KIAkJaWYgKG1vZGUgPT0gRkxfUkVBRFkgJiYgY2hpcC0+b2xkc3RhdGUgPT0gRkxfUkVBRFkp
CiAJCQlyZXR1cm4gMDsKKwkJLyogZmFsbCB0aHJvdWdoICovCiAKIAlkZWZhdWx0OgogCXNsZWVw
OgpAQCAtMjc0Nyw2ICsyNzQ4LDcgQEAgc3RhdGljIHZvaWQgY2ZpX2FtZHN0ZF9zeW5jIChzdHJ1
Y3QgbXRkX2luZm8gKm10ZCkKIAkJCSAqIGFzIHRoZSB3aG9sZSBwb2ludCBpcyB0aGF0IG5vYm9k
eSBjYW4gZG8gYW55dGhpbmcKIAkJCSAqIHdpdGggdGhlIGNoaXAgbm93IGFueXdheS4KIAkJCSAq
LworCQkJLyogZmFsbCB0aHJvdWdoICovCiAJCWNhc2UgRkxfU1lOQ0lORzoKIAkJCW11dGV4X3Vu
bG9jaygmY2hpcC0+bXV0ZXgpOwogCQkJYnJlYWs7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
