Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rKoI-0005kR-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Mar 2002 15:30:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020330144506.12877.qmail@sina.com> 
References: <20020330144506.12877.qmail@sina.com> 
To: fyaowen <fyaowen@sina.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problem with build jffs2 filesystem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 30 Mar 2002 15:30:23 +0000
Message-ID: <555.1017502223@redhat.com>
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

fyaowen@sina.com said:
>    dd if=jffs2.image of=/dev/mtd7
>    mount -t jffs2 /dev/mtd7 /mnt
> After I gave out this instruction, all partitions on Neponset were
> erased.  

That mount command should have failed. You cannot mount the character 
device. 

--
dwmw2
