Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C5ECF8842
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/3vqpp27zeiqjbViy03QH4LEnUi5ndoa05UqlO+TEs=; b=ULTGJF/rNHQsfv
	IyheQ3Xs7UVGEE8xIxmw5fStJN5R+bar0JGoiTPA8Yg+qnRXuUfRM64WauIwMlkMprxQc93VIvxeS
	yP1a8P5KTS9/zCaiFqmc/ZtUoqV8HMKG09j7LwZDvhPCDWOtldXYx7JbbtT+DuNu53CEZ09zxKtWy
	XOO/vuMbUpKBlhbh58FwTgb9voUkl9r/gD2AhvshQVqvb9qgO0STttUBkqzLhN8sPL+OTtOStAAbp
	5/qinEzYnK0Q+1vskxDg51QphcosYuGbFTg4FuAfTVPQHV8LW5xUk6PMJLLu/Yg2jkzqtPB6iNHzS
	Z5ton2FibJBPw5k0aSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swjlx-0000000CtpA-1TwE;
	Fri, 04 Oct 2024 14:59:13 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swjaZ-0000000CqUA-1hjF
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 14:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728053227; x=1728658027; i=markus.elfring@web.de;
	bh=A+dNUIVHyB/x/Bc3YYhMlKwmGkB5MZJLY2b4rGCcbMY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mcMrYBGjC1JW9gGVVlzcs9en17zQRE1GeHjgVb1ez42IX4uRdm6mR3WKtTtOocxC
	 NAl2tjIos7jrn/A8ilCCuNdL9g62uYLZbk+VK8/l8lmzMOsY/VECZ03OKyy9g/EML
	 UIyQwAmzbqsMYFK+BBd4T717vps89iHugmfOjphE3aEUMSa9AwczOGzTNF7jNJO0w
	 aLB0MxXZ1x+7a/4wYU28dtVXGcxRqVIFNOrXZtVfCzoqGY5JhkaK77r00nNmvcEA5
	 26/6cE9r86UbQRoqi39u0ZWw9FpcPW8EZelcDReC1aCTxoEXRBRllx0vcwVBtgYkp
	 9Yt6DNJBXiPQM82whA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MpTxm-1s6ppW3uCC-00n7Tq; Fri, 04
 Oct 2024 16:47:06 +0200
Message-ID: <95773471-a94d-4c10-b678-2b5b702f3bed@web.de>
Date: Fri, 4 Oct 2024 16:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mtd@lists.infradead.org, Miaoqian Lin <linmq006@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mtd: parsers: ofpart: Use common of_node_put() code in
 bcm4908_partitions_fw_offset()
X-Provags-ID: V03:K1:ZJrZ7bEjaQWkla2jPU6YmskI8FAKk84owvqvM1zNu3EahBADPmf
 zTI+iIwKmZiEqJ7ILxO6eHqIGXPWilGF8TedOvMfXVB8c2+CrnD4TSZzA+jlRKe8Rd6h6Lh
 JTqn3Xa/RZ4zIKAYi+k1Dmm97Q3IjaSH20bAis/Q7MJ+jHqusR75cJR7SKfw7i969evC/QM
 MN3gXEOs4/3XW4QK2V8Ow==
UI-OutboundReport: notjunk:1;M01:P0:rjK11Ig61CU=;MkiouDE4DQx5/nv4efR61E1S2jp
 h3OJurh9lHmuyWciEzL+phrJ1tO2EmEIvRDuA8lOgMNhOzWlH3VdVsP5trjfPfR/9mghlFwjg
 NABrkFvif99kcXhZMxS66XtRygcKny/l4Zrd+gUE33Lb100hzE9ZER3rU7VWqz9DOeYxLL9J4
 EevLcy880+cRNvr56WmldJmhPMS/C2iAwToHOs4tE96NLr+r9xWYLfLIRZp2doWa6YrUbLaoq
 MFW60QW7gWf15IG2nZOICwHIkazn2EhhzVheA1xXXxPu7OxLZH8nsbYEHV0A9atryEX2IV26s
 wJO4uL9M+xcl5P/jar6n8WlCiLYMpxQl4/+t2Uy4ZbeDaEh/tlW8/HwYztjMMcX/lD9u+gRM5
 vw1WGcbZ/+whMBbSJgp+gt0xeA+qGDnmy/OjVJ2gMTqbBjiiNSCvdPNh05RJbJei4MxaQkocX
 FNJvl/Am8FNvX0JiGyOHtEajv1+I8lCzzZXZHQiBupxboir6pmufqh+EGxLQQMx0SawXaDBF9
 P7UPKfVpmNhNPVD/Oxdxvme9j0fF0PbJ7YPlTbaIbeh8o7zVBxJax+7RQ8YVGaAh/Mhep1sgw
 +fHfzyrNLVsrqtQwm9Q1t/Ky2KkjzrBdyMbSu9av93MkK8OGZTD3XFh6vcTcl4340t2W4wg12
 uC29sfKfzbL2ZTi3wmK4zxKXjbhhjtc9HKJnzAonhqJ+N18wkTj0leR2M/SsnaMY1ccU6EtDH
 QIj3Ix1YjgFESaMn88Zsjb2xiXvHGECaGFjBtXt8etgojli/LDD2p885zbYvbDzJvNaaCbP+X
 jjlezHFmXLGpJ/bejoB5Jcgw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_074727_898182_33D72B17 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBGcmksIDQgT2N0IDIwMjQgMTY6MzA6NTIgKzAyMDAKCkVubGFyZ2UgdGhlIHNjb3BlIGZvciB0
aGUgbG9jYWwgdmFyaWFibGUg4oCcZXJy4oCdIGFuZCBhZGQgYSBsYWJlbApzbyB0aGF0IGEgYml0
IG9mIGV4Y2VwdGlvbiBoYW5kbGluZyBjYW4gYmUgYmV0dGVyIHJldXNlZCBhdCB0aGUgZW5kIG9m
CnRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBi
eSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBF
bGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL210ZC9w
YXJzZXJzL29mcGFydF9iY200OTA4LmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9w
YXJzZXJzL29mcGFydF9iY200OTA4LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9iY200
OTA4LmMKaW5kZXggYmIwNzJhMDk0MGU0Li5mOWNhZjRhNDRiNGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2JjbTQ5MDguYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJz
L29mcGFydF9iY200OTA4LmMKQEAgLTE5LDYgKzE5LDcgQEAgc3RhdGljIGxvbmcgbG9uZyBiY200
OTA4X3BhcnRpdGlvbnNfZndfb2Zmc2V0KHZvaWQpCiAJc3RydWN0IGRldmljZV9ub2RlICpyb290
OwogCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKIAljb25zdCBjaGFyICpzOworCWludCBlcnI7Cgog
CXJvb3QgPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiLyIpOwogCWlmICghcm9vdCkKQEAgLTI3LDcg
KzI4LDYgQEAgc3RhdGljIGxvbmcgbG9uZyBiY200OTA4X3BhcnRpdGlvbnNfZndfb2Zmc2V0KHZv
aWQpCiAJb2ZfcHJvcGVydHlfZm9yX2VhY2hfc3RyaW5nKHJvb3QsICJicmNtX2JscGFybXMiLCBw
cm9wLCBzKSB7CiAJCXNpemVfdCBsZW4gPSBzdHJsZW4oQkxQQVJBTVNfRldfT0ZGU0VUKTsKIAkJ
dW5zaWduZWQgbG9uZyBvZmZzZXQ7Ci0JCWludCBlcnI7CgogCQlpZiAoc3RybmNtcChzLCBCTFBB
UkFNU19GV19PRkZTRVQsIGxlbikgfHwgc1tsZW5dICE9ICc9JykKIAkJCWNvbnRpbnVlOwpAQCAt
MzUsMTYgKzM1LDE3IEBAIHN0YXRpYyBsb25nIGxvbmcgYmNtNDkwOF9wYXJ0aXRpb25zX2Z3X29m
ZnNldCh2b2lkKQogCQllcnIgPSBrc3RydG91bChzICsgbGVuICsgMSwgMCwgJm9mZnNldCk7CiAJ
CWlmIChlcnIpIHsKIAkJCXByX2VycigiZmFpbGVkIHRvIHBhcnNlICVzXG4iLCBzICsgbGVuICsg
MSk7Ci0JCQlvZl9ub2RlX3B1dChyb290KTsKLQkJCXJldHVybiBlcnI7CisJCQlnb3RvIHB1dF9u
b2RlOwogCQl9CgogCQlvZl9ub2RlX3B1dChyb290KTsKIAkJcmV0dXJuIG9mZnNldCA8PCAxMDsK
IAl9CgorCWVyciA9IC1FTk9FTlQ7CitwdXRfbm9kZToKIAlvZl9ub2RlX3B1dChyb290KTsKLQly
ZXR1cm4gLUVOT0VOVDsKKwlyZXR1cm4gZXJyOwogfQoKIGludCBiY200OTA4X3BhcnRpdGlvbnNf
cG9zdF9wYXJzZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBh
cnRzLCBpbnQgbnJfcGFydHMpCi0tCjIuNDYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
