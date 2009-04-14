Received: from mail-fx0-f166.google.com ([209.85.220.166])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtmxJ-0000Jm-De
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 18:02:03 +0000
Received: by fxm10 with SMTP id 10so3034869fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Apr 2009 11:01:55 -0700 (PDT)
Message-ID: <49E4CFB3.9010706@gmail.com>
Date: Tue, 14 Apr 2009 21:02:27 +0300
From: Darius Augulis <augulis.darius@gmail.com>
MIME-Version: 1.0
To: Richard Retanubun <RichardRetanubun@RuggedCom.com>
Subject: Re: [PATCH] Fixup for Numonyx M29W128 chips
References: <49D31937.6080403@gmail.com> <49E389F4.3060502@RuggedCom.com>
In-Reply-To: <49E389F4.3060502@RuggedCom.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard Retanubun wrote:
> Hi Darius,

Hi Richard,

> 
> I am tracking this patch that you submitted for the MTD mailing list and
> I think I am missing the rest of the discussion between this
> 
> http://lists.infradead.org/pipermail/linux-mtd/2009-April/025089.html
> 
> and the patch being committed to the kernel.org mainline here:
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=history;f=drivers/mtd/chips/cfi_cmdset_0002.c;h=61ea833e09086e631024f298575678ff3f123ea3;hb=HEAD 
> 

actually there is nothing to miss because discussion was finished with 
04/01/2009 post from myself. Seem David found it ready to main line.
If you thing it is regression please mail to ML.

> 
> I am planning to use this flash part on our design also and was 
> wondering if you got a chance to
> exercise the part as an mtdblock or mtdchar device and if the issue 
> persist there or is is only limited to using
> the part with jffs2? when the issue does happen, does it happen ALL the 
> time or some of the time?

I used it only with jffs2. If write buffer is enabled, error occurs 
every time.

> 
> Sorry if I'm re-asking somethings that you have explained before, feel 
> free to point me to the
> proper discussion thread if I am.

I thing this ML is the only place where this patch was discussed.

> 
> Thanks in advance for your time,
> 
> - Richard Retanubun.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
