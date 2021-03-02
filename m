Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C751CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:04:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058AC64EBD
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058AC64EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jszz2ZZdq9yUeMhc5hyjvSiM/w8tWiSM48ZLN+fGSb4=; b=EwecXLOqe2eOXZpWq2apCxvSV
	AkEOfTcA//U0zpGodJDyGMcScAUtL7SRuZ+pm7JEQ/qRyCjiDTT0VcxF5GZJqfLkOPiGmjlebqhGi
	ncgr+RyuW3HzU71tOOsMenDOBEoxuwgckmnSGjd8vWANM/EXBAOX3hDOXyhVNHIb/DPry3SFbsgCT
	SObuiKcyvVwXbbxgtHWzfZ3r53hf9wkYPLZ+DHP4xK+kenitIU06YN8/eGGxhjsTjDFF2nBUudKRC
	5tvQ0JDfHE8f0i2Mw3JyX2AUj7AIKIhzJVrhF0oIRI7Hqd6imKwgn2Lxzb/dKIRruHcF4j75+yONX
	KLJUbVbbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVqe-005w6K-0L; Wed, 03 Mar 2021 18:03:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSyK-005GMa-8q
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zsEDf8n+Oto4W5djP+FxbB8vrPIP0+Vf3EhfrB7p4+g=; b=b4KA4SWSzxGOM2QlM5noBNakD2
 UnC6w3E9xlz9oS/GJcmQIMwOwIwHtih3TpCIWFKw1vpjduFa82unU8OJUTuRzqVPl6A1B1Fan/DUq
 OzycLxqi+08UrS50cmHAqkw19+mkZ50ppewBKG8VghSsbwAxoUsxM/g29CsKzviIW4TSM+EqCnWZ7
 xCghCLd+WXFgqzpCfH3y8X7Dxu5ETQ5MO/cFRYzLWfPql9vLuUPs08hxFapJzBtFZJcZ9+y+iBhSR
 c4r6lNgw865EoNIMbNFlDly2UxXtddOo+hhjntKxgjLBPSYxwA483uOCYXG0UGMVi7ZK3QD5YoQoQ
 DzH32Jxw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7y5-00HSID-NQ
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:54 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7CF3A1C0011;
 Tue,  2 Mar 2021 16:33:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz
Subject: Re: [PATCH v3 6/9] mtd: rawnand: Try not to use the ECC private
 structures
Date: Tue,  2 Mar 2021 17:33:29 +0100
Message-Id: <20210302163329.23901-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e92d8e7bb79fcb8024ea53fd1f5228cefe20f138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163354_880348_5BFE42C2 
X-CRM114-Status: UNSURE (   5.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-27 at 20:30:17 UTC, Miquel Raynal wrote:
> Most of the time, there is no need to use the software ECC Hamming and
> BCH algorithms private context to know their configuration. All the
> data has been stored by their ->init_ctx() hook in the generic NAND
> ECC engine structure, so use this one when possible.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
