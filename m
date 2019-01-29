Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBEBC169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA4CE2087F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 22:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ar62LbH3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="nsIGcMJB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA4CE2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCy8VZWLS7zksNjmFUzM7vkyXtqS7YuqnLlV/3zamiQ=; b=Ar62LbH3eTBAEG
	TwyefFO67onU/Esq1YfTfW2F5C4SpOB7p+5KgcQG3nxLc9u/QObCxsMgEDCGGHcy3n01fj+RW9VJ0
	+TIF8IWpcu7/6HDbxg742r0J4k6ogus4tfunXN5wEQjDWAnUiR2VPZ0Mzb49jYrmWOS3usiL835Gp
	XqxZ0FZyRrQHKbR7mIUTHQgkaN8niFhSLPo5Ysjp24GbjNP51HB96mHw2DUU8BNtw/UDXJpGENFxD
	TfeMN0BEvWN1F5bf6D8ZVc/KB5WbwvEO+Wuf7aN3ECcKyW/I9z1mWhtPQSEm9NzMjsOCvhcpXPIFl
	DO0pqzQOAxVpqyMIZRPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gobXR-0007Uu-1Q; Tue, 29 Jan 2019 22:07:25 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gobXN-0007Th-Ft
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 22:07:23 +0000
Received: by mail-lj1-x241.google.com with SMTP id t18-v6so18934764ljd.4
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2019 14:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blYLu9xaUnsOEqLUt+eUuhWvEiF/5suDvocmotoEcsM=;
 b=nsIGcMJBQXBWg6H7PC8xr46QSzlD4u88ZgH2Yi2e4wAOF7ElKzhY6JL7ZEHaFDXAvH
 f/jw/CLNNT5rRuhJnGIMVVGlmz57xG/NHLyKO3IuxYFU7iarJ75KqFyXs1frOJA/UytN
 A/iLWSgNQb9bJoZxDWobruwEM9otUhmcj6Fc54nlPRD8Tc2EkdI1tjRHZj+wMc748IS9
 WqXvMH4OOnu4HO3GgbW0jiRYRu4QGDvezalMe4cr5XXT+zT348R8SLAKlcqb/iFtT1LB
 tUgUdrDghBw+0c1hVLuT60kjMSju8Z6WKPF9spTjNlEF49wofQg8AihhpzoCxrObrtcX
 d2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blYLu9xaUnsOEqLUt+eUuhWvEiF/5suDvocmotoEcsM=;
 b=paU4d/4w90yx3LnnTZN2vIRn7gaRde98cLDTglP6GADCg6jrhqcH5t14emDGzqtkh2
 ljjFfqDmAjikIuJxzzB7+TpvYEkyCUQlVjNhqMs2rE37ZirHy4+bA49k6wnCXAobdbHl
 nSumJihbDu0byhTXNBqUWeT1uDiDsAs9HLvUpsFvQCU/KQtsz4kNMl4hv8IPNvNV2aQX
 /wYqI40d7Hrw8BR/N+oTxD3/9Cd13arzdlxDGrjUMqACJNAH2iacdAop8ldHaNWwRTtA
 ijjymyGLSBmOaUUbXMTbsRAZLDPO9vvn68h62CzrraEj9FGDBiQYD/We6qfFTj7hYE2r
 NaEA==
X-Gm-Message-State: AJcUukcElJ7LRzF1RW4bbwA9AmYieit09wPX4Eeq+itsxIf6Q5LH+/1A
 4ep8mkxd53u+4DFaHz2Z/E/07z1Ujko=
X-Google-Smtp-Source: ALg8bN6ok4EBFFAGxIfXjwKHdCKPpyXGi4wojLRBkID3CN4OWxVLZtOpuzG92iVPRQPsWF0kLMqAYA==
X-Received: by 2002:a2e:4601:: with SMTP id
 t1-v6mr22476854lja.111.1548799637637; 
 Tue, 29 Jan 2019 14:07:17 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id c15-v6sm3821045ljf.76.2019.01.29.14.07.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 14:07:17 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/3] spi-nor block protection
Date: Tue, 29 Jan 2019 23:07:02 +0100
Message-Id: <20190129220705.5143-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_140721_669051_2E398DCA 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jonas Bonn <jonas@norrbonn.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Changed in v2:
* Provide the below cover letter
* Rebase patches so they apply cleanly on linux-next


In order to make device that's effectively read-only except to an
authorized user we need:

i)  Some way of defaulting block-protection to on when device is first
powered
ii)  Some way of controlling the write-protect signal so that the BP
(block protect) bits can't be changed

Some SPI flashes support the BPNV configuration register bit:  block
protect non-volatile.  When this bit is set, the block protection bits
BP0, BP1, and BP2 default to 1, effectively causing the flash memory to
becomes read-only at power on.  If we can set this bit, we solve problem
i) above.

Controlling the write-protect input is a matter for something external
to the flash itself.  Unfortunately, the WP# signal is only honoured if
the status register bit SRWD (status register write disable) is set.  If
we can have this bit always set, then we solve problem ii) above.

This short patch series provides the above bits, allowing for the
creation of a device that's effectively read-only to any actor who isn't
able to control the WP# signal.

Jonas Bonn (3):
  mtd: spi-nor: always respect write-protect input
  mtd: spi-nor: s25fl512s supports region locking
  mtd: spi-nor: allow setting the BPNV (default locked) bit

 drivers/mtd/mtdchar.c         |   6 ++
 drivers/mtd/mtdcore.c         |   8 +++
 drivers/mtd/spi-nor/spi-nor.c | 119 ++++++++++++++++++++++------------
 include/linux/mtd/mtd.h       |   2 +
 include/linux/mtd/spi-nor.h   |   1 +
 include/uapi/mtd/mtd-abi.h    |   1 +
 6 files changed, 97 insertions(+), 40 deletions(-)

-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
