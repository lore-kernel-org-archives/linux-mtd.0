Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16A6h4-0002WB-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 09:44:22 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0111300305120.11565-200000@newbast.lynuxworks.com> 
References: <Pine.LNX.4.33.0111300305120.11565-200000@newbast.lynuxworks.com> 
To: Aleksander Sanochkin <asanochkin@Lnxw.COM>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: cfi_cmdset_001.c problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 09:54:54 +0000
Message-ID: <16089.1007200494@redhat.com>
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

asanochkin@Lnxw.COM said:
>  I see that after write and erase operations, the current version of
> cfi_cmdset_0001.c driver can left a Flash device not in the READY
> state. If soft reboot is performed in such a situation, applications
> that use flash will behave erroneously since they expect that the
> flash is in the READY state. For instance, if the system is supposed
> to boot from flash, it will hang.

Thanks for this. One thing that concerns me is that I have a vague 
recollection that Nico once drastically improved the performance of the 
same driver by ripping out all the gratuitous state changes. I wonder if it 
would be better to do this with a reboot notifier than by changing back to 
read mode after every other operation?

Also, we need to make sure we do the right thing if the JFFS or JFFS2 GC
thread is actually in the process of writing to the flash while
machine_restart() happens on another CPU.

--
dwmw2
