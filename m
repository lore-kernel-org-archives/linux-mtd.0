Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FCFC282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 15:31:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468062084E
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 15:31:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j97HqQOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468062084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hedFI/5cnGgn6JXeZcQOfqQyp11v5oExXuZT3ceRrNg=; b=j97HqQOtn/CxMU
	E4YJ0Ja++SRHS0lBro/76T3Kox++84AtEzfICyEj5xdyyouVhTzFwGhO8lbQ6aB/m77LGNLj9pPhv
	KN2+t1AmewUb8AeA/XhYXS7ZUBuWtLeO+mIdAw/Z7wKMTXMB4ZBKOZ4ags7P70uScsvUHBp9GJLTF
	n+PRPDm4uSB5IRSNfTQm2/7nakEqDUVO2mkVvphwMfmXA3Z7jSLVVA+gy1dqgmDEyLIRA24pjNimi
	qPfQUVzDPxmuZQTFi6yflLjqieu09Kohv5DIa4V961+BFWX2mRiMWn6KUaWAjhrcMQMDQj6CW56dt
	VhXXcmtM1BKxCRQ0KC0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gta2D-0000oU-72; Tue, 12 Feb 2019 15:31:45 +0000
Received: from gateway32.websitewelcome.com ([192.185.145.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gta22-0000dM-FV
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 15:31:38 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 0C6591B520A
 for <linux-mtd@lists.infradead.org>;
 Tue, 12 Feb 2019 09:31:33 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id ta20gX48SdnCeta20gWFFm; Tue, 12 Feb 2019 09:31:33 -0600
X-Authority-Reason: nr=8
Received: from [189.250.119.20] (port=47586 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1gta1z-000WYa-SN; Tue, 12 Feb 2019 09:31:31 -0600
Date: Tue, 12 Feb 2019 09:31:31 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: lpddr_cmds: Mark expected switch fall-through
Message-ID: <20190212153131.GA5746@embeddedor>
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
X-Source-IP: 189.250.119.20
X-Source-L: No
X-Exim-ID: 1gta1z-000WYa-SN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.119.20]:47586
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_073134_627827_B0217688 
X-CRM114-Status: UNSURE (   9.72  )
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
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMvbXRkL2xwZGRyL2xw
ZGRyX2NtZHMuYzogSW4gZnVuY3Rpb24g4oCYY2hpcF9yZWFkeeKAmToKZHJpdmVycy9tdGQvbHBk
ZHIvbHBkZHJfY21kcy5jOjMxOTo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0
aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgaWYgKG1vZGUgPT0gRkxfUkVBRFkg
JiYgY2hpcC0+b2xkc3RhdGUgPT0gRkxfUkVBRFkpCiAgICAgIF4KZHJpdmVycy9tdGQvbHBkZHIv
bHBkZHJfY21kcy5jOjMyMjoyOiBub3RlOiBoZXJlCiAgZGVmYXVsdDoKICBefn5+fn5+CgpXYXJu
aW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MwoKVGhpcyBwYXRj
aCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCi1XaW1wbGljaXQtZmFs
bHRocm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVt
YmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bHBkZHIvbHBkZHJfY21kcy5jIGIvZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21kcy5jCmluZGV4
IGIxMzU1N2ZlNTJiZC4uNzZhNGM3M2UxMDBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9scGRk
ci9scGRkcl9jbWRzLmMKKysrIGIvZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21kcy5jCkBAIC0z
MTgsNiArMzE4LDcgQEAgc3RhdGljIGludCBjaGlwX3JlYWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFw
LCBzdHJ1Y3QgZmxjaGlwICpjaGlwLCBpbnQgbW9kZSkKIAkJLyogT25seSBpZiB0aGVyZSdzIG5v
IG9wZXJhdGlvbiBzdXNwZW5kZWQuLi4gKi8KIAkJaWYgKG1vZGUgPT0gRkxfUkVBRFkgJiYgY2hp
cC0+b2xkc3RhdGUgPT0gRkxfUkVBRFkpCiAJCQlyZXR1cm4gMDsKKwkJLyogZmFsbCB0aHJvdWdo
ICovCiAKIAlkZWZhdWx0Ogogc2xlZXA6Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
