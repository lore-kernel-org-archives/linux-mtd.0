Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE5C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60AD521872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JbjXNzkw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60AD521872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eTOh53BPpG9BL5n06mt62s5n/0gEZcTm86euaDuo7D0=; b=JbjXNzkwCZssAJby1MNSBa5VC
	BxTod5ttaQ/QQHxWettWZdNSrIr/+fn0zR2NOVf1UfRB1H04lBz75eQPJ20qyk0CnD0RFbchW/qJv
	XNT5WTae/DJIZeJ2hV3byL0wQnlmMVF4BHeXv/Qh+v0vUBWLBdZxDfJu91sDwMnxdOpMdD/w8cA6p
	CgZcnwh9la5hto+Gixk0RBJrtiIQXzkcDrRlWJi4UgYZTTUsT13osHznMpAIYng19UOxwOCN/hD7m
	F/L3OYOaSopjAxzJvArhTl8kFIr9o2LxT3NaOfxVxyRTFYuB0FaWIS/azj2aCjvA0oD0qsmq++roc
	kqQX9OK8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmZwU-0008SJ-En; Thu, 24 Jan 2019 08:00:54 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmZwM-0008Jn-Vg
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 08:00:51 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 71282A170A;
 Thu, 24 Jan 2019 09:00:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id gEcljLBwS26K; Thu, 24 Jan 2019 09:00:44 +0100 (CET)
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
 <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
 <20190123132249.2e7f65a2@bbrezillon>
 <358c78d9-6507-3998-a065-ddd18809d02b@denx.de>
 <20190123134050.7efe59a6@bbrezillon> <20190123135735.358fc9a6@bbrezillon>
 <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
 <20190124085018.2ad33dab@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <39d6edd9-14ad-8110-b618-6454f6840b28@denx.de>
Date: Thu, 24 Jan 2019 09:00:43 +0100
MIME-Version: 1.0
In-Reply-To: <20190124085018.2ad33dab@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_000047_754773_144E54E1 
X-CRM114-Status: GOOD (  17.12  )
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

On 24.01.19 08:50, Boris Brezillon wrote:
> On Thu, 24 Jan 2019 08:35:32 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>> On 23.01.19 13:57, Boris Brezillon wrote:
>>> On Wed, 23 Jan 2019 13:40:50 +0100
>>> Boris Brezillon <bbrezillon@kernel.org> wrote:
>>>    
>>>>> This definitely does look better. I assume that we are we on the
>>>>> right track now?
>>>>
>>>> Yep, and it confirms the ECC caps => 8bits/512bytes. Will send a proper
>>>> commit for the fix I did and Cc you so you can add your
>>>> Tested-by/Reviewed-by.
>>>
>>> Oh, looks like a side-effect of migrating to the dirmap approach
>>> (merged in nand/next [1]) is that this bug does not exist. Can you test
>>> the nand/next branch and let me know if it still works?
>>>
>>> [1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next
>>
>> Unfortunately this does not seem to work. I was unable to boot my
>> platform from this branch directly so I rebased all MTD/NAND related
>> patches on top of the latest kernel.org tree for this.
> 
> You mean linux-next?

No. I can try linux-next as well if necessary.
  
>> Here a log
>> with this version (new error this time):
>>
>> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
>> incremental biterrors test
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
>>           error 5 (Input/output error)
>> Failed to write page 0 in block 0
>>
>> Here a log with nandwrite errors:
>>
>> root@mt7688:~# flash_erase /dev/mtd5 0 1
>> Erasing 128 Kibyte @ 0 -- 100 % complete
>> root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
>> Writing data to block 0 at offset 0x0
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
>>           error 5 (Input/output error)
>> Erasing failed write from 00000000 to 0x01ffff
> 
> Weird, I wasn't expecting ERASE to fail (nothing changed in the erase
> path).
> 
>> Writing data to block 1 at offset 0x20000
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 1, offset 0)
>>           error 5 (Input/output error)
>> Erasing failed write from 0x020000 to 0x03ffff
>> Writing data to block 2 at offset 0x40000
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 2, offset 0)
>>           error 5 (Input/output error)
>> Erasing failed write from 0x040000 to 0x05ffff
>> ...
>>
>> Any ideas on this?
> 
> Try to revert b47b307ac23d ("mtd: spinand: Use the spi-mem dirmap API").

Then I get this error again:

root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
incremental biterrors test
Failed to recover 1 bitflips
Read error after 0 bit errors per page

And with your patch from yesterday applied:

root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 1/7
Read reported 4 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 3/7
Read reported 4 corrected bit errors
Successfully corrected 2 bit errors per subpage
Inserted biterror @ 5/7
Read reported 4 corrected bit errors
Successfully corrected 3 bit errors per subpage
Inserted biterror @ 7/7
Read reported 4 corrected bit errors
Successfully corrected 4 bit errors per subpage
Inserted biterror @ 8/7
Read reported 5 corrected bit errors
Successfully corrected 5 bit errors per subpage
Inserted biterror @ 10/7
Read reported 6 corrected bit errors
Successfully corrected 6 bit errors per subpage
Inserted biterror @ 12/7
Read reported 7 corrected bit errors
Successfully corrected 7 bit errors per subpage
Inserted biterror @ 14/7
Read reported 8 corrected bit errors
Successfully corrected 8 bit errors per subpage
Inserted biterror @ 17/7
Failed to recover 1 bitflips
Read error after 9 bit errors per page

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
