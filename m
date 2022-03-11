Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1098C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Whu8nNhyytClIVQ2Oc+EHP19ezzrPJRrFvhVZbN5aOk=; b=aEh1ZK3TQmRMtK
	LVzCsckeMpko9L3pT8TVKX9FkqlNPaoU+rn25opwZKJQq/DHadTqujbIgUi4pbt4V/LUQdafVvLp+
	5Uy/KBcmWRjfRDbphgoy3cMVVwl9x6Zzd7yDNStZxQpux0xHDORNUrsuBpnKgy3B4RGagzJ40FWgL
	AqzTLkyBlQlw8U6jX3BiGtuL+ahi6IoCmgEYX5ACmbbfHoyJ08X87A8VcLOZqu/KGzHKcjWEk1oAX
	73gjUFABq0Qe+piKs33GnV6CDXVfkPbKC3B6h1y+8+oegPWbd1yt/2/jsjt7/Y0txEH8gntTA5vvW
	RC31DRbM7wBbGE50kYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSjML-00HXLU-IJ; Fri, 11 Mar 2022 17:47:25 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSjMG-00HXKw-Tn
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 17:47:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22BHlDXT021105;
 Fri, 11 Mar 2022 11:47:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647020833;
 bh=pdP+i9m2lw1qpqeGFBrxp+l79uJC+mKNJuBzp+PYH+8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=aRiuC3tc34x7CtK/Tz9/INvJh3X3MRMjZrXxbp1LrtQPZs1uQq52SBK5vlOIOsq2d
 aP+PwInlCWjivPgYud86F5xtAeSGGy5rVswtp4YJWBMVxIofOh74yOcJHW9C+VzPKe
 KI1eyO+dAQwGRUNwI+9ywSNIshSEa27vjd14vW1w=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22BHlDtl116195
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Mar 2022 11:47:13 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Mar 2022 11:47:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Mar 2022 11:47:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22BHlBZx049523;
 Fri, 11 Mar 2022 11:47:12 -0600
Date: Fri, 11 Mar 2022 23:17:11 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 1/4] spi: spi-mem: Allow specifying the byte order in DTR
 mode
Message-ID: <20220311174711.wexljqvqx6cgmeub@ti.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-2-tudor.ambarus@microchip.com>
 <20220302100255.gseqjbdyxrgmt3zf@ti.com>
 <f0501c29-ae70-185d-8f40-4a249e49575e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0501c29-ae70-185d-8f40-4a249e49575e@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_094721_246518_1208D2A3 
X-CRM114-Status: GOOD (  35.31  )
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

On 10/03/22 05:31AM, Tudor.Ambarus@microchip.com wrote:
> On 3/2/22 12:02, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi Tudor,
> 
> Hi, Pratyush,
> 
> > 
> > I'm reviewing the code here. I still have not thought through the
> > discussion about Kconfig option yet.
> > 
> > On 18/02/22 04:58PM, Tudor Ambarus wrote:
> >> There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
> >> when configured in DTR mode. The byte order of 16-bit words is swapped
> > 
> > s/DTR mode/ Octal DTR mode/
> > 
> > I don't think this would apply to a 4D-4D-4D flash since it would only
> > transmit one byte per clock cycle.
> 
> From what I see, flashes that claim "QPI DTR support" they actually support
> 4S-4D-4D. JESD251-1 talks about 4S-4D-4D too. So data is latched on both rising
> and falling edges of the clock. But I'm ok with your proposal because we don't
> have any proof if there are any QPI DTR flashes that swap bytes in DTR.

I think this problem fundamentally applies to Octal DTR and above (if 
there is ever 16-line DTR (hexadecimal DTR?) in the future). In your 4D 
data phase, you can only send _one_ byte per cycle. So the byte order 
inter-cycle does not matter as it does in 8D mode. Similarly, for a 
16-line STR this would also apply, since that has 2 bytes per cycle. For 
a 16-line DTR there are now 4 bytes per cycle and so on.

And the BFPT bit that you use to enable this swap also says "Byte order 
in 8D-8D-8D mode". So I really don't think it makes sense for QPI DTR.

> 
> > 
> >> when read or written in Double Transfer Rate (DTR) mode compared to
> >> Single Transfer Rate (STR) mode. If one writes D0 D1 D2 D3 bytes using
> >> 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will read back
> >> D1 D0 D3 D2. Swapping the bytes is a bad design decision because this may
> >> introduce some endianness problems. It can affect the boot sequence if the
> >> entire boot sequence is not handled in either 8D-8D-8D mode or 1-1-1 mode.
> >> Fortunately there are controllers that can swap back the bytes at runtime,
> >> fixing the endiannesses. Provide a way for the upper layers to specify the
> >> byte order in DTR mode.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  include/linux/spi/spi-mem.h | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> >> index 85e2ff7b840d..e1878417420c 100644
> >> --- a/include/linux/spi/spi-mem.h
> >> +++ b/include/linux/spi/spi-mem.h
> >> @@ -89,6 +89,8 @@ enum spi_mem_data_dir {
> >>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
> >>   * @data.buswidth: number of IO lanes used to send/receive the data
> >>   * @data.dtr: whether the data should be sent in DTR mode or not
> >> + * @data.dtr_bswap16: whether the byte order of 16-bit words is swapped when
> >> + *                 read or written in DTR mode compared to STR mode.
> >>   * @data.dir: direction of the transfer
> >>   * @data.nbytes: number of data bytes to send/receive. Can be zero if the
> >>   *            operation does not involve transferring data
> >> @@ -119,6 +121,7 @@ struct spi_mem_op {
> >>       struct {
> >>               u8 buswidth;
> >>               u8 dtr : 1;
> >> +             u8 dtr_bswap16 : 1;
> 
> but I would keep this name here as it is, without prepending octal.

I won't nitpick much on the member name as long as the comment 
describing its role is clear enough.

> 
> > 
> > You also need to add this capability to spi_controller_mem_caps and
> > update spi_mem_default_supports_op() to check for it.
> 
> sure, will do.
> 
> Thanks!
> ta
> > 
> >>               enum spi_mem_data_dir dir;
> >>               unsigned int nbytes;
> >>               union {
> >> --
> >> 2.25.1
> >>
> > 
> > --
> > Regards,
> > Pratyush Yadav
> > Texas Instruments Inc.
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
