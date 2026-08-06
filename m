Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83087C56208
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2026 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36cNgKzfuXLxlViqtVWRSkHmUEaareruYk8ZTazo1HA=; b=3NntlRxMicL4Qp
	qKD3EO7qxltBul4E2WjEvp+WU+8PVE9y6xSrr99DiCJ6u8vYvZ2IThJShJO1epyjkQ+suVM5z9NOv
	MZ7DqOmy7qzxqyro2O4uBeTcSeyxA7iAomm7sq8DZ8xbEpRLy+yz2oA0ivcxRJnA2Li/c7P7YA51C
	IxioPWtbSnBoEJJu0TVmAd5pF9SLmShw0aZtkzsv2qXrOVk4nP2g1il/Dr9lm4gZ/oJfGc9d+BwA/
	5Q9DYMCbuGUYyIFFcYkaBFJlVF6O9jNAMOBghduBUnWUaye0tDkvJApqPY4QYkHQXQiAdwzy24D0w
	Qxsqu9vrMQ+e1WjGqHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwD8-00000005dsA-39MO;
	Thu, 06 Aug 2026 11:24:30 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwD5-00000005drk-2iW4
	for linux-mtd@lists.infradead.org;
	Thu, 06 Aug 2026 11:24:28 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81eaf3709b4so30412087b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2026 04:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786015466; x=1786620266; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=htlXA2vE3OGvFfG4HYdtHC6yn1LF5Ww06gH8IET7fdM=;
        b=HylcnU29CMzIf7auHl0KMC0KmiQxa16dzPkhpDRo92+4OOCjZFAwcq7PY2cerY5OAC
         ld37vMf9JxFCwyHwDp+Ep9QPfvYmqSv7XrwHhV+CIF5Am2oYHT7DwDl7o3WD9YZ3srSH
         3aGMTcd+pjr1IR3iNjvjhGthpGQBhd+GnCWFUq0rh7Z/6269Dyq3M1Qm78EEXj5Q8VTV
         UXMAUA9onDnisGRySWdX48RXPY8dPZzs5g4KLMg4fnosAbu8eW05hLwqLJCflaOmP6C9
         5qOWc/dW7XjIv4XimFih8K3SFEk+ry7VrFlmMPkHpImiEQy4J2uRYBJfNW1oC6Z+3IGh
         7QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015466; x=1786620266;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htlXA2vE3OGvFfG4HYdtHC6yn1LF5Ww06gH8IET7fdM=;
        b=SNZw1aGvqt/JwQLpYbQjTjj8r7kOlhdUD/EuzldimcvpVpnLJXDAcG9i0C8JS0gb6a
         wL8aNgwhCIIlzhbgbGlQssvCG4nQBEnW5a6xwcDHzm7+KFnTOtdDiWQEKb/bGd8bkrrl
         HKyEnBTjzdbLqi1oUM87xvmPfWhSPoltTjlGrKqzs19nv1BFw4E/MVWOptuPDHE8v0rg
         y2gop6tQJqQNSlmTBfD3JLPK6wng/qwHpQCEDNsf/EjYzboXZppN7sjm6PYPNdg8S2KE
         jPPW8Memm2GiEmZV+vhyDjHhrSr0R/EXs4FVr2d4n5H5dFygvTnOfjFmKI542P36WsSk
         4+aw==
X-Forwarded-Encrypted: i=1; AHgh+RqrNc/gHx2k3UQrxP2Sbl4nAynZBHRZcPIZTSz+bSG06ezFJNCitkcFWb1Rw7ZgiIM11eL9rfDJsr4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNeEbtDpcf6CV6vCjt/CrniCKzedS+AGdltRVJ1gnxrodF+V3P
	W/V3B67EOSZ/hUMGc7lSsLOJc7hJfyJSyXQZFYlYjY3GWE5Me83FRFuG
X-Gm-Gg: AR+sD10l1GhMMRN0uCMyCoLZXvNuaHG47GlUXzYFNFBfMqzLUJmIEU8GB91BAS6KgQB
	0LUe85IkfXk8w8hwlMdIQhHXUzU7F9m8eFeW31yjX5JikUWe38dTM2VEyHKwLJppE3BYClC/3rz
	vbZXxWegwYncn7mmqwotieQiAWGTC6pbdhMFv6jq/VCwX2bz9rRwnldkWp6T+3O/rft4sZtsis7
	AYD0YkfBcFwPAw/a117HZ4TK79WXjH9h620f4cxP7b3qtkxolmKBow5B7tsw9BBAPOSDdGPFkSI
	Ha3jSwP8Dx8KIBnsnrK9sysgTdjIkz7ya8SPgMuQplfys+Mx4Xq40Vj8q1nMODtrA5vY6ZtlalL
	LSpljoMz8ClSq/J7XwCXWt/SHs33knqhsqrj88/jvFbfkSKWg/G7F6KI9hx6ITZpumG1GHMWqw9
	UHSD83hFhZLSGcwaktljnNS674SE7bC5cX7zb+AYIkpUuOvClRIzBDHI2LEaHBZiKZmg==
X-Received: by 2002:a05:690c:6d8e:b0:81f:2479:16da with SMTP id 00721157ae682-8202232ce68mr90001897b3.16.1786015466392;
        Thu, 06 Aug 2026 04:24:26 -0700 (PDT)
Received: from SC-GAME.lan ([104.28.245.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8210fa3fe27sm16628097b3.37.2026.08.06.04.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:24:25 -0700 (PDT)
From: Chen Minqiang <ptpt52@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: allow force unlocking via DT property
Date: Thu,  6 Aug 2026 19:24:18 +0800
Message-Id: <20260806112418.14695-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2026-08-05171214.2934-1-ptpt52@gmail.com>
References: <2026-08-05171214.2934-1-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_042427_691383_8F82B389 
X-CRM114-Status: UNSURE (   9.70  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Thank you for your valuable insight!

You are completely right that for unlisted/generic chips that feature a 4-bit
BP layout (BP3 at bit 5 or bit 6) or a CMP (Complement Protect) bit in SR2,
spi_nor_unlock() won't clear those extra bits without the corresponding flags
(SNOR_F_HAS_4BIT_BP / SNOR_F_HAS_SR2_CMP_BIT6) set by the ID database or SFDP.

However, in practice:
1. The vast majority of 3.3V/1.8V generic SPI NOR flashes (e.g. 4MB-16MB chips
   commonly found in vendor devices like Tenda AX12L Pro) use the standard
   3-bit BP (BP0-BP2, SR1 bits 2..4).
2. The current main issue is that even for these standard 3-bit BP chips, the
   kernel currently skips spi_nor_try_unlock_all() completely at boot time if
   CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is set (for non-volatile chips)
   or if SNOR_F_HAS_LOCK is not set in chip flags. As a result, status registers
   locked by factory bootloaders are never cleared.

`linux,force-sr-unlock` serves as a pragmatic DT override to force the unlock
attempt at probe time.

To address your point regarding 4-bit BP and CMP bits for unlisted chips, we
have two potential options:

Option A (Current Best-Effort):
Keep the patch as-is, treating `linux,force-sr-unlock` as a best-effort DT
trigger to invoke standard spi_nor_unlock(). It successfully unlocks the vast
majority of standard 3-bit BP generic chips. For rare unlisted chips with 4-bit
BP or CMP bits, explicit entries can still be added to the ID database when
discovered.

Option B (Aggressive Force-Clear):
When `linux,force-sr-unlock` is present in DT, enhance spi_nor_try_unlock_all()
to perform a broader clear operation on SR1 (masking bits 2..6 to clear BP0-BP3/TB)
and SR2 (clearing CMP bit if SR2 is readable).

Which approach would you prefer? I'd be happy to revise the patch based on your
guidance.

Best regards,
Chen Minqiang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
