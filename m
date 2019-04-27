Return-Path: <SRS0=qSHN=S5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617A0C43219
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Apr 2019 06:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACC82087C
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Apr 2019 06:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7Qd/lxq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="D3qQynbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACC82087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wALMpRcYsP1K1SlP5c2wSOZWwuEKNzp5WpO25gPeJA0=; b=d7Qd/lxqb5RmzL
	G/2eJJNhGKtU1gk/kTIrYTRb3YTnnoATRFItVjnnoZyYObo5pOnahmXaCTsb2smjdAQezI/7zTDR7
	fFKZ3Zyi7C6hCFgHuynFcyjgGtbc5OJ6OhSVcbgDeAPaFIet34HzeZ65MyvrloI5R6DZ6f2kceGZx
	BhTav9EDGvafclddD8VXgN2st9fx8bxpwvG0N2+CvSjGctpKNoA6DFNNzDpk8j285/rOfdKTI5htw
	TfOmFzIYGoI7WMG+pQFl/GfcvceoDGk6TNbohhgiRi+Q4cbUP5NnIVpPhxFMtNLAcAwEauw7EhY3S
	iwoy249m3zLwMRmhbFeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKGk9-0003wa-Lu; Sat, 27 Apr 2019 06:23:25 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKGk5-0003wC-IL
 for linux-mtd@lists.infradead.org; Sat, 27 Apr 2019 06:23:23 +0000
Received: by mail-lf1-x141.google.com with SMTP id j20so4099272lfh.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cc7yCPelO2lVowaMLYe2OEFr5kHeXsyA0/yYuACqB0=;
 b=D3qQynbtJbcmTvv7zi9F5kmxOX6NCi9tdIeAjO9A7C66mpKFNwZbU8QZPJSz//pG1D
 DNLe4COVEj5pq8AIMKob0U8zfdaDHX1bweOWxyQQAY2eZ+jkfJufaGf2t0yemHM1ls5Y
 oHPBpRxA9kStGISxfYDGueFTzWbaiQpTSZqWDZ/SvD9hRRPzxc7Il4YAnMUkqIaEMb6B
 Y1JlmIuYr7MtflPdtnke1Dnjw6XuYpzDdnV1s53QnDYU0o3vwnd9CSxxsA34CuCd09jD
 dXljAPSTcTWVVMcTxowO+bn0/Kr0DDsLgRzFA/3eOjLs6o3zAPRtUfPuh9UAmtDt3p8v
 rHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cc7yCPelO2lVowaMLYe2OEFr5kHeXsyA0/yYuACqB0=;
 b=idLumCgBUgxa/V63wMiBWW2+TCIu3GevEF+fYOGFQDEyJM3TKhsaXN+LByDE6g/Pcp
 GiS2Eb8KJALTakGSUIZZ0kXkGV17ZNodp+dTfHF+bz2H9I//BsT4h4hkuX04QxK5RTA+
 XVwSj6Z7q6atvLxN+SrnolIlozvWjnW/DobVAsPja5iN6JemIa0/ZgKKf6ja8iqIXQe1
 YFOwalOUILgYW4wf7JDUbir2QBaGcuR62d28svlKJFypRNdJdu2xNhvzJNpjFY0KvOQV
 TcvChLVV4PoqLAw2c4/27gwJbaqTL5WEJaWxsFX1dHBYmZrms9ODQdVje9yMD4mLNh9U
 5acQ==
X-Gm-Message-State: APjAAAUdZ75PktGQFNgINgdQfxbTD8FoH8bWRPoYCTYPs0Yv0bKflerW
 /xmLm08a22dkZSsu9d6pPtCU9g==
X-Google-Smtp-Source: APXvYqzwARzQOFNFrBLlF0eAeefQvbLGm55F5aIhEr0cijOn2eSlXPlUyOndcCSPY2/DXgxOFoL5CQ==
X-Received: by 2002:ac2:5203:: with SMTP id a3mr6925309lfl.111.1556346197077; 
 Fri, 26 Apr 2019 23:23:17 -0700 (PDT)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id o79sm6066969lff.50.2019.04.26.23.23.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 23:23:16 -0700 (PDT)
From: Jonas Bonn <jonas@norrbonn.se>
To: Tudor.Ambarus@microchip.com, Yong.Qin@cypress.com,
 James.Tomasetta@cypress.com, linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/1] spi-nor: always respect write-protect input
Date: Sat, 27 Apr 2019 08:23:13 +0200
Message-Id: <20190427062313.24258-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5401b73b-0b06-45da-ced8-915b8d5c9278@microchip.com>
References: <5401b73b-0b06-45da-ced8-915b8d5c9278@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_232321_655466_0D4D9ADE 
X-CRM114-Status: GOOD (  14.49  )
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

The status register bit SRWD (status register write disable) is
described in many words in the datasheets but effectively boils down to:

i) if set, respect WP# when trying to change protection bits;
ii) if unset, ignore WP# when trying to change protection bits

In short, the bit determines whether the WP# signal is honored or not.

This protection bit is used in a couple of different ways:

i)  Some designs attach WP# directly to ground.  At first boot, they
write to the NOR and call flash_lock; this results in the BP0-2 block
protection bits and SRWD being set.  As WP# is permanently grounded,
this block protection cannot be undone and the NOR is effectively
read-only.

ii)  Some designs can control WP#, thus allowing the protection of the
SRWD bit itself to be managed.  When the hardware pulls WP# low, SRWD
and the BP[0-2] block protection bits cannot be changed; when hardware
sets WP# high, the block protection bits can be freely changed,
_irregardless_ of the state of SRWD.

iii)  In the third configuration WP# is pulled high internally, thereby
rendering the SRWD bit ineffective.  In this configuration, the BP[0-2]
block protection bits can always be freely modified; this puts the
writability of the NOR flash exclusively under software control.

Linux currently sets SRWD when flash_lock is invoked.  This prevents
further modification of the BP[0-2] bits and the SRWD bit itself, _if_
WP# is in play; if WP# is not in play, this setting has no effect.  This
behaviour is rational.

Linux, however, clears SRWD when the flash_unlock is invoked to clear
all BP[0-2] bits.  If WP# is low, this will fail and SRWD and the block
protection bits will remain unchanged.  If WP# is high, changing the
BP[0-2] bits will succeed irregardless of the state of SRWD, so clearing
SRWD has no meaningful effect here.

There is, however, another scenario where clearing SRWD when calling
flash_unlock causes unwanted behaviour.  If the BPNV bit is set, the
BP[0-2] bits revert to "fully protected" at reset.  In this
configuration, only someone who can control WP# is able to call
flash_unlock and clear the block protection bits.  In this
configuration, it is desirable that SRWD is not ever cleared so that the
WP# always has full control over the writability of the BP[0-2] bits.
This allows the NOR flash to be made writable _only_ by someone who has
control over the WP# signal; for others, the NOR is read-only.

Given the above, this patch removes the clearing of the SRWD bit from
the flash_unlock path.  With this, Linux only ever sets the SRWD; it
will never clear it.  This should be compatible with all three
configuration outlined above:

i)  If WP# is permanently grounded, SRWD is not clearable anyway.
ii)  If WP# is controllable, SRWD is moot because WP# takes over its
role
iii)  If WP# is floating and thereby pulled permanently high, SRWD has
no effect on the writability of the block protection bits.

Tested on a Cypress s25fl512s.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---

Hi Tudor,

I think this problem is simpler than we think.  Just removing the clear
of SRWD in the flash_unlock path is sufficient to cover all the various
cases, as far as I can tell.

Best regards,
Jonas


 drivers/mtd/spi-nor/spi-nor.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae147452aff..bc3317f2bc7c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1313,10 +1313,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask & ~SR_TB) | val;
 
-	/* Don't protect status register if we're fully unlocked */
-	if (lock_len == 0)
-		status_new &= ~SR_SRWD;
-
 	if (!use_top)
 		status_new |= SR_TB;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
