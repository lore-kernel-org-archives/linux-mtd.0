Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172J1o-0007fO-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 22:49:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CCDBF21.40004@yottayotta.com> 
References: <3CCDBF21.40004@yottayotta.com>  <3CC9A794.4070706@yottayotta.com> <3CC8C1C9.80709@yottayotta.com> <14375.1019801767@redhat.com> <24028.1019859603@redhat.com> 
To: Murtada Shah <mshah@yottayotta.com>
Cc: linux-mtd@lists.infradead.org,
    linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Kernel removing directories 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 29 Apr 2002 22:49:44 +0100
Message-ID: <2017.1020116984@redhat.com>
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
> When I set jffs2 debug level to 1... and default_console_loglevel to
> 9...  I get output for an extremely long time. Is this normal? I've
> been  waiting for about 3 hours now and it's still not done. Normally
> it takes  several seconds to load the filesystems. 

A long time is normal. Hours is a little excessive. How big is your file 
system? Are you running at 115200 baud or faster?

--
dwmw2
