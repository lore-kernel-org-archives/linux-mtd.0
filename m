Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15mbsV-0008O2-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2001 15:11:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <82B1591A280FD411B91200D0B75B484A015F5C6C@sis-uk-msg01.altera.com> 
References: <82B1591A280FD411B91200D0B75B484A015F5C6C@sis-uk-msg01.altera.com> 
To: Clive Davies <cdavies@altera.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: endless calls to jffs_garbage_collect_trigger 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 27 Sep 2001 15:20:01 +0100
Message-ID: <23140.1001600401@redhat.com>
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

cdavies@altera.com said:
>  I've got around the problem by forcing jffs_garbage_collect_trigger
> to clear s_dirt, but as I know very little about jffs I suspect that
> this my not be the best/correct solution.  

That's the solution I committed to CVS a few days ago. I've sent the latest 
code, including that patch, to Linus and Alan, and hopefully each will 
include it in their next release.

--
dwmw2
