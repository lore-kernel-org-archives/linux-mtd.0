Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fGcV-0006LS-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 09:04:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B987838.A7F8B7AA@dgt-lab.com.pl> 
References: <3B987838.A7F8B7AA@dgt-lab.com.pl>  <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B35@mailse01.axis.se> 
To: Wojciech Kromer <krom@dgt-lab.com.pl>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 07 Sep 2001 09:10:05 +0100
Message-ID: <18025.999850205@redhat.com>
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

krom@dgt-lab.com.pl said:
>  But writing my user partition (/dev/mtdblock4) destroys data from the
> begining of my chip ! What's wrong? 

Put printk statements in the glue functions which add the offset to the 
write request and pass it along. See if they're adding the correct offset. 

--
dwmw2
