Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B4FC77B73
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 17:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVgPze5Ro22C+/UgqYKfqYZJKU8UiP3UAd5h8aBGX18=; b=ZxcZZlAuxRfJ5W
	8uWBwV+MRtjDqXi7+9LaDdGYZzeQQ8GduT9QXQB6mDfm278qN4vJii7D6PAar3ntuR4rZsCXDSTeM
	H6WpULCw2Tu3JAqgfKCZTuOsbx2M4V//g31sYld+IJ+IeihE8KcNjiyevoSpWRyr1QSKTcSE3LNCj
	CemHO3ZBAn7YA0Tz2F9WQ0KHV2Efu8pJUUg0yKAGq1/5wnYR3dFTf6rKwUN/2ShgW59Z5d7Mnp9X6
	aEcA97+ykBWfQBpkQorcoL6YI9CTxyfAgnr2hQcMTPMQLcxnUVKAb13AYbj0pT2bKK/GLdmh78rr3
	gHebPtKWcQxy8Q1HBLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bVH-003Lh3-1d;
	Fri, 26 May 2023 17:45:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bVE-003Lfn-1h
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 17:45:26 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685123121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vW8GWMbz5sTr9yyBQ0lOsQ1IhyxKg59MofgGMizdKZQ=;
	b=Hc0jQu080me9NGxGSjMcNU9MtqoAT0m8wq8c2XZ9oUPTgTTn8fBPCVWe9PW9cMjQppK5dn
	MqHy+EF4taIPrgVNJVPP9stX7oCbGUOALsvdhxzKbFZvdinYc6dOh/cdFhJ4pjyZk04vaI
	6w7KK9Vk1upj9krH/HgRJVu1qLi8CGwzmbOEC8qskE/Yv7xOZ5a17dy77FiCveiEmFhqPq
	QMUrMkwydV5+Uwih8Kxs7+RFmdyb4WOVhAGhLmmsCdPkNtvo9QsuUUXBZayB36HdAw0An5
	sUMlUiMSmKLCg3D0H/KzBtWevtVb7LNcdqSnTSNINbI2rW/ldZSiiFq4fjU+BQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5600060003;
	Fri, 26 May 2023 17:45:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com
Subject: Re: [PATCH] mtd: spinand: gigadevice: add support for GD5F2GQ5xExxH
Date: Fri, 26 May 2023 19:45:19 +0200
Message-Id: <20230526174519.922160-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525110526.21998-1-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ef1560b670bd28ca3230c7f5ad29c6a211fb1adb'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_104524_706288_A3CCD4D1 
X-CRM114-Status: UNSURE (   5.26  )
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

On Thu, 2023-05-25 at 11:05:26 UTC, Md Sadre Alam wrote:
> This is 2Gb SLC NAND flash with 4b/512b on-die ECC capability.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
