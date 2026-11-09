Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8A606D82E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IUeoBYJF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QBujMw3d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vSFsJO9vY4Zt9vpJyRqPyot/VZ9koipKWPQ5mqh4jTw=; b=IUeoBYJF76LUfNnDl61Ok7YMDq
	OHIUnTK875FX6nY9f2Kb77PoQarW5eq32y5kN/CH2UAZ4fn114xyklKTB4oPD/ukx1FKfTdC6gKQq
	DHBeXiw3Y1L6WqjKP4iKcqwHponu1oWFPpIsgfztbgbokf7orlOfTBvMA6eCSz2VlSzXBoF8VOyWe
	yub/0t1VRDPGvGOg+LcKYAC+AMR96ISMIg+3lQNl/Eiv+0kyePRfoy2V21p/V7WnQzY0g/a41Io3j
	vPC3q8TfJ+OmmLoNcu/CXsPGeO1TQbnKVsSDG0gimG1kVVU2ie2N1w9ggw2Wpf0mZumC+jyowlkma
	B4svQdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECR-0000000H3J7-0utV;
	Mon, 09 Nov 2026 01:29:31 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECN-0000000H3Hy-4Av4
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 01:29:30 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-483c607ccb4so193585fac.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 17:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187767; x=1794792567; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3IT9ZF3wWg0/NDcCITM9rGC2ffWPOuz4O4zGIuPGi6Q=;
        b=QBujMw3d0b6BwHn+GPnfYYnYw66dLeKF+FhXjLyCkpayx05B4LgbEzWXcXO69LRmN7
         dWnmDNqMLW7GzV6cAixxIJGj4eYyGu76hWZqkbFsjhoDkfc6LKzIOGDCubEQka9W6i4g
         HwMkRo4MqHUR8Jr7PISp6bie6uJ2kwF66ixLPvOCtVbnwKnETZd/acujCbY3EcIp9MYD
         0JZQPHCPCKlUkah80xpTrt4UQ66al2RLz/2+RIf9Kl4s8kmAmFXK850AgxdfMZejH2q6
         sEkfwtzygjYVvBCqPgsUuD45Uqw2ep06XU5OlkrfwnxukTt5WcxN1e02KmP3dXHa/wW/
         WIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187767; x=1794792567;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3IT9ZF3wWg0/NDcCITM9rGC2ffWPOuz4O4zGIuPGi6Q=;
        b=zoPLuXTlKUOlKC+cPZExX7l5OaQAVXvat+zIuoh0PBraUWdpXx0vRuXY7T+IwiTDpL
         Ml8FNyq/g5TlhQY5b1f7KRYdz8qNtuiBV3y4/DbrA1g7mdygn4OyAbaF/TX1fa2jxhGy
         HFe3t0zPwS23ufprDl0pOB/ugaVdE2htQwR1H3MWRDLETASy5J0vUZCAkt/IcaiCR3I3
         YzAQ6QvPad0qJLwMODKdoDuiuzhuGNirqIHMRoUfvQuqq7IuJbXjTl+5DvNXph5aqapj
         EuViWwZwhgCjyBf8O2fGJOLwDlA3W6Wo00r9rU9Qs5kVl39Av84E3ofjl91J5F9R0/IN
         Pr3A==
X-Forwarded-Encrypted: i=1; AL+hErFA+VSyCEGxOqT3bTS5qsIXUSMWNdgFbpZpuEcVfb+2nTiSzaYB0yjcjkTwsHeL040pNuwLqEUwU4Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z9jUI9GUXWNkI1jmDmXWgjj8dURiMXPtURsur63mnDqRiZHXHIi
	N5AxvJkrkGgdvg/5bwio2iHk2h4tqVSCB2vM0TeUWlheq+y5CihkneLh
X-Gm-Gg: AYBFou0bnvj78UVrI1mTqmk5WSAbvpMFJPQonucCuCKlmDRbT9L873bbZEVvD8wEnHe
	yVSC+u/yAWG0XofpW3749WJm7PwUzMEgzJAqNb6vGIeEUEVcddbQQ7KGW124eyna+mL2+45CHkF
	DFV+bHlNfKrRrehIFsc10+6ulPDE/xBTgGmDmj6y0PuBjYgo3QPnLTCPSY/QcKpUpscD+NO5OkD
	v6kfRAmufA8FcKLHn60dNxllYtbJuzxM92HARdR2Rcfd5Pan+i7NxNVQpcAxppzOTQx+AKyZmpQ
	/HpmqE4krsfomET9+4Wc4mCPsSNThYZnYlITr4PcTAII/sBtavu0P5lo2ZQ3gcpV+XFGysQYP9w
	Gn62EqbBC6mYscNtQoI7Q9NKunTOm/xipsyGZtonuPyZKaK5IpMr06xy8yKKshwf66FP5euBXww
	Bq1HzLUbP5NPZq0zLV6aRYIYPGFCeV0WWKKH130iDWP3Z0apTeIVumVrQ8ka74MuwAAx6K4VnaE
	3uoI8uagI3Gy1aSzLcOhf0hP798T4pNQeC/rFKcFXycLijr2RfwoW6nB3LH/W2jjyaY/MxKuplA
	wPu3F8arVJ3ii6Z1gktZ/sXJnc9kPJ2J+/kfu21ewf+pGtnNFbo9kTHOSjnfPvJdo24q902C5PX
	UfAUJAKjofKY4DJ7EMbjk/lFII4ZJDsXQGqGv18HMvQmIXrD7mZ03pANdQNefoBZgU09Himi54V
	0gyGR+ySZFNe7FnsDC49GTL+eyVFTXf+9E0VyEe4ohsCcviPv0W3Vb
X-Received: by 2002:a05:6871:825:b0:491:6c73:817e with SMTP id 586e51a60fabf-4adeb44512cmr1457682fac.5.1794187766772;
        Sun, 08 Nov 2026 17:29:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/4] mtd: rawnand: restore SmartMedia setup in r852
Date: Sun, 08 Nov 2026 18:29:19 -0700
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQrCMBBEf6Xs2cUkoLT+injYJKtZIVGStRRK/
 91ULwNvGN6s0LgKN7gMK1SepcmrdLCHAUKi8mCU2BmccWdrzYjt47Mo1vHksGWqmjkKIalSSDh
 bdJOZJkvEhgi65l35Lsvv4nr7c3c8Oeju3ReeGqOvVELaq6zxWKj04EVh277+bkYYpAAAAA==
X-Change-ID: 20261108-submit-r852-smartmedia-attach-v1-290991aae0aa
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172928_044105_F16B94A8 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

r852 installs its own NAND controller, but the shared SmartMedia setup is
still attached to the unused legacy dummy controller. Run that setup from
r852's attach_chip callback so the media-specific OOB layout, bad-block
handling and page-size checks take effect. Restore the hardware-ECC
default during probe so the PCI path selects a valid engine without a
NAND device-tree node.

Before restoring the shared setup, correct the first ECC region's offset,
remove recursive NAND locking from the bad-block marking path, and select
the standard OOB writer for r852's contiguous spare area. These keep ECC
bytes away from the metadata and bad-block writes within the spare area.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (4):
      mtd: rawnand: sm_common: restore the first ECC region offset
      mtd: rawnand: sm_common: avoid recursive locking when marking bad blocks
      mtd: rawnand: r852: use the standard OOB write operation
      mtd: rawnand: r852: restore SmartMedia and ECC initialization

 drivers/mtd/nand/raw/r852.c      |  9 +++++++
 drivers/mtd/nand/raw/sm_common.c | 55 ++++++++++++++++++++++------------------
 drivers/mtd/nand/raw/sm_common.h |  3 +++
 3 files changed, 42 insertions(+), 25 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-smartmedia-attach-v1-290991aae0aa

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
