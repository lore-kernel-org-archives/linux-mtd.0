Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF50C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 11:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D57F20861
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 11:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GneQp1OX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D57F20861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TNR/o2A5Im1N6SSJqRUXV+nsn9lVUpnMbZvIT1GqXOQ=; b=GneQp1OXu5a/YYIo052HEvd0o
	mJTzTMsrKHWq+TqG7fPGzGNuHf9DYLWY4eq4POR5K10BYndWA62fN/a50mc5EmfH+Vby5MNiJah76
	NW5fEKAGdJOzuVaknKjt9ENUq3ud0embAwDkuelnxZXZd2xXsBV1p4tNVr5TnmgQzLQJA/DQZUVXh
	O1YIM9SnPWhKGMHW31609Y44aEUGY0e6J6cAz6Tb7Xa9e/Y3hZVfQWiTEb+NYhDTxrjKb8Sf/76TY
	D7AG8SVLdnjkZOCksz9tmcRLGEmBtDWEfrSDzjB0Xa4j0OQGlDjENYfF1dAbcC/s3dbVVn+24m/ob
	BwYE7kfeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmGrC-0000wx-1d; Wed, 23 Jan 2019 11:38:10 +0000
Received: from mx2a.mailbox.org ([2001:67c:2050:104:0:2:25:2]
 helo=mx2.mailbox.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmGr7-0000wZ-5a
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 11:38:07 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 72529A16F5;
 Wed, 23 Jan 2019 12:37:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id UZsp5dHqpRsD; Wed, 23 Jan 2019 12:37:58 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
 <20190123103512.722095cd@bbrezillon>
 <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
 <20190123122514.0db87887@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
Date: Wed, 23 Jan 2019 12:37:57 +0100
MIME-Version: 1.0
In-Reply-To: <20190123122514.0db87887@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_033805_537037_5ADEE360 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23.01.19 12:25, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 11:04:36 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>> On 23.01.19 10:35, Boris Brezillon wrote:
>>> On Wed, 23 Jan 2019 10:06:59 +0100
>>> Stefan Roese <sr@denx.de> wrote:
>>>    
>>>> On 23.01.19 09:55, Boris Brezillon wrote:
>>>>> On Wed, 23 Jan 2019 09:23:47 +0100
>>>>> Stefan Roese <sr@denx.de> wrote:
>>>>>       
>>>>>>> This one doesn't, incremental mode (-i) should.
>>>>>>
>>>>>> Here you go:
>>>>>>
>>>>>> # ./nandbiterrs /dev/mtd5 -k -i
>>>>>> incremental biterrors test
>>>>>> Failed to recover 1 bitflips
>>>>>> Read error after 0 bit errors per page
>>>>>>
>>>>>> I'm still unsure how this helps here.
>>>>>
>>>>> It helps, it tells us the ECC doesn't work properly (fails to recover
>>>>> one bitflip), or maybe it's the raw accessors that don't don't work.
>>>>>       
>>>>>> Is there anything else I should test?
>>>>>
>>>>> Add traces to the get_ecc_status() func and print the status value.
>>>>
>>>> # ./nandbiterrs /dev/mtd5 -k -i
>>>> [   22.098436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>>>> [   22.117184] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>>>>
>>>> <snip many identical lines>
>>>>
>>>> [   23.085412] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>>>> incremental biterrors test
>>>> [   23.102973] gd5f1gq4u_ecc_get_status (124): status=0x20 status2=0x00
>>>> Failed to recover 1 bitflips
>>>
>>> Hm, looks like the ECC reports error as soon as you start writing to
>>> the NAND. Maybe we have a problem in the write path...
>>>    
>>>> Read error after 0 bit errors per page
>>>>
>>>> Strange, this does not seem to match what the datasheet tells us. Any
>>>> further ideas what I should test?
>>>
>>> Erase a block (save data before if you need to), write random data with
>>> the ECC enabled and dump it back (once in raw mode, once with ECC
>>> enabled):
>>>
>>> # flash_erase /dev/mtdX 0 1
>>> # nandwrite --input-size=<pagesize> /dev/mtdX /dev/urandom
>>> # nanddump -f /tmp/dump-ecc -l <pagesize> -o /dev/mtdX
>>> # nanddump -f /tmp/dump-raw -l <pagesize> -o -n /dev/mtdX
>>>
>>> Send me both dumps (plus the console output), and we'll see how it
>>> looks.
>>
>> Here you go:
>>
>> root@mt7688:~# flash_erase /dev/mtd5 0 1
>> Erasing 128 Kibyte @ 0 -- 100 % complete
>> root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
>> Writing data to block 0 at offset 0x0
>> root@mt7688:~# nanddump -f /tmp/dump-ecc -l 2048 -o /dev/mtd5
>> ECC failed: 0
>> ECC corrected:[  100.171120] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>>    0
>> Number of ba[  100.178436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>> d blocks: 2
>> Number of bbt blocks: 0
>> Block size 131072, page size 2048, OOB size 128
>> Dumping data starting at 0x00000000 and ending at 0x00000800...
>> root@mt7688:~# dmesg -c
>> [  100.171120] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>> [  100.178436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
>> root@mt7688:~# nanddump -f /tmp/dump-raw -l 2048 -o -n /dev/mtd5
>> Block size 131072, page size 2048, OOB size 128
>> Dumping data starting at 0x00000000 and ending at 0x00000800...
>> root@mt7688:~# dmesg -c
>> root@mt7688:~#
>>
>> The attached files are identical. Thanks for looking into this.
> 
> First weird thing, the first portion of OOB (bytes 0x800 to 0x83F) are
> set to 0x0, and I'd expect to have 0xff in there. BTW, can you try
> nandbiterrs again without the '-k'?

Same result:

root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
incremental biterrors test
[ 5748.988596] gd5f1gq4u_ecc_get_status (124): status=0x20 status2=0x00
Failed to recover 1 bitflips
Read error after 0 bit errors per page

And from your other mail:

> BTW, which version of the mtd-utils are you using?

I'm currently using the one provided with my Yocto build:

root@mt7688:~# mtdinfo --version
mtdinfo (mtd-utils) 2.0.1

I hope that is recent enough.

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
