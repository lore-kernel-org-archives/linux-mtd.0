Received: from an-out-0708.google.com ([209.85.132.247])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDKOn-0006iL-3m
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 13:58:24 +0000
Received: by an-out-0708.google.com with SMTP id c3so240318ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Jan 2008 05:58:15 -0800 (PST)
Date: Fri, 11 Jan 2008 07:57:30 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Jeff S <jsolman33@yahoo.com>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080111075730.052c821d@zod.rchland.ibm.com>
In-Reply-To: <298338.39997.qm@web56002.mail.re3.yahoo.com>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 Jan 2008 15:38:50 -0800 (PST)
Jeff S <jsolman33@yahoo.com> wrote:

> How would one go about checking if JFFS2 is done with a file operation, or all current pending operations?  Is there something in the proc file system or sys file system that allows you to determine the JFFS2 state or something similar.  I need to be able to notify a user that the flash has been written successfully after open, write, and close operations. Thank you.

If you are using regular NOR flash and have the write buffer disabled,
anything you write via the write system call will be written to flash
before it returns.  The open call doesn't cause any writes, and close
is supposed to flush all pending writes before it returns.

There is always fsync or sync as well.

josh
