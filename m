Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE1CCF6D28
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQVnoM+cFaj1g/JR4UayZFRh0SR6dmoV0dUVnonXpNQ=; b=iuZSHjqDNmcMRO
	FTq9+FikJNjygpevftwnXWKP8Y6mQ+N38B0p4TfwWqCnNdbEe0oFd2N7Eye6zlr8cOkjTCNRIYwLX
	KN+4Zh4O/TVfj+js9ijL3hIX2ABf7jIvtKW56Hw7UTeCpiuaA7ckm1asEUB+viseBEfQlNN/JtLL9
	mYC5nBRr74nahwmohqkdzkEGgnGZ2qn/RP90Rqee/SLG1uqQ2XEv+O1L1UkcGW2wQzGeH/FWUqjqL
	OFa6O0RrU1RTyyjjL/I6CyqsHnzWkGiq8OQhs+WSqWvvhkVEjxHWj6tLXa2ckM95zZDCdhy/GIy9F
	YRn8Qhw9h4VjyG0twPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0P8-00000006P59-1S0T;
	Wed, 02 Oct 2024 14:32:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0NS-00000006Oe7-3rFc
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 14:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CC3D5C463E;
	Wed,  2 Oct 2024 14:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B671EC4CEC2;
	Wed,  2 Oct 2024 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727879454;
	bh=Pb+JtWxYsjr/0SesXeTGD2mmK5DW9IwUNOQW/wACrYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CZEova8V71TgT0Wc5kproq+/f3cEjcA1rVbueZUAs/6k+smPdsWjVBvlI4Ih2Snxj
	 kKmTu3wfn+fcpKyy1SaAsXTeAi7kVmrxDQ3r/RJVgQVV8jgrzGBljc59RCmgJ/gNaU
	 2QoZjqxV6l1ggfuJc+5cXXH9c4FXQHSpXB49kT6M=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Mirsad Todorovac <mtodorovac69@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 123/538] mtd: slram: insert break after errors in parsing the map
Date: Wed,  2 Oct 2024 14:56:02 +0200
Message-ID: <20241002125757.100344114@linuxfoundation.org>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241002125751.964700919@linuxfoundation.org>
References: <20241002125751.964700919@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_073055_030090_44F49AE0 
X-CRM114-Status: GOOD (  11.53  )
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

Ni42LXN0YWJsZSByZXZpZXcgcGF0Y2guICBJZiBhbnlvbmUgaGFzIGFueSBvYmplY3Rpb25zLCBw
bGVhc2UgbGV0IG1lIGtub3cuCgotLS0tLS0tLS0tLS0tLS0tLS0KCkZyb206IE1pcnNhZCBUb2Rv
cm92YWMgPG10b2Rvcm92YWM2OUBnbWFpbC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCAzMzZjMjE4
ZGQ3ZjA1ODhlZDhhNzM0NWYzNjc5NzVhMDBhNGYwMDNmIF0KCkdDQyAxMi4zLjAgY29tcGlsZXIg
b24gbGludXgtbmV4dCBuZXh0LTIwMjQwNzA5IHRyZWUgZm91bmQgdGhlIGV4ZWN1dGlvbgpwYXRo
IGluIHdoaWNoLCBkdWUgdG8gbGF6eSBldmFsdWF0aW9uLCBkZXZsZW5ndGggaXNuJ3QgaW5pdGlh
bGlzZWQgd2l0aCB0aGUKcGFyc2VkIHN0cmluZzoKCiAgIDI4OQkJd2hpbGUgKG1hcCkgewogICAy
OTAJCQlkZXZuYW1lID0gZGV2c3RhcnQgPSBkZXZsZW5ndGggPSBOVUxMOwogICAyOTEKICAgMjky
CQkJaWYgKCEoZGV2bmFtZSA9IHN0cnNlcCgmbWFwLCAiLCIpKSkgewogICAyOTMJCQkJRSgic2xy
YW06IE5vIGRldmljZW5hbWUgc3BlY2lmaWVkLlxuIik7CiAgIDI5NAkJCQlicmVhazsKICAgMjk1
CQkJfQogICAyOTYJCQlUKCJzbHJhbTogZGV2bmFtZSA9ICVzXG4iLCBkZXZuYW1lKTsKICAgMjk3
CQkJaWYgKCghbWFwKSB8fCAoIShkZXZzdGFydCA9IHN0cnNlcCgmbWFwLCAiLCIpKSkpIHsKICAg
Mjk4CQkJCUUoInNscmFtOiBObyBkZXZpY2VzdGFydCBzcGVjaWZpZWQuXG4iKTsKICAgMjk5CQkJ
fQogICAzMDAJCQlUKCJzbHJhbTogZGV2c3RhcnQgPSAlc1xuIiwgZGV2c3RhcnQpOwog4oaSIDMw
MQkJCWlmICgoIW1hcCkgfHwgKCEoZGV2bGVuZ3RoID0gc3Ryc2VwKCZtYXAsICIsIikpKSkgewog
ICAzMDIJCQkJRSgic2xyYW06IE5vIGRldmljZWxlbmd0aCAvIC1lbmQgc3BlY2lmaWVkLlxuIik7
CiAgIDMwMwkJCX0KIOKGkiAzMDQJCQlUKCJzbHJhbTogZGV2bGVuZ3RoID0gJXNcbiIsIGRldmxl
bmd0aCk7CiAgIDMwNQkJCWlmIChwYXJzZV9jbWRsaW5lKGRldm5hbWUsIGRldnN0YXJ0LCBkZXZs
ZW5ndGgpICE9IDApIHsKICAgMzA2CQkJCXJldHVybigtRUlOVkFMKTsKICAgMzA3CQkJfQoKUGFy
c2luZyBzaG91bGQgYmUgZmluaXNoZWQgYWZ0ZXIgbWFwID09IE5VTEwsIHNvIGEgYnJlYWsgaXMg
YmVzdCBpbnNlcnRlZCBhZnRlcgplYWNoIEUoInNscmFtOiAuLi4gXG4iKSBlcnJvciBtZXNzYWdl
LgoKRml4ZXM6IDFkYTE3N2U0YzNmNCAoIkxpbnV4LTIuNi4xMi1yYzIiKQpDYzogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8
cmljaGFyZEBub2QuYXQ+CkNjOiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+
CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBNaXJzYWQg
VG9kb3JvdmFjIDxtdG9kb3JvdmFjNjlAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgpMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tdGQvMjAyNDA3MTEyMzQzMTkuNjM3ODI0LTEtbXRvZG9yb3ZhYzY5QGdt
YWlsLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9tdGQvZGV2aWNlcy9zbHJhbS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYyBi
L2RyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYwppbmRleCAyODEzMWExMjdkMDY1Li44Mjk3YjM2
NmEwNjY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NscmFtLmMKKysrIGIvZHJp
dmVycy9tdGQvZGV2aWNlcy9zbHJhbS5jCkBAIC0yOTYsMTAgKzI5NiwxMiBAQCBzdGF0aWMgaW50
IF9faW5pdCBpbml0X3NscmFtKHZvaWQpCiAJCVQoInNscmFtOiBkZXZuYW1lID0gJXNcbiIsIGRl
dm5hbWUpOwogCQlpZiAoKCFtYXApIHx8ICghKGRldnN0YXJ0ID0gc3Ryc2VwKCZtYXAsICIsIikp
KSkgewogCQkJRSgic2xyYW06IE5vIGRldmljZXN0YXJ0IHNwZWNpZmllZC5cbiIpOworCQkJYnJl
YWs7CiAJCX0KIAkJVCgic2xyYW06IGRldnN0YXJ0ID0gJXNcbiIsIGRldnN0YXJ0KTsKIAkJaWYg
KCghbWFwKSB8fCAoIShkZXZsZW5ndGggPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAJCQlFKCJz
bHJhbTogTm8gZGV2aWNlbGVuZ3RoIC8gLWVuZCBzcGVjaWZpZWQuXG4iKTsKKwkJCWJyZWFrOwog
CQl9CiAJCVQoInNscmFtOiBkZXZsZW5ndGggPSAlc1xuIiwgZGV2bGVuZ3RoKTsKIAkJaWYgKHBh
cnNlX2NtZGxpbmUoZGV2bmFtZSwgZGV2c3RhcnQsIGRldmxlbmd0aCkgIT0gMCkgewotLSAKMi40
My4wCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
