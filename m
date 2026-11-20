Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F960A5BC4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWAfae/b;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBZ9c6wF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8Km/PsbXIrtHfq46QI/EvXYoe/GUhQ2zuES39raEnbo=; b=pWAfae/b2mJAvEjOVvNjcQHGdg
	nKXbojUC6XJWhDAUd3dwkUBVSHO+3WfZ47Kd17T+0AI1tippaLT+5wYzURdO/wTppIeGteT6ROaRC
	wbcWNIjuc0cOyOYgyPmCkAEK2p4tu0bTzCdOgXFdGopos2FZh4LvW9XkULiAw8VgPXrZ3bxn8SifY
	lOir9D2g/SYsXSolU9Kji9keeILPk/CY7BCIKVeGOVkLy0spYLOIYAIAPs8Asvco7FOceOgFdbocl
	zWoQ7EJdnIOtcZJCHT/W3ULrNBUj58Zvy/vSW4EbuYR2H+JUGkDrWCA3S/3qMMxiLWPekB4QciWvd
	O7lyCbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuf-0000000GBuL-0vJf;
	Fri, 20 Nov 2026 20:08:49 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuU-0000000GBpx-2wdz
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:41 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-8631e07b756so483102a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205317; x=1795810117; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uty8O3I7yR64QshHJyAi1i32cYAjS3ISDg9jbL0g2qc=;
        b=pBZ9c6wFVLnq7TRYec+j+Dlm9rLdmDsy5mcYHrUhxrDVaU84UnR8RSmrs9tfiudT3n
         Y/YwQeaj0zcRh7/a5D3PK4SNdvqwPABJev3/t2RODLi4LS0AWMs/op+yLH0kvK77eLQ8
         xBokdHnjh/K4dXWIFIt2oTl6/ZDcJeZmqS0pLF5ZQX73i1MC3JroSJUbqOAX+hGqEn4Q
         8uANmNh08hvVKB9RDkKXupRw6iNanojXTu61cB3+W/dgpbtZQTgT1aHFxsYSA+HsP3H9
         AAkZN3c2wGwqPjxxc12fEy5+6eaWcVqh0NvYCa75TEjih+9PmPECttzjffd7pCF8gUoM
         WhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205317; x=1795810117;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uty8O3I7yR64QshHJyAi1i32cYAjS3ISDg9jbL0g2qc=;
        b=u//1/0fhjTwCoSMNb2VD4LJJfSiZr4KYnbAWsuUJomMrUb8aryytOcZN2/kIixCXcm
         5XeUS6mIzGpsfyyD3hIXa7HNO3HjmMMgMo2WtTaxY6mqO3/JRwW8DhCxhpxWk4FqcnaM
         L/3yvWY/pdpJhLq3T/mMx72N0HEs8vwfvZ/wtciP78svPAwR0muNQWrjhOdsGjgcVM/d
         lympLYjDaZaWLoNAf8/7jQKaQpxqxLWVkKvI87/V4yZnrJGUiyldypCx/0so1i5yof5H
         W2pX0KwDRpU8ABJgJQYIkZ/E9e4B//yqRv0wFraqGTEUYzaSsKeR4V620yJiLN9d+XCx
         BnGg==
X-Forwarded-Encrypted: i=1; AL+hErEzUTIm7/XHGM5LgzDyeyMjZFAV4h53pcrNZtsdXdNJoSuXhc5tNtqyDgrtbApkIAFmhKqOWJ176tg=@lists.infradead.org
X-Gm-Message-State: APuU4Z+xWFbvSxyPEYVBID2u7E6TxH0hI3Vaqh/sdhST2FDTmZchO0Ex
	/b6XPfN/v+jPuFbVhmZSJO5QzoHYUkZvOnIv4bOVULwf4gFi1eiOeGPt
X-Gm-Gg: AYBFou1q/FwmqC31cZGxk//gPwq/HLAcqjLBnmkKZSstIc01OWDeo78fmneMGIdOm+d
	TmOLZlmqIboLFqNoFd3QOqIxYi5BrF3tLrZV2svGHHjrXa3/xzF368MVuIq7UnvRMbqQke0quko
	+vgzB8wPGzFDUR1I7YLnNYzWWEVjnlf9KfND6yHMVCH+6q6aKee2sqArqSg1SoPiSSmEwkpBqcc
	vmyq0Q80lfKWxMqkt74xDjo2Cu/m0c74Tviol/wxqj+F/eqmQNOKUqwshJGTTzz8jhmMjIsxmAp
	5DkSj1KvdSLUwp4SOsf5FOGIMG49zWw637yRNCDCk2KKbQsx+DUzcYvf+KDTyDYgy3eHcwupUHs
	n0/pfAx29KL1F+coDfI+qYA8aGQHfzLrFTcNGfyiQ4U8LboHV41S2fOtWMP5biI+ikqZdAtnKd+
	ks4ZDbmVpBJVqG9+IoZ8O7LZvi+9HrNZWrfcNnjaBgJg/BX3aVTtEx9GCL9pZzPIk5qUgUCnlm+
	3p8Z6hP/enFl57202LRtkz10rXV9VBe2SA9rRlMNVJIf0lxFYLyg+7YInEnrVH70AlDvv8rU4sS
	WCdNZDibcXxFc61+g0MAGzsw6xvG+wkofFbyh1yflZnfjorOjG7tMEJhc9gs0K8g8msO18DClyl
	bwF/s0mD7/CJyQN6UlaTJk7uvebaCZh0//4+Go/TXtM2b13V3l64cbccQYCuQO3+cX43ErsIKSe
	pgfC8dHsJyDzuzPF3c+quzLwUiCp8Z9WufulIsfA==
X-Received: by 2002:a05:6830:640e:b0:861:5a01:b30a with SMTP id 46e09a7af769-86315aabdecmr5184841a34.27.1795205317253;
        Fri, 20 Nov 2026 12:08:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 00/11] nvmem: complete provider and layout disconnection
Date: Fri, 20 Nov 2026 13:08:30 -0700
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQwW6EMAxEfwXl3JBN6LYsp/5H1QMJDuuWJKwTE
 NWKf2+AHvbYSr6MPHrj8Z1FIITImuLOCGaMGHwW1VPBzLX1PXDssmbqpF6klK88Ttph4n524Ph
 IYcYOiA9oIaEDPktutdJVJy/KmpZlzkhgcdkz3j8OnSGfYNIG/nUQ3KYcng4b020EngigKa4pj
 bERosdUfgF5GMpAvRgnLaJxYkA/LeJYbB4RCT2K/b4y68IG4h6WxLbsK8YU6HuvO8s96h/N8px
 4ZazunutaKn1+612LQ2mC2+mzeiRe/kJUmVjnR1VgzlbW5pG4rusPfOc0UaABAAA=
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
X-CRM114-CacheID: sfid-20261120_120839_143910_57311364 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
Changes in v3:
- Correct the Fixes tag in patch 4 to point to the commit that
  disconnected provider writes but kept the write-protect GPIO held.
- Link to v2: https://patch.msgid.link/20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com

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
