Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13BA606A89E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=185dfZp7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoRajZVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=crnhgDAMT7e/c3t/oH75R8xodd39eCcFaG9rr+BAT40=; b=185dfZp7TWrG6a4es/Yxdt23Er
	+9Annex4pGwgDTV5YwjVfLXfceJ/CwVMKeWHPp1FDI3UsJ9Iuew9xWRGxlqxrR6mFLKN/HAgQEwGD
	8izDd/LxICa5EwX4zB6YFg6LHZIsh8z9QAxyiLWZuO1nWrIif6+2wnA/oqx2fqiwN18EyPnougOeg
	5NNPJMwQzA710dgmOTs1x9p5QZJqH2aMFGtosrfCx8txB/XVYckanKtbBNOCRbaoXwyOaR2Kg4LQP
	8552g4I4TRM6+MIA5JwJwhSTeGSJRj5m8T14RsAyCZZi+niPWwlJrWedNuhstksi7/rJYn5PzVJxX
	ihkprf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0f-00000006vDw-09Ke;
	Tue, 17 Nov 2026 19:38:29 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0b-00000006vCl-3gwi
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:27 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-71ad099391dso117083eaf.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944304; x=1795549104; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m51bps/KpxA6Kr+kAwjiotkCQAl0xbHrJDx13A2RW/M=;
        b=JoRajZVLW9xetDXjt5UVh6ZvhBXOKarv+BxlMDffTNdp7MDZsuKIDy4+Ug+17I3ATU
         JKTibq6IaXXXjMtZMmYpGOO5Kc6XGTO1qDgt5yeX3hx2teJdSPBmE1NQPOchPnjZUtaM
         iLMLrtNvxVK22Uh7h2brcNNz0yW0H+P++ViBcaRZIRAdEz2gU77rLVq9XNaJUBsjlbzv
         5XbnHNnL6xSWwnhB8ogkFNcjRdG04LADNN/fwqM0dSkBVCP7J5N3gKBGZvNQd2Ys2ldM
         dr5qEGs7R2hAP3JP1IWZJOh8BAMGMFRPDPsVKOrkZYsYcTA1kFnPXmkbAQfC4yfxDpRg
         /WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944304; x=1795549104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m51bps/KpxA6Kr+kAwjiotkCQAl0xbHrJDx13A2RW/M=;
        b=fiaiCS7ZY6Rk4SnbT16sNeGDAjwZyeXQ5GOdSl0I3so7yeZoK6LxZHIPZ7YB/miMmR
         3mpAxHg4wUu4aHMKqgtzAmNZrd7TOQgvLUcr4Y0PrP+qwai3EjgvyrJABdky7+nPBJBG
         OabqgW93d7Soff63+Ta5oa3aNZooOO4CpPSAcr4VcO9Hy15BMtG9Z5YiGODqMIt2aF4q
         7hVAyyNoiLcvOiu30aMJndkJoxqvGqZPGYuGftU6+EzedpJcTPM308yLsK6MdpmEtOPM
         2uTGQoM8HxxZamjr5KEaFpPpQ8VPkjudREtorCbNyrCtgnunD2qRpiu4wvFOUhd/Nvwe
         FgyQ==
X-Forwarded-Encrypted: i=1; AL+hErGaJ+0o7BGK8YwBpkp2mtWdfsir3V9XdrQDH0on4+pikk8dFs3zrM56P8oSsMBh/bb9ztQkf/yuyOU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+LsF5eW+5sIBqaS3wOCxCT76LGBymXppfWYQEjygaeI7J6Qova
	tVAE8gH0tmhIHUpqX3Oy59c3wu7mnyXil91dr2rzDUPBSQrnjEQBt3og
X-Gm-Gg: AYBFou1ONpfVXIMWzzo3OHU0fRJNND9ZOQxW7/zeXe34y5yLtMSvv+zDCet0kmdd5DQ
	v2jvywPviOS33FbKOsjP45ElAorMMdN22o7n5kwJBhZHe1y66tgNDSYTFLkXCCSi2EddbuairQA
	VjftU2atn++8kJbXagDfHlYuftn8tER8y6q5DDSP4j9KyYBpyLexwzpRUBZO9L4jwZ1PfjBdo/T
	+iCtU6mquj3ktqzvhGEnvbyhmT0zVnPjgdQMjEjd693rh+oghDNptjU6pFOwlJlrPchdaR9r2ek
	Fm6cdnLPhX1jGtKQ/kPtbhBUzVx8FqN3q0cty0jmgWiHRP7G247YmCyakEnu754jAhVB3fZjQ53
	/l6Pxq20MhSOUYH9U9FBoJKYyXlSFukzVv5p/x+fM478v60inWwPlodIDho35ADHJzq3XlQXdBN
	GAgQL2CzfaWceFdklGQc/WqbSwhFC9kkN/8DExa8gEyBP47rtO7Lnc/7EPsWdYWd9RxdVeQ9OJg
	Tn95NN4SGn4XXvwepC/Nde2aUQW0fo66CFsxusWu6eofvlvMn1HkwIgESv9N9tna9GjTBaXPN33
	GdsxZHJH41uceYv/xsF8Njs4LP59Hj44S6vT6zfeyWYLLeWg6/tR3hubEWmEJHo32ZAi8j7ciWQ
	1+9/rXhTWX+sVpPFLttwZAiHTw9yExo99nX4KWnSi1wsmahf1Un+cI6ke7L6VEQI9fMH52Rnkc4
	hXiZFT5fWJ45cEwP6PGwtn7Tiflnw8jX+S1M93UtMGQ84PNQjNW3gOzoQALm/yFKdlJo1yfHNs
X-Received: by 2002:a05:6820:83d1:20b0:71a:f0dc:eca with SMTP id 006d021491bc7-71b18517f47mr215592eaf.40.1794944304317;
        Tue, 17 Nov 2026 11:38:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 00/11] nvmem: complete provider and layout disconnection
Date: Tue, 17 Nov 2026 12:38:07 -0700
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OQW6DMBBFr4K8zuCYSq3CVaIsMHyTabGh4wEhR
 bl7ndDl0zy9Pw+TIYxs2uphBBtnnlMBd6pMf+/SCOKhsGnOzadz7ovy6iMrpS0i0iLzxgOEJg5
 QjqDNUfCN/xjcpQl9Z0pnEQTe3xvX28El8o1eX+F/Q/C7lnE9NOO7DFIB2uquuuTW2pG1/oEkT
 PUso11Wb3Mf7cRp3e1xeDk2Cye27//qwlWYhRJ2Nbfn8w+LaNKD7wAAAA==
X-Change-ID: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_113825_934666_27E852CC 
X-CRM114-Status: UNSURE (   8.32  )
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

 drivers/nvmem/core.c                 | 426 ++++++++++++++++++++++++-----------
 drivers/nvmem/internals.h            |   4 +
 drivers/nvmem/layouts.c              |   2 +
 drivers/nvmem/layouts/fixed-layout.c |   2 +-
 drivers/nvmem/layouts/onie-tlv.c     |  19 +-
 drivers/nvmem/layouts/sl28vpd.c      |   2 +-
 drivers/nvmem/layouts/u-boot-env.c   |  25 +-
 include/linux/nvmem-provider.h       |  16 +-
 8 files changed, 352 insertions(+), 144 deletions(-)
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
