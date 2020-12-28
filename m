Return-Path: <SRS0=5rSU=GA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DAAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 19:14:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA82F22AEC
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 19:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA82F22AEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kS5Fae4Gq2dDuEtYzOCmM3FNxkOBqdE7aAzOSY70Hbk=; b=QXcOlOwCYPTHjzmIt9GP6el2HB
	lVkMSuWOWCrGgOkS9BP9qxnaImO6Q5kwd7VDzWFB1VhhT0DG+f2VegYEMzhMswtPsjdkVrDT/Hglu
	nNwbTb7QLJQiOhFANNuKLG/kL08PGqOzuDkumYdI+NE1mkRUdl/jcysIP1nxQi8LMBEJz66AroDC5
	um7A89P8TSq+kMNulLYAJyPY35GDE1Z89QECqP5bEpV+I+HuTNg0TxqD1Vt/gDAbqaQ/7Q3N8PrLS
	pgOozlwgFJHDRq+yc5FyqjT3bFef5w6Ezb4UMXIUbj18ukxrIh24FX8smepwZPVYVYkhnmI0M7gy8
	0/O1Q11w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktxxH-00014g-DF; Mon, 28 Dec 2020 19:13:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktxxF-000136-85
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2020 19:13:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 328CF229EF;
 Mon, 28 Dec 2020 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609182796;
 bh=WfRrNEImpr0j+Oo7HcTLI/gAY4EckaLzvRW0Nnzz9QA=;
 h=From:To:Cc:Subject:Date:From;
 b=QOEccFRDvvHr/4eKSIAJZC9fjOwN3vBNabeHqiWacoH3tyHdSDbB8u4lpQ+8ivZxl
 Vj85wtNi/mrufL/iKzCrKR1/nEgU9SrebR++4bzxFl2/Mshw+ScfXbUGolntZpLcZE
 zR/pJJuYEA50Ka0SdVTXsXN6PD2pSUJF8c7MYQoQhutE/MoeyIxxhKk6gUyxpWeFUi
 +0bbHBksTbZrbahMx4nfKbVwhjK/ZpuA+wCDeiY7tX1IQ55bIU4t4Mgo21/1nR8+sT
 8+BUv+NXhmRp7IYFdAl2VBy8p/RCY7xctzJSOrcD5z4ydBVzm8Z0p4lpURPSIy4ONa
 Ecy4xLRIL/voA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.19 0/4] fscrypt: prevent creating duplicate encrypted
 filenames
Date: Mon, 28 Dec 2020 11:12:07 -0800
Message-Id: <20201228191211.138300-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_141317_359877_88505A86 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Backport four commits from v5.11-rc1.  I resolved conflicts in the first
two.

Eric Biggers (4):
  fscrypt: add fscrypt_is_nokey_name()
  ext4: prevent creating duplicate encrypted filenames
  f2fs: prevent creating duplicate encrypted filenames
  ubifs: prevent creating duplicate encrypted filenames

 fs/crypto/hooks.c               | 10 +++++-----
 fs/ext4/namei.c                 |  3 +++
 fs/f2fs/f2fs.h                  |  2 ++
 fs/ubifs/dir.c                  | 17 +++++++++++++----
 include/linux/fscrypt_notsupp.h |  5 +++++
 include/linux/fscrypt_supp.h    | 29 +++++++++++++++++++++++++++++
 6 files changed, 57 insertions(+), 9 deletions(-)

-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
