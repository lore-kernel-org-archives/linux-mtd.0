Received: from www.pertocheque.com.br ([200.182.168.130]
	helo=rsmail.perto.com.br)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cu8Yj-0007Yj-JH
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 07:15:40 -0500
Date: Thu, 27 Jan 2005 10:18:09 -0200
Message-Id: <200501271218.j0RCI9L07866@rsmail.perto.com.br>
From: "Moises Beck - EDS Digicon" <mbeck@perto.com.br>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: nand_scan identification problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,
     I am using a smartmedia card on linux MTD. Everything runs very
well. But just after power on, the first attempt to load the driver
spia.o fails. The driver calls nand_scan(), that cannot identify the
present card. On the second attempt to load the driver, the flash is
correctly identified. I saw that in nand_scan(), the command
NAND_CMD_READID return nand_maf_id=0 and nand_dev_id=0 on the first call
to it. On the second call the IDs are returned correctly. I tried to
solve this by putting the following code just before the command
NAND_CMD_READID, on nand_base.c:

        /* Select the device */
        this->select_chip(mtd, 0);
                                                                       
        
        /* by momo - reset smartmedia e put it on mode READ */
        this->cmdfunc (mtd, NAND_CMD_RESET, -1, -1);
        this->cmdfunc (mtd, NAND_CMD_READ0, -1, -1);
                                                                       
        
        /* Send the command for reading device ID */
        this->cmdfunc (mtd, NAND_CMD_READID, 0x00, -1);
                                                                       
        
        /* Read manufacturer and device IDs */
        nand_maf_id = this->read_byte(mtd);
        nand_dev_id = this->read_byte(mtd);

     But this does not run, and to problem persists. If the funtion to
NAND_CMD_READID is called twice, as in

        /* Select the device */
        this->select_chip(mtd, 0);
 
        /* Send the command for reading device ID */
        /* by momo - send the command twice !!! */
        this->cmdfunc (mtd, NAND_CMD_READID, 0x00, -1);
        this->cmdfunc (mtd, NAND_CMD_READID, 0x00, -1);
                                                                       
        
        /* Read manufacturer and device IDs */
        nand_maf_id = this->read_byte(mtd);
        nand_dev_id = this->read_byte(mtd);

    then it runs well, always identifying the flash on the first call to
the funtion nand_scan !!!
    I am using mtd-snapshot-20050111.

Anyone has some clue ?

Thanks,
Moises
