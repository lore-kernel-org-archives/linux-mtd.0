Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172SGg-0008Jp-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 08:41:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CCDCB4F.6030808@yottayotta.com> 
References: <3CCDCB4F.6030808@yottayotta.com>  <3CCDBF21.40004@yottayotta.com> <3CC9A794.4070706@yottayotta.com> <3CC8C1C9.80709@yottayotta.com> <14375.1019801767@redhat.com> <24028.1019859603@redhat.com> <2017.1020116984@redhat.com> 
To: Murtada Shah <mshah@yottayotta.com>
Cc: linux-mtd@lists.infradead.org,
    linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Kernel removing directories 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Apr 2002 08:41:44 +0100
Message-ID: <12971.1020152504@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

mshah@yottayotta.com said:
> My mistake David. That was Jffs2 debug set to 2, that is why it took
> hours.

OK. It's probably best not to send logs that large to the list; just to be 
would have been better.

> Nonetheless, I attached the serial output of jffs2debug set to 1... so
>  you can take a look at it. I copied/pasted the relevant parts at the
> end.

> The inode #7 seems to be causing problems. You can find the relevant
> sections from the attached file by finding the following quotes. As
> you  see inode #7 has important children :) (i.e. "mv", "ps",  /etc/
> init.d/rc&). I can boot from nfs & mount the /dev/mtdblock/0 no
> problem after another reboot. 

There's no directory entry for inode #7. How did the JFFS2 file system get 
there? Could there be some missing somehow?

--
dwmw2
