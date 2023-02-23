Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC93C636D6
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmwnXFYZ1OLhaQe7Lpnm1NlBwNaap5ELCYEIwiqpjbs=; b=m2OjlZvSuylw28
	DrPfiiugChzhY8VAoFs3QmjcUCnFsVby9yMwwl+zTtkSwhtwU+zhXAf0v5VTeusjhkrRr3lYDH++2
	gOMExYIziZ3sTA50lKwxNERNWEwqgm5+HZKc0X0SFssLCWspSP0M6yCwO8saM6TNEREU/RCZX2a5V
	gryVm+LiajthV6sVqgUnP5idpUnUrRQm3K23Anqb4bQ2eCDlCGERCt+TmVH4n63sv8AFVX70qlJ9g
	okjIwIMxkx4AMGwhQA+NWfyvK7G1ZBI/B+K7GOvbq5SakLlzD2Zg3MhgAjDArIYbW5o2sJWB1RT8a
	1kJicL0NXwpFSqamhFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8x6-00FzE6-6S; Thu, 23 Feb 2023 10:35:52 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8x2-00FzC8-DQ
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 10:35:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5F8C240009;
	Thu, 23 Feb 2023 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677148540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbodoF8my/U7Wc4GJhz9xifmeCeQr4SbmspEfd6rRLw=;
	b=PpUgLCeGcAcUEfwTfnYHSKdZjKbLYmwYT4qyrCyFdtGrhh0um6HOyrjCOW/RcYGOjHu8Ko
	GHxSSJ+9u6Ry9snpIgbqs7JNsHeMS0U6ERgWOgYwv5A3lF7lXD8RQqlEIIaybjBINYQulV
	zBEW6U5nxcp98BNSrrc+761hiiNHv5V8SI+7NrSTbx/7kNx04zIr9QXOu5kEATCSpme3oK
	28uUvDA2Glt3XsSiF0PSZIFmZSbzgaouF80o4ENASW4aRUVo/c/6O8lgyDPgIowwzUfr0l
	FuSKanAN9H01JHskQP8oPlQn1/3He3KyRTNNsdkXhxthDIMyPEPMvJCbAgTxkw==
Date: Thu, 23 Feb 2023 11:35:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.3
Message-ID: <20230223113538.5fa68096@xps-13>
In-Reply-To: <20230223102125.4d913f60@xps-13>
References: <20230223102125.4d913f60@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_023548_758168_47F7922E 
X-CRM114-Status: UNSURE (   4.88  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFRodSwgMjMgRmViIDIw
MjMgMTA6MjE6MjUgKzAxMDA6Cgo+IEhlbGxvLAo+IAo+IFRoaXMgaXMgdGhlIE5BTkQgUFIgZm9y
IDYuMy4KClB1bGxlZCBpbnRvIG10ZC9uZXh0LgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
