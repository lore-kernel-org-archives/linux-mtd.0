Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uUGz-0005MU-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 09:45:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <19E00413.60CCAB38.0265FBE9@netscape.net> 
References: <19E00413.60CCAB38.0265FBE9@netscape.net> 
To: Kschoo70C@netscape.net
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question about power fail during file upgrade 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 26 Sep 2002 09:45:23 +0100
Message-ID: <8493.1033029923@redhat.com>
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

Kschoo70C@netscape.net said:
>     I need some help to understand how the JFFS2 works. If I have a
> version 1 of software component A on JFFS2, what happen if power
> failed while I am in the middle of upgrading the component A to
> version 2 ? The question is do I have version 1 intact or a
> combination of version 1 and 2 ?

> Does the JFFS2 filesystem only set the inodes of a file to be valid
> only after a complete file is written to the flash ? Does the old file
> will only be deleted only after the new file is verified to be valid ?

JFFS2 knows nothing of 'complete files'. You are guaranteed atomicity of 
individual file system operations only, according to POSIX. 

As with other file systems, you can write the new version of the file, then
rename it over the top of the original. That will be atomic.

There's been talk about extending JFFS2 to allow userspace 'transactions' 
but it's not been done.

--
dwmw2
