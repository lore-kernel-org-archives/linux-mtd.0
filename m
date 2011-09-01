Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qz0S9-00085H-Cr
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2011 06:08:42 +0000
Received: by iacb35 with SMTP id b35so1940961iac.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2011 23:08:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110831141731.GA29862@logfs.org>
References: <20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
	<20110831055854.GA12713@logfs.org>
	<CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
	<20110831074902.GA26382@logfs.org>
	<CAMjNe_csYHWCRFXt6sW1FpMaS_RFGLM6z1ML6_-3xb-5x7DZtg@mail.gmail.com>
	<20110831141731.GA29862@logfs.org>
Date: Thu, 1 Sep 2011 11:38:39 +0530
Message-ID: <CAMjNe_d0-vz==Hjqzyu6taJHyHiPff8EH+=qadrOv_87LO8F2g@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Were you unable to reproduce, but you sent me the log anyway?
I was not able to reproduce the file.c:172 bug. Please refer to my
previous mail.

  " On Mon, Aug 29, 2011 at 3:37 PM, srimugunthan dhandapani
<srimugunthan.dhandapani@gmail.com> wrote:

> To clarify on the bugs I reported
> 1. bonnie test( bonnie  -s 20 -r 10) does not complete . It gets stuck
> at "Creating  files in sequential order ..."
> (tested with nandsim, kernel 3.0.1. and 2.6.38.8; consistently
> reproducible on 2 machines.)
> The free command show that, while the bonnie test was run for half an
> hour, free space changed from 2982340 KB to 2550156 KB.
>
> 2. with mount-mkdir-unmount loop , logfs hits KERNEL bug at segment.c:784
> (tested with nandsim, the kernel is from your git.)
>
> 3. with bonnie test , sometimes it hits kernel bug at file.c:172
> (happens only on the unstable kernel that i was trying. not
> consistently reproducible on other kernels)
>
> Regarding the third bug, for double checking ,I thought of taking the
> log for your patch once more
> But I have recompiled the kernel in my machine and unfortunately i am
> not able to reproduce the third bug any more.
>
> I think the first two bugs should be reproducible at your end. If not,
> pls let me know, i will see whats wrong with my test setup. "

Its frustrating when you ask me to take a new set of logs without
reading my previous mails.
To repeat, iam not able to reproduce the third bug. I think the first
two bugs should be reproducible at your end.
I thought that you were asking me to take the logs because you are not
able to reproduce them too.
Out of curiosity, are you able to run bonnie successfully with logfs+nandsim?

Thanks,
mugunthan
