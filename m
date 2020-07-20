Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B93C433F2
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:40:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90AE4206E9
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ajpVH6xR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90AE4206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0bpqyZFjxFIV3C4WqT7mz2cT+b0ULpSB/37U5KlTz7Q=; b=ajpVH6xRTagLnbRR0/XnTvTz7
	7yH91mdFkd+t+SprylQcucFePnvX71za+CyETWSpk9Ocec6HTtocfugufUq9L9//S2sWI6VgJCTYf
	SFMcAtytRudDVVSpa2337PNaA/yZKy//ynbN7AicqoUjHj7K96U3PG0mqt8D6YqWuJi56y5yZ3gVP
	Ydo243bAtfqEM4V+kT40q1cz6N26xfJiBn4Vw9d1eZxa0QFU45rKis8hoqYrZe6R82jpsVEm2I3MI
	jZOZr8jpHbs0/K81EJ/xIT2t9I9quJcFY3BoPDKR3I4jXJDLYqvaNYZHJmKhM4CDxN+N+UZr78afh
	VeQ0dal+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYny-0005EB-SA; Mon, 20 Jul 2020 16:38:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYns-0005Bd-OX; Mon, 20 Jul 2020 16:38:13 +0000
X-Originating-IP: 42.109.212.217
Received: from localhost (unknown [42.109.212.217])
 (Authenticated sender: me@yadavpratyush.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7114824000E;
 Mon, 20 Jul 2020 16:38:04 +0000 (UTC)
Date: Mon, 20 Jul 2020 22:08:02 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v10 07/17] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Message-ID: <20200720163802.veql43cmal7sunit@yadavpratyush.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-8-p.yadav@ti.com>
 <1450d8c8-cda4-51e3-9f57-0b2f00825f11@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1450d8c8-cda4-51e3-9f57-0b2f00825f11@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_123813_017204_A4E4F68B 
X-CRM114-Status: GOOD (  32.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 nsekhar@ti.com, Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 michal.simek@xilinx.com, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, p.yadav@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 08/07/20 04:01PM, Tudor.Ambarus@microchip.com wrote:
> On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > This table is indication that the flash is xSPI compliant and hence
> > supports octal DTR mode. Extract information like the fast read opcode,
> > dummy cycles, the number of dummy cycles needed for a Read Status
> > Register command, and the number of address bytes needed for a Read
> > Status Register command.
> > 
> > We don't know what speed the controller is running at. Find the fast
> > read dummy cycles for the fastest frequency the flash can run at to be
> > sure we are never short of dummy cycles. If nothing is available,
> > default to 20. Flashes that use a different value should update it in
> > their fixup hooks.
> > 
> > Since we want to set read settings, expose spi_nor_set_read_settings()
> > in core.h.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c |  2 +-
> >  drivers/mtd/spi-nor/core.h | 10 ++++
> >  drivers/mtd/spi-nor/sfdp.c | 98 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 109 insertions(+), 1 deletion(-)
> > 
[...]
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index 3f709de5ea67..d5a24e61813c 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
[...]
> > @@ -66,6 +70,16 @@ struct sfdp_bfpt_erase {
> >         u32                     shift;
> >  };
> > 
> > +/* xSPI Profile 1.0 table (from JESD216D.01). */
> > +#define PROFILE1_DWORD1_RD_FAST_CMD            GENMASK(15, 8)
> > +#define PROFILE1_DWORD1_RDSR_DUMMY             BIT(28)
> > +#define PROFILE1_DWORD1_RDSR_ADDR_BYTES                BIT(29)
> > +#define PROFILE1_DWORD4_DUMMY_200MHZ           GENMASK(11, 7)
> > +#define PROFILE1_DWORD5_DUMMY_166MHZ           GENMASK(31, 27)
> > +#define PROFILE1_DWORD5_DUMMY_133MHZ           GENMASK(21, 17)
> > +#define PROFILE1_DWORD5_DUMMY_100MHZ           GENMASK(11, 7)
> 
> we should order these macros in a consistent way. I see that previous macros
> are declared in order starting from MSB to LSB.
> 
> > +#define PROFILE1_DUMMY_DEFAULT                 20
> 
> we need to explain why the default dummy value is 20.

No reason other than the fact that it is the default for the first flash 
that uses Profile 1.0 parsing (S28HS512T). AFAIK a similar reasoning is 
followed for the default being 8 for 1-1-4 or 1-1-8 modes.

I can't think of any reasonable way of deciding on a default value since 
it varies from flash to flash.
 
> How about declaring all these macros immediately above of spi_nor_parse_profile1()?
> 
> > +
> >  #define SMPT_CMD_ADDRESS_LEN_MASK              GENMASK(23, 22)
> >  #define SMPT_CMD_ADDRESS_LEN_0                 (0x0UL << 22)
> >  #define SMPT_CMD_ADDRESS_LEN_3                 (0x1UL << 22)
> > @@ -1106,6 +1120,86 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
> >         return ret;
> >  }
> > 
> > +/**
> > + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> > + * @nor:               pointer to a 'struct spi_nor'
> > + * @param_header:      pointer to the 'struct sfdp_parameter_header' describing
> > + *                     the 4-Byte Address Instruction Table length and version.
> > + * @params:            pointer to the 'struct spi_nor_flash_parameter' to be.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spi_nor_parse_profile1(struct spi_nor *nor,
> > +                                 const struct sfdp_parameter_header *profile1_header,
> > +                                 struct spi_nor_flash_parameter *params)
> > +{
> > +       u32 *table, opcode, addr;
> 
> s/table/dwords?
> 
> u8 opcode?
> 
> > +       size_t len;
> > +       int ret, i;
> > +       u8 dummy;
> > +
> > +       len = profile1_header->length * sizeof(*table);
> > +       table = kmalloc(len, GFP_KERNEL);
> > +       if (!table)
> > +               return -ENOMEM;
> > +
> > +       addr = SFDP_PARAM_HEADER_PTP(profile1_header);
> > +       ret = spi_nor_read_sfdp(nor, addr, len, table);
> > +       if (ret)
> > +               goto out;
> > +
> > +       /* Fix endianness of the table DWORDs. */
> > +       for (i = 0; i < profile1_header->length; i++)
> > +               table[i] = le32_to_cpu(table[i]);
> 
> le32_to_cpu_array(table, profile1_header->length);
> 
> > +
> > +       /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> > +       opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, table[0]);
> > +
> > +       /*
> > +        * We don't know what speed the controller is running at. Find the
> > +        * dummy cycles for the fastest frequency the flash can run at to be
> > +        * sure we are never short of dummy cycles. A value of 0 means the
> > +        * frequency is not supported.
> > +        *
> > +        * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
> > +        * flashes set the correct value if needed in their fixup hooks.
> > +        */
> > +       dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, table[3]);
> > +       if (!dummy)
> > +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, table[4]);
> > +       if (!dummy)
> > +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, table[4]);
> > +       if (!dummy)
> > +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, table[4]);
> > +       if (!dummy)
> > +               dummy = PROFILE1_DUMMY_DEFAULT;
> > +
> > +       /* Round up to an even value to avoid tripping controllers up. */
> > +       dummy = ROUND_UP_TO(dummy, 2);
> > +
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
