Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152E5C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/KWt9guiTQeXE7pFa643ZsWQRxVAonVdglji99Kkik=; b=rQNA1X63/MRzwo
	x9CwXFNYwcSm4yiEvBE9kBk1TbYe9WuHja9h/BSGvjRVE4XT8OdPxwlkHhc9pmbpoJITcWuohzq0n
	lnfTi7DLYGWJY2PlNS/tU9/rdBfSv8qDdh1250S7MrihCtPBa20CAt5/uBIl6tYb4IABIo5Z+SjM8
	e39YrHhgHLtBxezRhRKB/5gh51+ENsKJYxJeLZ8j+hBayfE1M9+JVR8Hfy4GRL+GBmP75O17mI+nj
	6q9aMGq93VetSYuUh3iPr4jay+oKXDpSDgp3BjagiYao2HJOz+5lpRCq3EM9pDiF4V9aVk2phTyJ2
	QRTEXhuonWY9Q/3XaqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrF2-002LKk-1l;
	Thu, 13 Jul 2023 08:00:00 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrEZ-002Kov-0U
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:59:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A76CE40012;
	Thu, 13 Jul 2023 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v46T/BXZeGNZxgZP5hKS5TeDg3icWstv/h6ECEftRxs=;
	b=VM+MAlmzxfKag5UwLRraD1Bnxh0o3dqq1fLdQMCxtIJgwuAd+rrUJT4RkuoynpiT+sYDVP
	jcLdBxqpl9yiivsqRNIww4Sdi/SXG5Rkt3tMyzVb3nYEBEj6UJYdR3RFgOB1aJ/pMpTj/N
	7YsBVt8ZPyUmFCRZ6Tuy5PWNx5H3Wft3wxLRaHQNfz1MX4k9lCnVleBcOishCf23EQViCW
	Zv5nic8hp68ln9BlEo0dTAWiIi7EWhZXPDdDZ/IGMeOQMbQE6iXPs3URkmadDl2soQ46lz
	nmAsbZOKuZTfTi0D3RnWJQDaH7R70gXeVvAWyHzYYdw49ISwXClrC6+HEdSlMQ==
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
Subject: Re: [PATCH 2/3] mtd: spinand: add support for ESMT F50D2G41KA
Date: Thu, 13 Jul 2023 09:59:25 +0200
Message-Id: <20230713075925.486851-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623045757.30055-3-quic_sridsn@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'aa08bf187f322b6e38810d93896d052ea7cd6758'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005931_379281_8CA72690 
X-CRM114-Status: UNSURE (   5.80  )
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

On Fri, 2023-06-23 at 04:57:56 UTC, Sridharan S N wrote:
> This adds support for ESMT F50D2G41KA. This is 2Gb SLC NAND flash
> with 8b/512b on-die ECC capability.
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
