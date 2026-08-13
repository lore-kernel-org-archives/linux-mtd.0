Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12651C5DF64
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N62/DDtrEEYviG5R3SPkqFpD05i9FG5cV9Exohb2+YI=; b=ciJ7ovOmkjgji8
	WpmMfMvEmYWI5ThTVWxGTYtU/k/ye5vvWu2rX3kE4y+5Hr3VZNUHudznrhtBf/fiav7gCY4bx9I3Y
	hIvqjjFJ9DtiGed6F6TkcoSttpcBJW07wCx6hdw1l4IykSNwgkfc3lfRV4PYQ0Yk+peADJ/CL+j+A
	cLRKsP/Pf5tpMe86x1wm5A1xpbW5OuhADWMMnmMVUcEbuv+8w8cIoJL0c7u3ah383YmF7j3TnwjH8
	RY9dySQR7DnXeoqyYVNY+s02aDUikBjRZ6N6G8HbkDdwgswRkoqXk90jicldSoT50C+j05uyacF7d
	FQESaQbQIw6HcJWaRvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXEp-00000000yJ4-3uty;
	Thu, 13 Aug 2026 15:20:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXEm-00000000yEG-0EDg;
	Thu, 13 Aug 2026 15:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cY4t849PVtWEl6wunV8TJ36nrxAUXdUJI7dfbuq4AQ8=; b=SLne8+NrlEpuSFR2j0AHBq/eiZ
	4BdpftTVio/5wqu1o71RhHb43jzVLbzt8rG926JNEoWcn35NTCtsHEBC5Z/PuMrHNcPECTA++UkaM
	DrGrc6BpXvJ9mYSigZM6rHmUOFYxoCxq/l+1kV9g0do/hwCv4e2yq7e5bXX8nFFbZbX9oxgUwt9sc
	ieuuWEOnn/X/H76QPK1dCoC/FKUnU/Z9aW4FR03i4abYKtTzc9WF7v2S7m2FImCE3pSMQfoTkfb7c
	tmGNWS7Ro3MSixviqam/vViDOzvg7SyayZ5M1pYm5x5i6ntJuaplHovcMvU8r1+B2yhN9unGz8mCe
	Qr0dpn+A==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuXEj-0000000GHJB-1AAr;
	Thu, 13 Aug 2026 15:20:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 983C34E41209;
	Thu, 13 Aug 2026 15:20:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66D23602B8;
	Thu, 13 Aug 2026 15:20:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2606A11C4E07B;
	Thu, 13 Aug 2026 17:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cY4t849PVtWEl6wunV8TJ36nrxAUXdUJI7dfbuq4AQ8=;
	b=sKlH8ahY3zqi5iQyvONvm9ZCAG2aeZIen/80uLrPO/j7aFNxZSoWWFlzDviD6rtaqUVQM/
	N9FlwXaSLGgIr9uM2E+g3LOmx5SV8Tz2uLEeVhxfmOwKMmJ4wvZIf0xPuTw8/vpjhIzaoX
	KwvSIRaztVqtfklrYE00dAjwfBDxpipBCxxknrk/rK2SpaHSO1gHw0r50S3MtNC9/95PJV
	Hgi3voI8UUiLN0KjqwzhmqJd9bvQnwqJEAQfCm981RfOQ53+twqyWxDFrJyhFCQKZEW3hi
	dDDyK8Z24k6StXA+P3ERyyHUNMIEZBGpJW8mKANNAYQFYS88eKE4M15Req+VoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:15 +0200
Subject: [PATCH v3 15/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_162053_460137_2CB346F3 
X-CRM114-Status: UNSURE (   9.20  )
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

There is an ID collision between the JV and RV families. Both chips are
very similar in practice, it is mostly a matter of electrical
differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
The new SFDP (rev F) field which forces an alternate write SR2 opcode
(0x31).

Since they share the IDs but not the names, we must hide the names using
a fixup.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 055c5833f687..b86458b22838 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -608,6 +608,8 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70), .match = winbond_rv_match,
+	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x21), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
