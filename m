Return-Path: <SRS0=Fbdm=ZV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E62EC432C0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Nov 2019 10:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF129215F1
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Nov 2019 10:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqz/1iQL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF129215F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEla/1ga6pblLxXZrLfvIa8G+zhefSPDdfWwtIpu+pk=; b=kqz/1iQLYvFXoC
	ctyW6Uym14lEXslxgvAFBUDkMqNTac0Hm4H2PXTtE2o+ytG4OCevq8NUfbuedW1CpwQLdcxIf9sO7
	QwNFIWIjY3Z+GeV3EnZWHFp9afxqHa5oZqC0l4CN1Ie5N/1is4+WPaGKh1LvG66oZ2WQOYKV7trRH
	tTY+Mt1zBxhE04gVxcIBtN77f04ZsCJv/pxglpkoUGmJf5z4NH/ZYMyRT1H3B9+bkR+iQyC1iTN6t
	Rp4vzBiJ3kanJdbB7ESp1zmAjJJXVZUcsy1rhEWz5360iaTjG+Nl5iXazy8X+9wtGNa2Nr9jiQFfb
	sEEyIL5eOjO5GjOS+9Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iadWF-0006bJ-9f; Fri, 29 Nov 2019 10:28:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iadW9-0006aC-7Q
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2019 10:28:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8BE0E605AD4C;
 Fri, 29 Nov 2019 11:28:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id MzjCSbs_Kowu; Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A1ADE62EBCA9;
 Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PpKVc_9Wkzol; Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 77A026083139;
 Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Date: Fri, 29 Nov 2019 11:28:46 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <1768300347.101090.1575023326346.JavaMail.zimbra@nod.at>
In-Reply-To: <20191129001930.651128-1-joel@jms.id.au>
References: <20191129001930.651128-1-joel@jms.id.au>
Subject: Re: [PATCH] Revert "jffs2: Fix possible null-pointer dereferences
 in jffs2_add_frag_to_fragtree()"
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: Revert "jffs2: Fix possible null-pointer dereferences in
 jffs2_add_frag_to_fragtree()"
Thread-Index: YU57vPD+ANar5XiWuA9wwI2ZV1KT3A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191129_022853_414703_9F70EC9E 
X-CRM114-Status: UNSURE (   5.86  )
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Hou Tao <houtao1@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkpvZWwgU3RhbmxleSIgPGpv
ZWxAam1zLmlkLmF1Pgo+IEFuOiAiRGF2aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9y
Zz4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiSmlhLUp1IEJhaSIgPGJhaWppYWp1MTk5
MEBnbWFpbC5jb20+LCAiQWwKPiBWaXJvIiA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+LCAiT3Bl
bkJNQyBNYWlsbGlzdCIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4sICJsaW51eC1tdGQiCj4g
PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gQ0M6ICJzdGFibGUiIDxzdGFibGVAdmdlci5rZXJuZWwu
b3JnPiwgIkhvdSBUYW8iIDxob3V0YW8xQGh1YXdlaS5jb20+Cj4gR2VzZW5kZXQ6IEZyZWl0YWcs
IDI5LiBOb3ZlbWJlciAyMDE5IDAxOjE5OjMwCj4gQmV0cmVmZjogW1BBVENIXSBSZXZlcnQgImpm
ZnMyOiBGaXggcG9zc2libGUgbnVsbC1wb2ludGVyIGRlcmVmZXJlbmNlcyBpbiBqZmZzMl9hZGRf
ZnJhZ190b19mcmFndHJlZSgpIgoKPiBUaGlzIHJldmVydHMgY29tbWl0IGYyNTM4Zjk5OTM0NTQw
NWY3ZDJlMTE5NGMwYzhlZmE0ZTExZjdiM2EuIFRoZSBwYXRjaAo+IHN0b3BwZWQgSkZGUzIgZnJv
bSBiZWluZyBhYmxlIHRvIG1vdW50IGFuIGV4aXN0aW5nIGZpbGVzeXN0ZW0gd2l0aCB0aGUKPiBm
b2xsb3dpbmcgZXJyb3JzOgo+IAo+IGpmZnMyOiBlcnJvcjogKDc3KSBqZmZzMl9idWlsZF9pbm9k
ZV9mcmFndHJlZTogQWRkIG5vZGUgdG8gdHJlZSBmYWlsZWQgLTIyCj4gamZmczI6IGVycm9yOiAo
NzcpIGpmZnMyX2RvX3JlYWRfaW5vZGVfaW50ZXJuYWw6IEZhaWxlZCB0byBidWlsZCBmaW5hbCBm
cmFndHJlZQo+IGZvciBpbm9kZSAjNTM3NzogZXJyb3IgLTIyCj4gCj4gRml4ZXM6IGYyNTM4Zjk5
OTM0NSAoImpmZnMyOiBGaXggcG9zc2libGUgbnVsbC1wb2ludGVyIGRlcmVmZXJlbmNlcy4uLiIp
Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTdWdnZXN0ZWQtYnk6IEhvdSBUYW8gPGhv
dXRhbzFAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1Pgo+IC0tLQo+IDUuNCBjYW5ub3QgbW91bnQgKHNvbWU/KSBqZmZzMiBmaWxlc3lzdGVt
cyB3aXRob3V0IHRoaXMgZml4LiBIb3UgcG9pbnRlZAo+IHRoaXMgb3V0WzFdIGEgd2hpbGUgYmFj
ayBidXQgdGhlIGZpeCBkaWRuJ3QgbWFrZSBpdCBpbi4gSXQncyBzdGlsbAo+IGJyb2tlbiBpbiAt
bmV4dC4KCnF1ZXVlZCBpbnRvIC1uZXh0LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
