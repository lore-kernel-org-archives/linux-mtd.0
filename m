Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Mzvg-0002aA-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 23:36:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B560DDC.55ECB635@sun.com> 
References: <3B560DDC.55ECB635@sun.com>  <3B560681.4D216FF3@sun.com> <26325.995493875@redhat.com> 
To: Tim Hockin <thockin@sun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002 and writes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Jul 2001 23:42:10 +0100
Message-ID: <27004.995496130@redhat.com>
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

thockin@sun.com said:
>  Right, but this is our boot ROM we're dealing with :)  Can you
> suggest a better alternative?  The device is rarely ever loaded, but
> when it is loaded we want to read and re-program the whole thing as
> safely as possible. 

It's sane enough. Just loading the 'mtdblock' driver will give you exactly 
the semantics you described. Alternatively, use the raw chardevice driver, 
and you have to issue the MEMERASE ioctl before rewriting a sector. There 
are utilities in CVS which do this for you, given an MTD device and a file 
to load into it.

Either way, the underlying flash device driver only deals with the physical 
capabilities of the flash chip. What you do on top of that is none of its 
business.

--
dwmw2
