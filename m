Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65098C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:12:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346BB217D8
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJRDrPBN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346BB217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LMOmXqWyQH2PG5+p6H43JvjyWugCqBlRf8Si/1onNr0=; b=NJRDrPBN8eDGmd
	tEL4CAh35l3vNOpGEKx3pswjvNeYWbV5EWB56bLx+HeXZn1Q1Z1V+gbtZR2F+H1nH/mZurLyqMF8C
	/QSxcGxDcZ4VMbjQ9TbdJGgEHOcYPPxTAW9OJAE35U/aXSuQF6EJVdzMcH9qJA7OW+z7+B1SQmxO8
	Xb1GUQfv7EF8UWq0Eh6EkM9HwZbV40PbJaVHdfgndOsXtLsBtJ5j2HhkxAhCSz1Ed8A2kdrRjbNmw
	gFCB7RKn0LP/xRl6x2eAVfZ6DUaBCqd6qaORpeoIxtT7U3i+/PH+7WNoOYhBygEYgHoEs6KQaVQDe
	sdeiIe7x/qx3WNqmW2lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsAdM-0005yX-3j; Fri, 08 Feb 2019 18:12:16 +0000
Received: from gateway36.websitewelcome.com ([192.185.186.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAdJ-0005sm-3i
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 18:12:14 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id 0BEE3400C5A16
 for <linux-mtd@lists.infradead.org>; Fri,  8 Feb 2019 11:26:06 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sAdIgi3TA2PzOsAdIgDxAp; Fri, 08 Feb 2019 12:12:12 -0600
X-Authority-Reason: nr=8
Received: from [189.250.49.191] (port=57582 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1gsAdH-004Fxd-B0; Fri, 08 Feb 2019 12:12:11 -0600
Date: Fri, 8 Feb 2019 12:12:10 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: lpddr_cmds: Mark expected switch fall-through
Message-ID: <20190208181210.GA8388@embeddedor>
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
X-Exim-ID: 1gsAdH-004Fxd-B0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.49.191]:57582
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 28
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_101213_198630_AD5A1302 
X-CRM114-Status: UNSURE (   9.44  )
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
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cgpkcml2ZXJzL210ZC9scGRkci9s
cGRkcl9jbWRzLmM6IEluIGZ1bmN0aW9uIOKAmGNoaXBfcmVhZHnigJk6CmRyaXZlcnMvbXRkL2xw
ZGRyL2xwZGRyX2NtZHMuYzozMTk6Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwg
dGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgIGlmIChtb2RlID09IEZMX1JFQURZ
ICYmIGNoaXAtPm9sZHN0YXRlID09IEZMX1JFQURZKQogICAgICBeCmRyaXZlcnMvbXRkL2xwZGRy
L2xwZGRyX2NtZHMuYzozMjI6Mjogbm90ZTogaGVyZQogIGRlZmF1bHQ6CiAgXn5+fn5+fgoKV2Fy
bmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKClRoaXMgcGF0
Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5nCi1XaW1wbGljaXQt
ZmFsbHRocm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZv
QGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbHBkZHIvbHBkZHJfY21kcy5jIGIvZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21kcy5jCmlu
ZGV4IGIxMzU1N2ZlNTJiZC4uNzZhNGM3M2UxMDBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9s
cGRkci9scGRkcl9jbWRzLmMKKysrIGIvZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21kcy5jCkBA
IC0zMTgsNiArMzE4LDcgQEAgc3RhdGljIGludCBjaGlwX3JlYWR5KHN0cnVjdCBtYXBfaW5mbyAq
bWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLCBpbnQgbW9kZSkKIAkJLyogT25seSBpZiB0aGVyZSdz
IG5vIG9wZXJhdGlvbiBzdXNwZW5kZWQuLi4gKi8KIAkJaWYgKG1vZGUgPT0gRkxfUkVBRFkgJiYg
Y2hpcC0+b2xkc3RhdGUgPT0gRkxfUkVBRFkpCiAJCQlyZXR1cm4gMDsKKwkJLyogZmFsbCB0aHJv
dWdoICovCiAKIAlkZWZhdWx0Ogogc2xlZXA6Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
