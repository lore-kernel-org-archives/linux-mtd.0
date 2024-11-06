Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E900D44D5D
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCVaQXgxng5tC0DjH9gJUkmbkL7PEi94aYvJ+ESLd1c=; b=A1iXCaHTTiW6Vh
	Y9siVUa6cnlP2uIFeGA/plc7m3H1tCUe1WByBkTGEpSoqW4TbTgt9EoHE//hSPi3FFgjvWiMaWNYt
	dKzaowStf/aNvztZ3rpL9gcySZCOoxMTyhdXcRKx5B5y8m9KPOakPO9xncVp9rDsPcn3mtVOZnAZ+
	IUtgAtkpMSNJFYG0TSjaaV3UTF9WJUg87R5YjnYV1XIjWCt2OA23xvYuz2LF1EQt8EnfXu4h4GClN
	4iGJ5ByGQmCI4U3LooozxOxjgoqMLmkyJ+jL5xoNBPaGM1w8r4Dn/wXjENxAGqiVyMGR1hUcNV0hT
	9Ij+Tdi5i/RLh7/cIuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gAQ-00000003Qqb-08Yn;
	Wed, 06 Nov 2024 13:33:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fcN-00000003Kuk-2Kbf
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 12:58:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A9955C41D0;
	Wed,  6 Nov 2024 12:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690A8C4CECD;
	Wed,  6 Nov 2024 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730897918;
	bh=2ujlV6ZxWEgsq+pvm9ddS3hkueG0y2+bUAhtEYCGcAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+XgNCectM4aNV3cFE4imKwYcNZX+AtnT5g6IWX5SstkX2u4x3Szda55QdwP8Iac9
	 GP1tU2ZpZ6dCXlpt1WIiXBHWDCn6T9zOabm1awDevTWbmneHy6DLLfiGvBR6vDN2Cx
	 pPArZftoc56yz2URshMLwArpVm5kjMY6LX7qHorA=
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
Subject: [PATCH 5.4 062/462] mtd: slram: insert break after errors in parsing the map
Date: Wed,  6 Nov 2024 12:59:15 +0100
Message-ID: <20241106120333.046274159@linuxfoundation.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106120331.497003148@linuxfoundation.org>
References: <20241106120331.497003148@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_045839_661701_E6096709 
X-CRM114-Status: GOOD (  11.85  )
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

NS40LXN0YWJsZSByZXZpZXcgcGF0Y2guICBJZiBhbnlvbmUgaGFzIGFueSBvYmplY3Rpb25zLCBw
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
