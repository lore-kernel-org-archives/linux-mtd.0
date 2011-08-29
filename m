Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QxykK-0007Xc-92
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2011 10:07:12 +0000
Received: by gwb1 with SMTP id 1so1991173gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Aug 2011 03:07:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110826194910.GE22411@logfs.org>
References: <20110805160325.GM26160@logfs.org>
	<CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
	<20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
	<20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
	<20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
Date: Mon, 29 Aug 2011 15:37:09 +0530
Message-ID: <CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
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

> Are you sure you have my patch applied?
>

To clarify on the bugs I reported
1. bonnie test( bonnie  -s 20 -r 10) does not complete . It gets stuck
at "Creating  files in sequential order ..."
(tested with nandsim, kernel 3.0.1. and 2.6.38.8; consistently
reproducible on 2 machines.)
The free command show that, while the bonnie test was run for half an
hour, free space changed from 2982340 KB to 2550156 KB.

2. with mount-mkdir-unmount loop , logfs hits KERNEL bug at segment.c:784
(tested with nandsim, the kernel is from your git.)

3. with bonnie test , sometimes it hits kernel bug at file.c:172
(happens only on the unstable kernel that i was trying. not
consistently reproducible on other kernels)

Regarding the third bug, for double checking ,I thought of taking the
log for your patch once more
But I have recompiled the kernel in my machine and unfortunately i am
not able to reproduce the third bug any more.

I think the first two bugs should be reproducible at your end. If not,
pls let me know, i will see whats wrong with my test setup.
Thanks
mugunthan
