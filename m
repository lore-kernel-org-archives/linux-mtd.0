Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pbXk-0006yk-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 22:30:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.GSO.4.44.0209121259120.26546-100000@fraser.sfu.ca> 
References: <Pine.GSO.4.44.0209121259120.26546-100000@fraser.sfu.ca> 
To: Benjamin Tze-Kit Lee <btlee@sfu.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: flash chip interface with MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 12 Sep 2002 22:30:19 +0100
Message-ID: <23217.1031866219@redhat.com>
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

btlee@sfu.ca said:
>  I am looking through the source code for MTD and trying to find the
> driver (interface) which communicates with the flash. Can anyone point
> me to some file or function that does the actually read/write to the
> flash?

drivers/mtd/chips/cfi_cmdset_0001.c

> Also, is MTD able to talk to an on board flash chip, something like
> the Intel StrataFlash?

Yes.

--
dwmw2
