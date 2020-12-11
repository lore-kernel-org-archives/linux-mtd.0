Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A10C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 19:15:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16302409B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 19:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16302409B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rEshCXE9d2FGUGw6eT+xYmu0XG8J1aTOq+XDz5ud2uc=; b=yQcgGWe2gb44R+eApNG1pLN5GT
	p0best+BkldircwPb+UTNCFXoa2V0LmR4t5ZCHxvlXS4Mem6WKLM1ES6mI5CuOvis9bezuflZOo9M
	luY9CmHyqFBCsOrdF36SwY3Tx88yOVOP1Is/GZlU9FUuVFBKKEAgDO0+9HxX33YKUHc8ZLt5/824V
	TmiiEZa8OWSscJXlY6+oF9gFZargje1GBYKI1RgZOz3Y08+BtrQR+w/BL0Gg93Me3AKWOSImNdpF8
	/FsQkCPdj8irZXxkfPeH1Ywz1QP8OT/MoYo7yX3oPe6cZeUSKH1CElqSKgN/TJ1vLkgqdroC59XQw
	G2OwFhcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knnrl-0005Rs-8s; Fri, 11 Dec 2020 19:14:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knnri-0005Qe-6b
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 19:14:07 +0000
X-Originating-IP: 109.220.208.103
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 111C220002;
 Fri, 11 Dec 2020 19:13:56 +0000 (UTC)
Date: Fri, 11 Dec 2020 20:13:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Changes for 5.10 final
Message-ID: <20201211201356.62c54b3f@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_141406_824102_DF7D1F44 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpUaGlzIGlzIHRoZSBsYXN0IGZpeGVzIE1URCBQUiBmb3IgNS4xMCBmaW5h
bC4KClRoYW5rcywKTWlxdcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBi
NjUwNTQ1OTc4NzJjZTNhZWZiYzZhNjY2Mzg1ZWFiZGY5ZTI4OGRhOgoKICBMaW51eCA1LjEwLXJj
NiAoMjAyMC0xMS0yOSAxNTo1MDo1MCAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbXRkL2xpbnV4LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNS4xMC1yYzgKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzM2Q5NzRlNzZlMjFlOWRhOGEzNmIxNGQyZGNlNjM5NGMz
NmMzZTMwOgoKICBtdGQ6IHJhd25hbmQ6IHh3YXk6IERvIG5vdCBmb3JjZSBhIHBhcnRpY3VsYXIg
c29mdHdhcmUgRUNDIGVuZ2luZSAoMjAyMC0xMi0xMSAyMDoxMDowMiArMDEwMCkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
UmF3IE5BTkQ6CiogU2Vjb25kIGZpeGVzIHNlcmllcyBpbml0aWF0ZWQgYmVjYXVzZSBvZiBhIHJl
d29yayBvZiB0aGUgRUNDIGVuZ2luZQogIHN1YnN5c3RlbS4gVGhlIGxvY2F0aW9uIG9mIHRoZSBE
VCBwYXJzaW5nIGxvZ2ljIGdvdCBtb3ZlZCwgYnJlYWtpbmcKICBzZXZlcmFsIGRyaXZlcnMgd2hp
Y2ggaW4gZmFjdCB3ZXJlIG5vdCBkb2luZyB0aGUgRUNDIGVuZ2luZQogIGluaXRpYWxpemF0aW9u
IGF0IHRoZSByaWdodCBwbGFjZS4gVGhlc2UgZHJpdmVycyBoYXZlIGJlZW4gZml4ZWQgYnkKICBl
bmZvcmNpbmcgYSBwYXJ0aWN1bGFyIEVDQyBlbmdpbmUgdHlwZSBhbmQgYWxnb3JpdGhtLCBzb2Z0
d2FyZQogIEhhbW1pbmcsIHdoaWxlIHRoZSBhbGdvcml0aG0gbWF5IGJlIG92ZXJ3cml0dGVuIGJ5
IGEgRFQKICBwcm9wZXJ0eS4gVGhpcyBtZXJnZSByZXF1ZXN0IGZpeGVzIHRoaXMgaW4gdGhlIHh3
YXksIHNvY3JhdGVzLAogIHBsYXRfbmFuZCwgcGFzZW1pLCBvcmlvbiwgbXBjNTEyMSwgZ3Bpbywg
YXUxNTUwIGFuZCBhbXMtZGVsdGEKICBjb250cm9sbGVyIGRyaXZlcnMuCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1pcXVl
bCBSYXluYWwgKDkpOgogICAgICBtdGQ6IHJhd25hbmQ6IGFtcy1kZWx0YTogRG8gbm90IGZvcmNl
IGEgcGFydGljdWxhciBzb2Z0d2FyZSBFQ0MgZW5naW5lCiAgICAgIG10ZDogcmF3bmFuZDogYXUx
NTUwOiBEbyBub3QgZm9yY2UgYSBwYXJ0aWN1bGFyIHNvZnR3YXJlIEVDQyBlbmdpbmUKICAgICAg
bXRkOiByYXduYW5kOiBncGlvOiBEbyBub3QgZm9yY2UgYSBwYXJ0aWN1bGFyIHNvZnR3YXJlIEVD
QyBlbmdpbmUKICAgICAgbXRkOiByYXduYW5kOiBtcGM1MTIxOiBEbyBub3QgZm9yY2UgYSBwYXJ0
aWN1bGFyIHNvZnR3YXJlIEVDQyBlbmdpbmUKICAgICAgbXRkOiByYXduYW5kOiBvcmlvbjogRG8g
bm90IGZvcmNlIGEgcGFydGljdWxhciBzb2Z0d2FyZSBFQ0MgZW5naW5lCiAgICAgIG10ZDogcmF3
bmFuZDogcGFzZW1pOiBEbyBub3QgZm9yY2UgYSBwYXJ0aWN1bGFyIHNvZnR3YXJlIEVDQyBlbmdp
bmUKICAgICAgbXRkOiByYXduYW5kOiBwbGF0X25hbmQ6IERvIG5vdCBmb3JjZSBhIHBhcnRpY3Vs
YXIgc29mdHdhcmUgRUNDIGVuZ2luZQogICAgICBtdGQ6IHJhd25hbmQ6IHNvY3JhdGVzOiBEbyBu
b3QgZm9yY2UgYSBwYXJ0aWN1bGFyIHNvZnR3YXJlIEVDQyBlbmdpbmUKICAgICAgbXRkOiByYXdu
YW5kOiB4d2F5OiBEbyBub3QgZm9yY2UgYSBwYXJ0aWN1bGFyIHNvZnR3YXJlIEVDQyBlbmdpbmUK
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hbXMtZGVsdGEuYyAgICAgfCA0ICsrKy0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2F1MTU1MG5kLmMgICAgICB8IDQgKysrLQogZHJpdmVycy9tdGQvbmFuZC9y
YXcvZ3Bpby5jICAgICAgICAgIHwgNCArKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tcGM1MTIx
X25mYy5jICAgfCA0ICsrKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L29yaW9uX25hbmQuYyAgICB8
IDQgKysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvcGFzZW1pX25hbmQuYyAgIHwgNCArKystCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9wbGF0X25hbmQuYyAgICAgfCA0ICsrKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3NvY3JhdGVzX25hbmQuYyB8IDQgKysrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcv
eHdheV9uYW5kLmMgICAgIHwgNCArKystCiA5IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
