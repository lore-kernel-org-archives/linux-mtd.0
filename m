Received: from smtp-1.llnl.gov ([128.115.3.81])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eos3U-0005qY-7k
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2005 19:42:09 -0500
From: Dave Peterson <dsp@llnl.gov>
To: linux-mtd@lists.infradead.org
Date: Tue, 20 Dec 2005 16:42:05 -0800
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512201642.05224.dsp@llnl.gov>
Cc: ebiederman@lnxi.com
Subject: ichxrom driver question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I attempted to flash the BIOS on a machine with an Intel 82801CA
(ICH3-S) I/O Controller Hub as follows:

    # modprobe ichxrom
    # modprobe mtdchar
    # mtd_unlock /dev/mtd0
    # mtd_eraseall /dev/mtd0
    Erased 512 Kibyte @ 0 -- 100% complete.
    # dd if=bios_image of=/dev/mtd0
    1024+0 records in
    1024+0 records out
    # dd if=/dev/mtd0 of=result
    1024+0 records in
    1024+0 records out
    # mtd_lock /dev/mtd0 0 -1

After doing the above, I examind the file 'result' and all it
contains is a bunch of zero bytes.  Thus the BIOS flashing operation
appears to have failed (I confirmed this by attempting to reboot, and
sure enough, the BIOS appears to have been wiped out).

I did this using the version of the ichxrom driver from the 2.6.9
kernel.  Looking briefly at this code in comparison to a more recent
version of the code from the 2.6.14.4 kernel, it looks like
substantial changes have been made.

So my question is, are there known problems with the version of the
ichxrom driver in the 2.6.9 kernel, and if so, have the problems
been fixed in later kernels?  Also, are there any known issues with
the ICH3-S that may explain the behavior I observe?  When replying,
please cc dsp@llnl.gov.

Thanks,
Dave
