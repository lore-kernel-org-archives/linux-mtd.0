Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3rv-0007Lo-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 11:13:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010803150921.C20809@borg.org> 
References: <20010803150921.C20809@borg.org>  <20010731175442.I10857@borg.org> 
To: Kent Borg <kentborg@borg.org>
Cc: Linux Mtd <linux-mtd@lists.infradead.org>,
    Abraham vd Merwe <abraham@2d3d.co.za>
Subject: Re: Building MTD with JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 11:19:04 +0100
Message-ID: <5650.997179544@redhat.com>
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

kentborg@borg.org said:
>  This made my compile happy, but, though the make dep seems to have
> visited the linux/fs/jffs directory, the make itself didn't.

> Hmmm.  Ideas on how to get out of the newbie mud? 

Look at the 2.4-ac patches. They have all the necessary glue you need to 
add the fs/jffs2 directory to the build.


kentborg@borg.org said:
>  In the mean time, because we don't have CFI chips, I think I will
> look into whether I need to write my own mtd driver.  (AMD and Intel
> chips, but old ones.) 

We have drivers for them, but just can't necessarily recognise them. Rather 
than doing a whole new driver, you need to just write a probe routine which 
passes control to the cfi_cmdset_000x drivers like cfi_probe.c does.

The actual commands are the same - CFI only defines how you probe the chips
to identify them.

--
dwmw2
