Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16id67-0003UD-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 15:12:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203061610.g26GAw806457@skylab.outpostsentinel.com> 
References: <200203061610.g26GAw806457@skylab.outpostsentinel.com> 
To: strtok@hotmail.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Lost DOC2000 after trying to load grub 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Mar 2002 15:24:15 +0000
Message-ID: <8333.1015428255@redhat.com>
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

strtok@hotmail.com said:
>  Now when it boots I get a grub propmt.  I'm not sure what to do to
> make the doc-lilo boot now.  So I do not know what to type at grub>

root=(dc0,0)
kernel=/boot/...

>  How do I revocer without replaceing the chip?

Use nftl_format if DFORMAT won't work.

--
dwmw2
