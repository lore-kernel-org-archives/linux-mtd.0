Received: from amdext2.amd.com ([163.181.251.1])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pAeO-0001mI-5j
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2003 18:52:08 +0100
Message-ID: <BCBC9D21763E5C42BEF10DC3BF958C9E05924FE1@txexmtab.amd.com>
From: jon.hoekwater@spansion.com
To: Bill_Hargen@Jabil.com
Date: Tue, 19 Aug 2003 12:50:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: cfi_cmdset_0002.c support for erase suspend and resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bill,

Thanks for your response.  I have responded below.

> -----Original Message-----
> From: Bill Hargen [mailto:Bill_Hargen@Jabil.com]
> Sent: Tuesday, August 19, 2003 12:16 PM
> To: Hoekwater, Jon
> Cc: 'linux-mtd@lists.infradead.org'
> Subject: Re: cfi_cmdset_0002.c support for erase suspend and resume
> 
> 
> -----Original Message-----
> > Date: Fri, 15 Aug 2003 16:24:30 -0500
> > From: jon.hoekwater@spansion.com
> >
> > I am adding support for the Am29LV640M.
> >
> > I will add support for the three byte device ID and buffered
> > writes.  Testing will be done on an Alchemy DbAU1500 using
> > MontaVista Linux.
> 
> Jon,
> 
> I am working with a custom board using the Am29LV640MT flash chip.
> Linux already had support for that chip - the only "problem" was that
> writes were taking way too long for my application.  (It took about 14
> minutes to erase and copy a 5.3 MB release to flash.)  I added support
> for buffered writes by adapting the code from cfi_cmdset_0001.c and
> reduced the time from 14 minutes to 2 minutes, and at least a third of
> that is erase time.  Using the write buffer makes a huge difference!
> 
> Since this has been for in-house use so far, I need to get my 
> manager's
> OK to release the code.  Should I send it to you to merge 
> with your work?
> 
> --Bill
> 
> 
I have buffered write code, thanks for the offer.  The erase suspend
code is my primary concern at this point.

Thanks again,
Jon
