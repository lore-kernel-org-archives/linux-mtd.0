Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6633C41513
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vd4bDFuPf/nsOx/sQj1acLmxve+JRO2l3WIzCJ4HLT4=; b=mCp4StDvBGorpd
	YEPUQma1ngV4A5Z0uUHgSZAIUo0lT8BwSe+UuEJwUTa2NXrHvZLVZ9FXTgP2sId/Bo5FMa9ZuTbd0
	khLuAq7+AgaxQP6apL/vXkdKQXmjhuVEeWXctzYAhFlOWqRylgwpumAvuISfEIJ7zWxkFpEEUjv+e
	hh53IiEhe8GiQPr1b+kcZpKJy71MqqpyJOeJfbt35ZoTO4ZNWDXD1cp2+hekCWXBbxodeuD7r90hE
	973NTa7Tw5EIN9JXeymdGG+rZumzog+nx9Wwl949HKVK0XEJk4WzHC5AZwa/vHl1wW+57PK1GoGbR
	RWgl5lFaCZkJ2OcV70Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7RN-0000000Gqlu-1AfX;
	Mon, 03 Jun 2024 13:09:33 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7RJ-0000000Gqkb-0kPh
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 13:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=saSbscj/lc1Vh8GhjtWmIhA6ffszYypeEA6Stg616AQ=; b=Mx
	JSGwRrsT3NgBJIPap+/fef/f5y07gyzhFnPorvucFoDsLB8JTUxbN7DTTDd1jJNdfOxIbHhfIl8p6
	BPFvUZG1lT9A4zWgQpNYWs9BLnnvQS4eXmagdxb6t4KfiqgLbr09mD9zoQ5wVdn8wXAJ2E7b8kqNL
	0Gmdo1QsVl4FtTTIg0qPCMDQuE11SX3DCXnDIAVcumj0n8OcPvR11Cxx+FjW1JppgtVVjDQpOMSn+
	63ynxg8fcvsaVCV7PugzJ5dXZGTOVQt0nrDoTAcsvA5hj2dAvbQ1YvmMOqKHJpSQvWfpqHG1dJkvv
	LXEawy3omWF0FCYounOSHHpFDv0WX+Lw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sE7RF-000Jpp-W5; Mon, 03 Jun 2024 15:09:22 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sE7RC-000O6H-0c;
	Mon, 03 Jun 2024 15:09:21 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: macronix: workaround for device id
 re-use
Date: Mon, 03 Jun 2024 15:09:14 +0200
Message-Id: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHrAXWYC/42NQQ6CMBBFr0Jm7Rg6UEFW3sOwqHSASYSSVgmG9
 O5WTuDy/f/z/g6BvXCAJtvB8ypB3JyAThl0o5kHRrGJgXIqc00lTqbzbpYNp430s6BcW+xley8
 B65r4Ssy2shUkweI5NYf83iYeJbyc/xxfq/qlf2lXhQqZlSbWF9M/itvAJk3PnZugjTF+AV0U+
 PXFAAAA
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717420161; l=1472;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=gbet9ula8hiXQ5Q+WCGU8KzDeDurJoyPHFLzhk0cMyY=;
 b=y5ijGA8XqkpyiBGBumNuknoDSMA7jQBonPKQG1Q6NrxAUfdOM7n6kRYO48IQO1A0a2f4gyVDB
 7Tm6TlO2DMqDpGtihS6mUUl88/ZwKoWZVDvAki7HLnhJlCQfoiNhsVx
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27295/Mon Jun  3 10:28:26 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_060929_685794_49ED8967 
X-CRM114-Status: GOOD (  10.49  )
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

I only have access to boards with MX25L3233F flashes, so haven't been
able to test the backwards compatibility. If anybody has boards with
MX25L3205D and/or MX25L3206E, please help test this patch. Keep an eye
for read performance regression.

It is worth nothing that both MX25L3205D and MX25L3206E are
end-of-life, and is unavailable from Macronix, so any new boards
featuring a Macronix flash with this ID will likely be using
MX25L3233F.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v2:
- Added new flag (SPI_NOR_TRY_SFDP) to spi-nor core to allow trying
  SFDP and fallback to legacy parameters without having to specify
  DUAL/QUAD parameters.
- Rewrite macronix to use SPI_NOR_TRY_SFDP flag.
- Use with the ancient EoL MX25L3205D chip will not get speed
  increase, but stay at 1-bit mode as it is now.
- Link to v1: https://lore.kernel.org/r/20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com

---
Esben Haabendal (2):
      mtd: spi-nor: core: add flag for doing optional SFDP
      mtd: spi-nor: macronix: enable quad/dual speed for mx25l3205d chips

 drivers/mtd/spi-nor/core.c     | 3 ++-
 drivers/mtd/spi-nor/core.h     | 1 +
 drivers/mtd/spi-nor/macronix.c | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240524-macronix-mx25l3205d-fixups-882e92eed7d7

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
