Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882F3D0E6DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfthVJB/nOLLf+wMHMNauJRR0EtByRlQ+EE4+N90YWI=; b=C0xIj6IpmH5OL7
	64C0z6XXNfbKiaMdkswegvDXApme/AmEc2v0M16g4HSDNq3qnqmDZOdOS+NL2Tuy5jkmAuxH0VIUP
	+HKBNfAH6KoUDnUT98xA4wy9T4bbQZL5KK1FsnQVREGaC9qswqy+ZYN5BnrDlxKhuANIRJOhUcKlS
	ipWtd1ypKzekDt0Cc0NPVDjbLviC3XBBeKWmQcA3XQU6NvI/BQlBjc3kIkXbIb8R3woYOc3dp5nDg
	cthuczHdqc9Mgb58lMFdmdD3+sp3uQjdV6ymLWfAPUxAt8PKa4X22+y4qm9T/M4DkqbkvU36qpV8S
	Ux8Vek+lbo+unvYoejow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pH0-00000006oLa-2EQh;
	Mon, 21 Oct 2024 10:04:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFD-00000006npT-1i3f
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FDDC20003;
	Mon, 21 Oct 2024 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7O7CUR52oli7h54t1OZFWTBl6V00t65INe4Y4XJcl2A=;
	b=AOOtaEzeo3bBDeUXJGr7jpPhsIywq9YjN4+swbqszhOu9CxMYYs6xEKGVELN1Wr2OmF1Bj
	NY8WJpjVFJ9zNc2bNaiWHj5CaPtyUu7vjSmgwJS2luCtpltHyFVeZAiTBnd0sSljlC+jpG
	pcD9LLEpy9V/QR1PQwbC368L/oSV1Vy1KmhC9WNrsXiU6mfE4aqJSbTGMMb8zJb7eIMhZ1
	efIrJnmOD+sPsVTNvXJUvMRTrOmgbfDl3t8ZowBcWLcJuL061u351Q1Lge2BRbaipqxt6g
	sXI49aIjGYJy/23MRdh6ee2Gh6CKMyyphMQX+pWreQavdbc0Hvb4MO8ZcpXP6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: spi-nand: winbond: Fix 512GW and 02JW OOB layout
Date: Mon, 21 Oct 2024 12:02:31 +0200
Message-ID: <20241021100231.173335-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009125002.191109-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c1247de51cab53fc357a73804c11fb4fba55b2d9'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030235_597544_99FE2831 
X-CRM114-Status: UNSURE (   6.95  )
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

On Wed, 2024-10-09 at 12:49:59 UTC, Miquel Raynal wrote:
> Both W25N512GW and W25N02JW chips have 64 bytes of OOB and thus cannot
> use the layout for 128 bytes OOB. Reference the correct layout instead.
> 
> Fixes: 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
