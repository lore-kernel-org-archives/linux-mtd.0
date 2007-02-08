Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HFEFC-0004g2-MY
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 13:43:45 -0500
Received: by ug-out-1314.google.com with SMTP id m2so539855uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Feb 2007 10:43:40 -0800 (PST)
Message-ID: <625fc13d0702081043g72e600a2mb19c20ec26d3494d@mail.gmail.com>
Date: Thu, 8 Feb 2007 12:43:39 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Sohn Chung-MCG31424" <ChungSohn@motorola.com>
Subject: Re: Calculation of JFFS2 free space
In-Reply-To: <F269680FD7CE404788EFB7B2A4DBC9CA02AFB464@de01exm63.ds.mot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <F269680FD7CE404788EFB7B2A4DBC9CA02AFB464@de01exm63.ds.mot.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/8/07, Sohn Chung-MCG31424 <ChungSohn@motorola.com> wrote:
>
> Hello,
> I am using JFFS2 (Linux 2.6.10) on the Large Page NAND flash.
> The size of JFFS2 partition is 7M. While applications were holding some
> files,
> I copied over an 8M file to this partition to make the filesystem full.
> After I got the out of space message, I issued the 'df' command.
>
> The output of df was:
> # df /jffs2
> /dev/mtdblock/3    7168   7023   136   98% /jffs2
>
> # cd /jffs2
> # touch foo
> touch: foo: No space left on device
>
> The jffs2_statfs returned 136K as the available space.
> After the filesystem is full, how the application program can figure out
> the real available space on JFFS2 before write?

You currently can't from userspace.  The df output is a best-estimate
returned by JFFS2 given that it has to reserve some blocks for normal
operation.

What would be nice is some sysfs entries to export some of this
information, without requiring JFFS2_DEBUG to be set.

josh
