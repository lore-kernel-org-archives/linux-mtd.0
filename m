Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rflh-0004Ls-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 14:20:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BC59A87.30F514C9@uniquemodem.com> 
References: <3BC59A87.30F514C9@uniquemodem.com> 
To: data <data@uniquemodem.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Parse error before 'do' in chipreg.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 Oct 2001 14:29:54 +0100
Message-ID: <23621.1002806994@redhat.com>
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


data@uniquemodem.com said:
>  Furthermore, I cannot download any patch from the ftp.infradead.org/
> pub/mtd/patches. Every time I try to connect to it, I got a reply that
> the ftp server is down.

Ah yes - I took it down when there was a wu-ftpd exploit reported, but 
forgot to start it again when the exploit turned out to be a hoax. I've 
restarted it now.

> Could you please let me know where I can obtain the patch to include 
> module.h?

ftp.??.kernel.org:/pub/linux/kernel/people/alan/linux-2.2/2.2.20pre/pre-patch-2.2.20-10.bz2

--
dwmw2
