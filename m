Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CqvS3-0002Tl-TO
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 10:39:29 -0500
Message-ID: <41ED2EB3.1070203@redhat.com>
Date: Tue, 18 Jan 2005 09:43:47 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: additional error checks for AG-AND erase/write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The Renesas AG-AND chips support additional error checking on erase and
write operations beyond just checking the operation status.  I think the
logic is that since ECC can correct 2-bit errors on read, if only a
single bit error occurs on and erase or write the operation should not
be considered FAIL.  Even if a single bit error occurs on read (in
addition to the single bit error on write), it will still be corrected
and no data will be lost.

I'm looking at how to implement the additional status checks, and am
considering adding an optional callback routine to nand_base that, if
defined, would be called in the event of an erase or write error before
returning a FAIL status.  The nand_write routine would need to be
modified to perform the callback routine as follows:

<pseudocode>
     command(SEQIN)  // begin auto page programming
     enable_hwecc(WRITE)
     write_buffer(data)
     calculate the ECC  // from FPGA
     write_buffer(ECC)
     command(PAGE_PROGRAM)
+   if READY && (status & 0x01)  // Program Fail (I/O1=1)
+      && error_status_callback  //   and there is a callback
+     status = error_status_callback(page)
+   endif
     if READY && (status & 0x01)  // Program Fail (I/O1=1)
       return error
     endif


// The callback routine itself would need to perform the following:

error_status_callback(page)
     status = read_error_status
     if !(status & 0x20)  // ECC not available (I/O6=0)
       return error
     else
       ReadECCcheck(page)  // Read the data and check the status
       if (!1_bit_error)   // if Not 1 bit error
          return error
       endif
     endif
     return ok
</pseudocode>


One problem I see is that in order to determine if there is a 1-bit 
error, we must perform a "read" of the page in question, but the erase 
and write routines both hold a "lock" on the device through 
'nand_get_device'.  This would prevent the read from proceeding until 
the erase or write completed (deadlock).

Is there a better place to include additional status checks, or a more 
appropriate method of implementing this?  I would appreciate any 
suggestions.


Thank you,

d.marlin
