Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pmQn-0008Iw-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 10:08:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.40.0209131025370.1575-100000@mag.devdep.sysgo.de> 
References: <Pine.LNX.4.40.0209131025370.1575-100000@mag.devdep.sysgo.de> 
To: Marius Groeger <mag@sysgo.de>
Cc: Karim Yaghmour <karim@opersys.com>, linux-mtd@lists.infradead.org
Subject: Re: the procedure setting up jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Fri, 13 Sep 2002 10:07:48 +0100
Message-ID: <13829.1031908068@redhat.com>
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

mag@sysgo.de said:
>  Regarding the main-line kernel: don't forget that updating
> kernel.org's MTD is one thing -- having more mapping drivers actually
> _use_ cmdline.c is another. This is the job of the corresponding
> maintainers.

I need to push the current stuff to Linus fairly soon, after which we can 
go through Jörn's new partition stuff and argue about the details for a 
while before merging it :)

--
dwmw2
