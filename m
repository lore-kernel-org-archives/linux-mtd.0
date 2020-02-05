Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D556C35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 17:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE52E21741
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 17:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POp1cVpS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLkeIXvj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE52E21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Le8vq8HYZu/LjKQd6rQDW9srBKNQSkZ/JgoIwo8OoAg=; b=POp1cVpSbpb7x8
	hOOkFPBGSz00Fr9RMAPJ+pNzcTuqTclJ+iDltqkeUh8FBUGgTlQoLNTdOiingtHG7hwW9e6GQw8Ff
	g6HnOw4+LuOG/W/iybuZ2pBhwGBBCD4kS+Fe/hskWZA9UxFl65s7T2WT297f3tyDvkUNocrhQG5dW
	dm6Xe4kL/+q2pNFCet0qzS2VcigbFHYz5ZVLrlcmYm9+cOGRGI5GXtSghP/AMxhexjfvLfMgW7/y1
	VPoLCYIivOYFCiuD5I7tB8FAhZXmUvmr6xNYn0VF/2M4D5e+RO1pdSfq/TB8XXFFfQRFP+QJ0iZSj
	tGLUx2gCWPyb2mXPn4WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izO9G-0000sh-5f; Wed, 05 Feb 2020 17:07:34 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izO9D-0000rj-Bn
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 17:07:33 +0000
Received: by mail-qk1-x72a.google.com with SMTP id b7so2539302qkl.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zOPyY91zpocwdKYRtUVulXj/bnY0/yKCFTI+a/Nn4aw=;
 b=SLkeIXvjAVgSQteMEFkuZXxWVFJq4/2YBgtw3k81nEL/gkiJONTWQ9Tjwe11ozAntu
 l/heAl2Q5ijLIge96QB/C9OPIezyTcYQ7mS6BmubFrdP8/GGjgHUjNIV496VTKAeZemX
 PmWZ7xY9xaNj0Irp+mxwJ4E1YgJHepjIto2DGNBV14+5ddS33YtWDnGoDHp5kuu2KDJV
 S4sbMjxv8IRkpF+6ZgepbGlwMdrVM2ex/QXsJgGvW8Q0s64eRK1sBpsEmMz3pUQSBbEY
 tdTgAubGwEig2jVINqSVG4BqiV9HRl99MKAKjQJPfomGFQTF9dutXJhqBqW59XIP9utc
 I4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zOPyY91zpocwdKYRtUVulXj/bnY0/yKCFTI+a/Nn4aw=;
 b=kDcMAnI0JDcTt3OzXOSMfVuZpcGNvCvnRL4/qFbdgt+UAled4f75CxXqaPrA9G2d0v
 PIAvgKKikDK6yczW00WObn2ARH+cK8jGRx2wr8kDJNzzNtIuP5/jNGx6H6mmvfwwnCha
 E9z0klwoRYhK/S5gX8BkczmEcQNE8WOB4VtJwJF4vrlU05+5CLr9UIqrGBUvEp/LPi2B
 ExRWibfV+VFZJR4hVzWMDCLwI/msrmStq6/whgx1YFZsOk7XenxpBfkg98VI34pcpImb
 BmmmlRXGMSHYsf75V8cu5e6YXSpIglI8Ucfx+UQWtP444om7FrEWmreIJVk/RpS0k2Jd
 gK3A==
X-Gm-Message-State: APjAAAVQE1LCFilP3r660SOhY6w68LVfC9MFX2OGIjsfWlxpDy0/dLZA
 2H1WMBtjS/s74z2EGMP6XE56S/SeC/XOZ4RKVBuXR5sr
X-Google-Smtp-Source: APXvYqyGvuHbOZolKy+XO4Nn4d61RlMgt7rd9wnUGyvdhGc05c1wLqB4x5EYPxPMOXuwMkbJT6pLOCUGc6YeFvgqAV8=
X-Received: by 2002:a37:8e03:: with SMTP id q3mr33409490qkd.395.1580922448991; 
 Wed, 05 Feb 2020 09:07:28 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
 <CALLGbR+8osorMEWUXW5BED=_Y1uYDDdheY+QNXp4hG_AwLgeyw@mail.gmail.com>
 <CAA=hcWSkzctHUgLDsC3w4-CRhPOwWNptFOv2Ef3SQ_c68iYEgw@mail.gmail.com>
In-Reply-To: <CAA=hcWSkzctHUgLDsC3w4-CRhPOwWNptFOv2Ef3SQ_c68iYEgw@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 5 Feb 2020 09:06:52 -0800
Message-ID: <CALLGbRJfr8MteAsh+hDtGNkDsv0gBOWQzZnNOeiD+_EmL1qGPQ@mail.gmail.com>
Subject: Re: Corruped NAND booting for all devices
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_090731_407229_7591BE65 
X-CRM114-Status: GOOD (  35.10  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi JH,

On Tue, Feb 4, 2020 at 11:58 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi Steve,
>
> On 2/5/20, Steve deRosier <derosier@gmail.com> wrote:
> > I've been following your questions on both this list and the
> > linux-wireless one. May I recommend some reading:
> > http://www.linux-mtd.infradead.org/doc/nand.html
> >
> > It isn't clear what filesystem you're using, though I recall from an
> > earlier email you weren't running UBIFS. But in the log I do see UBIFS
> > messages. In any case, based on your descriptions, I strongly suspect
> > NAND bitflips are causing your filesystem corruptions, and you likely
> > don't have the correct settings for the ECC strength as necessary for
> > your NAND. Or maybe you're not flashing images correctly and the ECC
> > info is getting lost.  Or maybe you're writing logs and such to flash
> > and you're filing up the filesystem. Maybe your extents aren't correct
> > and one filesystem overwrites another. Unfortunately, you've got your
> > system so cobbled up with user-space prettiness in your log output
> > that you're obscuring the kernel log output that would help you
> > diagnose the problems.
>
> Yes, the file system is UBIFS, the different revision of test units
> have been running for many months, they were relative stable until now
> for a new revision of hardware. Like you found, we have lots of
> problems in low level when running the new revision of hardware. As
> both firmware and hardware evolved, the first rational thing is to
> narrow down the source of the problem.
>

My suggestion, assuming that you have a version that ran on the old
hardware and that it can run on the new hardware (so, basics like
processor types, etc haven't changed enough to keep it from working)
is to run the known-good software on the new hardware and see where
you stand. My prediction is it will fail hard, but it should be
informative.

With hardware changes, there's two levels:

1. Small enough changes it's still more or less the same platform, but
with a few things that need to be changed.
2. Big enough changes it should be considered a new platform and
treated as such.

Either way, the approach is similar, just different in scope. In the
former, take a look at the old schematic and the new schematic and see
what changed. Pull the datasheets of any chips that changed (both old
and new) and check changed parameters. Check for changed port lines,
gpio pulls, chip selects, and timing parameters.

In the case of the latter, we're talking the processor changed, the
device architecture changed (not like ARM to MIPS, that's covered in
"processor" changed, more like how your overall device is designed),
etc...  Honestly just start over. Assume everything changed and start
over from scratch. Examine everything, make sure your DT matches, your
compile flags. Test and confirm everything. Basically ground-up board
bring-up.

A good question for you - did the old design use SLC NAND and the new
MLC NAND? That makes a huge difference. Also, I've found that not all
manufacturers are equal in reliability. I had a hardware team that
wanted to substitute a cheaper but "equivalent" part from a different
manufacturer. It had the exact same specs and in theory should have
run seamlessly - yet we had endless corruptions on the first articles
they sent me. We just said "no" and stayed with the more expensive
part because saving $0.45 on something that would sell only a few
tens-of-thousands of units wasn't worth the engineering time to "solve
it in software" if it was even indeed possible to do so. Note that
this was only possible because the only thing that changed was the one
chip, which from a software standpoint should have been identical.
When you only change one thing at a time, it helps you find the
problems.

> I appreciate all your advice which are very helpful and valid, the
> hardware was designed by other contractors, there is limited tools and
> equipment for software guy to debug the hardware. Hardware contractors
> firmly ruled out any issues in hardware, they pointed finger to
> software image built from Yocto to cause the NAND corruption. The

Of course they are saying "it's not my problem". You seem to be living
in a "throw-it-over-the-wall" style organization. In my experience,
you have three choices - get the hell out, become a hardware expert,
or become close friends with one of the guys on the hardware team and
change the culture. You need to realize that in a way they're right -
by their limited perspective, ie the electrons go where they should
go, everything is fine.  But gluing a few chips down on a board is
only 2% of an embedded engineer's job; there's a lot more to do
because our chips are now so programmable, and at the end of the day
it still needs to work right.

Again, examine and understand the datasheets. Check against the
schematic. Satisfy yourself there's no electrical errors. Validate
that every value that gets set in a controller register is the correct
one.

> Yocto image contains all open sources, Linux kernel, connman, MTD,
> ofono, etc, so I try to figure out if there are limitations and
> constrains to turn the device power off while it may be in the middle
> of erasing pages, would that cause the NAND flash corrupted? Or we
> might not set up things properly?
>

UBI is designed to be power-cut safe. Not to say there hasn't been
bugs or isn't a bug.  But basic things like "the power cut happened
when we erased a page" shouldn't be a concern unless there's a driver
bug.

> As you said, there are so many things in software and hardware could
> cause the NAND corruption, what I am particular interested in is if so
> called a bad Yocto image could cause the NAND corruption, let's make
> it clear I am not talking about software problems in that image, I am
> talking about Yocto build system problem which generated a bad image.
> I thought, if you built a bad image, it would not be able to run at
> first time, if an image to run NAND booting well for several days,
> what that the Yocto build system could to make the image corrupted the
> NAND  late like a virus? It does not make sense to me, but I could be
> wrong.

While I would say "nothing is impossible", the scenario you're talking
about is close to it. You're looking down a dry hole. If you can
successfully build and run it, it's not a "bad Yocto image" in the
sense you're describing.

Data loss over time is usually a bit-rot issue in my experience. Check
your ECC parameters, check that ECC data is being written correctly in
ALL cases. Check that U-boot and the kernel agree on the ECC
parameters.  Note - you should be seeing ECC warning messages in your
kernel log on boot, but to my eye you don't have the right settings
there to see what you need to see.

Also, be sure you're not filling up the filesystem, or have partitions
overlapping and thus overwriting each other. One type of "bad image"
is where the new one it is larger than expected, and thus when you
flash it you either overwrite some other area or you truncate what you
are flashing. In some cases like these, it is possible for it to run
normally...until it doesn't. But those types of things are easy to
check.

Check that your method of flashing doesn't ignore bad-block markers.
Or that when you flash it that ECC data gets written correctly.

To give you an example: I had a system where the typically method of
flashing the system for production was via u-boot.  I worked with it
every day reflashing via u-boot. I never had a problem.  We got random
reports of problems from the field and even some of my colleagues
would see corrupted (couldn't boot) NAND after a while.  Going through
the problem, I discovered that our u-boot method of flashing worked
perfect and correctly wrote ECC.  I eventually discovered that our
user-space update script would not write ECC but instead left it
cleared. And, at least with the version of UBIFS we were using, UBIFS
was tolerant of no ECC data. Basically, it would read the page and if
there was ECC data it would validate it and correct or error out if
there was a problem, but if there was no ECC data for the page, it
would short-circuit and basically say "nothing for me to check, all is
OK". So, in the short term anything flashed with the buggy update
script would run fine and would only show problems weeks or so later.
And of course, only if a bit flip happened in the wrong place, etc....
So it was rare enough it took a while to notice. But devices that were
never updated (only production flashed) would be fine.  Or ones that
got upgraded via the u-boot method, like I happened to do, never saw
the problems. Hard to track down and only found because I went through
everything. Hence my comment of "ALL cases".

Hope that helps,
- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
