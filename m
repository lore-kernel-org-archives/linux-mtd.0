Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qwZf-0008N8-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 14:05:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m3pu7xc6rv.fsf@DLT.linuxnetworx.com> 
References: <m3pu7xc6rv.fsf@DLT.linuxnetworx.com> 
To: ebiederman@lnxi.com (Eric W. Biederman)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Map drivers.... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 09 Oct 2001 14:14:37 +0100
Message-ID: <21082.1002633277@redhat.com>
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

ebiederman@lnxi.com said:
>  David here is my recent work on getting a series of jedec map drivers
> into shape against the most recent work.

Looks good, thanks. Russell has already committed the code to make the 
jedec probe code deal with some Intel chips - could you merge that with the 
current CVS code instead of 2.4.11-pre4? Also, could you add $Id$ tags to 
the new files?

I'd be inclined to retain the config option CONFIG_MTD_JEDECPROBE rather 
than renaming it, too.



--
dwmw2
