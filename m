Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16j8aX-000616-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Mar 2002 00:50:25 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFA54@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: 'Herman Theron' <HEtheron@csir.co.za>, strtok@hotmail.com,
	linux-mtd@lists.infradead.org
Subject: RE: Lost DOC2000 after trying to load grub 
Date: Thu, 7 Mar 2002 17:01:46 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

How feasible would it be to port the M-Systems DFORMAT utility to work 
under Linux through the MTD driver? 

[Vadim]
If you guys have a hooks for physical access operations like read physical
page, write physical page and erase unit it should not be a problem .

Vadim

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Thu, March 07, 2002 8:01 AM
To: Vadim Khmelnitsky
Cc: 'Herman Theron'; strtok@hotmail.com; linux-mtd@lists.infradead.org
Subject: Re: Lost DOC2000 after trying to load grub 



VadimK@m-sys.com said:
> If i understand eraseall utility correctly it erases the whole
> diskonchip completely . After that bad block table is lost and it's
> unsafe to use such diskonchip afterwards . 

You are correct. Neither nftl_format or eraseall functions are safe.

How feasible would it be to port the M-Systems DFORMAT utility to work 
under Linux through the MTD driver? 

--
dwmw2
