Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508CAC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 13:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD2B62190A
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 13:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rf0xKY5P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="jikAYyoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD2B62190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nic.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=de/CfO96/R5QfWozcY/AwyY9kWdTC1sY3UhFI0Fxs9o=; b=rf0xKY5PuOHhGI
	ps6Cl/pn5Z78Be6LwWYUbtIGUOdomQXpC1Oafrl/yKyFYWeNp5RbLJsvhaccclsYc3mF8ao15EiJ7
	IkDNCA9uCJBnJ9uTrb0YpixQOVDH/H4GqGWv+b33O3mm3z6WqTkfFZnIxdawKs39ozzmLIsxJoYas
	ldnusrff+y+7UdGCkoZSsKu/iCP2IC/03Jt9KMASWH+ih4x9yqov+LSMHHJTQXZG70Ch6ZI6u89NB
	NfTXH+eJZ6wmGJCGxM1ejR1WcxBCPiR55Q7ETOPPi5TJ85YJYRjnYsMouMbcxiGW9JLAkZMp1zbaz
	pVSL9M/rQRP1MNdeM/cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KBp-00078t-89; Fri, 22 Mar 2019 13:26:29 +0000
Received: from mail.nic.cz ([217.31.204.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7KBk-00077e-F0
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2019 13:26:26 +0000
Received: from dellmb.labs.office.nic.cz (unknown
 [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
 by mail.nic.cz (Postfix) with ESMTP id 69ADB629CF;
 Fri, 22 Mar 2019 14:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1553261180; bh=mkL1zH5NefhEDK8f1NxdYPc9rMHq7gG3J+LJMGYxjaE=;
 h=From:To:Date;
 b=jikAYyoXfdYALajMsD3CTDvMHAST1wmg148nAWbjHwHs3+clY0/nPkCDQF1yV0hp+
 SdXejmEWrTWsjEhL64XDGJS86Y0VOrRvdukQYqnidnRmss8CPr2AalyxDhweIIltbM
 Io/sQaKUPZkQxbXqKqlVZT4r5L3z9K3LB6POrzYI=
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 mtd/nand/next 0/3] mtd: rawnand: fsl_elbc: Make SW ECC work
Date: Fri, 22 Mar 2019 14:26:16 +0100
Message-Id: <20190322132619.10339-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_062624_776113_7EFFBF1C 
X-CRM114-Status: UNSURE (   7.49  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Shreeya Patel <shreeya.patel23498@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgp0aGlzIHBhdGNoIHNlcmllcyB1cGRhdGVzIHRoZSBmc2xfZWxiYyByYXduYW5kIGRyaXZl
ciB0byB3b3JrIG9uIENaLk5JQydzClR1cnJpcyAxLngsIHdoZXJlIHRoZSBOQU5EIGNoaXAncyBI
VyBFQ0MgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIEhXIEVDQwpvZiB0aGUgY29udHJvbGxlci4g
U29mdHdhcmUgRUNDIG11c3QgYmUgdXNlZCwgYnV0IHRoZSBmc2xfZWxiYyBkcml2ZXIgZG9lcwpu
b3Qgc3VwcG9ydCBpdCBjb3JyZWN0bHksIGF0IGxlYXN0IG5vdCBmb3IgVHVycmlzLgoKVGhlIGZp
cnN0IHBhdGNoIG9ubHkgbW92ZXMgdGhlIGF0dGFjaF9jaGlwIG1ldGhvZCBvbmx5IGFmdGVyIHRo
ZSBfcmVhZF9wYWdlCmFuZCBmcmllbmRzIGFyZSBkZWZpbmVkLCBzbyB0aGF0IHRoZSB0aGlyZCBw
YXRjaCBjYW4gcmVmZXJlbmNlIHRoZXNlCm1ldGhvZHMgaW4gYXR0YWNoX2NoaXAuClRoZSBzZWNv
bmQgcGF0Y2ggYWRkcyBSTkRPVVQgY29tbWFuZC4KVGhlIHRoaXJkIHBhdGNoIG1vdmVzIHRoZSBj
b2RlIHdoaWNoIHNldHMgRUNDIHBhcmFtZXRlcnMgZnJvbSBpbml0X2NoaXAgdG8KYXR0YWNoX2No
aXAgYmVjYXVzZSB3ZSB3YW50IHRvIGNvbnNpZGVyIGRldmljZS10cmVlIHNldHRpbmdzIChpZiBT
VyBFQ0Mgd2FzCmNob3NlbiBpbiBkZXZpY2UtdHJlZSkuCgpNYXJlawoKTWFyZWsgQmVow7puICgz
KToKICBtdGQ6IHJhd25hbmQ6IGZzbF9lbGJjOiBDb3NtZXRpYyBtb3ZlCiAgbXRkOiByYXduYW5k
OiBmc2xfZWxiYzogSW1wbGVtZW50IFJORE9VVCBjb21tYW5kCiAgbXRkOiByYXduYW5kOiBmc2xf
ZWxiYzogTWFrZSBTVyBFQ0Mgd29yawoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9lbGJjX25h
bmQuYyB8IDIwMSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MTMgaW5zZXJ0aW9ucygrKSwgODggZGVsZXRpb25zKC0pCgotLSAKMi4xOS4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
