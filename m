Return-Path: <SRS0=26vX=L3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D35C07E97
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 16:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D491661628
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 16:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D491661628
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=figgyc.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=66RXm75WrRSl+89c6HL83/Oo6N9WmtUS/1LNikyKH40=; b=yINjugQPR8tljjanMCztM9nUm0
	QFMD/Er51E49/PC0q7Sy5+IlZ35UUvGSLBwlU+LcAsFabtx+Kllkv1msxpr19jpRqWlaHEc78SSjI
	sF6JGWLovu3XFNNEjE2Hdw88aFhdBoowLUwg7qJHRsDtWYgeHpopJSrh/FtsqEIn8MKGqtiPADKi4
	RhYPZFXWkKoCq31iseyjPJJV5E25lXs/R139fawHfB8Cs9239lKe5rCliBc+yhEyJgvvfUy1YEWQE
	VH6R7baCNW7y6mZChpYG4JFMUobm6p+ZECBm0kdn5YhVWTyEXg5zI3w2CEaYEMUU5wQsi8kVJLRWh
	Cuu6y6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzi3G-00551y-H1; Sat, 03 Jul 2021 15:59:30 +0000
Received: from mail.figgyc.uk ([204.13.154.60])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzi3C-00551J-TA
 for linux-mtd@lists.infradead.org; Sat, 03 Jul 2021 15:59:28 +0000
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
 <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
 <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
 <f79a55f2-3f89-55a9-5cee-ae50d1fc0a47@david-bauer.net>
 <bccdfd0008c0f5482ae9f1b78dba3624@walle.cc>
 <b650bf50-0a66-e772-5ebb-5336fa818e02@david-bauer.net>
 <88451011-067b-ffd0-fd21-985a08a5aee0@microchip.com>
 <a0b94408-947a-a3ba-8685-8249e754eafb@microchip.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=figgyc.uk; s=mail;
 t=1625327955; bh=GB0Zo+BSpnrZzpTpQNpRcqHrfuZ9xeNSrjHUmRC7DIM=;
 h=References:From:To:Cc:Subject:In-reply-to:Date;
 b=V2wt0WSu2d2rtTzARr/3pT5yKyATpHmQf6GFRQkTjA3cb1F6DAeRmWLni90zt9WgZ
 n/ev+GSiMP7IzoGuJgfzWWSSbYynytnscQbGzEPfEDIzirI/HgSuyK66eERTSexsEl
 Ys3Hvn3TG3DPMKrU11ce301qpg0WZy8pCXhtTEEY=
From: George Brooke <figgyc@figgyc.uk>
To: Tudor.Ambarus@microchip.com
Cc: mail@david-bauer.net, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
In-reply-to: <a0b94408-947a-a3ba-8685-8249e754eafb@microchip.com>
Date: Sat, 03 Jul 2021 16:58:57 +0100
Message-ID: <86sg0vmlry.fsf@figgyc.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_085927_006463_65511F4E 
X-CRM114-Status: GOOD (  36.36  )
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

Hi Tudor,

Tudor.Ambarus@microchip.com writes:

> On 6/28/21 8:48 AM, Tudor.Ambarus@microchip.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 5/18/21 10:39 PM, David Bauer wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hi Michael,
>>>
>>> Sorry for the late reply, was not feeling well past week.
>>>
>>> On 5/10/21 1:22 PM, Michael Walle wrote:
>>>> Hi David,
>>>>
>>>> Am 2021-05-10 13:04, schrieb David Bauer:
>>>>> On 5/10/21 12:56 PM, Michael Walle wrote:
>>>>>> Am 2021-05-10 12:27, schrieb David Bauer:
>>>>>>> On 5/10/21 11:35 AM, Michael Walle wrote:
>>>>>>>> Am 2021-05-10 11:28, schrieb David Bauer:
>>>>>>>>> On 5/10/21 10:00 AM, Michael Walle wrote
>>>>>>>>>
>>>>>>>>> [...]
>>>>>>>>>
>>>>>>>>>>> +static const struct flash_info bohong_parts[] = {
>>>>>>>>>>> +    /* BoHong Microelectronics */
>>>>>>>>>>> +    { "bh25q128as", INFO(0x684018, 0, 64 * 1024, 256,
>>>>>>>>>>
>>>>>>>>>> I couldn't find "BoHong" in JEP106BC. 0x68 (without continuation codes)
>>>>>>>>>> is "Convex Computer". So this is wrong. OTOH I'm not sure, how many
>>>>>>>>>> SPI flashes "convex computer" have, if any ;) This company was brought
>>>>>>>>>> by HP in the end.
>>>>>>>>>>
>>>>>>>>>> In any case, this patch depends on how we handle continuation codes or
>>>>>>>>>> if we can handle them at all. Or if this flash just lie about its
>>>>>>>>>> manufacturer id and don't and CC.
>>>>>>>>>
>>>>>>>>> First of all, BoHong and Boya microelectronics seems to be the same
>>>>>>>>> company, as their datasheets seem to copy each other. There's not much
>>>>>>>>> information about either of both, so I'd say that's a fair assumption.
>>>>>>>>>
>>>>>>>>> Regarding the continuation codes, Boya is listed in bank nine, however
>>>>>>>>> in this case I should currently read an all 0x7f ID shouldn't I?
>>>>>>>>
>>>>>>>> I'd guess so, yes.
>>>>>>>>
>>>>>>>>> The datasheet also only specifies 3 bytes as a return value for
>>>>>>>>> register 0x9fh :(
>>>>>>>>
>>>>>>>> Yeah. So, this flash falls into the same category "simply hijacks
>>>>>>>> a manuf id" as all the other flashes.
>>>>>>>
>>>>>>> From a quick check, this is also be the case for GigaDevices and XMC.
>>>>>>>
>>>>>>> My spontaneous idea would be to extend support for JEDEC IDs to read
>>>>>>> the up to 9 banks of the vendor ID and fix up the existing offenders.
>>>>>>
>>>>>> you mean gigadevices and xmc? I'd presume they are also lacking the
>>>>>> continuation bytes.
>>>>>
>>>>> Correct, same story with them.
>>>>>
>>>>>>
>>>>>>> To not break existing boards, we could either skip the continuation
>>>>>>> bytes of the kernel ID definitions for all flash chips or flag the
>>>>>>> already existing ones and only perform this on such flagged chips.
>>>>>>>
>>>>>>> Personally, I'd say that only performing this on existing chips would
>>>>>>> be better, as new vendors with this violation scheme might probably
>>>>>>> appear and cause conflicts.
>>>>>>>
>>>>>>> As we still lack auto detection for new chips with that, configuring
>>>>>>> the flash chip used with the chip name via DT would allow to set the
>>>>>>> exact chip used and also validate if the manufacturer / product after
>>>>>>> the continuation bits matches the one read from the chip.
>>>>>>>
>>>>>>> What do you think?
>>>>>>
>>>>>> If you'd ask me, unless there is a real world conflict, I'd just go
>>>>>> ahead and add them as is. If there is a conflict we'd need to find
>>>>>> a per device resolution for it.
>>>>>
>>>>> Okay, I'll resend a v2 with the removed copyright then.
>>>>
>>>> Could you also apply my SFDP patch [1] and send the dump (if there
>>>> is any)? Unfortunately, I can't think of a good way to do that along
>>>> with the patch and if this in some way regarded as copyrighted material.
>>>> So feel free to send it to me privately. I'm starting to build a
>>>> database.
>>>
>>> Bad news, I'm not able to get a SFDP with your patches, as the SFDP extraction
>>> fails at the version check.
>>>
>>> Is there anything else I can try?
>>>
>>
>> So no SFDP data?
>> Have you tried to read more of ID bytes, maybe there's an extended ID? Please
>> dump 15 bytes of ID.
>
> what's the difference between by25q128as and bh25q128as? I see they share the
> same flash ID.
>

I've got the by25q128as, so I compiled the SFDP and sysfs patch kernel
to read it out.

figgyc@figgyc-pi:~ $ ls /sys/class/spi_master/spi0/spi0.0/spi-nor/
jedec_id  manufacturer  partname
$ cat /sys/class/spi_master/spi0/spi0.0/spi-nor/jedec_id
684018
$ cat /sys/class/spi_master/spi0/spi0.0/spi-nor/manufacturer
boya
$ cat /sys/class/spi_master/spi0/spi0.0/spi-nor/partname
by25q128as
(this is using my patch for the chip support)

There was no sfdp file for me either, failed the version check like
David's chip (I added a dev_dbg to check).

One thing I noticed reading the datasheet[1] again was this line:
"Security Register 0 can be used to store the Flash Discoverable
Parameters, The feature is upon special order, please contact Boya
Microelectronics for details."
The same line is also present in the BoHong datasheet but it says
HuaHong instead of Boya. That makes me wonder if the meaning of
"Discoverable Parameters (SFDP) register" in the datasheet does not
actually mean that it has SFDP data programmed in by default, which
would be quite strange, but if true then that would be quite annoying
because then I don't think there are any differences between Boya and
BoHong. Very strange design decision in my opinion but it is what it
is.

The only other explanation I could think of is that erasing the chip
might erase security register 0? Unfortunately I only have one chip so
I can't test that. Even if that were the case it would still be
unhelpful.

I dumped extra ID in a previous email thread, IIRC it just loops, no
extra 7f bytes like there should be.

In conclusion it seems to me as though the two chips behave
identically, there's probably no way to know for certain though without
asking the manufacturer.

[1] http://www.bmsemi.com/upload/file/20180425/15246261557309416.pdf

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
