Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WfBE-0007DN-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 15:00:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020201142405.79130.qmail@web20309.mail.yahoo.com> 
References: <20020201142405.79130.qmail@web20309.mail.yahoo.com> 
To: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fwd: Re: JFFS XConfig 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Feb 2002 15:11:51 +0000
Message-ID: <9323.1012576311@redhat.com>
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

monitoreurope@yahoo.co.uk said:
>  It is indeed dependant upon CONFIG_EXPERIMENTAL. However it appears
> to fail on build at the network driver stage with JFFS2 enabled. I
> have not yet pinned down exactly why. At this stage i have stuc with
> JFFS which should suffice for our immediate needs.

Turn the #include "zlib.c" in drivers/net/ppp_deflate.c to #include "zlib.h"
instead. This is fixed properly in 2.5.3, and we should backport that fix 
to 2.4.


>  Is there any documentation available on this proceedure? 

Read the list archives - ISTR there was some discussion of this recently.

--
dwmw2
