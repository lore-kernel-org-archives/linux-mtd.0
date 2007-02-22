Received: from py-out-1112.google.com ([64.233.166.177])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HKGvR-0000u3-Jo
	for linux-mtd@lists.infradead.org; Thu, 22 Feb 2007 11:36:12 -0500
Received: by py-out-1112.google.com with SMTP id p76so115034pyb
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Feb 2007 08:36:07 -0800 (PST)
Message-ID: <e167438e0702220835gbc5562fl4dc0bc4bd879f649@mail.gmail.com>
Date: Thu, 22 Feb 2007 10:35:35 -0600
From: "Julianne C." <juliannerc@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: OneNAND: Rate of write errors
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

Further thought about the numerous write errors to the OneNAND part
got me thinking about the symptoms, i.e., when we see the -EBADMSG
error return, there is no corresponding fault reported in the ECC
status register.  Consequently, we concluded that the bufferram may be
getting corrupted before the data is ever committed to the NAND array.

Hence, we rewrote the code for the setup as follows in the
onenand_write procedure:

        do
        {
            this->write_bufferram (mtd,
                                   ONENAND_DATARAM,
                                   wbuf,
                                   0,
                                   mtd->writesize);

            ret = onenand_do_check_bufferram (mtd,
                                              ONENAND_DATARAM,
                                              wbuf,
                                              0,
                                              mtd->writesize);

            if (ret != 0) // then
            {
                retrys = retrys + 1;

                printk (KERN_WARNING
                        "onenandwrite: bad buffer ram, retrying (%d)\n",
                        retrys);
            } // end if
        } while (ret != 0 &&
                 retrys < max_retrys);

        if (retrys >= max_retrys) // then
        {
            ret = -EBADMSG;

            break;
        } // end if

With max_retrys set to three (we have seen double attempts) to make
this work all the time.  There are no more errors reported back to the
JFFS2 system, and the file system cleanly mounts and unmounts.

This does verify the suspicion that the buffer was corrupted before it
was committed.  Does anyone have any idea how or why the data in the
bufferram might be corrupted?

Julianne C.
