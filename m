From: JDay@paradise.co.uk (John Day)
Date: Tue, 11 Mar 2003 09:57:42 -0000
Subject: DoC Debug Level Issue
In-Reply-To: <000401c2e5d3$6cb4e5d0$9d00a8c0@SPEEDWOLF>
Message-ID: <NFBBJMMEKLAEMEFBDILIGECHCBAA.JDay@paradise.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> I have a 64 Mb DoC that boots Linux using GRUB.  However, depending on
> what I set the MTD debug level to, the system will either work well, or
> hang when accessing the DoC.  I am using kernel 2.4.18 with the MTD CVS
> as of about one week ago.  The device has one ext2 partition on it.

> With the debug verbosity set to 3 (highest), the system boots fine, but
> rapidly fills up the kernel log file, especially when the DoC is the
> only device in the system.  With the debug level set to 2 or lower, the
> system hangs at the point during boot where the kernel tries to launch
> the init process.

> Any suggestions are appreciated.

> -- Dave

I have been investigating a similar problem with our MPC8260 PCB with a 3.3v
48M DOC using 2.4.10 Kernel.

Found the DOC resets during DoC_ScanChips in DOC2000.c when an invalid
second floor is selected. The code locks up unless the floating data bus
reads high. Later code seems to re-initialise the DOC....

Try setting MAX_FLOORS in DOC2000.h to 1. Temporary fix but worked for me.

This function does not appear to have changed in later kernels.

Hardware not Linux expert so sorry if email format not correct

John Day

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

This message is intended only for the use of the individual or entity to which it is addressed, and may contain information that is privileged, confidential and exempt from disclosure under applicable law.  If the reader of this message is not the intended recipient, or the employee or agent responsible for delivering the message to the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited.  If you have received this communication in error please return the message immediately to the sender and delete the message from your systems. Thank you.
