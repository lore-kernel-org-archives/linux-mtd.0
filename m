Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05164C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:37:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DCD20715
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DCD20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DlxPhwvlnk0LqHup5tgrxHKv11Z/CTJSddntP8Un5kk=; b=AQ0OXIesAOODt2s9a2aEb0UF7
	DKQsqSxLuMBOWRu8HXKGy0VLrUuLI/tGh9F7VhOO+CWZTJRc79n8WpMK2Z1MADaKfH7Nb6/6blymD
	C8yXxWhbr2TQ4yR5MXDeS2ulU7akBGlPq5oEi1VBF3AnLFfOLImltumpUuNkSRdvt94Iak7NSRkfv
	QtgPkKm/Y5TsbM87xDH66D14ps0MBS79nF0XCjDa1SlBd6i2E9GskQywDaGFjYbZVESwlGycrx9dj
	Razjdn5Y32x3bZzWF0nH+kFwJDs6lNxqE3IaWJtOYokzifxQGEgnnJFG6IN5IUQTE/hz5fzIGxQNj
	i+KIpx6dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwNDb-00072h-DT; Mon, 04 Jan 2021 10:36:07 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwNDY-000727-8R
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 10:36:05 +0000
X-Originating-IP: 90.89.98.255
Received: from localhost.localdomain
 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr [90.89.98.255])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 195A36003C;
 Mon,  4 Jan 2021 10:35:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix dst bit offset when extracting
 raw payload
Date: Mon,  4 Jan 2021 11:35:58 +0100
Message-Id: <20210104103558.9035-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221100013.2715675-1-sean@geanix.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d1879af7ce7618e3580fbd89bf4f2fefe4175e6d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_053604_410778_E657170B 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: =?utf-8?q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTEyLTIxIGF0IDEwOjAwOjEzIFVUQywgU2VhbiBOeWVramFlciB3cm90ZToK
PiBSZS1hZGQgdGhlIG11bHRpcGx5IGJ5IDggdG8gInN0ZXAgKiBlY2NzaXplIiB0byBjb3JyZWN0
IHRoZSBkZXN0aW5hdGlvbiBiaXQgb2Zmc2V0Cj4gd2hlbiBleHRyYWN0aW5nIHRoZSBkYXRhIHBh
eWxvYWQgaW4gZ3BtaV9lY2NfcmVhZF9wYWdlX3JhdygpLgo+IAo+IEZpeGVzOiBlNWU1NjMxY2M4
ODkgKCJtdGQ6IHJhd25hbmQ6IGdwbWk6IFVzZSBuYW5kX2V4dHJhY3RfYml0cygpIikKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFJlcG9ydGVkLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8
bWFydGluQGdlYW5peC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBOeWVramFlciA8c2VhbkBn
ZWFuaXguY29tPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
