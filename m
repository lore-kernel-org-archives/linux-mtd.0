Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16UQ9v-0004Hn-00
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jan 2002 10:34:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F102s7nlT2NqFJ3sl3x00002184@hotmail.com> 
References: <F102s7nlT2NqFJ3sl3x00002184@hotmail.com> 
To: "=?gb2312?B?1twgyPE=?=" <san_blabla@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Why no kernel message on my DOC system? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 26 Jan 2002 10:45:04 +0000
Message-ID: <23595.1012041904@redhat.com>
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

san_blabla@hotmail.com said:
> I've build up an X86 Linux system using MTD DiskOnChip driver, using
> serial  port as my console. The Linux system can boot form DOC and I
> can also login  into the system, the problem is that I can't see any
> kernel printk  messages. But if I put the same kernel on my harddisk
> and boot up using  harddisk, I can see all kernel messages, still
> using serial port as my  console. my lilo.conf for DOC is: 

I suspect it's a LILO problem - when you log in after it's booted from the 
DiskOnChip, what are the contents of /proc/cmdline?


> I don't know why it output "invalidate: busy buffer", but as I said
> before,  the DOC can boot up and I can even login. 

LILO is asking the kernel to invalidate a buffer of the ramdisk. But on a 
ramdisk, the buffer is the _only_ copy of the data, so it's marked busy and 
cannot be invalidated. I think this is harmless.


> My lilo.conf for my harddisk is :

> The command to put lilo on harddisk is simple: #lilo and the output is
> normal. 

If you boot using LILO on the hard disk, but with 'root=/dev/nftla', do 
you see the console messages then?


--
dwmw2
