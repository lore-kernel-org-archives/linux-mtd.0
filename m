Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B604EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8OVjlb6a75Ee6yZeH4yjy7iQ6sCW3Z/DYxIRhRMLmM=; b=LhmfMkkxx7twqV
	7T+4b88nyyWYsCbw6hG4seHMcpSfV3KMc8SBa6eK1Gmh669PKhRiCrSMoXQcyMi2IwDxkohLl4CoQ
	jtOTALNQVr0xI0/lMylAKUJr0ZKvJRMiXgJAc48uoOVD0HnLfx+mYKn9q3cC/xnlhxfQu4VftzOBv
	DTbYfpfWa3LdL7h/wUB+yKM02XBE0WgaMhCSuCWaMypB7788Y7qczzINH4Oe31If5IWeW05GPA2T5
	jGqLN9FjYrLs42KHiAXY1YwFUa4htX6QFz+RKcmY9Gxo2Q2PQeS3jx7YY0GnmIM30t8JMQXB64sfs
	jhAShE/YaM3Anms0EbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrF5-002LNp-1W;
	Thu, 13 Jul 2023 08:00:03 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrEZ-002Krn-2v
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:59:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DDBA20008;
	Thu, 13 Jul 2023 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GQ9csKcB6A9a2ezYkOqBmEGVpBq6Q7Z6rQ+Q1GoYuc=;
	b=JfOl9Iyi+L0P1JpDkgZz9CSkvjGoxswlv/6l6AdDTe+V3ETGy7/7MeXqoBM1VRDf5DocNV
	eXL2L30Bul98eedSHNp1wR2aCfm3UvB+39mMoci/BO8Vu+rX1XEelsH5fKArly3b4vAoCy
	bGmdhB/wz+l9r6E8qUBG7ht3H/+h4PGQVu5duLaIc9WZodvaskvXGcujXujDtlwvJKRgWz
	LJOPgkvG/kOubcarSxBflMjU+UnTWl+rC0GQjDG/f5FzySh70jR762n5sCkXs6dIqN5XSt
	t3fcG+YRSFYGZLr2RSS0bInFBcooR0DyaUNLxrzpzS7xo1x9H8YGuzgd1XGXtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sridharan S N <quic_sridsn@quicinc.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	ddrokosov@sberdevices.ru,
	gch981213@gmail.com,
	mmkurbanov@sberdevices.ru,
	quic_mdalam@quicinc.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: spinand: gigadevice: add support for GD5F1GQ{4,5}RExxH
Date: Thu, 13 Jul 2023 09:59:28 +0200
Message-Id: <20230713075928.486879-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623045757.30055-2-quic_sridsn@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'746b0f2675de6cc2197a9363873de7274c539d84'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005932_104220_D633CB23 
X-CRM114-Status: UNSURE (   5.66  )
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

On Fri, 2023-06-23 at 04:57:55 UTC, Sridharan S N wrote:
> Add support for:
> 	GD5F1GQ5RExxH
> 	GD5F1GQ4RExxH
> 
> Both are 1Gb SLC NAND flash with 4b/512b on-die ECC capability and has
> 2K + 64B PageSize.
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
