Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA72C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pZIKBI1L7uzy4gZ8ISlO6b4ByQ/EvYerVpYGYCsMyl8=; b=kiLSuURga1UuY8eW5/P+wI73nw
	ltTQjfIIurRTV2Ein+6cvtnk7YDuYy3Xc7fJbZcXKX1LQ7A5Vt0vW3v61UDBXp+0Mf0y3nbSwhjsN
	A0Eyv7JVBQmHD3ZJuSLlWxov4ympM8VyaZ267tDR0k6DijaFxz9RhyxWXgcChxqhzE3RPDJuOE5tX
	BsJyjKrA1pO9CZxJOl61Ls5rl+jn4emYxN8YW9X5FqTrTkPYyw1OH5aH1RtyifHxU02m7Q5j/VP3h
	82rhRK9PDqZsksyAhMcBZcNHcoPPqJryKUTAeKi8o30eBDjPts/3prl/nSN6vgwJ1D89PzE/jWwoK
	WG2VuAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovxAz-002u9Y-Cq; Fri, 18 Nov 2022 08:56:45 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovxAv-002u6k-HO
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 08:56:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 48A0261989E3;
	Fri, 18 Nov 2022 09:56:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id GwV-ib3UAR4e; Fri, 18 Nov 2022 09:56:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C02E461989E9;
	Fri, 18 Nov 2022 09:56:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Zw0FgYgv4uWV; Fri, 18 Nov 2022 09:56:28 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A1BCB61989E3;
	Fri, 18 Nov 2022 09:56:28 +0100 (CET)
Date: Fri, 18 Nov 2022 09:56:28 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <16338722.252938.1668761788563.JavaMail.zimbra@nod.at>
In-Reply-To: <8207d8f9-8b30-cfbb-9a5f-56294cb35601@huawei.com>
References: <20221011034732.45605-1-chengzhihao1@huawei.com> <8207d8f9-8b30-cfbb-9a5f-56294cb35601@huawei.com>
Subject: Re: [PATCH 0/6] ubifs: Fix wrong space calculation while doing
 budget
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix wrong space calculation while doing budget
Thread-Index: uy1pHj0we5aN/s0rXTydNGW/V+d95Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_005641_766323_307C4E33 
X-CRM114-Status: UNSURE (   4.00  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
IlNhc2NoYSBIYXVlciIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+LCAiTWlxdWVsIFJheW5hbCIg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRA
bGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnPiwgInlpIHpoYW5nIgo+IDx5aS56aGFuZ0BodWF3ZWkuY29tPgo+IEdlc2VuZGV0
OiBGcmVpdGFnLCAxOC4gTm92ZW1iZXIgMjAyMiAwOTo1MzozOAo+IEJldHJlZmY6IFJlOiBbUEFU
Q0ggMC82XSB1YmlmczogRml4IHdyb25nIHNwYWNlIGNhbGN1bGF0aW9uIHdoaWxlIGRvaW5nIGJ1
ZGdldAoKPiDlnKggMjAyMi8xMC8xMSAxMTo0NywgWmhpaGFvIENoZW5nIOWGmemBkzoKPiAKPiBI
aS4gUmljaGFyZAo+IEp1c3QgYSByZW1pbmRpbmcuIENvdWxkIHlvdSBwbGVhc2UgbG9vayB0aHJv
dWdoIGZvbGxvd2luZyBzZXJpZXMoU29tZSBvZgo+IHRoZW0gaXMgc2VudCBzZXZlcmFsIG1vbnRo
cyBhZ28pLCBJIHdpc2ggdGhlc2UgY2FuIGJlIG1lcmdlZCBpbiA2LjEsCj4gdGhhbmtzIGEgbG90
Ogo+IAo+IHViaSBpbmZpbml0ZSBsb29wOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVzPTMwNDQ4NQo+IHViaSB1YWYgaW4gc3lzZnM6
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9z
ZXJpZXM9MzExOTU2Cj4gdWJpIGZhc3RtYXA6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9MzEzMDYzCj4gdWJpZnMgYXNzZXJ0aW9u
IGZhaWxlZCBhYm91dCB3cml0ZXBhZ2U6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9MzAyNzc2Cj4gdWJpZnMgc3BhY2UgYnVkZ2V0
Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlzdC8/
c2VyaWVzPTMyMjIyMAoKU3VyZS4gTGV0IG1lIGNoZWNrIHdoYXQgaGFwcGVuZWQgdG8gdGhlbS4K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
