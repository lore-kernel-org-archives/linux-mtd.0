Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FCAC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:59:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40170206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcRTQ+43"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40170206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6s3lt4LnQGQC4PAs4avcM4CKU2fZ0cUdk/yoJQ+tvjk=; b=hcRTQ+43NBLkcc
	WmpTCAtNANA+Q57e5aD6SMkTvFtI7Avkp4tgkppXIBJy8Rpy6ouXxVPp+NxDLVcXUCQYfdIjVkmo+
	iBgAJEUQ3UxpYRfMTTUlvsWsLkNf5oxmDkTzp0P38yWXJ9FgRdPciQ/lwjN0R3guoqKx+plabsU2c
	sfbd0lzaOL8j1A728OJARYQaovnEOWU0udWPesDbk/fncfAGGPCs3IDNgqRUUX4XyPC+Fd5lqSeuS
	SFBeu/peQQzUnkfKaT6NqsXiYgF4HyufgOuf0BzxqVsT8VaquuEIyvuFCoWFCorFGIcmwNlxdx5yA
	iI+iq5dMDtQuNhxEqQBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8xN-0004xK-Em; Mon, 25 May 2020 08:59:37 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8wk-0004NR-HW
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:00 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 178CC240016;
 Mon, 25 May 2020 08:58:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 00/17] Clean nandsim error path
Date: Mon, 25 May 2020 10:58:34 +0200
Message-Id: <20200525085851.17682-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015858_724527_843029E3 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpBcyBwYXJ0IG9mIGEgYmlnZ2VyIGNsZWFudXAgSSByZWFsaXplZCB0aGUgZXJyb3Ig
cGF0aCBvZiBuYW5kc2ltLmMgd2FzCmhvcnJpYmx5IHdyb25nLiBUaGVyZSBhcmUgYSBmZXcgYWRk
aXRpb25hbCBjaGFuZ2VzLCBsaWtlIGhhdmluZyBhCmNvbnNpc3RlbnQgbmFtaW5nIGZvciBhIGdp
dmVuIG9iamVjdCwgYnV0IG1vcmVvdmVyIHRoaXMgaXMgYW4gZXJyb3IKcGF0aCBjbGVhbnVwLCBk
cml2ZXItd2lkZS4KCkNoZWVycywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2MjoKKiBSZW9yZGVyZWQg
dGhlIGtmcmVlKCkgYW5kIHRoZSBsaXN0X2RlbCgpIHRvIGF2b2lkIGEgdXNlIGFmdGVyIGZyZWUK
ICBpc3N1ZSB0aGF0IEkgaW50cm9kdWNlZCBpbiB2MS4KKiBVc2VkIGRlYnVnZnNfcmVtb3ZlX3Jl
Y3Vyc2l2ZSgpIGluc3RlYWQgb2YganVzdCBkZWJ1Z2ZzX3JlbW92ZSgpLgoKTWlxdWVsIFJheW5h
bCAoMTcpOgogIG10ZDogcmF3bmFuZDogbmFuZHNpbTogQ29uc2lzdGVudCB1c2Ugb2YgJ25zJyBp
bnN0ZWFkIG9mICdkZXYnCiAgbXRkOiByYXduYW5kOiBuYW5kc2ltOiBVc2Ugb2N0YWwgcGVybWlz
c2lvbnMKICBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06IFVzZSBhIGNvbnNpc3RlbnQgbnNfIHByZWZp
eCBmb3IgYWxsIGZ1bmN0aW9ucwogIG10ZDogcmF3bmFuZDogbmFuZHNpbTogQ2xlYW4gZXJyb3Ig
aGFuZGxpbmcKICBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06IEtlZXAgdHJhY2sgb2YgdGhlIGNyZWF0
ZWQgZGVidWdmcyBlbnRyaWVzCiAgbXRkOiByYXduYW5kOiBuYW5kc2ltOiBSZW1vdmUgZGVidWdm
cyBlbnRyaWVzIGF0IHVubG9hZCB0aW1lCiAgbXRkOiByYXduYW5kOiBuYW5kc2ltOiBGaXggdGhl
IHR3byBuc19hbGxvY19kZXZpY2UoKSBlcnJvciBwYXRocwogIG10ZDogcmF3bmFuZDogbmFuZHNp
bTogRnJlZSBwYXJ0aXRpb24gbmFtZXMgb24gZXJyb3IgaW4gbnNfaW5pdCgpCiAgbXRkOiByYXdu
YW5kOiBuYW5kc2ltOiBGcmVlIHRoZSBhbGxvY2F0ZWQgZGV2aWNlIG9uIGVycm9yIGluIG5zX2lu
aXQoKQogIG10ZDogcmF3bmFuZDogbmFuZHNpbTogRnJlZSB0aGUgcGFydGl0aW9uIG5hbWVzIGlu
IG5zX2ZyZWUoKQogIG10ZDogcmF3bmFuZDogbmFuZHNpbTogU3RvcCB1c2luZyBuYW5kX3JlbGVh
c2UoKQogIG10ZDogcmF3bmFuZDogbmFuZHNpbTogVXNlIGFuIGFkZGl0aW9uYWwgbGFiZWwgd2hl
biBmcmVlaW5nIHRoZQogICAgbmFuZHNpbSBvYmplY3QKICBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06
IEZyZWUgZXJhc2VfYmxvY2tfd2VhciBvbiBlcnJvcgogIG10ZDogcmF3bmFuZDogbmFuZHNpbTog
Rml4IHRoZSBsYWJlbCBwb2ludGluZyBvbiBuYW5kX2NsZWFudXAoKQogIG10ZDogcmF3bmFuZDog
bmFuZHNpbTogTWFuYWdlIGxpc3RzIG9uIGVycm9yIGluIG5zX2luaXRfbW9kdWxlKCkKICBtdGQ6
IHJhd25hbmQ6IG5hbmRzaW06IFJlbmFtZSBhIGxhYmVsIGluIG5zX2luaXRfbW9kdWxlKCkKICBt
dGQ6IHJhd25hbmQ6IG5hbmRzaW06IFJlb3JnYW5pemUgbnNfY2xlYW51cF9tb2R1bGUoKQoKIGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYyB8IDQzNyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNTMgaW5zZXJ0aW9ucygrKSwgMTg0IGRlbGV0
aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
