Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC8C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t/3/9dOEQiKf0v4eVQTShoCQ9pp68vI0Kf64Yuv1MUM=; b=P4xNDowNDppL1S
	CXKdXlX3rUWlHosGUfafKn274xo+BfP7s62tibv/xNDsvdHWFi6vxSgYZJ1iNfuuvYa6EVb+M9ZKH
	kupff2VSWEtXnEONt0JEpJnDXzAQJG/wWS8WGefxsTSTM26r3Q6SYuSVhZLcGw7jJJY2QkP2BEmVW
	VFggkJZpMrYwI7d3O5iJoke6G7U6p7wxIKkAKvvfZFtBPjjRQsKBj8AO9g17ewnCnP3Ih6YBjfj+X
	BpquaFZA0Y2yLIXbSgqq4u6k/do1OXah3bTnqbr6i5cnIqGma5bCIB7yPelaNTJ2ZtBuiWrd7/YwU
	72QaMYbFlgRsB1HoTPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWTyp-009g3N-BC; Tue, 22 Mar 2022 02:10:39 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTyi-009g2o-Hb
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:10:38 +0000
Received: by mail-pg1-x52c.google.com with SMTP id t14so11609852pgr.3
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piMJsfse5nDZzPrYdbJei29P+QaKxOakG4LoynFh010=;
 b=Kcl1CGLecUSoYYN6ufeg4H2Icny9zfpVgQO3LbeWED1mxrci4k+fHwN5NREmTzLmSF
 gUieROM/f0LDt94VuFqI1aj6gpK/SppvjlysD6LwPqO47qjhfh3FPa7JnXX1Rqt6gOOd
 O7sfCc4VW8Oe6YzUpmic33+dsBsfuX2A5S3b5EmIwLwtiIYm7GhlUpfywsgqSJh9JgHh
 oy85OUDZLKYIktgQ7viBsmC3TPzLUNlfUcujFfkg1cyJWBsNh5SzHIMUp5FevY9R3T3f
 Hs/RVGJ22CR52dMuYdo9Wm8peQPh0wKIewIN8jf9WNL934md+q9Jlv56w1eLR4Jmf7x/
 cUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piMJsfse5nDZzPrYdbJei29P+QaKxOakG4LoynFh010=;
 b=euz/Zrq0rinuzY4L+rc1c0JQO6rbep6x7Be4w/0cLm/+vDCHsVKT0xa2xRz9vM9+o/
 dsWMfrxzMYIt2PCfj1Bdj2NuU9HH87zfgNWqmAMgyCtYIseiu7PjVC8VvXT3qeR6D2BL
 NBG5ZL4+XKPiu65T0quPitkeaZYvtD8SE3X6Nk8k+C0XR3Hjp3xtqv1DknDu3kLph/xM
 9Kfse+WEFKpO6eKjQozHYhwojaSXnR/SF5sbHXYDWb/S+8nd/jXV9zRYzCDhvqaBrkyK
 PEuaISe2ERAWFHdnWePMoYU3q/AAmjwMtDcz0QR/E6v2DU13KuRrNynChFSa/47XMocP
 sykA==
X-Gm-Message-State: AOAM533ZNdK3wjgQFZggYgsfWMj8DKkmMG3F3ceblZvj2fFpAmEeo7o/
 2Hq57Hsc/tV2QuNVBffQX4Sye3ZdHCPMVw==
X-Google-Smtp-Source: ABdhPJyDrRlEWKnc/NGv9PIQWSTfjJ/tCa+Q2ScF+XE8IUSVSr1oBo5Hh0vZdI6XMnHEYdmNILN3Tw==
X-Received: by 2002:a05:6a00:a1d:b0:4f6:5051:6183 with SMTP id
 p29-20020a056a000a1d00b004f650516183mr26883061pfh.42.1647915030807; 
 Mon, 21 Mar 2022 19:10:30 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:1847:b4dd:1227:a1f6])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm15673579pgr.37.2022.03.21.19.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 19:10:30 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v5 0/3] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Tue, 22 Mar 2022 11:09:58 +0900
Message-Id: <20220322021001.138206-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_191032_612877_05B92DFC 
X-CRM114-Status: UNSURE (   8.09  )
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

Tokunori Ikegami (3):
  mtd: cfi_cmdset_0002: Move and rename
    chip_check/chip_ready/chip_good_for_write
  mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
  mtd: cfi_cmdset_0002: Add S29GL064N ID definition

 drivers/mtd/chips/cfi_cmdset_0002.c | 112 ++++++++++++++--------------
 include/linux/mtd/cfi.h             |   1 +
 2 files changed, 55 insertions(+), 58 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
