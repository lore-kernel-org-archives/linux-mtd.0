Received: from tomts5.bellnexxia.net ([209.226.175.25]
	helo=tomts5-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALaWF-0002wm-GA
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 03:57:43 +0000
Received: from sympatico.ca ([65.93.214.38]) by tomts5-srv.bellnexxia.net
          (InterMail vM.5.01.06.05 201-253-122-130-105-20030824) with ESMTP
          id <20031117035616.NXG21460.tomts5-srv.bellnexxia.net@sympatico.ca>
          for <linux-mtd@lists.infradead.org>;
          Sun, 16 Nov 2003 22:56:16 -0500
Message-ID: <3FB846E0.1080607@sympatico.ca>
Date: Sun, 16 Nov 2003 22:56:16 -0500
From: Mike Gore <magore@sympatico.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: GRUB MTD DISKONCHIP patch failure with"grub-2003-01-08-doc.patch"
 on file stage2/disk_io.c using latestGRUB CVS
Reply-To: magore@icr1.uwaterloo.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    Thanks! The updated patch worked just great

>Mike,
>
>On Mon, Nov 10, 2003 at 10:11:32PM -0500, Mike Gore wrote:
>>/ I downloaded the latest CVS for grub on 10 Nov 2003 at 9:30pmEST and 
>/>/ attempted to apply the MTD patch grub-2003-01-08-doc.patch
>/>/ Besides the expected Changelog and Authors errors I got one rejected 
>/>/ section on stage2/disk_io.c (see below for copy of the failed section)
>/
>I updated the patch to match the change in disk_io.c you've found.  The
>new patch is grub-2003-11-10-doc.patch.  I tested it only with a floppy
>boot.
>
>-- 
>Ilguiz Latypov
>
>tel.  +1 (519) 569-8746
>66 Wildlark Crescent
>Kitchener, Ontario N2N 3E9
>

-- 
# Mike Gore
# At Home:	InfoWrite Consulting
# Mail:		405 Midwood Cres, Waterloo Ontario, N2L 5N4
# Phone:	1-519-884-4943
# Fax:		1-519-885-0548
# Email:	magore@sympatico.ca
#
# At Work: 	Technical Support, CSCF
# Smail:   	DC3549C, University of Waterloo, 200 University Ave
#	     	Waterloo Ontario, Canada, N2L 3G1
# Phone:	1-519-888-4567, x6205
# Fax:		1-519-746-5036
# Email:	magore@uwaterloo.ca
