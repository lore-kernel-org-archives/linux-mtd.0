Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35162C83F12
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Aug 2023 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHxQgM5t4m/an/sIoM74SLglVoR9vQ2AZ6WiR80wiDk=; b=3OtmIinMJHB555
	30IidzFodtzXu3npp9SrTU8Zhq/wNR1bA7+SNQ//8d45A0uCzol3CnaaA04dx7cz8Q2X7HPs+AB0R
	VXG58oIY3mAeVAVLKIHahXU4YlpBnp/UK/nTot3uiRXHHU8drAu6AgWHPvJO765ASAsUOHRdz/sQe
	8Yp0ognhxy7VHB0GDm5Kv637F7nPvupYFRTC7yfL8fodaW8l903riztfFx1PwvREWVj1+n8WBIE4/
	GtpgOBYZsBQqin/1cW/CeEjhXa7hqY8wwAKUe4oSU47fWVtS/Jdk1reNLIdbRpYYIZcXTWXeyhV/P
	uDOaa38C2g71mKiJIcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaFv7-0086Pm-0T;
	Sun, 27 Aug 2023 13:35:13 +0000
Received: from out-248.mta1.migadu.com ([95.215.58.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaFv4-0086Oe-1k
	for linux-mtd@lists.infradead.org;
	Sun, 27 Aug 2023 13:35:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1693143308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y42FYySYNsis5G3mORomW/nSivl81IaFtk7YSUfz0Jg=;
	b=S4P5Lis+5UgxAXsbIFEQ0bJcfwW5bp3gD+5EV25w4Odl6XRzUJpaJGVaokRckJ9Hpyff0y
	QCMWQ876jzpmtvZlXQ4fdJDhdeygghENaAwk2aokCERTn3SKcsNlbNr+KPD/7nkWidZUEs
	LZ/LAlKjzWeA2HQHZTdX8ZHXdvIJ060=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Cc: Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>,
	Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-mm@kvack.org,
	linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: [PATCH 09/11] vfs: error out -EAGAIN if atime needs to be updated
Date: Sun, 27 Aug 2023 21:28:33 +0800
Message-Id: <20230827132835.1373581-10-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_063510_725940_D0AAB7BA 
X-CRM114-Status: UNSURE (   7.19  )
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

From: Hao Xu <howeyxu@tencent.com>

To enforce nowait semantics, error out -EAGAIN if atime needs to be
updated.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/inode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/inode.c b/fs/inode.c
index e83b836f2d09..32d81be65cf9 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1970,6 +1970,9 @@ int touch_atime(const struct path *path, bool nowait)
 	if (!atime_needs_update(path, inode))
 		return 0;
 
+	if (nowait)
+		return -EAGAIN;
+
 	if (!sb_start_write_trylock(inode->i_sb))
 		return 0;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
