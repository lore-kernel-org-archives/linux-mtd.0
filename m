Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mssR-0003hq-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2002 10:24:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AEEFILJDOOHJLBCFOBJDIEIJDAAA.thomas.testasecca@etictelecom.com> 
References: <AEEFILJDOOHJLBCFOBJDIEIJDAAA.thomas.testasecca@etictelecom.com> 
To: "Thomas TESTASECCA" <thomas.testasecca@etictelecom.com>
Cc: "Mtd" <linux-mtd@lists.infradead.org>
Subject: Re: Scheduler, or task priority problem ... i need help 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Sep 2002 10:24:37 +0100
Message-ID: <11415.1031217877@redhat.com>
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

thomas.testasecca@etictelecom.com said:
>  When i upload (by ftp) a file into the jffs2 (for a 200kByte file it
> takes approx 40s) during the upload time the pure-ftpd process really
> loads the system, and my WD task, doesn't run anymore until the end of
> the upload.

That should be fixed in the current CVS code. Can you try it?

I suppose there's something to be said for backporting the cond_resched() 
additions to the 2.4 tree too.

--
dwmw2
