Received: from ntp.iriti.cnr.it ([150.145.55.6] helo=ghirolo.iriti.cnr.it)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159l7X-0000fL-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 11:09:59 +0100
Received: from zot.iriti.cnr.it
	([150.145.55.66] helo=iriti.cnr.it ident=fabrizio)
	by ghirolo.iriti.cnr.it with esmtp (Exim 3.12 #1 (Debian))
	id 159lCL-0007ZW-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 12:14:57 +0200
Message-ID: <3B25EBA0.71C2EF64@iriti.cnr.it>
Date: Tue, 12 Jun 2001 12:14:56 +0200
From: Fabrizio Pollastri <pollastri@iriti.cnr.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: "add only" fs
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hello,

a common problem in embedded systems is to log important data in a way
safe against power failure and software bugs.
The question is: may be jffs2 the right place to introduce an "add only"
protection? It can be at partition level, in such a way that mounting
that
partition as "add only" I am protected against loss of data, because I
can only create new files and/or append data to existing files and never
delete or truncate a file unless the partition is remounted rw.


Best regards,
Fabrizio Pollastri.
