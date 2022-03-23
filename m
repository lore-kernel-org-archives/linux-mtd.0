Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5379BC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NND0DF+D6jj3MFrwsEQTIcqIuqtI1OqNaH7QPBBCAts=; b=vKqn6waS9AOxBc
	XAZ6qgjIK893Cm69W7COA09f/9hTY4cZNy6yvbM4hpCilHR8xCcOYq8jNniR4DUlB0FCRqRMk6Lo3
	KvuLQ//3CsfHGlaFEV9yEKNjgRCX2faE9hQG2V12QJpBwcFyC7fk6l97DqR7mm8jj/Np6q+maQt3g
	9JTHL1s20U8oV4epuWvT7sCYapJAt9slDNvsLa9ve8cUi+d5yyBB7CC0bWDQuHhW3QYg0/+nSNg8A
	F86YYmv+Hw0c2nkxHmFb0CoXQqzODRtK+cy63kMEWqYPT2w1Pjh3+srgaVIbToonLNd+8oTEcrQ1z
	9wbjJbH3x8lE8Hm1aGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4QC-00ELxS-9z; Wed, 23 Mar 2022 17:05:20 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4Q9-00ELwv-I5
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 17:05:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id w4so2093208ply.13
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2022 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=74D/U/90Uf1pf4AvU85/YAaYtZaeBZkBo+JC5Lf1iEY=;
 b=JNcubnE2zcYoCl28/CXfqDUB8jcw1XrhROCoezFtUE74fZ1pUZsnxSIr6XuOU/WlL2
 z82ss2qBVcQ79ewfNdMSod4Nw05Cy699JGvWXbsQDmZXc4WkEQ6PAQMcaYGaTmtlBYFw
 1ckk9usZ3kao456Q1kLUUMNDG+11lgG3FNoJ6ZQUkrEYsfHjk8IeecWadVD3k/RjuvZQ
 kfgKvPjDyJiPE/Ige9NWfTxHyZZ5tsyYD8hsGNapySH72EtY4yQaK/dVgQSlMbk+8ubO
 PMy877gpiFE0a7B2Qam0b9e+TBD+cV4asj/wNM7DC/V702qkf2MVV7liUU6J30hVvvPT
 8mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=74D/U/90Uf1pf4AvU85/YAaYtZaeBZkBo+JC5Lf1iEY=;
 b=pAmwVY0ohPdQsj1E2TIs5XC4RV02b5u2Gj9FjrrK3azyryJWXKoZRNnH8XvbcS+z7X
 XVZ6GPU7fqZrQahjELwzlw8dyVOv70oUt8tZkttmSwMsDTtzJzxhsoHQ98pEMQmUGATN
 wjQ04Glc3ir0wr3zsybkK8HFTi0dkaQkNDZNnteqQd4CPlra3kSSxQ3MVADBzTXMfrbm
 unL93gYv1Ub1BdVip0ZtqsiEjpB8hLpCp0Ji0725XamEJqCGbnofxxFUhKJAAVVO6ixw
 5Op4zzFOYjt9BAvDpe8rXOWkt1m7sVfjNKAcaoFna1NCTdHDdyrWv65+5dTrmJ4zoEVL
 lUXw==
X-Gm-Message-State: AOAM530Oio/qNeK9jh1uipaH6GGxcNrRWxRAf+ddVE7N4CM3NyPJok0K
 Yt1N7djItiKt3Yf+IDmFuGL9qM74ctmvyQ==
X-Google-Smtp-Source: ABdhPJzQw/BaMmdY86uQD0UijO+q0SVHd1cS4Yj0jlP9xF+CEDTpi9KfF8AeIxPI+EDPaau6M4CpWA==
X-Received: by 2002:a17:90b:224e:b0:1c6:d9ed:576b with SMTP id
 hk14-20020a17090b224e00b001c6d9ed576bmr766538pjb.26.1648055116282; 
 Wed, 23 Mar 2022 10:05:16 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:98c:eff5:b721:5f7b])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm6649709pjn.14.2022.03.23.10.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:05:15 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Tokunori Ikegami <ikegami.t@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v7 0/4] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Thu, 24 Mar 2022 02:04:54 +0900
Message-Id: <20220323170458.5608-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_100517_621618_1AB95656 
X-CRM114-Status: UNSURE (   7.89  )
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

Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
check correct value") buffered writes fail on S29GL064N. This is
because, on S29GL064N, reads return 0xFF at the end of DQ polling for
write completion, where as, chip_good() check expects actual data
written to the last location to be returned post DQ polling completion.
Fix is to revert to using chip_good() for S29GL064N which only checks
for DQ lines to settle down to determine write completion.

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Tokunori Ikegami (4):
  mtd: cfi_cmdset_0002: Move and rename
    chip_check/chip_ready/chip_good_for_write
  mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
  mtd: cfi_cmdset_0002: Add S29GL064N ID definition
  mtd: cfi_cmdset_0002: Rename chip_ready variables

 drivers/mtd/chips/cfi_cmdset_0002.c | 112 ++++++++++++++--------------
 include/linux/mtd/cfi.h             |   1 +
 2 files changed, 55 insertions(+), 58 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
