Received: from tomts24.bellnexxia.net ([209.226.175.187] helo=tomts24-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eIpe-0006CV-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 16:46:02 +0000
Date: Fri, 22 Feb 2002 11:57:12 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Herman Theron <HEtheron@csir.co.za>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Error using GRUB patch (and LILO questions)
In-Reply-To: <sc760dea.038@CS-IMO.CSIR.CO.ZA>
Message-ID: <Pine.LNX.4.44.0202221145120.8089-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Herman,

Can you try the updated automake and autoconf packages from
  ftp://ftp.redhat.com/pub/redhat/linux/rawhide/i386/RedHat/RPMS

Mine are
  automake-1.5-8
  autoconf-2.52-6
I get only a couple of warnings with autoconf.  Sorry for the 
configuration nuisance.

Ilguiz

P.S.  Have you checked the LILO HOWTO at
http://www.ibiblio.org/pub/Linux/docs/HOWTO/mini/LILO ? After the quick
search on the web I have a suspicion that your M-Sys BIOS firmware was
configured to pretend as a second hard drive.

On Fri, 22 Feb 2002, Herman Theron wrote:

> stage1/Makefile.am:55: invalid variable `nodist_pkgdata_DATA'
