Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336F9C5472C
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RolbSv+sX1JJkX38jrNukXqvPC3yvjFQGpJfQ8nTdSY=; b=yFw2d+7MdrBLsM
	pc+l5ydyqGekRxXs8qacNLeYw9mUkzWhxdtYFRXJv6sWV75xO++TVFaa+NCx86gJgVjO8X71f73SL
	mDFgWUI8kp4wYUUwQH6NAbLI0iKdL95DGo70RqgHAfavhJWzXUochVajh0gM5DTLt04kwdpLczQur
	mxONd+/aFJXYG5gLD9NayzXmSSWJ37Y2QHiwjso8t5jiTbQY+e94u+lQ2eF8tjYX4L8sbnv+E9PrM
	+S530IC6qk/GJavqnmo63HIayZgZQtjDCEEfF9OZx4NEnqwi2Ij+lZg+X5sPBmcuYXUk63/6RChPS
	7T2Cr3+5UWIdLPw+Hh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9R-00000009kJE-2Ve3;
	Wed, 21 Aug 2024 16:25:37 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9N-00000009kFi-19RX
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 16:25:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF9971BF204;
	Wed, 21 Aug 2024 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724257530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ad804CjfeVcf2tejrm1Zcg8RD38AvtB5yU8+rMRGKiw=;
	b=iF9jLMc94l0RbBjrj/i9RmVD+3Faf0RdOgyie6l+aw7is+JUQ2f56z5zmPguYhHWYQT0u/
	HtGV9Uy0HMiV9zDLf6QVCrqOg3AiDJETt7tCPbBSyKFEjvA9KY8ma1wfVLrX5I6I+A15jp
	Zijgll03t68W71B0l7SsfO7+khNsg8KAneTN9QX26RV307HeToh7Y/8oR31V8n5WfSUxTC
	C/UMQsyI12AqvMuP7PhGFhFaUKjXw7NKKWs0OD/tSWgx1dbMfl3ucVchUWb1Q7ZvVgrth8
	Vjjo/RQx2yndgplC2rulHmW2mkRTD/1mo3B6A7Uef6r58FAC+D5tkUimbCepzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/9] mtd: spi-nand: Continuous read support
Date: Wed, 21 Aug 2024 18:25:19 +0200
Message-ID: <20240821162528.218292-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_092533_655490_E07E1D71 
X-CRM114-Status: GOOD (  10.19  )
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

SGVsbG8sCgpBZnRlciB0aGUgcmF3IE5BTkQgc2VyaWVzLCBoZXJlIGlzIGFuIGVxdWl2YWxlbnQg
c2VyaWVzIGJyaW5naW5nCmNvbnRpbnVvdXMvc2VxdWVudGlhbCByZWFkIHN1cHBvcnQgdG8gc3Bp
LW5hbmQuIFRoZSBnb2FsIGlzIHRvIG9wdGltaXplCnRoZSByZWFkcyB3aGVuIHNldmVyYWwgY29u
c2VjdXRpdmUgcGFnZXMgYXJlIHJlYWQuIE1vcmUgZXhwbGFuYXRpb25zCmFib3V0IHRoZSAicGh5
c2ljcyIgaW4gdGhlIHBhdGNoIDQgYWRkaW5nIGNvbnRpbnVvdXMgcmVhZCB0byB0aGUgY29yZS4K
ClRoZSBmZWF0dXJlIHN0b3BzIGF0IHRoZSBibG9jayBib3VuZGFyeSBmb3IgdHdvIHJlYXNvbnM6
Ciogc29tZSB2ZW5kb3JzIGRpZCBub3QgaW1wbGVtZW50IG1vcmUKKiBOQU5EcyBhcmUgYWNjZXNz
ZWQgdGhyb3VnaCBVQkkgdGhlc2UgZGF5cywgYW5kIHRoZXJlIGlzIGFic29sdXRlbHkgbm8KZ3Vh
cmFudGVlIChxdWl0ZSB0aGUgb3Bwb3NpdGUpIHR3byBjb25zZWN1dGl2ZSBMRUJzIHdpbGwgZW5k
LXVwIGludG8gdHdvCmNvbnNlY3V0aXZlIFBFQnMuCgpUaGUgZmVhdHVyZSB3YXMgdGVzdGVkIHVz
aW5nIE1hY3Jvbml4IE5BTkRzLCBhbmQgdGh1cyB0aGUgdmVuZG9yIGRyaXZlcgppcyB1cGRhdGVk
IHRvIGV4cG9zZSB0aGlzIG5ldyBmZWF0dXJlLgoKQmVuY2htYXJrcyBhcmUgYXZhaWxhYmxlIGlu
IHRoZSBsYXN0IGNvbW1pdCwgYnV0IHRoZSBvdmVyYWxsIHRoZSBzcGVlZApnYWlucyBhcmUgaW1w
cmVzc2l2ZTogdXAgdG8gNDUlIHdoZW4gcmVhZGluZyBhIGJsb2NrIGluIDEtMS00IG1vZGUsCndo
ZXJlIGEgc3Vic3RhbnRpYWwgdGltZSBpcyBsb3N0IHdhaXRpbmcgZm9yIHRoZSBjaGlwIHRvIGJl
IHJlYWR5LgoKQ2hlZXJzLApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFsICg5KToKICBtdGQ6IG5hbmQ6
IFJlbmFtZSB0aGUgTkFORCBJTyBpdGVyYXRpb24gaGVscGVyCiAgbXRkOiBuYW5kOiBJbnRyb2R1
Y2UgYSBibG9jayBpdGVyYXRvcgogIG10ZDogc3BpLW5hbmQ6IElzb2xhdGUgdGhlIE1URCByZWFk
IGxvZ2ljIGluIGEgaGVscGVyCiAgbXRkOiBzcGktbmFuZDogQWRkIGNvbnRpbnVvdXMgcmVhZCBz
dXBwb3J0CiAgbXRkOiBzcGktbmFuZDogRXhwb3NlIHNwaW5hbmRfd3JpdGVfcmVnX29wKCkKICBt
dGQ6IHNwaS1uYW5kOiBtYWNyb25peDogRml4IGhlbHBlciBuYW1lCiAgbXRkOiBzcGktbmFuZDog
bWFjcm9uaXg6IEV4dHJhY3QgdGhlIGJpdGZsaXAgcmV0cmlldmFsIGxvZ2ljCiAgbXRkOiBzcGkt
bmFuZDogbWFjcm9uaXg6IEFkZCBhIHBvc3NpYmxlIGJpdGZsaXAgc3RhdHVzIGZsYWcKICBtdGQ6
IHNwaS1uYW5kOiBtYWNyb25peDogQ29udGludW91cyByZWFkIHN1cHBvcnQKCiBkcml2ZXJzL210
ZC9uYW5kL3NwaS9jb3JlLmMgICAgIHwgMjE1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jIHwgMTIyICsrKysrKysrKysrKyst
LS0tLQogaW5jbHVkZS9saW51eC9tdGQvbmFuZC5oICAgICAgICB8ICA5MCArKysrKysrKysrKy0t
CiBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggICAgIHwgIDExICsrCiA0IGZpbGVzIGNoYW5n
ZWQsIDM3OCBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKCi0tIAoyLjQzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
