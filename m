Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B29C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 10:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A59A207D3
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 10:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="seQI5/DD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A59A207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwhwAZjAG9am0VyUjVAyJqwHQ5Jv0ckTo5tfzZRNsow=; b=seQI5/DDu0PSgP
	+YGn24RE8H3nzkdS+NoDj5jG35v3KS421DUxK1/L15ppC+OgE7pB6fVBqap5/rewU7Q4A68vS5FbX
	kzd/ZAzBOrFYPoKmiLs3gaFmhUZ3LUxwQQjDOblVA+Z6BD5U519QO9X3TJgm/ad/YipggNrbFunkt
	LPXgGFvCLRzkfGCWrRXgrTMYdWUfEcDoFO4HPQehgT7hPxWPmZuss00vf048yx6ZI1yJ2yisNAy2p
	lDy6CPFCgy7s36awIh6MP0VvpzTZ+h4rqKjDCNXOctFXtqS/lO2si1dRZtANmIWNtSa4hCsifq/5R
	naovviaEVH1+kPSYi/iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeG0B-0001Nm-LW; Thu, 28 May 2020 10:43:07 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeG08-0001MS-Gt
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 10:43:06 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 9237780307C0;
 Thu, 28 May 2020 10:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDWl3gmag4Ug; Thu, 28 May 2020 13:42:47 +0300 (MSK)
Date: Thu, 28 May 2020 13:42:45 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH RESEND v2] mtd: physmap: Add Baikal-T1 physically mapped
 ROMs support
Message-ID: <20200528104245.jurucbblufluyjut@mobilestation>
References: <20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru>
 <5f5fc883-1cf0-f0b8-11bb-a60b45d135cd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f5fc883-1cf0-f0b8-11bb-a60b45d135cd@ti.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_034304_914091_A4046C9A 
X-CRM114-Status: GOOD (  29.20  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
 Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
 Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
 Arnd Bergmann <arnd@arndb.de>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 28, 2020 at 03:36:55PM +0530, Vignesh Raghavendra wrote:
> Hi,
> 
> On 27/05/20 4:28 am, Serge Semin wrote:
> > Baikal-T1 Boot Controller provides an access to a RO storages, which are
> > physically mapped into the MMIO space. In particularly there are the
> > Internal ROM embedded into the SoC with a pre-installed firmware,
> > externally attached SPI flash (also accessed in the read-only mode) and a
> > memory region, which mirrors one of them in accordance with the currently
> > enabled system boot mode (also called Boot ROM).
> > 
> > This commit adds the ROMs support to the physmap driver of the MTD kernel
> > subsystem. Currently the driver only supports the Internal ROM, since
> > physically mapped SPI flash is utilized by the Baikal-T1 System Boot
> > Controller driver so won't be available over mtd-rom interface and
> > the Boot ROM mirror mapping has dependency on the SPI flash mapping
> > switcher available within the SPI flash registers space. The real access
> > to the Boot ROM memory will be added in future.
> > 
> > Note we had to create a dedicated code for the ROMs since read from the
> > corresponding memory regions must be done via the dword-aligned addresses.
> > In addition the driver in future states will have to take into account
> > that the Boot ROM might mirror the SPI flash region so before accessing it
> > the SPI flash direct mapping must be enabled by means of a dedicated flag
> > in the Baikal-T1 System SPI register flag.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> > Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> > Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> > Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> > Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> > Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: linux-mips@vger.kernel.org
> > 
> > ---
> > 
> > Miquel, Richard, Vignesh, the merge window is upon us, please review/merge
> > in/whatever this patch.
> > 
> > This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> > base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> > tag: v5.7-rc4
> > 
> > New vendor prefix will be added in the framework of the next patchset:
> > https://lkml.org/lkml/2020/5/6/1047
> 
> 
> Sorry, driver patch and dt bindings have to be proposed together...
> Driver cannot be accepted ahead of DT bindings been reviewed.

Understood. I'll fix it in v3. Thanks.

> 
> > 
> > Note since the next patchset is no longer relevant (as a result of a
> > discussion with @Lee and @Miquel)
> > https://lkml.org/lkml/2020/3/6/421
> > and Boot ROM mtd is currently unsupported I can freely submit this patch,
> > while in former case I had to wait for the patchset merged.
> > 
> 
> [...]
> > +static void __xipram bt1_rom_map_copy_from(struct map_info *map,
> > +					   void *to, unsigned long from,
> > +					   ssize_t len)
> > +{
> > +	void __iomem *src = map->virt + from;
> > +	ssize_t shift, chunk;
> > +	u32 data;
> > +
> > +	if (len <= 0 || from >= map->size)
> > +		return;
> > +
> > +	/* Make sure we don't go over the map limit. */
> > +	len = min_t(ssize_t, map->size - from, len);
> > +
> > +	/*
> > +	 * Since requested data size can be pretty big we have to implement
> > +	 * the copy procedure as optimal as possible. That's why it's split
> > +	 * up into the next three stages: unaligned head, aligned body,
> > +	 * unaligned tail.
> > +	 */
> > +	shift = (ssize_t)src & 0x3;
> > +	if (shift) {
> > +		chunk = min_t(ssize_t, 4 - shift, len);
> > +		data = readl_relaxed(src - shift);
> > +		memcpy(to, &data + shift, chunk);
> > +		src += chunk;
> > +		to += chunk;
> > +		len -= chunk;
> > +	}
> > +
> > +	while (len >= 4) {
> > +		data = readl_relaxed(src);
> > +		memcpy(to, &data, 4);
> > +		src += 4;
> > +		to += 4;
> > +		len -= 4;
> > +	}
> > +
> > +	if (len) {
> > +		data = readl_relaxed(src);
> > +		memcpy(to, &data, len);
> > +	}
> > +}
> > +
> > +static map_word __xipram bt1_rom_dummy_read(struct map_info *map,
> > +					  unsigned long ofs)
> > +{
> > +	map_word ret;
> > +
> > +	ret.x[0] = 0xFF;
> > +
> > +	return ret;
> > +}
> 

> Why define dummy_io for "baikal,bt1-boot-rom"? I don't see any use of
> adding a driver that always reads 0xFFs

This is supposed to be temporary solution for the baikal,bt1-boot-rom ROM.
The Boot ROM mirror might reflect either an embedded firmware or the SPI flash
directly mapped into the memory. In former case there is no problem, we can
freely read from the Boot ROM region. But in the later case the mirrored region
(memory mapped SPI flash) is not always accessible. If normal Boot SPI
controller is enabled, then the SPI flash mapping isn't accessible (any attempt
will cause a bus-error). In order to fix this we'd need a mutual exclusive lock,
which would disable the SPI controller while the mirrored memory mapped SPI flash
region needs to be accessed. Such mechanism isn't currently implemented, but it
will in be in the framework of my patch created for the SPI subsystem.

My idea was to just provide a dummy callback for now and replace it with normal
IO-methods with mutual exclusive lock-unlocks when the corresponding SPI driver
is accepted.

-Sergey

> 
> 
> > +
> > +/*
> > + * Currently Baikal-T1 SoC internal ROM is only supported. Boot ROM region is
> > + * dummy-data filled for now since in case of the system booted up from an
> > + * external SPI flash the ROM will mirror the Baikal-T1 System Boot SPI direct
> > + * mapping memory region. That region can be only accessed when transparent
> > + * mode is enabled, which we unable to do here because this feature is provided
> > + * by the SPI controller config space occupied by the corresponding driver.
> > + * In future we'll export the mode setting method from the Baikal-T1 System
> > + * Boot SPI Controller driver to also have the Boot ROM supported here.
> > + */
> > +static const struct of_device_id bt1_rom_of_match[] = {
> > +	{
> > +		.compatible = "baikal,bt1-int-rom",
> > +		.data = &bt1_rom_normal_io
> > +	},
> 
> > +	{
> > +		.compatible = "baikal,bt1-boot-rom",
> > +		.data = &bt1_rom_dummy_io
> > +	},
> > +	{ }
> 
> 
> 
> [...]
> 
> Regards
> Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
