Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SY1C-0000r7-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 08:05:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200207101752.51379.nsnehaprabha@tnint11.telogy.design.ti.com> 
References: <200207101752.51379.nsnehaprabha@tnint11.telogy.design.ti.com> 
To: Snehaprabha <nsnehaprabha@tnint11.telogy.design.ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 Jul 2002 08:05:35 +0100
Message-ID: <4554.1026371135@redhat.com>
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

nsnehaprabha@tnint11.telogy.design.ti.com said:
>  I copy a file, and delete it for several times;  (You can think of a
> case  where a configuration file is written again and again).

> Depending on the space I had initially, it reaches a stage, where I
> cannot   copy the file any more though 'df' shows enough available
> space for the file. 

Until recently there was a bug where we wouldn't reclaim the space if you 
renamed one file over another. Could it be that? If not, it's not a known 
problem.

What version of the JFFS2 code are you using? Do you have a serial console? 
Can you set CONFIG_JFFS2_FS_DEBUG=1 and set the console loglevel to 9 so 
that all the resulting KERN_DEBUG messages are printed, then reproduce the 
problem while logging the output?


--
dwmw2
