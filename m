Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32DDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xm70CrFLYI9RmedDDIPHqvPZv4Y/Vk5ffMhuiBtgOUI=; b=KuZIBOflmbnplRcUzesbepI++c
	Plzb3q7dapxqsjp9ji502kz7yz8tPVIUiZKqCnpvfkz8YGYy0dNev8J3SfjeB14wQIVyJOiGT8VKb
	lx+JatVzVDzn/rYKVcz6mWYtd1kQ2f4Rhagi+LGReqD6PT2rDozVJW/DKpsmMi0IvRwGCeVcLvJaj
	nuQtib/Fov0zsgzPqB1eGQs7NEhCZCoxFxfVpxKMqIbHwa0NuTh5U1I6rJkIvq5xSmESn5bqEbSnP
	9N5tTYwnBvGSYrYUCmoMy268eTa+j71tRsB40svWCblhe/VuTqsZqAAQ9pEcpQk3B9i+w3bBspgwM
	KOcfY0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUPCx-00CAKu-Qo; Wed, 16 Mar 2022 08:40:39 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUPCG-00C9v7-6P
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 08:39:59 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B4D912223E;
 Wed, 16 Mar 2022 09:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647419990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfWEyVdNhZ2PEbQ7xLSXglp7UcYPsmqDrsv7e0s9JhA=;
 b=BaKtRWUqplLjFdATAVwcnIXV8nbQ51yM+K4qZ++8hd8s5flFZjiaJoEAIlCC+aJKmvf//V
 FArxoXQyWkOcWvnvVtAy1ih5ZuFDyLNlnSIdZQ5CJLmrduoaotqd38R3ArdxHSK2Yp1evs
 skS46O66wMZw0ZFQqN9iHY0wN9T6gIc=
MIME-Version: 1.0
Date: Wed, 16 Mar 2022 09:39:48 +0100
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor.Ambarus@microchip.com, p.yadav@ti.com, broonie@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Nicolas.Ferre@microchip.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw,
 andreasilvagni@macronix.com
Subject: Re: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
In-Reply-To: <8e6e3dcb-0771-560f-4eb8-d49e7cf1f1df@ti.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
 <9e0b6bde-838d-b8a4-9fe7-75c4f916fb27@microchip.com>
 <8e6e3dcb-0771-560f-4eb8-d49e7cf1f1df@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <09fe05b41a8b325150d44969ebf39d01@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_013957_096167_3C011AF6 
X-CRM114-Status: GOOD (  36.97  )
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

Am 2022-03-16 08:08, schrieb Vignesh Raghavendra:
> On 15/03/22 12:28 pm, Tudor.Ambarus@microchip.com wrote:
>> On 3/15/22 08:08, Vignesh Raghavendra wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>> know the content is safe
>>> 
>>> Hi,
>> 
>> Hi,
>> 
>>> 
>>> On 11/03/22 1:31 pm, Tudor Ambarus wrote:
>>>> There are NOR flashes (Macronix) that swap the bytes on a 16-bit 
>>>> boundary
>>>> when configured in Octal DTR mode. The byte order of 16-bit words is
>>>> swapped when read or written in Octal Double Transfer Rate (DTR) 
>>>> mode
>>>> compared to Single Transfer Rate (STR) modes. If one writes D0 D1 D2 
>>>> D3
>>>> bytes using 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it 
>>>> will
>>>> read back D1 D0 D3 D2. Swapping the bytes is a bad design decision 
>>>> because
>>>> it may introduce some endianness problems. It can affect the boot 
>>>> sequence
>>>> if the entire boot sequence is not handled in either 8D-8D-8D mode 
>>>> or 1-1-1
>>>> mode. So we must swap the bytes back to have the same byte order as 
>>>> in STR
>>>> modes. Fortunately there are controllers that can swap the bytes 
>>>> back at
>>>> runtime, addressing the flash's endiannesses requirements.
>>>> If the controllers are not capable of swapping the bytes, the 
>>>> protocol is
>>>> downgraded via spi_nor_spimem_adjust_hwcaps(). When available, the 
>>>> swapping
>>>> of the bytes is always done regardless if it's a data or register 
>>>> access,
>>>> so that we comply with the JESD216 requirements: "Byte order of 
>>>> 16-bit
>>>> words is swapped when read in 8D-8D-8D mode compared to 1-1-1".
>>>> 
>>> 
>>> Sorry, bit late to the thread. But, dropping 8D-8D-8D mode support is
>> 
>> no worries
>> 
>>> quite restrictive IMO.
>>> 
>>> AFAIK, SFDP standard does not dictate how data should be stored in 
>>> flash
>>> or how SW should interpret after reading data from flash. It merely
>>> indicates endian-ness compared to 1-1-1 mode.
>>> 
>>> So, its up to various system SWs like bootloader/Linux to work 
>>> according
>>> to pre-aligned layout as there is no rule that data needs to be 
>>> stored
>>> in byte order.
>>> 
>>> We have two types of controllers:
>>> 
>>> 1. SPI controllers supporting swapping endian-ness on the fly:
>>> -> For such flashes, better choice is to have SWAP option always
>>> enabled. So that data written in 8D-8D-8D mode can be read correctly 
>>> in
>>> 1-1-1 mode and vice-versa.
>>> ( I am assuming SWAP option of controller is only effective in 
>>> 8D-8D-8D
>>> mode and is NOP in 1-1-1 or other modes)
>>> 
>>> But, its possible that "ROM" or other non-upgradable SWs may choose 
>>> not
>>> make to use of this SWAP option of HW to keep things simple in which
>>> case, they cannot boot from 8D-8D-8D mode with above setting. Such SW
>>> don't always have knowledge of flash and cannot be forced to have a
>>> constraint to enable byte swap on read.
>>> 
>>> So, IMO, its best left to system integrators to specify whether or 
>>> not
>>> SWAP option needs to be enabled (perhaps via DT as its per flash
>>> specific property?)
>> 
>> we can't use DT for configuration, maybe a Kconfig instead. Are there 
>> any
>> other options?
>> 
> 
> Problem with Kconfig is that it cannot be used when there are multiple
> flash instances on the board and both behave differently.
> 
> This is similar to big-endian vs little-endian property used by CFI
> physmap driver and other places in kernel[1]

On more thing to consider is that if we are using Kconfig things
cannot be changed during runtime. While this might be ok when you
are building your typical embedded distribution, there are efforts
to be able to boot standard distributions on embedded platforms (see
ARM SystemReady). A Kconfig option won't work there.

-michael

>>> 
>>> 2.  SPI controllers don't support endian-ness SWAP on the fly:
>>> It is still possible to reliably read and write data as long as its
>>> written and read back in same mode.
>>> 
>>> De-rating speeds because of absence of this support would mean 
>>> reduction
>>> of speed by **16 times** (maybe even higher as 8D mode tends to 
>>> support
>>> higher bus freqs). Swapping bytes in Linux before writing or after
>>> reading is not an option either as it negatively impacts performance.
>>> 
>>> Asking ROM/bootloaders to swap bytes based on SFDP indication is
>>> restrictive too as it involves boot time penalty and most systems 
>>> with
>>> OSPI flashes are using them to achieve super fast boot times.
>>> 
>>> One more case to consider is flashes that dont have SFDP table to
>>> indicate byte order but follow Macronix's convention. In such cases, 
>>> its
>>> better for SPI NOR layer to be as dumb as possible and not really do 
>>> any
>>> byte swapping, leaving it up to user space to handle/interpret data
>>> appropriately.
>>> 
>>> Also, Macronix is probably in violation of xSPI spec (JESD251A 
>>> 6.9.5.2
>>> 8D-8D-8D Profile 1.0) where diagrams clearly show data output should 
>>> be
>>> D0 D1 D2 D3... So ROMs following xSPI spec (which is the only spec
>>> providing flash agnostic way of switching to 8D mode and reading data 
>>> in
>>> 8D mode) would not care about SFDP bit indicating byteorder and its 
>>> up
>>> to flasher programs to take care of the same
>> 
>> This is a bit in contradiction, because if the ROMs follow xSPI, thus 
>> little
>> endian byte order, they should swap the bytes.
>> 
> 
> As I indicated below xSPI (JESD251) spec seems to align on little 
> endian
> order. So, don't really need to swap the bytes on read. Anyways impact
> on performance prohibits such support and thus most ROM designs will
> expect flashing program to take care of it (especially in case where
> controller does not support on the fly swapping).
> 
>>> 
>>> IMO, kernel device drivers should just provide access to underlying 
>>> HW
>>> and not have too much intelligence to interpret data/take decisions
>>> 
>>> So, simpler constraint to put is:
>>> Flasher programs should program data in the same mode in which
>>> ROM/bootloder/Linux is expected to read the data on that system.
>> 
>> No, this constraint doesn't cover all possible cases: take a 1-1-1 
>> ROMcode,
>> 8D-8D-8D for other bootloaders and kernel. You need to dynamically 
>> change modes
>> in the flasher program in order to address this use case, which is a 
>> no go.
>> 
> 
> Flash programmer need not change the mode, but needs to generate a byte
> swapped image and write it knowing that image is being flashed in
> 8D-8D-8D mode and read in 1-1-1 mode or vice versa.
> 
>>> 
>>> For Macronix like flashes, if one has a ROM/bootloader that only
>>> supports 1-1-1 mode and flashing data in 8D-8D-8D mode with Linux, 
>>> then
>>> please generate a byte-swapped image offline and flash it. Don't 
>>> impose
>> 
>> we can't do that, see the example from above.
>> 
> 
> See above, no need to change mode dynamically.
> 
>>> penalty on systems that do best to handle this messy situation.
>>> I see this as the only option with least performance penalty.
>>> 
>> 
>> I take from this that we should let the byte swap be 
>> user-configurable,
>> thus a Kconfig. Which I'm not against it, but it will give users
>> headaches to sync all the software components. Making such a decision
>> implies that users know SPI NOR internal details, which also is a bit
>> stretched. Let's sync so that we move forward with this. Opinions?
>> 
> 
> I am fine with things being configurable
> 
> Only issues with Kconfig: it does not help systems with multiple OSPIs
> with different endian-ness.
> 
> 
> [1] Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> 
> 
> Regards
> Vignesh

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
