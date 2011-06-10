Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUxA5-0002K6-3k
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2011 08:33:49 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
	by co202.xi-lite.net (Postfix) with ESMTPS id 31D43260300
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Jun 2011 12:27:49 +0200 (CEST)
Message-ID: <4DF1D6C5.8080503@parrot.com>
Date: Fri, 10 Jun 2011 10:33:09 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: omap2 : bug in omap_wait
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

omap nand driver implement the nand.waitfunc[1] but it is buggy and can lead to
 nand write/erase error :
- status = NAND_STATUS_FAIL
- timeo is computed
- thread is preempted
- timeo is expired and we never enter the loop
- we return NAND_STATUS_FAIL, even if the real status is okay.

The correct behavior is to read again the status after the loop like in nand_wait.


BTW why omap2 driver doesn't use nand_wait ?

Matthieu

[1]
static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
{
    struct nand_chip *this = mtd->priv;
    struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
                            mtd);
    unsigned long timeo = jiffies;
    int status = NAND_STATUS_FAIL, state = this->state;

    if (state == FL_ERASING)
        timeo += (HZ * 400) / 1000;
    else
        timeo += (HZ * 20) / 1000;

    gpmc_nand_write(info->gpmc_cs,
            GPMC_NAND_COMMAND, (NAND_CMD_STATUS & 0xFF));
    while (time_before(jiffies, timeo)) {
        status = gpmc_nand_read(info->gpmc_cs, GPMC_NAND_DATA);
        if (status & NAND_STATUS_READY)
            break;
        cond_resched();
    }
    return status;
}
