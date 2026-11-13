Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91C160A3802
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LePd1oln;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEVOl+AT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V34o9URYVO6Neo8xUfKgUWN7c2N2bpiPhWAdMnkMt2M=; b=LePd1olnxm80WwW6cApl0qeai4
	xuknBRuFVQzuhnkVUhhQJWe3p3vrFcORypsSG7gVXAuFbL3qohqlYslnx/3GgLLiidcDqBbgJ4c+Z
	SPGuWuIoQsCkSIeaEW8qQ7e3SOjdaNvqpQU4RIbX4LhJyaGaz24fZ3vp+OYWacSUyBEwBSuyKOAFN
	RdkNWrt+z19BdUKjNNWXzQQbGv5axvXZY0CPY/Nu0pNnOsUsTrkT1+Di6TjGHYPi1hzWmapboCVsv
	lPuUIHK+Qths8500/RJC4F6Nfc7+vVoGMVk+2ZHuyeOvSjul7TuB2bqd7nwk8CGxAn0J1l2Z1AVg/
	O/kDqysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvnz-0000000DqU7-2VBk;
	Fri, 13 Nov 2026 18:15:19 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvnv-0000000DqRn-1wDo
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:17 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7f84a55cc06so1485749a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593714; x=1795198514; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=npRJKj6BlqdwFJKciGGphf3F65mEV9WXqQjzPBUisy8=;
        b=KEVOl+ATWvDE3cC0rh5DKsz/CyQ9h7qrrEWillx6VWJlU9gchM/hoEet0iziwOW2RA
         g6aXI5J/WduURc4zdFkSBcvW/H4aUkeRXHtukAM3beUd/COc4Dn4MmRQ/EvnMghgM0yv
         D4NfD8fHnE5S+GspZDp3lvOU4Ehjo73W+SyGslKMum8UO8II7OtfXOpK82YydlLJwXMH
         /bqxfJ4lTDA6n+Y4SXY80KNK2t1HNBTvMiA+rio7pby3MK7yQGGD2avuFyHHsZdlyKng
         /bIPxmc7vJs9RhpvDxMRA4deWZJ69AS5ZCDLFKnGy8hE09sp1Itamkgy2XgyXJLRFFJF
         qvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593714; x=1795198514;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=npRJKj6BlqdwFJKciGGphf3F65mEV9WXqQjzPBUisy8=;
        b=lU554yZgun53+XTklgQITN0TXFBGztZj6Tv3RCr/MY1qQHqrJdMRooI7mX+0VJ8+xR
         WFDIYmzviOOKvjFOmCclwrJwhiiuYAxjP6x2tqMiurkZa6KGQ1CVeXU1wDc1AaxwiA+h
         l257bxeaTzeKGBUa/MDDROvYU2T5k8bycWJhNeHL+TCoEXh7xGbuH/YS+JWXmFxpBx2U
         i+ajtqbwjGVD+gH9EB0kaGwRFm1ezaWjK8/mtE9kPqGP8vynl7pqsyExAisWkx6artVJ
         w198uDbOf5sU1+rg+DvbxcDa2K+DvOLirOSnJ/3hI2/8FhmNIIsAhYIWP3Q/Cfwcnl8X
         SI3g==
X-Gm-Message-State: APuU4Z/0Ku/1IhcfFeNau9idWn818vE3kcZESSa7w8hkeE7wNyl6kv9l
	MkHp1ZMlOH2VI8SiV3XgBeka7aEeX7QjR1Bt+LVrlSGks8ptl229rLUN
X-Gm-Gg: AYBFou1BjpsJf/aiMd4PzDv+JXMmkqJbEMkIwYA3dVy+LJmMMOb/zotz2iY5caT9cbg
	y0HRs9xjTTgVUKFVLbAAk3OTI8CwJrdXXsTB22sj7/prTP37IMX8NOubWKVhGDT8MNxoGVPR1I6
	pjmDSJSQeF4mnB3SktB+opZQT52TpRgI5kxSPfjTI+xiVFttfP4xYJGu8MVniUua6+mTJ7dx42J
	c46/BovucEc9Gr38Tc7kvNJQC8+fvlicXyLsEsJW/5fsB3SlNX9tanYVW7ZVVyWkpMkYKXEVn7b
	PKnR3AdzsqeYjIdgmYsg6ugoZ5Hsm1kwX71kvtR8+rx8Nwcu3f0tpnSC8uNtoPZK2LScvNpfdq6
	xMMeEEX2xh6PVVoQdZjCU5x8zhn0lDMBvHW0zdUluOJk9gyukOK8Ad7dukXCAQPKC0Nbxa8lLWN
	wrzxPKNWKEe6Qq/IuBAQRt6XHE1TaeJvxYw9gvR1+fNwlRGuvbMo71u9k4rJuHhrBE5udNh6x2a
	Z0wP4DwBEgSjdjx+RzKMbmnRwWywS9ka59M30kY571Zf3yT7XXFIMr7cmNuUY5DBD47vECIm8Wi
	lFOQkWGFUYg9qwDpmlNzfpdLLBO9ZFLvvaWtGkDjGUH2PQqNbq/R/+3pc61nadOOH6LMEMbo4oz
	6VvKVrBDsLfcceIjr/KM3Zg8FalU5ikcmj0DAm6NojSKA45hPsWOhNl2yFXdUWcuslidfUVGGNR
	sapX3MQ/jkYeCuQu+geOdxKV/ZGAovzslAq/4/dWtLR6ZYk2E06GY=
X-Received: by 2002:a05:6830:230f:b0:85f:aa6:b7f1 with SMTP id 46e09a7af769-862898e6a6cmr2948369a34.23.1794593714124;
        Fri, 13 Nov 2026 10:15:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 00/58] mtd: rawnand: retain chip and controller state
 across removal
Date: Fri, 13 Nov 2026 11:14:16 -0700
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5VUzW6jNwx8lcDnuqAoSpRy6nsUPYh/m69InK3tT
 Vss8u6lvYsi9i3QSYBmhuIM+X138uPmp93jw/fd0d+20/Z6yAv98rDTp3X44vvN8r5DwF4K0P7
 0TV628/64/j6sg+2Pfl7bwW2fj+3Z989b+Hl78f1b2YMQYvOmDrJLwq9Hj+2fq9jvf/y4J9ufr
 ueLws8XR//rW1Zx/vFs93Wd9SlreHxYrchUIWAu0GjOUqtSqdaG8jIsNrlKHVee/1FSO0+1RZb
 QrCTBKBGOZtC4CzayILJbFLA0ZXCiZbMVQ3Bfk3joHGGrNlfuTeEWtcRXA+Q2EcNrm8aoqZwdE
 MVSBEjEGt+iGvOljkIRArWWWmYAEhWM/FNKka4Jrd9VOMVR1sqvlIBWGQh7VSUBqzMw1qKgqbc
 orctG6wCmY/LSWkCcGtiwtTArD5nF/U6L1hXTWjVTZZO2Zip6WNa1uKh1rNHb/b/mnNk3WjRx5
 mttq80qAJ4qalxjleZ3fmGqlzVWxbBCbA0dYhpUbqNXmgVtSHjcogoNthjqw7vSIC5hzMrEoD7
 TgIGWjtx1I10UHz0mDpuadkqgSod0tnVGhtFKCaU7l7UPn9Kb1bVa70UsOwmBmS3TyNy00PC7b
 DhD5FEyqmBU+rpYQUMqRywrPVks4C4b2V5TM9EGwdTcsRPIyDBFleC+sHAgzTtU/kF4SS+zA/e
 oyDpLBqY5yxBBaGlywQtK1sn3+vqSM/34kJVloqpzhkPSdZvC6E1ARzfrjhlmzgDtLtP7tJ3Or
 8d/r5vjrVyH9eeS4M8sicue2EMZxbM7Sjp++/Kytudfs6arzBt+oC7wKWpM6lwTbDByRizuqet
 H6vIp6prU6jkFGXKmYh+p39/f/wM6ZulZWAUAAA==
X-Change-ID: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Yuqiang Sun <izaiahsun@gmail.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-hardening@vger.kernel.org, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>, Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Lucas Stach <dev@lynxeye.de>, Dmitry Osipenko <digetx@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, 
 Shan-Chun Hung <schung@nuvoton.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, 
 linux-renesas-soc@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Liang Yang <liang.yang@amlogic.com>, 
 linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101515_626626_37B124E3 
X-CRM114-Status: GOOD (  16.33  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An MTD handle can outlive controller unbind. Its metadata and NAND locks
must remain valid, including when a writable file closes and calls sync,
while further hardware access must be rejected after disconnection.

This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
("mtd: use refcount to prevent corruption") added MTD reference counting
[0], but retaining an MTD reference does not by itself retain the
driver-owned allocation containing the master. The read/unbind discussion
also covered raw NAND [1] and draining active operations [2]. Tze Yee Ng's
SPI-NOR series addresses the corresponding SPI-NOR paths [3].

Following Greg's review [7], separate class-device data from the MTD
backing allocation. Delete the device's interfaces and drain NVMEM and
class PM callbacks before releasing backing data. Bare device references
retain an independently allocated device, whose type, PM dispatch and
final release are built in even when MTD is modular. NVMEM similarly
disconnects and drains provider and layout callbacks before unregister
returns; retained consumers keep core-owned metadata and receive -ENODEV
on subsequent access.

Introduce opt-in backing-object ownership for MTD masters. Registered
nodes and acquired MTD handles retain the chip, while nested partitions
also retain their parent metadata. Unregister first so removal notifiers
can finish I/O, then disconnect raw NAND and drain admitted operations.
Hardware resources can be released without waiting for open files to close.

Virtual concatenations serialize publication and removal across physical
controllers. Disconnect and drain a published concatenation before any
component can disappear, then release its component references. An old
handle keeps the disconnected virtual device, independently of a later
replacement.

Run NAND and controller-specific cleanup during disconnection, while
the controller driver is still bound. Snapshot the OOB layout in core-owned
data before publication so metadata queries remain valid without driver
callbacks. The NAND core frees retained chip and controller allocations;
the final MTD put never calls back into the controller module. Ordinary
MTD and NVMEM handles retain the NAND core that implements their
operations, rather than the hardware driver.

Share allocation ownership across the raw-NAND drivers, including
partially published probes. Shared controllers remain allocated until
their last retained chip is released. R852 allocates a new chip for each
card, and NDFC allocates controller state per binding.

Based on NAND next at 30daaf3e7897, with Tze Yee Ng's module-reference
ordering fix [4], Karl Mehltretter's OTP cleanup fix [6], and the separately
posted registration, operation-locking and controller probe/teardown fixes
identified by the prerequisite metadata. TLA+ models and their assumptions
and coverage limits are available in [5].

[0] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@intel.com
[1] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc2ZFDqA@mail.gmail.com
[2] https://lore.kernel.org/r/mafs0bjs73tbq.fsf@kernel.org
[3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com
[4] https://lore.kernel.org/r/20261022035352.52129-2-tze.yee.ng@altera.com
[5] https://github.com/jameshilliard/linux-h616-nand-tla
[6] https://lore.kernel.org/r/20260816163027.10044-1-kmehltretter@gmail.com
[7] https://lore.kernel.org/r/2026111037-stir-hermit-cb21@gregkh

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Keep MTD subdirectories behind CONFIG_MTD so boolean child options
  do not become built-in users of a modular MTD core.
- Serialize partition publication with deletion and retain a handle
  while parsing subpartitions. Reject children of removed partitions.
- Distinguish explicit NULL NVMEM owners from the parent-module
  fallback, including OTP providers backed by built-in NAND code.
- Register layout-owned cells explicitly, preserving provider cells
  added before or after a layout binds.
- Rebuild cell attributes across layout bind/unbind, free partial
  allocations on failure and remove attributes before device deletion.
- Pair NVMEM_REMOVE notifications only with successful NVMEM_ADD
  notifications and remove the redundant disconnected-device check.
- Resolve concatenation OOB layouts through the first component's
  master, including partition-backed components.
- Link to v3: https://patch.msgid.link/20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com

Changes in v3:
- Finish NAND and driver cleanup during disconnection, leaving final
  allocation release in the NAND core, following Greg's networking example.
- Snapshot OOB layouts before publication and drain complete BBM/BBT
  updates before releasing their working state.
- Separate MTD class-device allocation and final release from backing-object
  ownership, following Greg's review.
- Drain class PM callbacks under the device lock before detaching backing
  data; keep device-type and PM dispatch storage with the built-in device.
- Drain NVMEM provider and layout callbacks during unregister, retaining
  core-owned metadata for old consumers and retiring cells across rebind.
- Keep NVMEM consumer-owner references, with converted raw NAND
  providers naming the NAND core instead of the controller module.
  Release write-protect GPIOs once provider callbacks are drained.
- Acquire an MTD handle for PTP OCP firmware updates through a class device.
- Drain concatenation operations before releasing components, including
  concurrent removal of masters without opt-in lifetime ownership.
- Use scoped cleanup consistently in Tegra probe and add the introducing
  commits for Socrates and FSL UPM, following Sashiko's review.
- Link to v2: https://patch.msgid.link/20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com

Changes in v2:
- Keep the MTD device callback owner pinned through callback return,
  with the final module put performed by the device core.
- Retain virtual-concat components across removal and rebind, serialize
  staging/publication and unwind incomplete partition registrations.
- Balance Tegra's probe-time child-node reference separately from the
  reference retained for the chip lifetime.
- Refresh the prerequisite stack to the separately posted fixes, using
  the latest QCOM child-probe revision.
- Keep the lifetime changes on top of those fixes: preserve QCOM scan
  before publication, R852 per-card initialization and Intel probe
  hardware shutdown.
- Fold Macronix disconnection handling into the NAND disconnect patch;
  its operation locking is supplied by the posted prerequisite.
- Use Karl Mehltretter's posted OTP cleanup fix as a prerequisite in
  place of the duplicate preparatory patch.
- Keep the NVMEM context callback module pinned until its final callback
  returns, independently of the provider's consumer owner.
- Use the posted fixes for dynamic partition publication and partition-node
  ownership. Keep master get/put accounting independent of
  later master registration in the MTD ownership patch.
- Propagate disconnection through BBT error recovery without marking
  the eraseblock bad.
- Make suspend of a disconnected, retained NAND device a no-op.
- Handle R852 card events during removal while preventing new work from
  being queued.
- Initialize Denali and Atmel cleanup variables at allocation and add
  the introducing-commit trailers for Orion and MPC5121.
- Link to v1: https://patch.msgid.link/20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org

---
James Hilliard (58):
      nvmem: disconnect provider callbacks before unregister returns
      mtd: acquire an MTD handle from a referenced class device
      mtd: separate class devices from retained backing objects
      mtd: retain virtual concatenations across component removal
      mtd: rawnand: separate hardware disconnection from cleanup
      mtd: rawnand: share retained chip and controller ownership
      mtd: rawnand: sunxi: retain chip state until the final MTD put
      mtd: rawnand: plat_nand: retain open-handle state on removal
      mtd: rawnand: gpio: retain open-handle state on removal
      mtd: rawnand: stm32_fmc2: retain open-handle state on removal
      mtd: rawnand: denali: retain chips across controller removal
      mtd: rawnand: arasan: retain chips across controller removal
      mtd: rawnand: mxic: retain open-handle state on removal
      mtd: rawnand: intel: retain open-handle state on removal
      mtd: rawnand: tegra: retain open-handle state on removal
      mtd: rawnand: mtk: retain chips across controller removal
      mtd: rawnand: rockchip: retain chips across controller removal
      mtd: rawnand: atmel: retain chips across controller removal
      mtd: rawnand: orion: retain open-handle state on removal
      mtd: rawnand: socrates: retain open-handle state on removal
      mtd: rawnand: fsl_upm: retain open-handle state on removal
      mtd: rawnand: pasemi: retain open-handle state on removal
      mtd: rawnand: ams-delta: retain open-handle state on removal
      mtd: rawnand: xway: retain open-handle state on removal
      mtd: rawnand: hisi504: retain open-handle state on removal
      mtd: rawnand: vf610: retain open-handle state on removal
      mtd: rawnand: technologic: retain open-handle state on removal
      mtd: rawnand: loongson: retain open-handle state on removal
      mtd: rawnand: ma35d1: retain open-handle state on removal
      mtd: rawnand: pl35x: retain open-handle state on removal
      mtd: rawnand: mxc: retain open-handle state on removal
      mtd: rawnand: fsmc: retain open-handle state on removal
      mtd: rawnand: gpmi: retain open-handle state on removal
      mtd: rawnand: omap2: retain open-handle state on removal
      mtd: rawnand: marvell: retain open-handle state on removal
      mtd: rawnand: renesas: retain open-handle state on removal
      mtd: rawnand: meson: retain open-handle state on removal
      mtd: rawnand: cadence: retain open-handle state on removal
      mtd: rawnand: qcom: retain open-handle state on removal
      mtd: rawnand: cafe: retain open-handle state on removal
      mtd: rawnand: brcmnand: retain open-handle state on removal
      mtd: rawnand: au1550nd: retain chip state across removal
      mtd: rawnand: sharpsl: retain chip state across removal
      mtd: rawnand: davinci: retain chip state across removal
      mtd: rawnand: sh_flctl: retain chip state across removal
      mtd: rawnand: lpc32xx_slc: retain chip state across removal
      mtd: rawnand: lpc32xx_mlc: retain chip state across removal
      mtd: rawnand: ndfc: retain chip state across removal
      mtd: rawnand: txx9ndfmc: retain chip state across removal
      mtd: rawnand: ingenic: retain chip state across removal
      mtd: rawnand: mpc5121: retain chip state across removal
      mtd: rawnand: bcm47xxnflash: retain chip state across removal
      mtd: rawnand: fsl_elbc: retain chip state across removal
      mtd: rawnand: fsl_ifc: retain chip state across removal
      mtd: rawnand: r852: retain chip state across removal
      mtd: rawnand: nandsim: retain chip state across removal
      mtd: rawnand: cs553x: retain chip state across removal
      mtd: rawnand: diskonchip: retain chip state across removal

 drivers/Makefile                                   |   2 +-
 drivers/media/pci/cobalt/cobalt-flash.c            |   2 +-
 drivers/mtd/Kconfig                                |   5 +
 drivers/mtd/Makefile                               |   5 +-
 drivers/mtd/devices/bcm47xxsflash.c                |   2 +-
 drivers/mtd/devices/docg3.c                        |   4 +-
 drivers/mtd/devices/mchp23k256.c                   |   2 +-
 drivers/mtd/devices/mchp48l640.c                   |   2 +-
 drivers/mtd/devices/mtd_dataflash.c                |   2 +-
 drivers/mtd/devices/mtd_intel_dg.c                 |  30 +-
 drivers/mtd/devices/powernv_flash.c                |   4 +-
 drivers/mtd/devices/spear_smi.c                    |   2 +-
 drivers/mtd/devices/sst25l.c                       |   2 +-
 drivers/mtd/devices/st_spi_fsm.c                   |   8 +-
 drivers/mtd/hyperbus/hyperbus-core.c               |   2 +-
 drivers/mtd/lpddr/lpddr2_nvm.c                     |   2 +-
 drivers/mtd/maps/lantiq-flash.c                    |   2 +-
 drivers/mtd/maps/physmap-core.c                    |   2 +-
 drivers/mtd/maps/plat-ram.c                        |   2 +-
 drivers/mtd/maps/pxa2xx-flash.c                    |   2 +-
 drivers/mtd/maps/sa1100-flash.c                    |   2 +-
 drivers/mtd/maps/vmu-flash.c                       |   2 +-
 drivers/mtd/mtd_blkdevs.c                          |   2 +-
 drivers/mtd/mtd_virt_concat.c                      | 526 +++++++++++----------
 drivers/mtd/mtdconcat.c                            | 103 +++-
 drivers/mtd/mtdcore.c                              | 306 +++++++-----
 drivers/mtd/mtdcore.h                              |   5 +
 drivers/mtd/mtddevice.c                            |  59 +++
 drivers/mtd/mtddevice.h                            |  12 +
 drivers/mtd/mtdpart.c                              |  61 ++-
 drivers/mtd/mtdpstore.c                            |  50 +-
 drivers/mtd/nand/ecc.c                             |   3 +-
 drivers/mtd/nand/onenand/generic.c                 |   2 +-
 drivers/mtd/nand/onenand/onenand_omap2.c           |   2 +-
 drivers/mtd/nand/onenand/onenand_samsung.c         |   2 +-
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/ams-delta.c                   |  28 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c      |  49 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  44 +-
 drivers/mtd/nand/raw/au1550nd.c                    |  23 +-
 drivers/mtd/nand/raw/bcm47xxnflash/main.c          |  18 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |  65 ++-
 drivers/mtd/nand/raw/cadence-nand-controller.c     |  51 +-
 drivers/mtd/nand/raw/cafe_nand.c                   |  27 +-
 drivers/mtd/nand/raw/cs553x_nand.c                 |  44 +-
 drivers/mtd/nand/raw/davinci_nand.c                |  26 +-
 drivers/mtd/nand/raw/denali.c                      |  28 +-
 drivers/mtd/nand/raw/denali_dt.c                   |  13 +-
 drivers/mtd/nand/raw/denali_pci.c                  |   9 +-
 drivers/mtd/nand/raw/diskonchip.c                  |  17 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |  56 ++-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |  48 +-
 drivers/mtd/nand/raw/fsl_upm.c                     |  20 +-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  19 +-
 drivers/mtd/nand/raw/gpio.c                        |  18 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |  19 +-
 drivers/mtd/nand/raw/hisi504_nand.c                |  20 +-
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c    |  41 +-
 drivers/mtd/nand/raw/intel-nand-controller.c       |  20 +-
 drivers/mtd/nand/raw/internals.h                   |   2 +-
 drivers/mtd/nand/raw/loongson-nand-controller.c    |  21 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |  38 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |  40 +-
 drivers/mtd/nand/raw/marvell_nand.c                |  46 +-
 drivers/mtd/nand/raw/meson_nand.c                  |  49 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c                 |  26 +-
 drivers/mtd/nand/raw/mtk_nand.c                    |  40 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |  23 +-
 drivers/mtd/nand/raw/mxic_nand.c                   |  23 +-
 drivers/mtd/nand/raw/nand_base.c                   | 103 +++-
 drivers/mtd/nand/raw/nand_bbt.c                    |  24 +-
 drivers/mtd/nand/raw/nand_lifetime.c               | 246 ++++++++++
 drivers/mtd/nand/raw/nand_macronix.c               |   8 +-
 drivers/mtd/nand/raw/nand_onfi.c                   |   4 +-
 drivers/mtd/nand/raw/nandsim.c                     |  21 +-
 drivers/mtd/nand/raw/ndfc.c                        |  34 +-
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  |  42 +-
 drivers/mtd/nand/raw/omap2.c                       |  27 +-
 drivers/mtd/nand/raw/orion_nand.c                  |  24 +-
 drivers/mtd/nand/raw/pasemi_nand.c                 |  22 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c       |  38 +-
 drivers/mtd/nand/raw/plat_nand.c                   |  20 +-
 drivers/mtd/nand/raw/qcom_nandc.c                  |  39 +-
 drivers/mtd/nand/raw/r852.c                        | 111 +++--
 drivers/mtd/nand/raw/r852.h                        |   1 +
 drivers/mtd/nand/raw/renesas-nand-controller.c     |  37 +-
 drivers/mtd/nand/raw/rockchip-nand-controller.c    |  45 +-
 drivers/mtd/nand/raw/sh_flctl.c                    |  22 +-
 drivers/mtd/nand/raw/sharpsl.c                     |  22 +-
 drivers/mtd/nand/raw/sm_common.c                   |  15 +-
 drivers/mtd/nand/raw/sm_common.h                   |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c               |  19 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             |  19 +-
 drivers/mtd/nand/raw/sunxi_nand.c                  |  46 +-
 drivers/mtd/nand/raw/technologic-nand-controller.c |  22 +-
 drivers/mtd/nand/raw/tegra_nand.c                  |  27 +-
 drivers/mtd/nand/raw/txx9ndfmc.c                   |  41 +-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  20 +-
 drivers/mtd/nand/raw/xway_nand.c                   |  24 +-
 drivers/mtd/nand/spi/core.c                        |   2 +-
 drivers/mtd/nand/spi/esmt.c                        |   2 +-
 drivers/mtd/nand/spi/micron.c                      |   4 +-
 drivers/mtd/nand/spi/otp.c                         |   2 +-
 drivers/mtd/spi-nor/core.c                         |   2 +-
 drivers/mtd/ubi/build.c                            |   2 +-
 drivers/nvmem/Kconfig                              |   1 +
 drivers/nvmem/core.c                               | 463 ++++++++++++------
 drivers/nvmem/internals.h                          |  16 +-
 drivers/nvmem/layouts.c                            |   2 +
 drivers/nvmem/layouts/fixed-layout.c               |   2 +-
 drivers/nvmem/layouts/onie-tlv.c                   |  20 +-
 drivers/nvmem/layouts/sl28vpd.c                    |   3 +-
 drivers/nvmem/layouts/u-boot-env.c                 |  25 +-
 drivers/ptp/ptp_ocp.c                              |   7 +-
 include/linux/mtd/concat.h                         |  22 +-
 include/linux/mtd/mtd.h                            |  21 +-
 include/linux/mtd/rawnand.h                        |  37 +-
 include/linux/nvmem-provider.h                     |  16 +-
 118 files changed, 2744 insertions(+), 1263 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261104-submit-rawnand-retained-handle-lifetime-v1-0b4225e5ce0b
prerequisite-patch-id: a51b9cb4077105499133c413d58c7ad21d973b38
prerequisite-patch-id: b3679cda4dcb45ce7712bffe2dd0576b254df44d
prerequisite-patch-id: 07b5c70e44ad951d20eea9478c98fda35ec765c0
prerequisite-patch-id: abea50275922fe359d72ca4de5cbc211b04bbd57
prerequisite-patch-id: 57776b214ffb0331319f024412f21d35e4ca9056
prerequisite-patch-id: 09be2baaffe1f053704263cc4b0d39f2faa4f49c
prerequisite-patch-id: c3ad85600dc897ac310be450d8daa2275fb91ee6
prerequisite-patch-id: 4a85600553ddcc7db5a9537efd905a71cd623f65
prerequisite-patch-id: 579990ee4a49297efc5a593b00efb9cd73fa15e8
prerequisite-patch-id: 2ee61a8a32fd147d52e0f9d03758634912d8bfef
prerequisite-patch-id: 1487df8ce8e6c48471fd77c7470ce9de582dfe3c
prerequisite-patch-id: 5ecbe86f928d9c5c0bf2cb6065c5672708511fc4
prerequisite-patch-id: ac68e9b65d3aa5661bd7ac0f2e77dcf5c75fcfe0
prerequisite-patch-id: e70f0f0c4d430d416a3ad848b37ffad16bd7df07
prerequisite-patch-id: 05adcddbc50f745ee2640b8c21f3bf76a217f249
prerequisite-patch-id: 0b60b7ab6196076f327c919be5e7b8bb2051ee12

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
