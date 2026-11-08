Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F852606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 02:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IksMBT0R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=D4ZMxX3X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QMjI5QGBe79tfdCAM4u2I+AXDfyJjq/VuUHwo6SOsy8=; b=IksMBT0R9x3eprL3n7jVf026Td
	Mm9vm4biDHQhAK5FRBuUwtaRxzxFnrRI+bW8H+oJMxglMafb7rkGI+2kLwYL2otwY9hE4Mm+rNtJp
	qCwYjENMH88TRvPVtoUYKGuZwmUl8K1JZ/QuPGNXymgKzBjVcthsoeYgEz+TzPPNAYX4QFx3MFto2
	HMJCrNaxERkdgj5Qkh8va/SajWhtQ4RdME90MOCdp4xtKlZvTsmtjA/94FvpycMLOU7rv81V74Qoy
	D8zRjqtz22aD53zEMnO0Ad9NGoR/plldZ1x6E6mhFkvU7Tk10ACmFQuzdO7p0KxYJNqwLjzY016tq
	zsk11ACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPssV-0000000Fceu-0mVa;
	Sun, 08 Nov 2026 02:43:31 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPssS-0000000FceX-41SP
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 02:43:30 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36dbde64409so237366eec.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 18:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794105808; x=1794710608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFuoGXXrkyFliEzMqju+9q+B5cpIirOFosUPmdC6VLM=;
        b=D4ZMxX3XAABlyJdyeOS/oW1gTwu5HwfeTyPWpqQlsR8t/1p2JLdjpJGrqiXLQlLAzn
         rhDQIptaWvWrmkPt5Ve57ObHGXB8Kv+iqL94c+Iax/UdkOnRlDDSZNOdP4x9Bg5IKpwj
         rl78IYGhqoC1xvx2YrAGlCp78Xzuu/eE8BeLiy1M2bM7d9uIfumFU6Gma7XgM6hpr9vx
         kFikzDBIa523IU8dC8l0Ix1IPf0CpsUzNhVBr9oLbRCpeZlhkpSydqDaBlfGcorUDt7t
         A2gFE9mNi8s9PYjqJljE/lU36sB44qsfnMw+uZheYn9cghWjthqkB0uucSzL9PIYHf/v
         YlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794105808; x=1794710608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFuoGXXrkyFliEzMqju+9q+B5cpIirOFosUPmdC6VLM=;
        b=NWWr3ZXzuVMwsuiWX7fBsI7LfNjdD3jfor+jPTenvYXYV2O+zhKxJjPZcqIgLoxfkC
         W3UDd0wUkG0LUANTlgSIZRWtVRYtEN2L2HVqx8ol+JK2qpaJQaSVXja1W5b2YOvFq1uh
         Cn4fSP0lQYh+2MK4VBZ8AvUx7NupbXhRlZ69uPN8XjbnPS4ch6kEHWEbmA8O5hFWXVvO
         cgJSz1UHpfI35QGLZUkdELuqWKsCknL1og77zgvFV7R5rfeJ2CohH+Njv6wQqbFwJ8iP
         cOG2GilRCjidxRJwsbANIroI8GnqO8HFcRAPS8B7kCLBI6zlj5iFVqCMwK4NHhQCWNyn
         ucAg==
X-Gm-Message-State: APuU4Z8S5gCDKS2uK+XUr5n6NUiOR9WxoiHVsaGGptCG4mZurY1c6aF9
	0QieEoxxcqHtUervihC7yqhsQkceKdYkMvLE2YcVeslTotjwf0c4f2i0XBF4BzMWfw==
X-Gm-Gg: AYBFou3Uzq3bXZBYO1GDg1M+ruL7isyleGB+gPuNqxYjbdlEU1EO8rnNq8Lo5qjF+OI
	AmrJJdMeGFTl/30Mt7edW4fA/3MeUvNpYlXbKSmtwIWzW1mc6QvhethEnjG2nNb0sB2bIt9Dqyh
	B7OhQy+vL7crHNTGH8zsQ5z1u9qG8QyX7l4KkBM3ewUbX+R7yy3UAahkSYcUbPzGC0KyG7+z6l1
	ykBUlb4h9kPYUD0WLc91yaJq/h6o0bTCgXSu2xxmBrzAYixuz/ImRsRfDoEolkOOIgaW8uXwqjM
	FiJxlUugAJWc+USceeDfRlCg6ujFPfW6eR2x38ecdk6OUgsar4ZZo0m3B2+/4Qnihnte+5nV0Xi
	9jIUFo+QsmU8GA8+LF4/HUrJN+AO0EOm877gYYlOiMALPKMMfb1X2HyyDdJWUElPuavp92xxbPc
	HDw0h87GiuPJaJmucj7bLaoOU2tbowi6FCvS9sK5beRXwb1o0BdVEG6nh2ibCmY+IgHUJwBKS2Y
	EcEkbc/Xb//+1p5A6lP7KlZd5UTJ2DVxb2BA/C1+s9Peu8h87vE4N1e68j0lddavqxqiWrog8CU
	V84cUxn2pU5cn3/I5G7K1KqETaD1s+DbaKzf5/8KMiLNYKtPPZVslsuwc3JMvOmQVlFzCP6z1qI
	8ljkkefkCZg==
X-Received: by 2002:a05:693c:62dc:b0:36f:5746:3369 with SMTP id 5a478bee46e88-3725807c859mr1143986eec.24.1794105807738;
        Sat, 07 Nov 2026 18:43:27 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db8bbsm1681203eec.22.2026.11.07.18.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:43:27 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH v2] mtd: spi-nor: gigadevice: Add support for GigaDevice GD25B512
Date: Sun,  8 Nov 2026 02:43:17 +0000
Message-ID: <20261108024317.898917-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_184329_138780_CE9A8A95 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the GigaDevice GD25B512 512Mbit (64 MiB) SPI NOR flash.

The chip exposes valid JESD216B SFDP tables including 4-byte address
instruction tables, from which geometry and opcodes are discovered.
Status register locking is enabled. Read, write, and erase functionality
across the full memory array have been tested on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
v2:
 - Drop .fixup_flags per modern SFDP discovery conventions.

 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 6a2e6ebda148..fe05c0f0370d 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,6 +64,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
 		.name = "gd25lq32",
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
