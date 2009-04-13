Received: from mail.ruggedcom.com ([204.50.190.93])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtRGr-0002hl-7o
	for linux-mtd@lists.infradead.org; Mon, 13 Apr 2009 18:52:47 +0000
Message-ID: <49E389F4.3060502@RuggedCom.com>
Date: Mon, 13 Apr 2009 14:52:36 -0400
From: Richard Retanubun <RichardRetanubun@RuggedCom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Re: [PATCH] Fixup for Numonyx M29W128 chips
References: <49D31937.6080403@gmail.com>
In-Reply-To: <49D31937.6080403@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: augulis.darius@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Darius,

I am tracking this patch that you submitted for the MTD mailing list and
I think I am missing the rest of the discussion between this

http://lists.infradead.org/pipermail/linux-mtd/2009-April/025089.html

and the patch being committed to the kernel.org mainline here:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=history;f=drivers/mtd/chips/cfi_cmdset_0002.c;h=61ea833e09086e631024f298575678ff3f123ea3;hb=HEAD

I am planning to use this flash part on our design also and was wondering if you got a chance to
exercise the part as an mtdblock or mtdchar device and if the issue persist there or is is only limited to using
the part with jffs2? when the issue does happen, does it happen ALL the time or some of the time?

Sorry if I'm re-asking somethings that you have explained before, feel free to point me to the
proper discussion thread if I am.

Thanks in advance for your time,

- Richard Retanubun.
