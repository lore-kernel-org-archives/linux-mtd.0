Return-Path: <SRS0=qE3A=UG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61D6C2BCA1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 16:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C5B20657
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 16:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqjIG2xp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVM/I6i3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C5B20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CjWq/zC/VEOAy7Y08Tgf5NISfwFvdMCCJrcTR5FCYU=; b=qqjIG2xpxwJ6Q9
	fmlnsSqUmGa4vtn5LeBKzSMBUvbj5/09px/bLWN1uKXQYXhdYiZFKlb/1hcZc1ZUxsGz9Tl+80PnH
	c0pBrI8HvLXTg8r+2izqKmXi4pt300Y6KiL/8Ml6v7o2HPqS1a/f15MDbS+Ffu0MnaDazFYkD4Y09
	/dmuyygaX9UJvLzPZlGyjphax1ivi6oLPzUp0xCY8PlVP2OEzCGMoXqt+7f7OR5vuF4MS6YRCX5pJ
	fykKi6k4rJ7KWayLUjXzEqIiV45jEjuQLadcn6JMVUqf8RDVDAXaSuwtpVdfv0NdaUG965JDyBzuI
	akY08hhwvsft9RKUwgpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZHJF-0006t9-Pz; Fri, 07 Jun 2019 16:01:41 +0000
Received: from mail-it1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZHJD-0006sn-GB
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2019 16:01:40 +0000
Received: by mail-it1-x12c.google.com with SMTP id a186so3504250itg.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jun 2019 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Chg9BlRJ0VttwiZUqjLYmh2LjT8ygI14pmJSx0JjTP8=;
 b=eVM/I6i3S2nJLMwmmEXkT2z+UUTOwTQZQyJRKToM8fGCsCnMweowxfok92upyXANoz
 wzXt0T4QtbxiBvxjaY1Zmg8uzgPDowP2xzzd75MEa3fzirlZb/o8CLEwgBealKh96aTL
 RegXgq75/9b9jsosXOWF+PztMIE3Q30rTm6dT6Ya5x5/N0PMHrNRzMkmODyViSoWgbQD
 31K/1qzSXL1pSeR4Q5tRZGm7vptXLkbHzea0JOQFcGW6kHm7ygWXWKOMzfc7iJOdu5mv
 /aO9SQy8Z98TqBjEqrckDVAQFp7e7Wu9uwxPB6+ZFIAvgHjAkhErtSjHt8bxmxyTeFY3
 QyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Chg9BlRJ0VttwiZUqjLYmh2LjT8ygI14pmJSx0JjTP8=;
 b=HXsoMyFEAJ5X1b8eB+gl6SSqDfmXsr5Qx9G688yJrlK+B1hfFFHo1PK+oqkYSCauo0
 euxaWftLVGroLMbagi84eWlckCVCQFPHOF67JR2gka48fCf6/+NWZdPZ2MZ1yYyKlyiO
 hpUxa/PqhOHnLrsxS9ZiL5QZzb0awweDUe0BYP6UG26ahjUNAL2AyAyoIwl1U/YtDY9m
 x8o0QHWY/GrAnNkaukvgUHrdX6sNdtYz7yQGdDfqOJA/VWF8bRREQGSzs2kejgbD2ZRp
 Gos56xXYI/QpnFYZx9ReP6onA7EnY8fkjSIKDEo150RnYjsj0J4t3NowAQUxb2+eNtIY
 6DPg==
X-Gm-Message-State: APjAAAVfv6E0/gLbczjBzS0CmRirBQUB9oRXmna6Vtz18i+4vNLRymLu
 X/Q0Dn/C1fFVithXdO+6OP4EPHyfWlG1nGEnkXbIB9NP
X-Google-Smtp-Source: APXvYqyRKOFMKMj+21aBn3RfuGA4E+z21YQ8yyUgCDxLlFtbEBQCQcMjGloLAVuqXrX7bwu7rRkuyLOI/32vscADXsI=
X-Received: by 2002:a02:c952:: with SMTP id u18mr12584840jao.23.1559923296848; 
 Fri, 07 Jun 2019 09:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <CAFLxGvx4iqpU8pq8CPwah9M+Qa2YkpXEiSmndeVy2mLadNQn_g@mail.gmail.com>
 <20190606210803.481cbc5d@sergmir.emcraft.com>
 <CAFLxGvy1BTuLkcn=7N=FG_q5cBgj5L1YzyhiakVFewYPyr6dzA@mail.gmail.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
In-Reply-To: <20190607172355.6541fa51@sergmir.emcraft.com>
From: Steve deRosier <derosier@gmail.com>
Date: Fri, 7 Jun 2019 09:01:00 -0700
Message-ID: <CALLGbRJbb8oJfbgsOOaDsu8eueNiCJ_ubqdohBFXMRMLjKxVNA@mail.gmail.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
To: Sergei Poselenov <sposelenov@emcraft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_090139_560516_70595870 
X-CRM114-Status: GOOD (  15.64  )
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

On Fri, Jun 7, 2019 at 7:24 AM Sergei Poselenov <sposelenov@emcraft.com> wrote:
>
> Hello Richard,
>
> On Thu, 6 Jun 2019 20:13:07 +0200 Richard Weinberger <richard.weinberger@gmail.com> wrote:
>
> > On Thu, Jun 6, 2019 at 8:08 PM Sergei Poselenov <sposelenov@emcraft.com> wrote:
> > > This is understood. However, on the file length that is written to the partition, I'd expect that the file content will be the same as in the original file. This is not so.
> > > Is it expected, or is it a deficiency of UBI?
> >
> > Please show in detail what you are doing, on syscall level, and what
> > the expected output is.
> >
>
> Here is my test:
...
>
> However, upon retry of the very same test from the beginning (with the power cut-off in the middle) it's easily to have the content of test2 (exactly the last 512 bytes in my case) which doesn't match test0, so "dd if=test2 of=test0 conv=notrunc" will result in test0 with a different checksum.
>

IMHO, your test is invalid and it's your expectations that are wrong.
The file didn't finish writing because you did a power-cut. If I had
to guess, those exactly "last 512 bytes", are the size of your page or
subpage on the NAND flash, and I'd bet they're filled with 0xFF.
Unlike other filesystem media, writing flash media is done in pages,
where they're erased and then written, and erasing and writing is slow
and complex process.

If I had to continue my guessing - the valid portion of the file test2
that was successfully written is not a multiple of your NAND's page
size.  Likely you've got 2Kb pages with 4 512 byte subpages.  The last
page of that flash that was written for that file wrote three of the
four subpages.  When you `dd` the file overwrite the existing file,
you corrupt it yourself by using the no-trim option - for each page
from the start of test0, it erases, writes the page from test2, until
it gets to the last page of test2 where it erases the page, writes
three subpages, and leaves the last subpage as erased, but now you've
got invalid data in the middle of your file because you don't trim the
size to the write and so the erased data is now part of your file.

You're seeing a hardware effect and expecting a software result.

Simple fact is - a power cut when writing a large file, even with sync
on, will result in an invalid (short) file.  UBIFS (nor ANY
filesystem) can not protect against that. UBIFS is doing it's job by
making sure your filesystem is still usable after the power cut
despite it being in the middle of a write.  Which, since your system
is booting and you're not posting any kernel logs showing corrupted
filesystem, it seems to me that UBIFS is doing what it is supposed to.

If you want to understand more, the mtd website is a good start, and
you should absolutely read all the datasheets and app notes for the
flash device and the NAND interface you're using.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
