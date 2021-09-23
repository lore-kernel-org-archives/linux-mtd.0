Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B7FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8902D6124F
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8902D6124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MnzdATF0gMYzgQTgp0K/8o9s29RCZ2UFvuXBjBX2Wf8=; b=gTQIOjCzBlkSGs
	X7eaE+T0NgiFGjsCfdU71XQAZ5V4OoBtBAFOUJaxpZGJgMbWVPNvuEbrY9I/eVBy0txyMziix0NQ3
	3ehuXMHz+cBKdQ9GDks3VmELFP2SNMxeoLwL04kQwRMTksqNvM4Pf5C9rrhhX1cxwWEB3zyAPFzFQ
	5xY08mKyT9TWAlDgkGgPdD7ZsDpQZ0vho/xOinZ+8xTkHzc82hLcNZo9y0O5Rggq1nQ/yIsNqCe1N
	LrZc3Nrb3K/p36YjsMX2CxHYIBwvH+RkJctlDH9Rx0Z/psUMOFiUMjNaOmyUk+ZGzL4903+f1/B2Q
	g8YJLbl3IjCo/pee902g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTUiy-00CUy0-NG; Thu, 23 Sep 2021 19:49:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTUiu-00CUwV-TV
 for linux-mtd@lists.infradead.org; Thu, 23 Sep 2021 19:49:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88CAA60F6F;
 Thu, 23 Sep 2021 19:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632426576;
 bh=Eooc+3NSX8qly0jbZkhXcWvdBLQboytD+RfXmJXuoGk=;
 h=From:To:Cc:Subject:Date:From;
 b=LwfTRo5dY07DseA8G10+JsdnTPzB0JRNsobD3dsEPtNK/Hb1e9+lWCl0xPJnAILkZ
 DY5tka9nRZmKSysXvWnvpZeMIfxxEHbgDGXeJmDAzlxx+edDlB/N2FctvDDhJJ00Jb
 zLlVEOfSpjddLAmV5V45m8+K+e1wj2KhDTn0pnVvJ/W4vVVIUjIGIBZ8ePRMo41l5r
 YzKi/H0/LlIGsc9PrK0XLZA9RLUJlhNHIIVMsmfUMfk1z3bgUKr63TWNFxWABBe2es
 AA8N1dQ6DXHf7S9Nwj+U3lp8mZwEdJ3Jt15sNdOnkmmbuhJgeFm/BRB1qrgKg0CxTT
 CAVE4ZLY2PBIQ==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 0/3] mtd: Ensure DT compatibles have SPI device IDs
Date: Thu, 23 Sep 2021 20:48:24 +0100
Message-Id: <20210923194827.53229-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; h=from:subject;
 bh=Eooc+3NSX8qly0jbZkhXcWvdBLQboytD+RfXmJXuoGk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNoHaNlG5QlKMXE9N0hUVDNjvW9L5BE3Ap3kfGl0
 Y0FGRx6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaBwAKCRAk1otyXVSH0G7jB/
 496DbjxnM47icdwfSojr+2HFcL1Qeu51v+UGweopRXgWi27iltHZGUURqBsU83zB2+EYv7qzSZyJEO
 3BgsIQi+B6BXLFKI2INNesvoYFmZxOHbXZP4ycW2JsZ/05j0aE3QF+vFrDBDKXPZ0FanqR40t8r0Th
 fcUXvwVa1zqFHRPwnuEwOWy/Ekg0nwRPEjFAhMVqRFTsld5KTpdzY9DMsuqKRJcT/FyX9cLXQ2iWxR
 tZHB7O/aNbZINM+efUDFsz8tek81iKr58xiTsruYYO+wjuzbHnlV+y5/vNOMz8Bi/LzqIqJuU+zufb
 NshYBcY+ghZPJMVZkxMaseaTZ+j3lS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_124937_012039_11E436CF 
X-CRM114-Status: UNSURE (   7.60  )
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

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so this series
adds SPI IDs where they aren't provided for a given modalias.

Mark Brown (3):
  mtd: dataflash: Add SPI ID table
  mtd: mchp23k256: Add SPI ID table
  mtd: mchp48l640: Add SPI ID table

 drivers/mtd/devices/mchp23k256.c    | 14 ++++++++++++++
 drivers/mtd/devices/mchp48l640.c    | 10 ++++++++++
 drivers/mtd/devices/mtd_dataflash.c |  8 ++++++++
 3 files changed, 32 insertions(+)


base-commit: e73f0f0ee7541171d89f2e2491130c7771ba58d3
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
