Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E7606A339
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uIY1H1Z4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u37tk4xV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GqLkVFTvfPuvWQw5L35er0p30tu8fMYgdnKMFpyFiHY=; b=uIY1H1Z4B/z5IKFwRZkrr1psuY
	81V2kvwtth/UC8WfnxUaBuSbM4YoXAGaIX5qcCq1onSvi2hsAeyz2qYx2G2wN/gLlbIzC3cgH8LyP
	eSz2Y0Tr6LrP6Uwz4qMFXxUK3zBl5q9AvE9Nn31O1N9aqCP5V3cMDfkibEqvYX6LjxZTeZRmUY//T
	FEgoUhyUxp/BGEG2zN1cn4KrOnbqE7F9KjOpX2d/2r7vFmpmPN0qF+tyXEoEkNsPPPF/bY9jDwhpO
	TK/mOWNRCxOr+jIHLVEjez+/jOFbe+gmptXHYRAVKYorzOyrtv7i09Il/y3C7MqCQsHmlQqhcCGes
	t4Y0ZUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIo-0000000Gf4f-1lie;
	Sat, 14 Nov 2026 19:20:42 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIj-0000000Gf40-0iGj
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 19:20:38 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-91f0272ce61so32302746d6.2
        for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2026 11:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684035; x=1795288835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrRlpQEwXgiRcoz4RvmnIKknxKuf/PJC+lqfeOzsn1g=;
        b=u37tk4xVoNnFGE4K/lQVVb5EpM8hXnodW5co8+cxCL5NBFMJlZVAs+E57eGoQSCb8Y
         r4+2+HR65o7PKL5cpT8eRheeAWj9BPpRnTJGcfUixdJQNnvAOHEgjvFcGuo9c2kGme6C
         bdbRUzlJhl8kCbi6CuNG3/ni1nR8OndEMF5ord9YobaC1pdsTyVcP1k8GxdYfA1JZZNK
         /s2EUaUablrJ6xXk0ll47PnJYAIY0/Yp5JhuGRFDRnwejmcenNDwu62GuaMhv9z1DKqD
         d74B2eRPrl2XseEOBo8sl3VvIrEfwfrw7bRsI6YcGzoYqG1Qx65CzayPN0dr8sCRbzqy
         Sc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684035; x=1795288835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrRlpQEwXgiRcoz4RvmnIKknxKuf/PJC+lqfeOzsn1g=;
        b=jhZP1Jc24uuBJB4y8/w2tu4GOv2cwxqkDTBQfF1RbnbfWDdmz/srHLfCkgblRDCO8E
         LRPQtagPM2CIJXPasmtnxhQV1z2KCTv8sj3P2tyW5G6jh7RkKEtZUiJJ5o22sA4W3TZC
         FqNvQLyyr0H7HYNm/OlJI/vgrUvOeWqqSHzKFi8Ls7xTt6thEG6ek8e0qFJqYMQupAbl
         KbtdU9E7ofecJThM51GiBC1ZplYd7LNrXpyvpZLYSyT+i1fObL9erRcyC8UAU5J9cwj6
         uyGa1fPEQz2XoBgRYwVdsNLP+xF/GVctCcXO8pLyWBqdreE7SuQFPkT/k0vYvxYNVL4B
         DBgQ==
X-Forwarded-Encrypted: i=1; AL+hErHFufSitxdQobpwjsVUuat3HfFM/+2kqsHW0js8mzkDRqprjhME769kd0Ofr12smiJbAFcIRmdoh7A=@lists.infradead.org
X-Gm-Message-State: APuU4Z/Z5Rcut0YId0/DCCyUHN3P9PRfKsmuEzpEU7YmHbdufRYBPY64
	TMVdWRwOjlRunfYGozXo2wFAYe0Yi2VUlk7gokA09wSPTyo0BjlqbW69
X-Gm-Gg: AYBFou0Gh/AJKxQVFQy04VBmUgH3NcygH2raqWDUTxzjZmnWQyFKW/8uQqt0UHrTgAG
	s6wHZTGFywkpe5voljuhcxnTnGMPzKp3jUCjV69NnEjzOLhuo3jVfv8VoeEuZL/CfoHcuqJYYNT
	y2UhQfaF8rHxnTN7Thvn5u0x+lRSAUNOCB4YM/HXmz5Z8CBnvNZ2A6hngYmWfi7Do9s8ZnsnVp0
	tt555oAmoE1fdljgQZZHA2KnAigK9AjR0FYolouvqKzTHvh4HaNqjHlBTvygm4t1B5m6Q1l8y4l
	iJywsbcVFFc5e0YJYb9Selc/d+DIjNk+B4SNUrB+KZwXw+yikJ0M2Tn0/EkpyUkzS+C8v5+GBiu
	Yyj+DTqZlRoszm3cDUcJZ5yglmLldp1qgIB+9TT/TPYa7QYDI9BbXuquzY0jNhJI3LeUk4kkNbw
	7HG85wAKqZxdTWVGlCZZHHVMp9PkqLmg8S7YqqYYz4Enr/KjzWEIMNy1t7b7GKFTt+eLWurWcqn
	b22MQJ5dODnnjF3Xo+KQFudtEMuvedVsP9bxMZ/qYLPwvv6BX+Ccjwpv1m+uvEj73v7amAuVPLB
	H5nS66esm5eUapgbXJ6PJWrbD6pQ2yuB33E=
X-Received: by 2002:a05:6214:2f87:b0:919:557c:f0a1 with SMTP id 6a1803df08f44-91f241b9d98mr94261976d6.24.1794684035598;
        Sat, 14 Nov 2026 11:20:35 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 0/3] mtd: rawnand: vf610_nfc: fix the OOB of written pages and command timeouts
Date: Sat, 14 Nov 2026 20:20:28 +0100
Message-ID: <20261114192031.959376-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_112037_224837_F37CFE0D 
X-CRM114-Status: GOOD (  14.73  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Three fixes for the vf610_nfc driver. All three were pointed out by
Sashiko, on the large-OOB series [1] and on v1 of this one [2].

1/3: the ECC page write transfers the spare area out of the controller
SRAM but nothing ever puts chip->oob_poi there, so every written page
gets whatever the previous transfer left behind as its OOB.

2/3: a command that timed out can still finish later, and then the next
command returns before the controller is done.

3/3: a timeout is only logged, the callers report success.

Tested on a Colibri VF50 (MX30LF1G18AC) with v7.4-rc2, PROVE_LOCKING and
DEBUG_ATOMIC_SLEEP. A debug patch skipped the wait of one command, so
that the command finished after the status flags had been cleared, and
counted the commands that returned while the controller was still busy:

  unpatched:                       250 after 100 forced timeouts
  completion reinitialized (v1):    41 after 100 forced timeouts
  this series:                       0 after 200 forced timeouts

With the series each forced timeout came back as a read error and the
reads after it returned the right data. An 8 MiB UBIFS write read back
identical after dropping the caches, with no ECC corrections or
failures and no lockdep or atomic sleep report.

Changes in v2:
- rebased on v7.4-rc2. The large-OOB fix that patch 1 builds on
  (vf610_nfc_spare_size()) is merged, which was the build failure
  Sashiko reported on v1 1/2
- 1/3: comment dropped, commit message shortened, no code change
- 2/3: rewritten. Sashiko was right that reinitializing the completion
  is not enough, see the numbers above. The idle interrupt is now
  disabled on a timeout and the status flags are cleared before a
  command starts
- 3/3: new

[1] https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-mtd/20260828085340.3916239-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
  mtd: rawnand: vf610_nfc: keep a timed-out command from completing the
    next one
  mtd: rawnand: vf610_nfc: return an error when a command times out

 drivers/mtd/nand/raw/vf610_nfc.c | 41 +++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
