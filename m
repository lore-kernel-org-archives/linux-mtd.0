Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FZAN-0000KG-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 11:36:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010628120519.B6265@crystal.2d3d.co.za> 
References: <20010628120519.B6265@crystal.2d3d.co.za>  <3B3B5128.7040006@niisi.msk.ru> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: Alexandr Andreev <andreev@niisi.msk.ru>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Making partitions questions. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 28 Jun 2001 11:37:20 +0100
Message-ID: <12028.993724640@redhat.com>
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

abraham@2d3d.co.za said:
>  In order to actually make a userland utility you'd have to implement
> a system call to actually send the info to the partition driver which
> will have to reregister the devices. Not all that difficult, but I
> don't think anybody is working on it right now.

You don't necessarily need to be able to change them at runtime. We already 
support a few methods of storing partitioning information on the medium 
rather than hard-coding it in the mapping driver. We can grok RedBoot FIS 
tables, Compaq bootldr partitions, and also the ARM Firmware Suite layout.


abraham@2d3d.co.za said:
>  Yes. As long as you compile your kernel with MTD block device support
> it, you can put anything on those block devices. I wouldn't use ext2
> on flash tho since it's not optimised for flash - jffs2 is definitely
> your best bet. 

He said ext2 on FTL. That's sane, but possibly not legal, depending on 
whether software patents are enforceable in your part of the world.

--
dwmw2
