Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44F6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2e3gFIKBvWTBE/WUslcPk70UHe9WHh3ygJLPJlSfaA=; b=ecOeSZDcPejmtY
	YJSipgR8ujkF8vjzoMqWAwwEPDmj8h+TTYUEEYavQAy7mLZGjKuPb/xGfarcP+vvoWzxAE7re+cKz
	FiSZ610buxdrhwqwV/rVuCbLHe7IANTlT9WaSKdPyk7Op4VKuKU7a5y0VT3Rq1by53nQndfgDcT48
	PiUhakYx+TmNRFq0md7hK9cb1P7t++9qba6XF3JRs8mTD7MPo57Ft40I23GxlWid/bXLzEopmpSIe
	M6cJy5/eXcESJPBdP508CR5LZgyvppHJbHtJ2uf04W5VDRAv4gq+WLm9dIoZtDpRh5TyMWSbLnmtG
	o/ueTL8i6zKUunv1Sjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njzMW-005SxA-8z; Thu, 28 Apr 2022 08:18:56 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njzMH-005SpQ-Qy
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2022 08:18:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F42F240002;
 Thu, 28 Apr 2022 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651133918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGq0B/cl7e8z6PfdpCnS+bFwMhy6zz4mnJlSHvvoZ40=;
 b=Ik0a0/JpJFSbdFuNwHYmv4fPVm5GYO9QWHEvVtSCW2sN6DMhTYdsN5rf6E5XuQS6Yl+em6
 OrgzGeNI6h7jDoDVSQxzxYgiSdoFRnLjym6jmm9r5OpompTlbT1zPpyZZIrqIIaZkQJfM7
 DjWNDHQa0bwxmcCHSx1JZ9FNsHdwVwMgO0UyX4y1ka93pph8T/jM8961nwNTw0BR00zy7T
 niMUxqb565nfAUIFWnMSdPkBYJKT91aWkDiZ5iXoUr5jANJZ4Qjbos1btgNKQnuyeXcr/b
 2jYSPGDXDyCGBNmE4s5z9LRRQ141WXT82CPYDuwwf+I6VUovV8hiS7mNHRN3wA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v7 3/4] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Date: Thu, 28 Apr 2022 10:18:36 +0200
Message-Id: <20220428081836.120018-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220323170458.5608-4-ikegami.t@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cccea9414dae8058ce9c48b7c7ccff040501f419'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_011842_099222_51A33C17 
X-CRM114-Status: UNSURE (   4.36  )
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

On Wed, 2022-03-23 at 17:04:57 UTC, Tokunori Ikegami wrote:
> It is for the model number 01, 02, V1 and V2.
> 
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
