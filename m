Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9F060A3815
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YYgwwG2d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XnrPpPG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nJr6MvkgxTQH5iENUCJTS4bVB8psMVLIBCeSvpLzSGc=; b=YYgwwG2dwwFDWpZm1jWNVNIYAD
	2bCjpadut12hAxvsnUco8NekwOa6+BN3gEyE1KU+kfu3cNrtl+9m8et9vasnM737Ghidpkibfgbxq
	BAjwp2O2t9lGRS3x36kmQTXsZf1SN+2dPwR5ufIHzvLqmr1SHYjJCUVwRrGiIpcHo2HDe54+Txqrd
	uK5BjDHKAm2/oPl1mDKg1KsPIinSNBU1Qo3JmXe71mPhrALkkJVBadqi8aq1HdmO+GelkoOTzXcLk
	mqjIR0XCWjxMfizgoxOgUrFU6T928aBu2g990oAAy+DBuggbusM0KtkYz92NNXmiQOHM8gKkw93PK
	dWOzf9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DU-0000000CgpF-2ETR;
	Thu, 19 Nov 2026 16:42:32 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DR-0000000Cgo7-2ohw
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:31 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6ddef424972so2063606eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106548; x=1795711348; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KUBWs7gHzAoDsOIKeMKkrUFWN0tyJdvUWhYfBTyuJvo=;
        b=0XnrPpPGKEMgW86tvfj+M6Uh4jRpSmqku2Huk6AYFCsOb50Bp6z8C7EFZA0+k8W/AZ
         uT12oSrnMIxVb8z/F1iNF3AriwGo7VBgMhi5PImZnvgHIAm45w4/AcL3emwj3oDFkaIi
         cPEVemTvzFEoIo0w3HssjpajaMI1dl1qg+dnl6uBZnPhwptU6hbCc1Slox9Fj5rtpOiv
         miTnLFir0PpRzuDDtkcKYVIZ7dfVN8d/9SFYrexFm3cq/V8K+xW7ixaOCpVxvFKby0py
         GXAuigFScucvsQNT8ckT7fcYob7IPBTk/jx83p8La1G8C07a5HjtZW0Rglc0SLZlPdim
         uX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106548; x=1795711348;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KUBWs7gHzAoDsOIKeMKkrUFWN0tyJdvUWhYfBTyuJvo=;
        b=N8BZuX2ha42CZhwF0tnpfHIUWpiayt0NTdp5BWhZVYEwzXIu14jXOXmV9auCHz733X
         4s7vjIVtf1D1JydTIuFt6SUNWcP/Aiig6H4BZ5JP0r4d8iZBi0ESQUhaRu6JW+oYsTvO
         TZD2YUk2lEB8ZzFLVqXkp9+heg36mmnaNcssNFT31K26LGY1eWxex7FiMQCsSAN2s2jE
         I+XsoSo7eV0wtK9xNX+0a+AdaIyc7f00gYxeUaIGI+R15FF+W4u5IlBvSqpOhfHngx+S
         RtCX1gz6+i3WYpMxtC8lSo4/Bv++5f4lfXa9qrUk3EBgTwsbiiaiAUrWbupYbAiRs7MX
         xBjw==
X-Forwarded-Encrypted: i=1; AL+hErE7tYBzBRR/Oc7/kE0cnKqm9Ip80gnN3WOAet8TuPq5l29CgMc2+OuSCgTm6xj46zL1gil1/cRyteg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9R1/21hf4zCJgDnoHzXajlbYTXrOXnZbLllUt5JYzb5echvpY+
	Hit+aWEN74sJgrFlPQktHZi1pitKKV/KQfTV8BFcg7iZiFQ5j8g6cLWi4gcn1A==
X-Gm-Gg: AYBFou2QoCqZ1s5On+hA4MZZ+029MwIXnqxE90B6Dr65PzLy+HssFjMPKOIiX/xbkoM
	txETmICaeAPjbzeIjP73AWiwHw/iHcQvVNB7jm6oWWJr46S1etVil8mGjX7iTRSE8w47AJcqUZn
	BfZKCPXGP9j5CaQRQZvAbSZEog4PbwDgfU6/IrTBGFH+MPAiguquXxdRYVuYfRJUCvV/4FDAXzT
	ZpjFUCEgu8tLvL6Mk06OcVi+wRPIn3gUV6IsSVjNGszn/QuE/7sD9vV/Fm8ihGTzFn4crgwoOkF
	X8KyACc2UuEQr12YT1mKSHhqlzfDJG7lnnEJAI7m2pOTfV7lvs+U7kRZ4Ck7dvDLYBbjTPG0/J7
	JdIDqC6GSN6nPot3tv1oTIxZm6ShaEmRtX3skMmq+9KDcSZw7mfjs68BDOAKtyVZMYFBbTwS5kk
	gA/f4RyIkmEGHYLlkjFfg7azwrUbc7tcr6ELkEU/u6mo0l91GMbW6PYs/dI2LxDfiygskQLPsLi
	vbS26VbF6O+YFeMgzmakwDZ5N1Kb+v6dasMMb2OEv4s8r7EFxkDce9lfS7E4LIrFriFlbxoKCzK
	PBc6WWi+xJJ/GfZSFjm+g88f9N2sqCBQ2rdJWrTv0dtzvIE4STxcX1bWx18/M9k0lgiDTVeuz23
	8nN73Y57FyDJqGRc05U1oeHjxZMbpODPnQm4JyUwHS1doTPeZ5DK8xDvpFawdS+mUU1FZdta5C2
	9aFk5NY9RMPso9m/TKEN6mNmNQiwzSRLPNzT9uryPhowldWEGlll8=
X-Received: by 2002:a05:6820:8916:b0:716:dafc:55c4 with SMTP id 006d021491bc7-71b39510140mr88553eaf.56.1795106548440;
        Thu, 19 Nov 2026 08:42:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 00/11] nvmem: complete provider and layout disconnection
Date: Thu, 19 Nov 2026 09:41:58 -0700
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WPTW6DMBBGr4K8rnHs9Cdh1XtEWWAzhmmxTcfGI
 oq4ew30ApVm8zSfvjfzZBEIIbKmejKCjBGDL6BeKmaG1vfAsSvM1Em9Syk/eJy1w8R9duD4RCF
 jB8RHtJDQAc+SW630uZNXZU3LSs9EYHHZHbf7waXkC0zaiv8SBD9zkacjxnQbgScCaKohpSk2Q
 vSY6m8gD2MdqBfTrEU0Tozo50Uciy0jIqFHsd9XF65sIO5hSWxzDxhToMf+bpa76h+flTnxs7G
 6e71cpNJvn71rcaxNcOy+rusvljIqdE4BAAA=
X-Change-ID: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084229_746476_FE524466 
X-CRM114-Status: UNSURE (   9.54  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NVMEM unregister already disconnects register callbacks with SRCU. Some
accesses extend beyond those callbacks: keepout traversal, cell
post-processing, DT fixups and device matching can still use provider
state. Layout unbind also leaves its cells and their callbacks available
to retained consumers.

Extend the existing drain to those accesses, and retire layout-owned
cells independently of provider cells. Old handles retain core-owned
metadata and reject further access. Explicit cell references and sysfs
group ownership make layout removal and rebind independent of existing
consumers. Release the write-protect GPIO when callbacks are drained so
a retained consumer does not prevent provider reprobe.

The final patch lets providers distinguish an explicit NULL module owner
from the parent-driver fallback, for callbacks implemented by built-in
subsystem code.

This separates the NVMEM work previously included in the raw NAND
retained-handle series [0], following Paul's request for smaller patches
[1]. It builds on the NVMEM for-next tree at 6628e7d4c6b, including the
existing SRCU protection and device-reference ownership.

[0] https://lore.kernel.org/r/20261115-submit-rawnand-retained-handle-lifetime-v1-v5-1-cbc49c5c5e74@gmail.com/
[1] https://lore.kernel.org/r/9c247830067d2192acfe08080d1c5f2bb366cf1a.camel@crapouillou.net/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Use one SRCU read-side section per register or cell access, including
  keepout traversal, partial-byte writes and cell post-processing.
- Use device_set_of_node_from_dev() when inheriting the provider's OF
  node, following Bartosz's review.
- Use an SRCU notifier chain so listeners can register another provider
  while a cell notification is in progress.
- Check cell publication against disconnection under the list lock and
  drain cell-add notifications before reporting provider removal.
- Simplify error unwinding in sysfs cell creation and layout registration.
- Link to v1: https://patch.msgid.link/20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com

---
James Hilliard (11):
      nvmem: retain the provider node until device release
      nvmem: drain keepout and cell post-processing accesses
      nvmem: exclude disconnected providers from callback admission
      nvmem: release write protection when the provider disconnects
      nvmem: reference cell entries independently of their provider list
      nvmem: manage cell attributes independently of device resources
      nvmem: distinguish layout cells from provider cells
      nvmem: disconnect cells before removing their layout
      nvmem: disconnect published devices before registration rollback
      nvmem: u-boot-env: propagate cell registration errors
      nvmem: allow providers to specify an explicit NULL owner

 drivers/nvmem/core.c                 | 545 ++++++++++++++++++++++-------------
 drivers/nvmem/internals.h            |   4 +
 drivers/nvmem/layouts.c              |   2 +
 drivers/nvmem/layouts/fixed-layout.c |   2 +-
 drivers/nvmem/layouts/onie-tlv.c     |  19 +-
 drivers/nvmem/layouts/sl28vpd.c      |   2 +-
 drivers/nvmem/layouts/u-boot-env.c   |  25 +-
 include/linux/nvmem-provider.h       |  16 +-
 8 files changed, 401 insertions(+), 214 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
change-id: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
