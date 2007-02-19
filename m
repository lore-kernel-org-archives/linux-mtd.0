Received: from py-out-1112.google.com ([64.233.166.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJHew-0000gC-Br
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 18:11:05 -0500
Received: by py-out-1112.google.com with SMTP id p76so967836pyb
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Feb 2007 15:10:58 -0800 (PST)
Message-ID: <e167438e0702191510v2f68036bt20af6f6db6d13bed@mail.gmail.com>
Date: Mon, 19 Feb 2007 17:10:58 -0600
From: "Julianne C." <juliannerc@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: OneNAND: Enabling ECC in main area
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a continuation of the "unexpected zero" problem reported
earlier.  With further experimentation and investigation, we observe
the following behavior:

The bootloader on the board we use (LogicPD PXA270) does not have ECC
enabled during its operation.  Hence, we need to enable it sometime
during the OneNAND device driver setup.
This is the code that is inserted in the onenand_probe function, just
after the first wait call.

    // Contains old value of sysconfig register from bootloader
    syscfg = syscfg & 0xfeff; // ~0x0100;

    this->write_word (syscfg,
                             this->base + ONENAND_REG_SYS_CFG1);


    // Reset the command after enabling the ECC.
    this->write_word (ONENAND_CMD_RESET,
                             this->base + ONENAND_BOOTRAM);

    // Wait reset.
    this->wait (mtd,
                    FL_RESETING);

Using the utility mtd_debug 'write' mode, a file with a known pattern
is written to a partition on the OneNAND device:

mtd_debug write /dev/mtd3 0 0x10000 test_64k.bin

When we inspect the area using nanddump:

nanddump -p -l 0x2000 /dev/mtd3

we see the expected pattern in the main area of the partition, but the
spare OOB area is still completely untouched (all FF).

We created a modified version of the mtd_debug program that writes
only to the OOB area using the ioctl command

        err = ioctl (fd,
                        MEMWRITEOOB,
                        &oob);

where the oob structure contains a count sequence leaving out the 5
spare bytes reserved for ECC in each 16 bytes of OOB.  On inspection
using nanddump again, we see that all of the OOB data has been written
successfully, including the 2 spare area ECC bytes.

It is my understanding (please correct me if I am wrong) that setting
the 'ECC enable' bit in system config 1 register (bit 8) to zero (as
in the enable described above), should enable ECC for both the main
and OOB areas.

Is there something we are missing in getting the ECC to work with the main area?

Also, if the ECC is working correctly, should we see non FF bytes in
the spare area in bytes 8 to 10 of each 16 byte portion of the OOB
when we do a dump of the data?

Regards,

Julianne C.
