Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F76B10F3DEA
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2026 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BqfJ0pNBXGzxsoYQixHUKLda16GGOFoBVKYC6YG4KsM=; b=YhKtIaH7Y3bGeQ
	mhUVnaxe5V7VHp/bukzq6IpTH+AQWtjB8Os0sHjxXZPQcseJcL9wddF6bQ3FuZXdqz+uLXMfz3/iW
	fOqJBGv9qKc7/Wl9Ml8ixOnX5xUQRDbJ7PnT27ij66I0ZFYNlTcUbn7o4caIDynZLf+szy1ywkNEu
	MZ5t3iIWEBVCxBDuEWhbNsC3ip6gSaIpYr8yNPx6aeYSntY809lFWiVoL9zxNsuCXB519amnHLp7n
	pIUG5GzRAFSdVftEBmW7wHJHB+1myxh1XTuhQLxJNfqCHQ8RqnI6D4ajwEMc9YWcj9Ld2xrwXnM3G
	so5O6PNLr9SqgcrwKWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6W0x-000000095UC-2DBC;
	Sat, 28 Mar 2026 15:55:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6W0u-000000095TY-3QA7
	for linux-mtd@lists.infradead.org;
	Sat, 28 Mar 2026 15:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 976864027F;
	Sat, 28 Mar 2026 15:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3FFC4CEF7;
	Sat, 28 Mar 2026 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774713351;
	bh=P7YkcLByhCVatdaLBX2CKcby11UXQZFz8qz/3hqqEnU=;
	h=From:Subject:Date:To:Cc:From;
	b=f/wapYY8xzOVX1LjPSfj8GHNj7cf3+ZAnZpY6ecoXFxbfce8rselwFK1TrjdzF2FX
	 w22Ed45TrJV/Z3QPcputAhcUXzpMHI0Czp+JUje7DM8EcBafCjIEUa78TRs1YQsc1n
	 cvBIzL71NS2QK9eGBR4G8VopZ6/bpD+1YkD6EqpaNFLPLXLXnUCO36/npp7OTn3Cmc
	 o1WpgGOii0i3zVY5jq3gZuZPEHTU7U3IlIgQyXDvHukQCNKDvTlSSNCbXeJjhCSGuT
	 UI/xBm/7jhgomvwUSQsyB2vLH2aY4ywv64z0EmBQT6dinakFjEyiMCYq187ctCxAN2
	 T8LvnaGVdQ1mw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] MIPS RB532 GPIO descriptor conversion
Date: Sat, 28 Mar 2026 16:55:46 +0100
Message-Id: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1gZq6nwVceEQNQtraasI4t0tL
 t/i/wc8O2EPbfKA40u8HCYiSxOYtsGsjDJHAykqlaYKd7EexdgzoBsLTTieIRwGdcN5rupioKW
 BWFvHi9z/uevf9wNcy/CIaQAAAA==
X-Change-ID: 20260327-mips-input-rb532-button-39e44085a2f9
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_085552_900395_274CB99C 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This moves the MIPS Mikrotik RouterBoard RB532 over to using
GPIO descriptors by augmenting the two remaining drivers using
GPIOs to use software nodes and device properties.

This is part of the pull to get rid of the legacy GPIO API
inside the kernel.

It would be nice if someone can test of this actually works,
I've only compile-tested it.

If we can agree on this method to move forward with this machine
it would be nice if the MIPS maintainer could merge the end
result with ACKs from the input and MTD maintainers.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      MIPS/input: Move RB532 button to GPIO descriptors
      MIPS/mtd: Handle READY GPIO in generic NAND platform data

 arch/mips/rb532/devices.c         | 83 ++++++++++++++++++++++++++++-----------
 drivers/input/misc/rb532_button.c | 35 ++++++++++++++---
 drivers/mtd/nand/raw/plat_nand.c  | 24 ++++++++++-
 3 files changed, 113 insertions(+), 29 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-mips-input-rb532-button-39e44085a2f9

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
