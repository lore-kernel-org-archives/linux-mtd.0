Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0192EC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 07:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A7221855
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 07:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oberT+Jf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A7221855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5gMFqNjXwVZ/sSMFLeUoqVgq7P3MnUAMtA3aj48Oy0w=; b=oberT+JfbfsWmZdoZJ/6WbeH8
	FHdGjEAxRjSng096Yj/0ndosr8DUUJBKazouXNZ8JXVPYvI0OconsvvwXUXYWcna7+uIQKjhLlOM7
	qWR/C+GpGqdjoyFiuFVfmVLj2NjEvgflTMtiBJ5Ql98maEzg7ULUleOEQh5UOpXibmd6T0M5k4QV/
	hm9cRqrXEm7/WQdViqFdKumyd0W++siMEkZPlprBxYNBWe139/Ke485iNhH54DcOyxUXEGg6VI1ql
	fSup4IybxY4VMM9pG0FTeHrUYz7lhBiYgRskHc6FD+9fW+Y7Cpmme0YR/9bJuxkj+HO4xhryJUukw
	9Y1wHdh8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmZYA-0001tZ-Dr; Thu, 24 Jan 2019 07:35:46 +0000
Received: from mx2a.mailbox.org ([2001:67c:2050:104:0:2:25:2]
 helo=mx2.mailbox.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmZY6-0001sz-I2
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 07:35:44 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 088F9A11C6;
 Thu, 24 Jan 2019 08:35:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id Al5WAlPTIQlz; Thu, 24 Jan 2019 08:35:35 +0100 (CET)
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
From: Stefan Roese <sr@denx.de>
Message-ID: <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
Date: Thu, 24 Jan 2019 08:35:32 +0100
MIME-Version: 1.0
In-Reply-To: <20190123135735.358fc9a6@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_233542_742070_953AD642 
X-CRM114-Status: GOOD (  17.02  )
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

On 23.01.19 13:57, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 13:40:50 +0100
> Boris Brezillon <bbrezillon@kernel.org> wrote:
> 
>>> This definitely does look better. I assume that we are we on the
>>> right track now?
>>
>> Yep, and it confirms the ECC caps => 8bits/512bytes. Will send a proper
>> commit for the fix I did and Cc you so you can add your
>> Tested-by/Reviewed-by.
> 
> Oh, looks like a side-effect of migrating to the dirmap approach
> (merged in nand/next [1]) is that this bug does not exist. Can you test
> the nand/next branch and let me know if it still works?
> 
> [1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next

Unfortunately this does not seem to work. I was unable to boot my
platform from this branch directly so I rebased all MTD/NAND related
patches on top of the latest kernel.org tree for this. Here a log
with this version (new error this time):

root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
incremental biterrors test
libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
         error 5 (Input/output error)
Failed to write page 0 in block 0

Here a log with nandwrite errors:

root@mt7688:~# flash_erase /dev/mtd5 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
Writing data to block 0 at offset 0x0
libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
         error 5 (Input/output error)
Erasing failed write from 00000000 to 0x01ffff
Writing data to block 1 at offset 0x20000
libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 1, offset 0)
         error 5 (Input/output error)
Erasing failed write from 0x020000 to 0x03ffff
Writing data to block 2 at offset 0x40000
libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 2, offset 0)
         error 5 (Input/output error)
Erasing failed write from 0x040000 to 0x05ffff
...

Any ideas on this?

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
