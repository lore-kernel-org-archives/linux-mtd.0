Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iEzJ-0001js-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 13:28:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E16iE0E-0004SJ-00@host3.hosting4everyone.com> 
References: <E16iE0E-0004SJ-00@host3.hosting4everyone.com> 
To: cfowler@outpostsentinel.com
Cc: Robert Sandilands <robert.sandilands@secureworx.com>,
    americas-techsupport@m-sys.com, linux-mtd@lists.infradead.org
Subject: Re: msys process 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Mar 2002 13:36:31 +0000
Message-ID: <11433.1015335391@redhat.com>
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

If you just reformat your DiskOnChip using version 4 of the software it 
should work fine. Alternatively, it'll take about a couple of hours worth 
of hacking to make it work.

--
dwmw2
