Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06CCC0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RVvqGC0Utr9WClcgP/vpJmp8YnkOs+OiB+Gr/pMgbn0=; b=auKPR5QEtp1LxSlmpQPtGTZcfV
	UDDpqivduEc1e9YfbWByUTJIIo6pGSVMS6j+h7W764xDJE7TeZzokDMk80Sy6pp+uiPjis53kjlPK
	DI5FaVPocibdWCgM/Ni6NKrEZGGEYY6Zs2GmWEVoOOhNLhyzSWVzJyXHnWeyfc8DfJEQlDf0qlFwC
	Qbg+GHTPrfvLInfrzt3Qy27R033N/eYwBuLWFOJLvm1Iiom/Xb1xU9c5emZvskTPrEnjc9AuHtCah
	rkUw8XX5/zNLIrfUl7njGPjmiGXYCWpTDeAwUJVDJlO6VCN6iLVTRf0Q9dtk+OnayZpQzNoBaWsyc
	RCcyhTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLOeS-004AZA-1a;
	Mon, 17 Jul 2023 13:52:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLOdp-004AV7-0K
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 13:52:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E039B61057;
	Mon, 17 Jul 2023 13:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8109C433C7;
	Mon, 17 Jul 2023 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689601915;
	bh=+tSO894L4BHaW4iUVifFUEKppPkzwhF1L/DOWtPSdZ4=;
	h=Date:From:To:Cc:Subject:From;
	b=nkSaMzi1IwBERHT26DJdxODkdMpNUUPWD5o5xtC+4wXv2a9tq1up1QMBwN0vO3Zya
	 t2BUAZM7BZ3+Hwt/roAh6hyJZcBIRqrldUUrOtl5Jy7rBxo0BHtyq8YiijQXMzlNs4
	 rogrhz7kLzUryfHwdZke3JSU200TvOawvx3IZwHjDkUKn253gYFQuIT3h+Zu/Rd0tT
	 pFmEMVafZTxYxsuPpDGZDjnc+tkOPZYvKVw0YAsBHu23SNrIHURv7gF1iZ/AGEucbx
	 A9iGeRBca968C2cq33S0f9IzhcXCrsZssI3mRL5XMstQw4GJOSkJPebmQWC/ufx3KV
	 ns05cO0pjnp+w==
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 15:51:51 +0200
From: Michael Walle <mwalle@kernel.org>
To: tudor.ambarus@linaro.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
Subject: mtd: spi-nor: flash_info db overhaul
Message-ID: <28d2e2f6f607cc14419ef996d9b624bc@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_065157_262527_F9DADFE7 
X-CRM114-Status: GOOD (  18.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I'm planning to do a makeover of how the in-kernel flash database of
the SPI-NOR parts are represented. It all started with the quest for
dropping unneeded properties like size and sector_size for newer
flashes which already contains self describing tables within the flash
itself :)

Soon additional drawbacks (or maybe legacy features :) were discovered:
  * the SNOR_IDs are hardcoded to either 3 or 6 bytes. But with the dawn
    of continuation codes, these IDs have a flexible length.
    Fun fact, we have one flash with a correct continuation code,
    "is25cd512" with id 0x7f9d20, 0x7f9d is the vendor id and 0x20 the
    device id, which is just one byte for this flash. First, I though 
that
    was a mistake, but actually it is in line with the datasheet. 
Apparently,
    the vendor is afraid of spi code which only supports 3 id bytes :) 
The
    same is true for "pm25lq032".
  * all the macros contain a trailing comma, and thus the trailing comma
    is omitted in the flash db which makes is somewhat inconsistent if 
you
    also want to use non-macro entires, like ".fixups = fixup,"
  * macros which just returns their argument, e.g.
    #define NO_SFDP_FLAGS(x) .no_sfdp_flags = (x),
  * newer flashes only need the id, a name and some flags, thus INFO()
    has a lot of empty fields,
  * newer flashes need to explicitly specify PARSE_SFDP.

Goals I'd like to achieve:
  * first and formost, new flash entries should be as slim as possible,
  * the id should have a flexible length,
  * same (consistent) format for legacy flash entries and newer ones,
  * no overuse of macros


Here are some old examples:
{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512)
	NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
	FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
	MFR_FLAGS(USE_FSR)
},  // (1)
{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512)
	NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
	MFR_FLAGS(USE_FSR)
},  // (2)
{ "w25q512nwq", INFO(0xef6020, 0, 0, 0)
	PARSE_SFDP
	OTP_INFO(256, 3, 0x1000, 0x1000)
}, // (3)
{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
	PARSE_SFDP
	FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
	NO_SFDP_FLAGS(SECT_4K)
}, // (4)

Here's the (idea of the) final version:
{
   .id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
   .name = "mt25ql256a",
   .size = SZ_32M,
   .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
   .fixup_flags = SPI_NOR_4B_OPCODES,
   .mfr_flags = USE_FSR,
} (1)
{
   .id = SNOR_ID(0x20, 0xbb, 0x19),
   .name = "n25q256ax1",
   .size = SZ_32M,
   .no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
   .mfr_flags = USE_FSR,
} (2)
{
   .id = SNOR_ID(0xef, 0x60, 0x20),
   .name = "w25q512nwq",
   .otp_org = SNOR_OTP_ORG(256, 3, 0x1000, 0x1000),
   // or maybe just .otp = SNOR_OTP(),
} (3)
{
   .id = SNOR_ID(0xef, 0x40, 0x18),
   .name = "w25q128",
   .size = SZ_16M,
   .force_sfdp = true,
   .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
   .no_sfdp_flags = SECT_4K,
}, // (4)

The full template would be:
{
  .id = SNOR_ID(),
  .name = ,
  .size = , // will replace n_sectors
  .sector_size = , // if 0, SZ_64K is assumed, otherwise has to be set
  .n_banks = , // if 0, 1 is assumed, otherwise has to be set
  .page_size = , // if 0, 256 is assumed, otherwise has to be set
  .addr_nbytes = , // addr_nbytes is already special, see 
spi_nor_set_addr_nbytes()
  .flags = ,
  .no_sfdp_flags = ,
  .mfr_flags = ,
  .otp_org = SNOR_OTP_ORG()
  .fixups = .
  .fixup_flags = ,
  .force_sfdp = , // see below!
}

The only mandatory field is .id because that is the key into
the db entry. Of course, with the dawn of the generic spi flash
driver, an entry with no additional flags doesn't make any sense.
Therefore, I'd expect an entry to have at least .*flags or
.otp_org set.

Alternatively, the second key is the name for legacy flashes which
are looked up by the name instead of the id. If we ever need to
resort to individual DT compatibles, I'd use a new .compatible entry
for that like everywhere else in the kernel.

One word on .parse_sfdp (@Tudor this is new, so let me know). Because
I want new entries as slim as possible and I expect that all new flashes
will support SFDP, I'd like to get rid of the mandatory
".parse_sfdp = true" line. The first idea was to just invert the logic
and have a .no_sfdp which will need to be set to true for all the old
flashes. But I think we can do better. We can assume that each entry
with .size != 0 (or .n_sectors in the old format) will implicitly be
".no_sfdp = true" (or parse_sfdp = false in the old format). There is
of course one exception to this rule. Flashes with the same ID where
one supports SFDP and one doesn't. In the end the outcome is the same,
we need to force SFDP parsing even if .size non-zero. Thus for this
case, we need a .force_sfdp = true entry. See also example (4) above.

I've already had a talk with Tudor about that topic. Does anyone else
have thoughts on it?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
