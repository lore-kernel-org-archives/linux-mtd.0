Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F08C71157
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 20:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IPjYzBIj4/hFDxP/X58HHPmGfLJJzV65qlxMWlvDe5o=; b=rqF3ixXN/BKxVj
	lwqLRQYKQqzRPIw+qMNwcrdDhtEiCNtDkxWXfUR+WWySPG/JSeuhnt5N2lov1nPaCe+2+F27tMvjP
	ZtGpNKf32kX2oUOZL5SZmR9+5jyFdOnmlg0D1vu14B6RLA2D/oAc48RybsnxOslnp6drJS88ivW+g
	+c8hPL+Eq76a72FEXTzVVKpyMvOa+cmQVoKE2whP8ID1Q6uJN2VvWib1TyJFdcp6YqpIdSomC8y1f
	WcNqEzjj34jTF9eaRYfypMfH0zRjkVhm1f/HJWLjb4D93k3zMqlH1B61UimBday/3YWwuz7ll+/VG
	42hfmLx7EjJklf0zMRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzJM-0000000BJpP-3dyI;
	Wed, 18 Jun 2025 20:23:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzJJ-0000000BJoe-3BYZ
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 20:23:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a522224582so43582f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2025 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750278184; x=1750882984; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DdY90JVNXT4QPFohJuCx2RaKTGnu0SRF1dWwzgFg3Ls=;
        b=KalNN8lX2V1aLk7b20GAl1lap7g1I8+vDMiJn5Gq07VnEHvpzRpBJTNXRT2IKGLF0+
         ZleexVyukzqxbJcgoBzKyPEhoote6BucpOmpOjP2ZiqYSxfVy/4s6Zj8PRvrWpTu1ls8
         Laee95pvFV1nN/z57QFRkZEPnMpuqetAXsM3uQJ3Svs+T507InK5Pkn5YgpeJCXlrS8k
         GefZa3Ic763stdE5cUZmv8CERtgt2VjtdhO+eKJ2NkZj32+g4n51D8jZeiSexjux44KR
         zb5Zf9brg6B0x1oirdXnycL0w2JIQZQk7io2JMqva4CEd9x7vq4KFcCRlVC7tT2tGJnE
         WnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278184; x=1750882984;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdY90JVNXT4QPFohJuCx2RaKTGnu0SRF1dWwzgFg3Ls=;
        b=Bp2Ao5X4lJ5S2Q0DdJ0wheHPsaZCjB9a+Rn5ADkoIxiXd4Edsi69Q6m5Y0WkQoneMZ
         39dMvTLsaZ+VcgmFncItaXNyAkuaePVStLJKKiF8UgLbRoKKOxPxnSmTXuhiXKycqw1d
         D586cTXrDDb4hZxPDNb75l3F3uEIRKNtlTqjMkcT3OqRPd0n/rYiVeabUS1Y/V97XIdJ
         2G1JtpZqbF+NQt8BVMWdAiv8yJ7TIvWo3+yDryDWVmnU/a3JGApm82mblxQyTdrGD9uu
         hzmUjuMoBl0x51BvhpQpXuEAxvKFaP38qWlotw+aN+MNSD6viErJ4c3nQFD4btT7YiXm
         lA+w==
X-Forwarded-Encrypted: i=1; AJvYcCVjcpkGzX0a5rSC2Nkk/TuuQSeOvtOaJS9+g2FCJbk50fs/FYP3mWwp5n4ZjSfrUv4PmgZR88fdCOg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCrOvOrETN4Vd7DfgiGWD3eIbSQt4goFCs/suY+JqcOKf3VDZ3
	Ch76o2JDCJt57ImBpAwmQTmGmGL70rtZJvo/0Aa/9wdUwxBDR8JCF3Phay/0teNm
X-Gm-Gg: ASbGncuarKrXgdVgUVm7PWl7Jb7iQF3zqQgB8QOLM/RQsjYqNIw/JPorY0USxdIHd55
	1HiIH/UnSYIVEuthVCqP9EdCVn/+lSCpxJotu6hLJlk8cOS4mUVsuEhTTvsovHLBrX4uznitKDy
	m0cK/mZWOLv7fEk1aUOAXE2B+IoEXmDS1M/W0gHikBbWv/7gZ2ik3EozjBBechD4igcrp/uAT/2
	xCvKab/G7+KKxi8/KgwbDsKQVzaGptqpSMXuFrkLFKjZ+9hfup+5EgAlVxtmIovJKvCkQlES6KQ
	0HsPCAL882pcX+koST73wxGKcRzZgXmvSQR96RrueIo506K+tTrIExdmgZmkko0V68bk9VLuIb7
	Avwif91u51nOsBBU=
X-Google-Smtp-Source: AGHT+IHoejpqZzdcxb15o9qORclA2awd92JClJvR/ZCPZyDuQip+yhKFOk2EIbxVxD6hNuRNxXHhbQ==
X-Received: by 2002:a05:6000:4305:b0:3a4:dbac:2db6 with SMTP id ffacd0b85a97d-3a572e553e0mr14325235f8f.49.1750278183806;
        Wed, 18 Jun 2025 13:23:03 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm17617951f8f.26.2025.06.18.13.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:23:03 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v3 0/2] spi: spi-qpic-snand: avoid memory corruption
Date: Wed, 18 Jun 2025 22:22:48 +0200
Message-Id: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABggU2gC/4XNQQrCMBCF4auUrB1JU0LVlfcQF2kyaQdMUpMal
 NK7mxaE7lz+A/O9mSWMhIldqplFzJQo+BLNoWJ6UL5HIFOaCS4kl6KB50gaklfegMqBDDh0oEO
 Mr3Eqv9DwWlnVYcexY0UZI1p6bwu3e+mB0hTiZxvM9Xr92fKvnWvgIC1KcTJoW9tde6focdTBs
 dXOYu+d/3uieMJyUzfK6taIvbcsyxct9gZNHgEAAA==
X-Change-ID: 20250523-qpic-snand-avoid-mem-corruption-301afabeb0eb
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Lakshmi Sowjanya D <quic_laksd@quicinc.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132305_803526_E797EB6B 
X-CRM114-Status: GOOD (  15.24  )
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

The 'spi-qpic-nand' driver may cause memory corruption under some
circumstances. The first patch in the series changes the driver to
avoid that, whereas the second adds some sanity checks to the common
QPIC code in order to make detecting such errors easier in the future.

Preferably, the two patches should go along in via the SPI tree.
It is not a strict requirement though, in the case the second patch
gets included separately through the MTD tree it reveals the bug
which is fixed in the first patch.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on top of current spi/for-6.16
  - add 'Acked-by' tag from Miquel to patch 2
  - Link to v2: https://lore.kernel.org/r/20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com

Changes in v2:
  - collect offered tags
  - reduce kernel log spam in commit description of patch 1
  - remove inline error printing function from patch 2, and adjust the
    commit message of the patch
  - Link to v1: https://lore.kernel.org/r/20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com

---
Gabor Juhos (2):
      spi: spi-qpic-snand: reallocate BAM transactions
      mtd: nand: qpic_common: prevent out of bounds access of BAM arrays

 drivers/mtd/nand/qpic_common.c       | 30 ++++++++++++++++++++++++++----
 drivers/spi/spi-qpic-snand.c         | 16 ++++++++++++++++
 include/linux/mtd/nand-qpic-common.h |  8 ++++++++
 3 files changed, 50 insertions(+), 4 deletions(-)
---
base-commit: d57e92dd660014ccac884eda616cafc7b04601e0
change-id: 20250523-qpic-snand-avoid-mem-corruption-301afabeb0eb

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
