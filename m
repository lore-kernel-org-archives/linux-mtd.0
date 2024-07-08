Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412FAC3DA45
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 07:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfJcDMMhgYZ9VmM5cFsOEOp0hKf1tV488f0kq6IoWeQ=; b=xIB8wr4gTFbAbo
	IbHO8PZs7VxO37KVF+zp0gJbxG/QZdwJ4vmnvQ4iYAqiFTwopy90h0eHiUGtRfUG3lknNRKMbXKq2
	KusfobXy3DmwfvyTvBj8uYz9nY2ciVAAQwXuKK4QpopzBW+Y1/r5p7gxuiVA7GHtUjEL+bVaqeTrL
	LK9pV3+MJ+YTgFxvGv07ZGZaekuEbTAwykKIT7huL99B9OcEV4eNbVf9f2qYjW0eatIzua0J+OkNE
	cEOphgHvDQpusZzK5XKKQLvTXFKLHfqBBvWq4rqsjZyxuEWpHccEcsqC8dbSlFW+TYOdwLVXVt/DI
	1rJO8c0zUdW8x1b0l0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiNy-00000002xce-2LDG;
	Mon, 08 Jul 2024 07:02:06 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiNo-00000002xYj-3s9y
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jul 2024 07:01:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B88F20007;
	Mon,  8 Jul 2024 07:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720422114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+I3UPmsCQqa7VNrWRNTEA+DBLGE5VNKe5lzl9UQuF8=;
	b=LyfU1B3BwJ8dUJv9SKTWE7K8enxz23xs4syYwBby3SGdAvHwr0StbteCkbeXIllsLQYpte
	4u477vOwS8ZThtOMDyq5fAPlPg3Z0a0nt8Mqlpw1VEBtMwcih3NbSXS65i3RWaYWzcykAM
	i8uZrb7JLuWAucR/cdjkbOe3H1CM5HkMxM+3UVfBDTQ3lXcRUxSU82DZXboU/Rc5MK71G1
	j1WrC15+260BAOn6K47cOErVHrTPcl8NHT888iYXg7uQUt7u3wfDXjsRhfI9H016U4Wayh
	RmTg1iM3GA7k79E1zIoopNUif5EfdZkcbe0itEXx54XTp3erV6Hsosen48vS6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/2] mtd: spinand: macronix: Add support for reading Device ID 2
Date: Mon,  8 Jul 2024 09:01:51 +0200
Message-Id: <20240708070151.12247-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704024839.241101-2-linchengming884@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'20dc4c711a2a3260f02f15e1cdd4f34cc38e8b4f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_000157_125071_085552A5 
X-CRM114-Status: UNSURE (   8.11  )
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

On Thu, 2024-07-04 at 02:48:38 UTC, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Adding the Device ID 2 on Macronix serial NAND flash.
> 
> When the number of flashes increases, we need to utilize
> Device ID 2 to distinguish between different flashes.
> 
> These flashes have been validated on Xilinx zynq-picozed
> board which included Macronix SPI Host.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
