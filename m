Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16LvH9-0001QS-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jan 2002 23:58:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020102235704.27620.qmail@web11106.mail.yahoo.com> 
References: <20020102235704.27620.qmail@web11106.mail.yahoo.com> 
To: Sheela Kashyap <sheela_kashyap@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 Jan 2002 00:06:11 +0000
Message-ID: <24355.1010016371@redhat.com>
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

sheela_kashyap@yahoo.com said:
>  While creating the jffs image using mkfs.jffs, I noticed that it did
> not create all the /dev entries for me. I had to use 'mknod' and
> create it manually on the target. What is the easiest way for me to
> create a target image with all the /dev files? 

Er, not sure - mkfs.jffs ought to work. Why are you using jffs not jffs2?

--
dwmw2
