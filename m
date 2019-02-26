Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B65C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 10:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53BEF2173C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 10:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4m/8/Yv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53BEF2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+VuIzWOLt9EYaCJagv7NBfGPJk+ckk82pNB99FixzM=; b=K4m/8/YvWLT/Xp
	lwb79d8PHHXCa+hxTrF6TePg1iqZkE0bOU2tzXaoaI5CM46JbOHXN6lo+wWUYoJc0NTrUuWZyp7Sx
	D2NVe7cg96fGcBQ36ts3UuqvQa9xi4D+VVuHQ4BQ+isGLPD8RVs/ZrH8DFD1CSfSnPFXbEzOFvLND
	k3DG1hGNxx4drZYLFNQN0N31KoyuMQ5vwbjSvaIbGF27oJyJQs+ZIFs7/Pid5H/5uhiIlHPtfULyG
	STVo6e70gJ4AwffwVuEvP+BvcsgGDxvWaUnaQyJFKaA7Bjrh1RlGD75TMsRofubpbheqXNg5apeQk
	ECEkHESKC9R2hO26N1dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaHi-0007qb-47; Tue, 26 Feb 2019 10:48:26 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaHd-0007ou-UX
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 10:48:24 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 5.5.0) with ESMTP id SG003717272.MSG 
 for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2019 11:48:11 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Tue, 26
 Feb 2019 11:48:10 +0100
Received: from flavio-x.asem.intra (172.16.17.161) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1261.35 via Frontend
 Transport; Tue, 26 Feb 2019 11:48:10 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Mark
 Brown <broonie@kernel.org>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/1] mtd: devices: add ACPI support for non-jedec m25p80
Date: Tue, 26 Feb 2019 11:48:07 +0100
Message-ID: <1551178088-6615-1-git-send-email-f.suligoi@asem.it>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0207.5C75196B.0049, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_024822_352576_1AAC7174 
X-CRM114-Status: GOOD (  13.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Flavio Suligoi <f.suligoi@asem.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch concerns the use of a "non-jedec" m25p80 device in a x86 machine.

For an x86 machine a m25p80 device has to be declared inside a BIOS ACPI table
(for example inside the SSDT or the DSDT table).

No matching problems for the jedec compatible devices, since we have the list:

static const struct of_device_id m25p_of_table[] = {
	{ .compatible = "jedec,spi-nor" },
	{}
};

But for the "non-jedec" devices there are no possible matches, even if we try to
use, the SPI modalias, as:

spi:mr25h40

So it is necessary filling the m25p_of_table with all the m25p80 device names
used in the driver. This solution works both for the ACPI-style (x86) and 
the DT-style declarations (ARM).
I checked this patch with:

1) x68 board using both an SSDT and DSDT tables
2) i.MX6DL custom board using a Device Tree 

This is an example of working SSDT table for x86:

DefinitionBlock ("mr25h40.aml", "SSDT", 5, "ASEMsp", "MR25H40", 1)
{
	External (_SB.SPI1, DeviceObj)

	Scope (\_SB.SPI1)
	{
		Device (NVR0)
		{
			Name (_HID, "PRP0001")
			Name (_DDN, "Everspin MR25H40 MRAM")
			Name (_CRS, ResourceTemplate () {
				SpiSerialBus (
				1,                      // Chip select
				PolarityLow,            // Chip select is active low
				FourWireMode,           // Full duplex
				8,                      // Bits per word is 8 (byte)
				ControllerInitiated,    // Don't care
				10000000,               // 10 MHz
				ClockPolarityLow,       // SPI mode 0 ClockPolarityLow
				ClockPhaseFirst,        // SPI mode 0 ClockPhaseFirst
				"\\_SB.SPI1",      	// SPI host controller
				0,			// Must be 0
				ResourceConsumer,
				,
				)
			})

			Name (_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", "mr25h40"},
				}
			})
		}
	}
}

Flavio Suligoi (1):
  mtd: devices: add ACPI support for non-jedec m25p80

 drivers/mtd/devices/m25p80.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
