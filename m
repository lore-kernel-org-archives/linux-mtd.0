Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2476C35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 02:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD35A20730
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 02:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GnRKSJiS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s853eTQc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD35A20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAr2Fa8fb24vYSdsV/zc69YaDsYLf5VfSoma1rnKUag=; b=GnRKSJiSB4RdrU
	QYrOWATFNrWwa+IO4PseM05ZNR+s+6Q82XcJbQm3pq67FgodAWU3f4+VolOJOPr/yprEzSDvWzzrN
	51p0Yr8IcksAcEwd03D5WkhSyt3f6UlvXz/Nx8npDpy1EMeT9hlf4urU5EsXlzVTVHmDEbwCGR5c5
	99IBcC4xFYZBiN9CugTxsbfyJtP3ghLMRk+u6aWlMTfAAmMAunT+0gx+OJZ3ixjkkhfsMvD1Wf7LT
	LcjjWlh/i9PlNvr5E3oViqsoidS3+TmrIgE2RGFbvXMl4jg/2GTqBWvrXB9HfWYvBsl7pa6aUHm+M
	FxKE7nmVDfD0dKB4Grsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izWWf-0004HI-6c; Thu, 06 Feb 2020 02:04:17 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izWWc-0004Gb-2l
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 02:04:15 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id p2so2132112qvo.10
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 18:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ab/yX2N/subCT941nuOwSlztfHa3FtdQyAtIY6qvDvc=;
 b=s853eTQcYlik/Qe8ZhSbgamk6ZDxpl7QV/sx6e9EdwtFbtWFZxM7JD0LQ7RE0fUGPI
 7OhWtGIDKW/a6QmnQnmTqOL+0K8unlQoEKNoDI5fuA/YCYyOI7ptIYymxcpZcmDXbv+U
 uNy4AzA0A82KTGY8KYHC36n5eUPKARnIefGVgFJN8ji+5ZjWwZJCMTAets/28GBS/7mX
 1T4gAPOxD+6CP8h4NvQvufPHa/R/ajjuk+sRCmugREAXzp8GmXYfTB+fiNGRDHw+Z7FZ
 GcwAHMvxqgsP+Y/jadLm0jliL6PMLWyjW0WJhzsHg4Fi4qDM16mFGk6KUovtI49EG4+4
 mzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ab/yX2N/subCT941nuOwSlztfHa3FtdQyAtIY6qvDvc=;
 b=I8Kd0qYNDjCK6e8m/Qt4LNqQ7LT+xDQwhQqYHtqs9fFLCI3sUmYal2Iw7qPcxNIMTJ
 InXjBHsGaxJIkLPy4o/q7hg4l/vVagSW+vsaD2osevZwJ3GDpQbRErKivuLLo982OE2a
 DOREPWwqy+/TLZPGZBPMgI0L7csZjLwnspiauzCjc6/U257voiCFTwSLqOWAim2HVNqr
 pD97F95ywLNV81o3iUO3AQzRYiYnt8E0F8Ni4jcyGok+J9xWZ04vpMGbRoZYUsgpDxUw
 d9RcZCklWlmPQPeTJaTYXz5Qa+unmONFSpE079fgmBg7o0mI/H8cUrJlbC8OQyj+IOvQ
 Lz4Q==
X-Gm-Message-State: APjAAAVz2RInTRcAe52T3qPSS6tLEbdzaenhxv9pC8CIjoQh4xR7gVj/
 oUuCzBLVAEmaBYs1Ut9YtyEBYnhaJn/3vjCoX9A=
X-Google-Smtp-Source: APXvYqw3ZkzuCffE7JWk66A9s5VFyxga6Ghtrc3o5j5YJSkRLu01Ujgl7diXQ64aSIMNp9wECSZpyYVyay60dZjNGt8=
X-Received: by 2002:a0c:fe0d:: with SMTP id x13mr537129qvr.88.1580954652607;
 Wed, 05 Feb 2020 18:04:12 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTvGf9_izDMJhER-S=vEYcc22K4Syp5CuVjUr9tND7cgQ@mail.gmail.com>
 <CAA=hcWSX9tBOjX8DEsg+=9NPdKzdwQBa1PyxA-r9vCLVsz52tg@mail.gmail.com>
 <20200205212301.1e26c263@collabora.com>
 <CAA=hcWT+veAKUUKyJSZEx-mtoPAMzPhzd=gd8XtPq-NbrC9TMQ@mail.gmail.com>
In-Reply-To: <CAA=hcWT+veAKUUKyJSZEx-mtoPAMzPhzd=gd8XtPq-NbrC9TMQ@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 5 Feb 2020 18:03:36 -0800
Message-ID: <CALLGbRKGmVCvDgr7g5D0BQaH6R1J_cfguC9WYRJxwo9KT+Fa-A@mail.gmail.com>
Subject: Re: mtd_nandbiterrs errors
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_180414_124171_63987AF0 
X-CRM114-Status: GOOD (  21.48  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi JH,

On Wed, Feb 5, 2020 at 4:20 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi Boris,
>
> Thanks for the response.
>
> On 2/6/20, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > On Wed, 5 Feb 2020 22:28:50 +1100
> > JH <jupiter.hce@gmail.com> wrote:
> >
> >> Resolved, using kernel test probably a bad idea, change to use
> >> mtd-utils nandbiterrs resolved issue.
> >
> > I doubt it solved the real problem: ECC is not working properly.
>
> You are right, I was working and posted at middle night, my brain was
> not functional well. Let me try it again to clarify it.
>
> # nandbiterrs -i /dev/mtd2
> incremental biterrors test
> Successfully corrected 0 bit errors per subpage
> Inserted biterror @ 1/7
> Read reported 1 corrected bit errors
> Successfully corrected 1 bit errors per subpage
> Inserted biterror @ 3/7
> Read reported 2 corrected bit errors
> Successfully corrected 2 bit errors per subpage
> Inserted biterror @ 5/7
> Failed to recover 1 bitflips
> Read error after 3 bit errors per page
>
> It did have errors after reading 3 bit errors per page. Could it be
> ECC strength not be set up correctly?
>
> I did not set up ECC strength, how can I check the ECC strength bit? I
> run the nandbiterrs --help, it did not tell me which option I could
> check ECC strength bits.
>
> Also, how to set up ECC strength bits?
>
> Sorry for all rudimentary questions.
>
> >> > [  695.257984] mtd_nandbiterrs: Inserted biterror @ 0/0
> >> > [  695.262984] mtd_nandbiterrs: rewrite page
> >> > [  695.273646] mtd_nandbiterrs: read_page
> >> > [  695.280000] mtd_nandbiterrs: Read reported 2 corrected bit errors
> >
> > The ECC engine should report an uncorrectable error here, not 2
> > corrected bits. BTW, an ECC of 2bits/512bytes sounds weak for a 2k-page
> > NAND. What's the NAND part you're testing with?
>
> I am currently testing a test unit that is using W29N02GVSIAA, it will
> change to Samsung : K9F2G08U0D-SCB0 in the future, I have no idea why
> the hardware contractor uses two different parts in development and in
> product.
>

Probably because the other part was cheaper. You can't let them sub
parts without testing and approval.

> Sorry to repeat my questions above again, how to run nandbiterrs to
> read ECC strength bit? And how to run nandbiterrs or other command to
> set ECC strength bit? I thought that default should be 4 bits, I have
> never set it up here, have no idea why it was 2 bits.
>

ECC is dependant on the device. And it can't be mixed-and-matched.
Every device has a datasheet that will tell you the minimum required.
You can (and usually should) go more than the minimum required, up to
however much you can fit in the OOB area. There's several ways to
check it, one way is to dump a programed page via u-boot `nand dump`
command from each partition and see how much of the OOB is taken up by
ECC bits. Personally, I'd do that even if I thought I knew what the
setting is supposed to be to validate that the data was actually
written in correctly. Depending on your system, you can find the
configured strength in your DTS. And also the u-boot config for your
platform (boot loader and kernel need to agree on ECC settings).

You need to find the datasheets for your devices, it will tell you
what you need to know.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
