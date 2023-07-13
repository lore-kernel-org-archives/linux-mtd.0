Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D50DC001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0noy9SJiugkSu0/iEbcOG0EV7CtaFlR4I2H63ndc6o=; b=W2eoFUPCqYag93
	ZQCcnOolKn/mxPc1x5kDhbZ9ZSOkb8XJ7VUeFIrVGH9PmAbJXVMIaxORpIpi/dQC9ztbKcP7/t4NJ
	U7BKF2gtqg6WuUQZ+0B4o5sDPqo4VXqUOBtSslGExWAtRFR7B0pp5oQTY+Cger+MFR7j7mDQPL/gA
	uWpP7n57EFSTNPP0rt+Fna3I7b/+cnvMlBlpsD4pqyjFNsBdlLzEH76JaTfKqbtp5shkjncWv6aA7
	Qo2jxICJNwBIa56hBzNe8fKd5NP2VYTrjc+gWLly5B2SUyZmPle1v5NOWN3EeYTWJiOa7XV7oSMHZ
	EggCoTGa/oEn+rc6co9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrD7-002JUP-19;
	Thu, 13 Jul 2023 07:58:01 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrD3-002JRW-33
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB5DD1C0009;
	Thu, 13 Jul 2023 07:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzbnWBipEyKzakFN5m3gXHXFc+Lw91kYYGSsbgUP5ZQ=;
	b=czmms+Wv+tNI6e+tbSPNxh6A13/JM3TZk915BKDg9bA6R/Jlsf1qC7fCTgU8+tyub0jSs/
	uLf2R5MqFdqHTf+o4XmyUO8xUMrpLyP2QDZaTXxZRdVxO9VJzYcXSr1JrJIutqmpOp3oJQ
	JOa/wE8O21FWlCMwkriiB43xt0gAZ95clutJgfxum4gliSMFP59bxcjOEKmnA2o3jF1uqH
	x8rFJpmUFN6dM7KNluADa/y0Y2eFZym+OpfTU7B9LkOrzzuI6V9CtqtVJg7idiWmCabVfw
	DH0PX6TNsmH1ei8EEkQPt75Wx71sZCrbg0nYIoPUJsY2WWtu3c34KWR7mFmANw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/18] mtd: nand: samsung: Convert to devm_platform_ioremap_resource() and devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:57:55 +0200
Message-Id: <20230713075755.486104-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-11-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'717a53833d0b0d735df82f041d1d000afa768cf8'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005758_124031_DA289592 
X-CRM114-Status: UNSURE (   5.64  )
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

On Fri, 2023-07-07 at 04:06:15 UTC, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() and
> devm_platform_get_and_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
