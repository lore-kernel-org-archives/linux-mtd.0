Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ED8C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VTQ0eTQJnWn4RMVoMUCJxvY8KRPviHljr528W4hCqyk=; b=ByGoeLu+KPUGwvb7Rzr5Xzrsjc
	SFhIqOvSsL2ogusaL7Io94yE68PnHdmt8qdWCUiO4aTmnuTyllHDwZ0dXUi/gG5Dj8QJDCZ4XaIBG
	OYg3VajTN3gCk3jZ3E3HZBraWbM2e+V50lxNyhyPDKNo+ZLTCZf33oxgOpwf1p5fqoXl3L/E1Qg8i
	diaAN2gqLrcQA1+QqUKpOmjdGr8603UY6kWMNiOIAZ/08aVkVuFlDTmncnA3SV/YZ/B7OvA+tDSP+
	X7MTrrmMg4Uxe+4z0re22uuu+tAErBXGsY0gh9jx2Rx/3cnWPiHqjtz1sXlRZ68mi9l3pmLBmCcqV
	TPvDf0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCepo-00B30s-6t; Wed, 26 Jan 2022 09:43:24 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCepk-00B2yC-QU
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 09:43:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7400E62DA600;
 Wed, 26 Jan 2022 10:43:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Mj5u7YB1Sny4; Wed, 26 Jan 2022 10:43:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2852062DA5FD;
 Wed, 26 Jan 2022 10:43:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id V602CWnTQ0xT; Wed, 26 Jan 2022 10:43:19 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 080E26089354;
 Wed, 26 Jan 2022 10:43:19 +0100 (CET)
Date: Wed, 26 Jan 2022 10:43:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: David Decotigny <ddecotig@google.com>
Cc: David Decotigny <decot+git@google.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <892667198.295852.1643190198952.JavaMail.zimbra@nod.at>
In-Reply-To: <CAG88wWZYbMLYRa9iebAeWtBdLtNWdL4djbPRq36EHrXeNzMsiw@mail.gmail.com>
References: <20220126085735.575625-1-decot+git@google.com>
 <1788102040.295765.1643188123063.JavaMail.zimbra@nod.at>
 <CAG88wWZYbMLYRa9iebAeWtBdLtNWdL4djbPRq36EHrXeNzMsiw@mail.gmail.com>
Subject: Re: [PATCH RFC v1 1/1] mtd_blkdevs: avoid soft lockups with some
 mtd/spi devices
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd_blkdevs: avoid soft lockups with some mtd/spi devices
Thread-Index: TfhhA1QsuslokIrhxg+yldyMEyrYEw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_014321_047107_E65BF2F2 
X-CRM114-Status: UNSURE (   3.92  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhdmlkIERlY290aWdueSIg
PGRkZWNvdGlnQGdvb2dsZS5jb20+Cj4gWWVzLCBpdCBpcyBhIHJlYWwgcHJvYmxlbSBmb3IgdXMs
IHNlbnQgdjIgd2l0aCBzcGxhdCBpbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLgo+IFRoZSBtb3N0
IGFubm95aW5nIGZvciB1cyBpcyBub3QgdGhlIFJDVSBzcGxhdCBwZXItc2UsIGl0J3MgdGhlIG5l
dGRldiB0aW1lb3V0LAo+IGJ1dCB0aGUgdHJhY2UgaXMgbm90IHJlbGV2YW50IChkZXRlY3RlZCBv
biBhbm90aGVyIGNvcmUpLgoKT2theS4gQnV0IHRoZW4gaXQgaXNuJ3QgYSBmYWxzZSBwb3NpdGl2
ZSBhcyB5b3Ugd3JpdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
