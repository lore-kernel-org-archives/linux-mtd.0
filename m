Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33191CD6E6B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eN1Az1sfq2RKRD1DtvZgkHpLkxCM8+BMQaf4/OghJk=; b=sgoJpynsavp1Oa
	ktQvtFKDfQNI2Qgr89WBqKUBQwvGaS9qv8nZavCHox4f6FQuIsqT8patIvxPFApOiIzZS1z5DP4Sb
	0CNeRBRPsClCtKR36fyC3GJZMcd5WChyPTj0GPWVCNK/7o3NAAbNlpCUt4L1oswhdR4di+nnHXs4t
	hjpHY4UiVEHTtvJepqqRhL8MwtE93zPzwZ4wzW5Byt4TIawEYoieL88ZRZ1h1gA5wUDZOMVrMHmMF
	h2L2kzdsOcRHknMf+UnV2rdQJn365989Ni5AiVQQLzPfpXPA3HMiOkjYrXeS2HG7iB4r0aR0imA2O
	l9YmUYL4PSOB+aziF5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQG3-00000000LDJ-2Vzu;
	Fri, 05 Jun 2026 08:50:27 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQG0-00000000LCe-2Cez
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 08:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1780649424; x=1812185424;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WhzpbFoxxYPjAF2tqe8WMmUOQZvP6A3CxqiHAqEeP18=;
  b=Ys7XyIiu/OtY/MQUdJEorreSogMFT5mFNRuXZw+N2OpHL67ER+MpJ1C6
   gKu8r1CSLhD9d9qnMiHsSKvKBS0zxgSYrZpGLYK96ihQ0Q7HP8WBCEWz/
   NBqpu2El9ytcMN1iuk18m/bP8BiFwyEyhA1+RWx34X9ZC2rPUgEgDX/4Y
   g=;
X-CSE-ConnectionGUID: X/QmngN2SqOHG4fMdiSWGA==
X-CSE-MsgGUID: cVAsXB/fRgW6Dr7uwzGgJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="160912355"
X-IronPort-AV: E=Sophos;i="6.24,188,1774306800"; 
   d="scan'208";a="160912355"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 10:50:23 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 10:50:22 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.037; Fri, 5 Jun 2026 10:50:22 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <mwalle@kernel.org>
CC: <pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
Thread-Topic: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
Thread-Index: AQHc8cXTO5f/tOgcMEyxMymmbryaJrYrCr5PgADpbECAA7IlkA==
Date: Fri, 5 Jun 2026 08:50:22 +0000
Message-ID: <28461250e841436e98e67fd7b0d02313@infineon.com>
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <87tsrlmf7g.fsf@bootlin.com> <c8f082b6deb4483b9a6a5f54ac549d62@infineon.com>
In-Reply-To: <c8f082b6deb4483b9a6a5f54ac549d62@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_015024_870503_F3773F07 
X-CRM114-Status: GOOD (  27.52  )
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

> Hi,
> 
> > Hi Michael,
> >
> > On 01/06/2026 at 14:52:42 +02, Michael Walle <mwalle@kernel.org> wrote:
> >
> > > Try to simplify the flash initialization and get rid of the legacy
> > > handling. As default, all the flags of the in-kernel database are
> > > taken and amended with the SFDP data.
> > >
> > > This might have the consequence that all the flashes now get a
> > > RDSFPD opcode which might be an unknown opcode. But that was already
> > > the case for any flashes which were unknown to the linux kernel. So
> > > far, there was not a single complaint.
> > >
> > > See patch 3 for more information. If feedback is positive, this is
> > > intended to be applied to the spi-nor tree after the next merge
> > > window, so it will sit around in -next for quite some time and get
> > > some testing.
> > >
> > > That being said, I've just did a quick test on my boards. Please
> > > give it a test on your boards.
> >
> > Interesting cleanup, thanks for pushing it. I'll run some tests with
> > some old and newer SFDP based flashes. I do not have chips without SFDP
> > though.
> >
> I do have some non-SFDP chips (S25FL-S). Will get back to you with test
> result.

With my AMD Zynq-7000 & Infineon internal SPI controller, s25fl128s0,
s25fl128s1, and s25fl256s0 work fine.

Here is the test log of s25fl256s0:

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25fl256s0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
0102194d0080

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion

zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
xxd: /sys/bus/spi/devices/spi0.0/spi-nor/sfdp: No such file or directory
xxd: /sys/bus/spi/devices/spi0.0/spi-nor/sfdp: Bad file descriptor

zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
md5sum: can't open '/sys/bus/spi/devices/spi0.0/spi-nor/sfdp': No such file or directory

zynq> test_spi.sh
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.074296 seconds, 26.9MB/s
Erased 2097152 bytes from address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
1565a9e729e432053d204d569952d5ee6d669e0ace84a88d681b20e4600df356  spi_read
1565a9e729e432053d204d569952d5ee6d669e0ace84a88d681b20e4600df356  spi_test
Erased 2097152 bytes from address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
1565a9e729e432053d204d569952d5ee6d669e0ace84a88d681b20e4600df356  spi_test

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            s25fl256s0
id              01 02 19 4d 00 80
size            32.0 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_16BIT_SR

opcodes
 read           0x6c
  dummy cycles  8
 erase          0xdc
 program        0x12
 8D extension   none

protocols
 read           1S-1S-4S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 d8 (256 KiB) [0]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-01ffffff |     [0   ] | no

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0b
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
