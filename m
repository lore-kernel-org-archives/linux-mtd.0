Return-Path: <SRS0=Yh92=UI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC58C28EBD
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 08:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6C62083D
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 08:32:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+Fex1xR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6C62083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emcraft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzwoxYkFSW0Mc1nhWQvrAzD7qmfSr/ablAei3RHQVkc=; b=Q+Fex1xRucjuKe
	ShK263Z9TjrqRpqX0dVBxQr7e6kYuXoidAJrHV2jPwcecGPV61OKWO7PvuRbgZ7ldVk7dnQ27qSe0
	qoxZjYk+wybnJtbyFdLUlguJkvyjI94LzKLhy7PaK7uKyqc6AIiZnE2aJHKaF0Ig2sGv+L4GuAlyA
	L1EyzKiyHHrO3sU7/Xl8rKe+rEPzXlFBG2tQSHp9GVroAeJsLdNlILrvD/LcAeWhJmU/wGRqTD942
	dpcDhl8S7C2MzYNZqDD9/h+gMSZawJ/P762rv2x9EtQ7jP+NrBR9aZZuvOX/9DHfZ4s0F92DpeIDQ
	yPaII+Ws8c/h4ppLUCXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZtFg-0004OE-Ob; Sun, 09 Jun 2019 08:32:32 +0000
Received: from [176.110.122.116] (helo=ocean.emcraft.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZtFd-0004Nn-QR
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2019 08:32:31 +0000
Received: from [10.8.0.10] (helo=mehome.localdomain)
 by ocean.emcraft.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.76)
 (envelope-from <sposelenov@emcraft.com>)
 id 1hZtFZ-0005v6-G2; Sun, 09 Jun 2019 11:32:25 +0300
Message-ID: <a22bd2ccea58ceb5caafe922a059bfe7e5617134.camel@emcraft.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
From: Sergei Poselenov <sposelenov@emcraft.com>
To: Steve deRosier <derosier@gmail.com>
Date: Sun, 09 Jun 2019 11:32:24 +0300
In-Reply-To: <CALLGbRJbb8oJfbgsOOaDsu8eueNiCJ_ubqdohBFXMRMLjKxVNA@mail.gmail.com>
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <CAFLxGvx4iqpU8pq8CPwah9M+Qa2YkpXEiSmndeVy2mLadNQn_g@mail.gmail.com>
 <20190606210803.481cbc5d@sergmir.emcraft.com>
 <CAFLxGvy1BTuLkcn=7N=FG_q5cBgj5L1YzyhiakVFewYPyr6dzA@mail.gmail.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
 <CALLGbRJbb8oJfbgsOOaDsu8eueNiCJ_ubqdohBFXMRMLjKxVNA@mail.gmail.com>
Organization: Emcraft Systems
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_013230_240141_5377F13F 
X-CRM114-Status: GOOD (  23.23  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Steve,

Please see my comment below.

On Fri, 2019-06-07 at 09:01 -0700, Steve deRosier wrote:
> On Fri, Jun 7, 2019 at 7:24 AM Sergei Poselenov <
> sposelenov@emcraft.com> wrote:
> > Hello Richard,
> > 
> > On Thu, 6 Jun 2019 20:13:07 +0200 Richard Weinberger <
> > richard.weinberger@gmail.com> wrote:
> > 
> > > On Thu, Jun 6, 2019 at 8:08 PM Sergei Poselenov <
> > > sposelenov@emcraft.com> wrote:
> > > > This is understood. However, on the file length that is written
> > > > to the partition, I'd expect that the file content will be the
> > > > same as in the original file. This is not so.
> > > > Is it expected, or is it a deficiency of UBI?
> > > 
> > > Please show in detail what you are doing, on syscall level, and
> > > what
> > > the expected output is.
> > > 
> > 
> > Here is my test:
> ...
> > However, upon retry of the very same test from the beginning (with
> > the power cut-off in the middle) it's easily to have the content of
> > test2 (exactly the last 512 bytes in my case) which doesn't match
> > test0, so "dd if=test2 of=test0 conv=notrunc" will result in test0
> > with a different checksum.
> > 
> 
> IMHO, your test is invalid and it's your expectations that are wrong.
> The file didn't finish writing because you did a power-cut. If I had
> to guess, those exactly "last 512 bytes", are the size of your page
> or
> subpage on the NAND flash, and I'd bet they're filled with 0xFF.
Actually, in that last subpage I've seen 512 bytes of zeroes, or some
other data, but never 0xff.
> Unlike other filesystem media, writing flash media is done in pages,
> where they're erased and then written, and erasing and writing is
> slow
> and complex process.
> 
> If I had to continue my guessing - the valid portion of the file
> test2
> that was successfully written is not a multiple of your NAND's page
> size.  Likely you've got 2Kb pages with 4 512 byte subpages.  The
> last
> page of that flash that was written for that file wrote three of the
> four subpages.  When you `dd` the file overwrite the existing file,
Looks like you are right, what I'm seeing is that only 3 of 4 512-bytes 
subpages written correctly.

So, you are saying that the NAND controller (or the kernel device
driver?) returned "success" for the "4K page write" operation, while
that wasn't actually true?

Thanks!

Regards,
Sergei


> you corrupt it yourself by using the no-trim option - for each page
> from the start of test0, it erases, writes the page from test2, until
> it gets to the last page of test2 where it erases the page, writes
> three subpages, and leaves the last subpage as erased, but now you've
> got invalid data in the middle of your file because you don't trim
> the
> size to the write and so the erased data is now part of your file.
> 
> You're seeing a hardware effect and expecting a software result.
> 
> Simple fact is - a power cut when writing a large file, even with
> sync
> on, will result in an invalid (short) file.  UBIFS (nor ANY
> filesystem) can not protect against that. UBIFS is doing it's job by
> making sure your filesystem is still usable after the power cut
> despite it being in the middle of a write.  Which, since your system
> is booting and you're not posting any kernel logs showing corrupted
> filesystem, it seems to me that UBIFS is doing what it is supposed
> to.
> 
> If you want to understand more, the mtd website is a good start, and
> you should absolutely read all the datasheets and app notes for the
> flash device and the NAND interface you're using.
> 
> - Steve
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
