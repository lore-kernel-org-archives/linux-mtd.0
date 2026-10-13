Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F12CC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haVIuneC1qUTYnXJlz5zKqhq/paP9uIcx7BVhS4grUU=; b=ajdF14/D5/wo7t
	dlpij2i2zyZriWHVAeBG9/EEDkUEvCDBfX0KglinMcx5dRIN2bOSdOJITcgVmHciC6R3X1Epts4Ye
	QeXdOKnvywFAqJK4dg3Hd/6CAe4xK8QrJFilf2+fAo6uEglEIDNZnlX+lA8aFNSO4Dn/efP7vkKG7
	2lw44GGKQP1DMrQtMBBM8pi+38R5wa7d8RmxZKHlk16lJ+vEaAS6BEJQ5opb6+4+nECLTEPkPFYXG
	Zu4WaXeZFtTFb2Nuk/Y5pyR+wMsB1cLXmwZIPLcabx2Tw2YlAFhDoD3ZusHWwi0pS5eVwi2POBYtm
	nRHZRYEc4p/6Xv9kSbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX5k-0000000CETi-038L;
	Tue, 13 Oct 2026 07:38:32 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX5h-0000000CESs-37gO;
	Tue, 13 Oct 2026 07:38:29 +0000
Date: Tue, 13 Oct 2026 00:38:29 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
	ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	exfat@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 27/28] xfs: allow remounting read-only after a
 shutdown
Message-ID: <as3f9WNZ1nB_lLvV@infradead.org>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-27-60743a3dc326@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-27-60743a3dc326@kernel.org>
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

Looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
