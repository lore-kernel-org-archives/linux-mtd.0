Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16icTW-0003Pr-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 14:33:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E16iE0E-0004SJ-00@host3.hosting4everyone.com> 
References: <E16iE0E-0004SJ-00@host3.hosting4everyone.com> 
To: cfowler@outpostsentinel.com
Cc: Robert Sandilands <robert.sandilands@secureworx.com>,
    americas-techsupport@m-sys.com, linux-mtd@lists.infradead.org
Subject: Re: msys process 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Mar 2002 14:41:01 +0000
Message-ID: <1472.1015425661@redhat.com>
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


cfowler@outpostsentinel.com said:
>  I'm using the latest M-SYS software.  From what I heard, the MTD
> driver  does not support the version 5 of software. 

We only didn't support NFTL instances with UnitSizeFactor != 1. That is,
where the _logical_ erase block size used by NFTL was larger than the
physical erase block size.

The fix for this, which I'd been trying to get someone to do for ages, took 
about half an hour. It's in CVS, untested.

--
dwmw2
