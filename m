Received: from 42.242.232.72.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7x0m-0008VV-F7
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 11:54:47 -0500
Received: from mail.b-incubator.org ([213.184.250.250]:33971
	helo=[192.168.10.139])
	by secure.poehali.org with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <eugene.kozlov@promwad.com>) id 1H7wyp-00016s-3g
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 18:52:43 +0200
Message-ID: <45B11371.2080400@promwad.com>
Date: Fri, 19 Jan 2007 18:52:33 +0000
From: Eugene <eugene.kozlov@promwad.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nand_base questions
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello i just confused because:
1. NAND_CMD_STATUS command realized in NAND_CMD_RESET case:
        case NAND_CMD_RESET:
                if (this->dev_ready)
                        break;
                udelay(this->chip_delay);
                this->hwcontrol(mtd, NAND_CTL_SETCLE);
                this->write_byte(mtd, NAND_CMD_STATUS);
                this->hwcontrol(mtd, NAND_CTL_CLRCLE);
                while ( !(this->read_byte(mtd) & NAND_STATUS_READY));
                return;
2. One time uses
             if (!this->dev_ready) {
                        udelay (this->chip_delay);
                        return;
another
                if (!this->dev_ready)
                        udelay (this->chip_delay);
                else
                        nand_wait_ready(mtd);
another
                if (this->dev_ready) {
                        if (this->dev_ready(mtd))
                                break;
                } else {
                        if (this->read_byte(mtd) & NAND_STATUS_READY)
                                break;
What the conception? Because as i understand read status register isn't
working yet.
