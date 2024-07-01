Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4180C3065C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydRM2zzYBN/9SJc50bQX4Wv4wIr6z/Arha3lP+nlCfo=; b=GgQiIK2j66jwxy
	cG/OZgfESIUsNAfj1PzOv6qCliInfNQlRDNdsuKPG6b9RC97/jtgvxgiqwXp2xY67B/3DAQ+3vIj9
	8b5CDRVL6z9/n8tV5UTWPmYub22yG5bpQflK+nOl8WNHYuB+ST3brkNHJZIeLhubZ63JJPT5X17HA
	MaV26W1IaPZ1KGGZNU633MjTGSZITfV2wi+f6dAGIiD3qf5IdRxB9pC0/8pYmd3+hRW1zJSgOGxEX
	LX2+760HAQ1UIUhC7lmbVBmWeSITK5b+zPr4w54Mfw2qZRPwKJtAZBVlD3FLSCPrkAfyH5bXtOrJK
	QwSfyWq6rofli3LDPcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFon-000000032n2-3E9K;
	Mon, 01 Jul 2024 12:07:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFhX-00000002zqO-495g
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:00:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACD9D1C0013;
	Mon,  1 Jul 2024 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Dm+5ZOEDo5N1ona/2gB+fx6W26LTeBh2TMryo1Pt7s=;
	b=QW+s2yCu5tgEzhpS0Yn/BgS4Zbs8SbBJnKidPqpCCN/Cv9v1wxkd5xGuHTgHJ3WUe2b/Vj
	VdT0GW7WKdWXs8zSnX7ISdVHzJiwMTqr8ct5XlY1te7sEeWBGjbkJi/qZQNnt06myz293t
	BUXihOUfNIjx08ODwg9Z9EFcyONqst3oABtRGd/a/ME6FihdLpg+/vMiGcS4n7oGa6IYMI
	/9Rbodl3CnlP733+cwQtXT8QujdUVFndu4ghZGBsAu04ZCMb8YUlYKOI0qnpXV35v3E4oa
	DunIIpu6atdQqI8YzMPZkUaHmRwIHS4N2Xrmozj8Jn8DnB6L8yGhc7TNnAOajg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: cmdlinepart: Replace `dbg()` macro with `pr_debug()`
Date: Mon,  1 Jul 2024 14:00:03 +0200
Message-Id: <20240701120003.525353-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625093148.3579660-1-csokas.bence@prolan.hu>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2538af030d6fa74dfe66121d6c53757e47d224a4'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050008_347595_67415E4F 
X-CRM114-Status: UNSURE (   6.64  )
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

T24gVHVlLCAyMDI0LTA2LTI1IGF0IDA5OjMxOjQ3IFVUQywgPT91dGYtOD9iP1EzUERzMnZEb1hN
c0lFSmxibU5sPz0gd3JvdGU6Cj4gVGhpcyBtYWNybyB3YXMgbGVmdCBvdmVyIGZyb20gdGhlIGRh
d24gb2YgR2l0IGhpc3RvcnkuCj4gRm9yIHNvbWUgcmVhc29uIGl0IHdhcyBkZWZpbmVkIGluIHN1
Y2ggYSB3YXkgdGhhdAo+IHlvdSBuZWVkZWQgZG91YmxlIGJyYWNrZXRzIGFyb3VuZCBpdC4gUmVw
bGFjZSBpdCB3aXRoCj4gdGhlIG5vdy1zdGFuZGFyZCBgcHJfZGVidWcoKWAuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ3PDs2vDoXMsIEJlbmNlIDxjc29rYXMuYmVuY2VAcHJvbGFuLmh1PgoKQXBwbGll
ZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQv
bGludXguZ2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
