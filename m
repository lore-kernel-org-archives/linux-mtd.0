Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gh9I-0001qQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 07:08:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0202281551400.1054-100000@server.superbt.com> 
References: <Pine.LNX.4.44.0202281551400.1054-100000@server.superbt.com> 
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: "Yoshinori K. Okuji" <okuji@enbug.org>,
    GRUB mailing list <bug-grub@gnu.org>,
    Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Mar 2002 07:19:14 +0000
Message-ID: <30393.1014967154@redhat.com>
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

ilatypov@superbt.com said:
>  3. I wish to assign my copyright to FSF.  This refers only to the
> changes that were not copyrighted by others, of course.  Hopefully, I
> didn't break things in the existing code.

> Most of the new code in the patch has a copyright notice.  The only
> exception is stage2/bdev_diskonchip.c.

> David, would you like to put your copyright notice in the above file?
> I can do this for you. 

Er, did I write that? Yeah - looks like my scribblings. I think it predates 
my employment with Red Hat, who own my new output and have FSF copyright 
assignment stuff all sorted out. If it's optional, then I can't be bothered 
with the paperwork - yes, please do add
	(C) 2000  David Woodhouse  <dwwm2@infradead.org>

If only emacs would complain at you when you edit a file which doesn't have 
a copyright for the current year, and possibly even update it for you :)

--
dwmw2
