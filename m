Received: from smtp-out-2.wanadoo.fr ([193.252.19.254] helo=mel-rto2.wanadoo.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mxAX-0004Ag-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2002 14:59:37 +0100
From: "Thomas TESTASECCA" <thomas.testasecca@etictelecom.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Mtd" <linux-mtd@lists.infradead.org>
Subject: RE: Scheduler, or task priority problem ... i need help 
Date: Thu, 5 Sep 2002 15:57:39 +0200
Message-ID: <AEEFILJDOOHJLBCFOBJDKEINDAAA.thomas.testasecca@etictelecom.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <11415.1031217877@redhat.com>
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

Hi,

What do i need to do to update my kernel with last mtd cvs ?
Is just copying the files ?

tom

-----Message d'origine-----
De : linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]De la part de David
Woodhouse
Envoye : jeudi 5 septembre 2002 11:25
A : Thomas TESTASECCA
Cc : Mtd
Objet : Re: Scheduler, or task priority problem ... i need help 



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



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
