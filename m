Received: from web60301.mail.yahoo.com ([216.109.118.112])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7o2V-0002S9-MH
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 04:34:03 +0100
Message-ID: <20031010033236.74060.qmail@web60301.mail.yahoo.com>
Date: Thu, 9 Oct 2003 20:32:36 -0700 (PDT)
From: Kevin Kaichuan He <hek_u5@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: nand_scan() returns 0 even if no nand chip exists
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems to me that the nand_scan() in nand.c will return 0
even if no NAND chip is detected (CVS code on 10/09/03). This
has negative impact since my hardware specific nand driver
will assume a NAND chip is detected and go on doing 
add_mtd_partition() ...

I applied the following patch to avoid the problem, not sure
if I missed anything:

--- ./nand/nand.c       2003-10-09 19:10:05.000000000 -0700
***************
*** 1388,1394 ****
                }
        }

!       for (i=1; i < maxchips; i++) {
                this->select_chip(mtd, i);

                /* Send the command for reading device ID */
--- 1388,1396 ----
                }
        }

!       if (nand_flash_ids[i].name) {  /* Added by Kevin */
!                 /* Found NAND  */
!         for (i=1; i < maxchips; i++) {
                this->select_chip(mtd, i);

                /* Send the command for reading device ID */
***************
*** 1398,1408 ****
                if (nand_maf_id != this->read_byte(mtd) ||
                    nand_dev_id != this->read_byte(mtd))
                        break;
       }
       if (i > 1)
                printk(KERN_INFO "%d NAND chips detected\n", i);

       mtd->size = (1 << this->chipshift) /* * i when we fix the rest of the code */;

        /*
         * check ECC mode, default to software
--- 1400,1411 ----
                if (nand_maf_id != this->read_byte(mtd) ||
                    nand_dev_id != this->read_byte(mtd))
                        break;
         }
         if (i > 1)
                printk(KERN_INFO "%d NAND chips detected\n", i);

         mtd->size = (1 << this->chipshift) /* * i when we fix the rest of the code */;
+       }

        /*
         * check ECC mode, default to software


Thanks

Kevin
