Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zgd7-0005QF-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 00:42:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FA06AA2C99BCD511951200005A99441001E3ECC3@irvexch1.sextantifs.com> 
References: <FA06AA2C99BCD511951200005A99441001E3ECC3@irvexch1.sextantifs.com> 
To: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 00:42:14 +0100
Message-ID: <16163.1028072534@redhat.com>
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

Allen.Curtis@Thales-IFS.com said:
>  Questions then: 1. Does this node get reclaimed? I get this same
> message now with each reboot.

It'll get erased when that block gets garbage-collected.

> 2. It appears that the mount operation gets slower once this error
> condition occurs. Is this possible/expected?

Definitely not expected. I can't really see how it's possible. I'd say it's 
probably a coincidence.

> 3. If the file-system becomes corrupted, what is the failure condition
> and how do you correct it? Test for it?

JFFS2 is purely log-structured. There are few ways in which the file system 
as a whole can be declared to be 'corrupted'. The only real case I can 
think of is when a directory with children appears to have no links from 
the root inode, which is obviously a bug. In that case, we just delete the 
offending directory and all its children. I suppose we should really 
re-link it to /lost+found instead :)

--
dwmw2
