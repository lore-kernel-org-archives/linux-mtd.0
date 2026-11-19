Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6960560A2601
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RunMCk0l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbyWLEyU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2UqeM15pSp9sG5akg9pm/1Gl+PuRBEuS2WgEFdSTCsM=; b=RunMCk0lX5S8e8Kp12xaPDWDMW
	Ahh9zeQ7F6Bg+/ysuzKbX7PEtgEml6TTRBVYoDqicPa9bFI8mYYfEKY4gvzdCQHBjh+Vn0XLCZq2+
	4evwFgGzk1YZxx0q9+RqkCt8seDZpsaPQVWThD++IJu62W23wezbjuRVua0eADxtriQTCbGlpsdnL
	n4zZMkpROHpOqeQle9GTP5Yjwf6SSxgwlBdMbCL8GQHtlJqrO+9f/shDG7Uz0ybrf0O0DX6WG+Wr4
	MB53zYV92oJLtDhJUUCYQd6nJu3Kg9NEpBjorZonDvq/uAScsxJk4onn7JyWwa5PyXILw542YZTNJ
	lGb5rXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wc-0000000Bzk1-0Bpe;
	Thu, 19 Nov 2026 13:12:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wZ-0000000Bzj1-2fmo
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 13:12:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so1574370f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093969; x=1795698769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WJXnVig7SZkwO4OAkKnuo6Hlh0mY+nkABDPAGbY4VVo=;
        b=SbyWLEyUkhTnEo3g3B55Cnlb7o9/rOgdiEuo19fPuHKQGokKpIykCMSFt33QRePV3g
         ENzOzLRksLCfOnghnQrS5+K7+MoZp1LB5bkXMmd1C1Kt/G23RtNN9WSzVT9gwa4V1N0n
         EInYjmw+quoizqUqk2m6hrb61mn13uFtIa4dTCdpnuxewacq9Q2nK7lNx+2EcMed8zEr
         mpVbbYN6lszYoRwtRTpwZXRC2gBWFNnbiLtCnrdHaRnGB+0dr6nBxkI5UB4rNIwnoC4V
         Tsmw+TiNOGY3G+sJkVEfaKTFSJgF2uaqPTkb5mZ5Eivbv8JgVrbABUI7xMZY28SwtV6k
         /DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093969; x=1795698769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJXnVig7SZkwO4OAkKnuo6Hlh0mY+nkABDPAGbY4VVo=;
        b=gIs642JyV+3iN3iPVZ89ClxJku66gprWH1ql0DzFmHXIDzJO7has6C78Lw8LrECzkv
         l/ATKdpYyCoAG9m00PaoScyghO6yKngvSOAtoxH0RsXs1pBiiF26tGzLxFJY9KoJiDXN
         SfzdDtZFTB/sMTtxDCJ1hvIeDlAA6exD5qWDSGfTszi71aWcrRNw17JmaS/sz35DU475
         jLL6/jR9FbiU694KrjK05xAt9KI+cCKaYbR4DRF7imYud17zbPBudIzYusADb+nw27LW
         l0hCVksAOyI7SII2uNw3phOSkbjTZ0FjtknhYBzwqjAkL7wMj4uMOV0rZDFWuezowHIH
         uDqQ==
X-Forwarded-Encrypted: i=1; AL+hErHnwA7DsCITQhDHXBuN3JTcLOO0zURy/j0yOFuaNitnn9gwBE0aaTmhgHnZJOYuJeFPCTwzfG4kuDY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+kus+Yf04tNcF4oivA6AbgDblm3BJl45qKjs4dKs1Shz4tm+FX
	Mmef5g9mg7HWp1qGhftcrAqXv1PRBb7mTjv9AS56lBm2Mu0tz+cqB7uq
X-Gm-Gg: AYBFou2lnaInK9gef39chzumzai36h2ikILFd2MPfuov4jfhaLZDRa3lPpu0BdIOrcV
	DI9X67HmCG5wlG2hl7Bz8/5tuvouXWw3RLeZjmsVNFZCdyflv1pYJVdUHqLk/i+agBT++oPd9A6
	vlCGPsmMqDWZItE7yBHJefYDwSTWgeY3+nHAMejjNl4Dsml1v6wnn59cDmYAbXsK8CwTOuRu/OK
	3kV4sSjRLuAzIp4lNRlFWOR9P1cHUyDt0ide8r2CTAyjuofkm9LAHP+NkCnN1IekH7Y2OzImJ9P
	YxknmHLuc936FWtec8BedE7147WjjtNxQM+ZnIqg4U5rPSkhU7c2gKhlw9lPzghc4ZKzTehIKsp
	i7hfAajWKZwoiTRQJ4s9b6VD8iOsQxcLYISfvGT0P4az0GfU73rwzHYp4C3yFQ6l7Waq29ZDkQ9
	GqP84qsLA5Rw99SmbIXEWySt1XWX3OmjDxp2j3s4ExLpOEmcI6wbbv7CmGH1asjyrFJ6OdJr0h2
	k3FRwctVtjhmNhwEJ8eOHMKozlQarhsunDKfp87QH9qolDKXM+m5KcJUTKMWqUyxcFklrK+qTtR
	k77ncLDuWgsjOjgPh8jNtphMZVNSO0ENGKt0+Me2Y3hK/hYEDxekynYD
X-Received: by 2002:a05:600c:6095:b0:4bb:6238:cd81 with SMTP id 5b1f17b1804b1-4bb7d9fb3e1mr109823685e9.10.1795093968695;
        Thu, 19 Nov 2026 05:12:48 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:48 -0800 (PST)
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
Subject: [PATCH v3 0/3] mtd: rawnand: vf610_nfc: fix the OOB of written pages and command timeouts
Date: Thu, 19 Nov 2026 14:12:43 +0100
Message-ID: <20261119131246.187406-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051251_700320_D17E8AA1 
X-CRM114-Status: GOOD (  16.47  )
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

For the v3 change the debug patch forced the timeout in the raw re-read
of an erased page, 50 times. With v2 each read of that page from
/dev/mtd succeeded and ecc_failures went up by one, with v3 each read
failed with ETIMEDOUT and ecc_failures stayed 0.

Changes in v3:
- 3/3: a timeout in the raw re-read of vf610_nfc_correct_data() was
  counted as an ECC failure by vf610_nfc_read_page(). It is returned
  now (Sashiko)
- 1/3, 2/3: no change

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

v2: https://lore.kernel.org/linux-mtd/20261114192031.959376-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
  mtd: rawnand: vf610_nfc: keep a timed-out command from completing the
    next one
  mtd: rawnand: vf610_nfc: return an error when a command times out

 drivers/mtd/nand/raw/vf610_nfc.c | 43 ++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 11 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
