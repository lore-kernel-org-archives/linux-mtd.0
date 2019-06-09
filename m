Return-Path: <SRS0=Yh92=UI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E42C28EBD
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 15:26:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40DF2206DF
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 15:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UF9VOHfk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNDlmBD0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DF2206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWdD6Uxwu0MU6kBsiQGn1Z3CsI8tFq3hxM3UYNqiIzI=; b=UF9VOHfk7IrveL
	z2Sre5MBwIZ3ThI+LMmI0T2R/40gNENfIzisrqc/cl165k5wnJv4ZKautKkNgd18JgF2sgYreSpLq
	ezfUU2nvEoNa3zFU1iGiPnet87c2cclw5R50w6+GQRJsKUruMHHHeTvgKvTn8cm1LyGHiZs/vqbub
	SeE+HIlOmJHvI/jkzTAY/yUAyXLXgqta1nvrbAtNUJ8pImxqQLlz6pVlW6sJyvs5bCakRgPIG20Yi
	QQNLekWmucHMJ5X1Z5GIVxxbaS2g3OlBWlmVUBc9OmP27mYrjVfgUn3q8HeJYnCCfDQXgcKWULAEv
	MWseUa+PLwYAdz8/94Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZzhn-0001H6-8t; Sun, 09 Jun 2019 15:25:59 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZzhk-0001Gn-9Y
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2019 15:25:57 +0000
Received: by mail-it1-x143.google.com with SMTP id v193so8525037itc.0
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2019 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YxI1WwfIam4PltsMt4JfNtCcDGC+3HMEYpceh27Lb2I=;
 b=eNDlmBD0bDIN0OpMCxKfABkcCCWU6HygbIjODy1O0MJT2qaZUeCplDxdTTyWtTp14g
 ACE9ySVOnL8cVxEuptom2A6MTb0cERlhY7a4r9myo7ppbJV2g2eAmGgv1Gj7IKNWYdVy
 ZzqwJkjFW5PVx+U8c0szcsiejfX+phrKekEoVpIG4ohi1x9eQH+z7Ne2IZHlRfIgWxSO
 QVmYWec5MQMnh0KZKSQwKzMwqay3MUmQ4pUDUMMqfaBK4wPxy4+kBO19AFuejGf7hEbn
 wjGjfIOdOZmZQoR8s+nUwfH5Hy6kzx1t3hkEBN0/gaJsl2439kElirtaNxpNqTxBoMwX
 UTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxI1WwfIam4PltsMt4JfNtCcDGC+3HMEYpceh27Lb2I=;
 b=J69P36+YVANatz/vIGrglQhjYmIgFWx2E5K/HH8mn9BpqliR0pdjODOsko7W72lXMF
 O+crNB6p0BX9kl/l4ah87T1JpZIwhmEmdx6Ixy1q7z2+flDDNpmWEzx2lxXuskYQukDz
 AEKRAYyJ9LqlPxGGsUX4DBfrm2aiu8+3+hz2GHMD2D0uNq1l8FNeboL57SQgEVzDYze5
 Q5HNuZfvnfyPPKVewt5R6yg9DO8qtQA8zAz8Ki3IlHwzPKjhBwrna3gx/dXBz6WOv8nJ
 oPVOFHEG5JS0ASM1irjdf2qAL4R7CYGaGqEpZRivk7YYocpye2Jyf5uMgrrX+NeaT/lt
 V44g==
X-Gm-Message-State: APjAAAWFeXKi6zzJ2yB0e4t1I+L0zN1gjnmETum5/VHCkpWcrbIjh12r
 K5z/GeizqAMZPjO52+EobnHzVSOMAmp4FpdylkQ=
X-Google-Smtp-Source: APXvYqxnvY+/TlpKPqnvSPXQYcXIuO5OT7CVqRAquMqUhnq9UMZxZjlnqoNaOH0m0Dr5x8DngnmVPMpdQXsOd1XMFtk=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr41226500jao.82.1560093954012; 
 Sun, 09 Jun 2019 08:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <CAFLxGvx4iqpU8pq8CPwah9M+Qa2YkpXEiSmndeVy2mLadNQn_g@mail.gmail.com>
 <20190606210803.481cbc5d@sergmir.emcraft.com>
 <CAFLxGvy1BTuLkcn=7N=FG_q5cBgj5L1YzyhiakVFewYPyr6dzA@mail.gmail.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
 <CALLGbRJbb8oJfbgsOOaDsu8eueNiCJ_ubqdohBFXMRMLjKxVNA@mail.gmail.com>
 <a22bd2ccea58ceb5caafe922a059bfe7e5617134.camel@emcraft.com>
In-Reply-To: <a22bd2ccea58ceb5caafe922a059bfe7e5617134.camel@emcraft.com>
From: Steve deRosier <derosier@gmail.com>
Date: Sun, 9 Jun 2019 08:25:17 -0700
Message-ID: <CALLGbR+=Y6eHe10JDnHv5MNYzD0uiH9LVR0NojKbFLnuqL-4jA@mail.gmail.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
To: Sergei Poselenov <sposelenov@emcraft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_082556_362010_2E9ADA12 
X-CRM114-Status: GOOD (  17.32  )
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

Hi Sergei,

On Sun, Jun 9, 2019 at 1:32 AM Sergei Poselenov <sposelenov@emcraft.com> wrote:
>
> Hello Steve,
>
> Please see my comment below.
>

> > If I had to continue my guessing - the valid portion of the file
> > test2
> > that was successfully written is not a multiple of your NAND's page
> > size.  Likely you've got 2Kb pages with 4 512 byte subpages.  The
> > last
> > page of that flash that was written for that file wrote three of the
> > four subpages.  When you `dd` the file overwrite the existing file,
> Looks like you are right, what I'm seeing is that only 3 of 4 512-bytes
> subpages written correctly.
>
> So, you are saying that the NAND controller (or the kernel device
> driver?) returned "success" for the "4K page write" operation, while
> that wasn't actually true?
>
>

No, that's not what I'm saying.  I'm saying the NAND was written
exactly as you specified.  You basically said: "write these bytes from
this page, ignoring the fact that the space I'm writing to is too
long". Flash gets erased and written in pages and subpages
(respectively). My suspicion is that your test case itself causes the
issue.  UBIFS, nor any filesystem will protect a file from getting
corrupted when the power goes out when you write it. It also can't
protect you from purposely corrupting a file with you test-case. The
purpose of UBIFS's power-cut tolerance is to be sure the filesystem
itself doesn't corrupt and can still boot.

While I'm still pretty sure your test case is the cause of the
corruption itself, I tried the basics (minus the power cut) to test a
part of my theory. Namely the dd of the partial page with notrunc is
the source of your problem.  On my platform, on a single test, I
couldn't replicate what I think is happening.  However, that's hardly
conclusive because I _know_ I'm using different hardware and software
stack than you.

So, let's start back at the basics:

* What is your processor hardware? You said "based on i.MX 6ULL", but
let's be 100% specific.
* What is your NAND chip?
* What is the layout of the NAND chip (sectors, pages, subpages)?
* What ECC level are you using?
* What version of Linux are you using (all three x.y.z, preferably
with a reference to the actual git branch you're using, vendor or
stock)
* What NAND controller driver are you using?
* What NAND chip driver are you using?

And finally:
* Do you see overall UBIFS corruption? In other words, when the device
boots, do you see it unable to correct a problem caused by the power
cut?

Read the link Richard sent you. The basic rule is: "...applications
should not assume anything about the contents of files which were not
synchronized before a power-cut has happened. " Having -osync on
doesn't mean your file was synced if the power-cut comes in the middle
of a write. It just means that the OS is going to do the sync
automatically (per the semantics) so you don't have to issue a sync
command.

I think UBIFS is behaving as designed and intended and your test-case
and expectations are flawed.  However, please give the asked for
details, actual logs and data dumps and if there's a bug here it'll
get looked at.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
