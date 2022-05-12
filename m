Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5035C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JI20yWYHKwZVSSHkmo/LHPTsISmh0CwNJkEeWusZt+U=; b=WrhtHgLFOUgLIO
	H8fBwOPcalWdBtmv5Y1FFqLqElAmSgQJAjxGyKyNAj1SMuOCS84cw0V5yMXwCPAAlliLPA7cGuLWB
	KBn8OKX4Q49fUeTmlr68ImnC5l/tjabNXWkfG8X0rj85ZoIdXEh3qQ9kSYqJiQgIp16/uSSvXS+zi
	Mmj7k8qZbLWMODos0f44P+6kCZ3lnbtkhs+nWaLL1is894Ov9F/LsK59Ng1+EDWOJ+0GCQyp5HZj1
	8O/0tkIjn90YVa2c+iTkjd2UU1Qr72E3i9+u7CY1m3VKBiA+sDn5t5eQD9vbQVpTZkYRbe88j2dlN
	Tm30y8cx7nLMEbNQdhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAib-00CbmQ-Li; Thu, 12 May 2022 15:27:09 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAiY-00Cbll-Sj
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:27:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C2561BF20E;
 Thu, 12 May 2022 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7NNT92k26CJgW/8BeDWNQkG7ssrSCWKv0a9u8U2/8M=;
 b=P8I5f/YpC9U1TfQ8e9YGjttd53tWVniAp7/SiGkzeOOeFKIVX4v2JFxT9U/p9sDxbbkGUH
 /jOrPdPANq+XVQ1uJ/JpDKgkg6wDlwuDECjIPVkQxhIKRXZ3wPKL8F1hlB1g5Jq60yFNel
 yVruQCQEfcvV1Z8HwpV3mjC0avNxT1bTzMtVsTn267dlrAESD1ls6eRBReag0vs199sCww
 m5kspJGdlrM4bL6U7sda3FBdZ9eCM2BgyLAiQGhtViKluoScyAEM9q8rWK2U7QTRy/2wNb
 /RJ5X13tKs3/87v1a8x6wYjTHtcTKg8HjdnA8KPxLmaoYfUsprOHoKL0OYOZRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@axis.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mtd: phram: Allow cached mappings
Date: Thu, 12 May 2022 17:27:01 +0200
Message-Id: <20220512152701.244667-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220510151822.1809278-1-vincent.whitchurch@axis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9a7459fd9be4968721ba7a4c6c7eae2f01da2b32'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082707_175429_21F9335F 
X-CRM114-Status: GOOD (  13.21  )
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

On Tue, 2022-05-10 at 15:18:22 UTC, Vincent Whitchurch wrote:
> Currently phram always uses ioremap(), but this is unnecessary when
> normal memory is used.  If the reserved-memory node does not specify the
> no-map property, indicating it should be mapped as system RAM and
> ioremap() cannot be used on it, use a cached mapping using
> memremap(MEMREMAP_WB) instead.
> 
> On one of my systems this improves read performance by ~70%.
> 
> (Note that this driver has always used normal memcpy/memset functions on
> memory obtained from ioremap(), which sparse doesn't like.  There is no
> memremap() variant which maps exactly to ioremap() on all architectures,
> so that behaviour of the driver is not changed to avoid affecting
> existing users, but the sparse warnings are suppressed in the moved code
> with __force.)
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
