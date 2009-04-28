Received: from qw-out-1920.google.com ([74.125.92.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LyePJ-0007CQ-BI
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 03:55:04 +0000
Received: by qw-out-1920.google.com with SMTP id 4so287840qwk.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Apr 2009 20:54:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3cc7a0df0904260309g4486ad02u9bc8ebe886fc9d8@mail.gmail.com>
References: <3cc7a0df0904250127y3f2dbb65t50f349c3e9dfb969@mail.gmail.com>
	<9c9fda240904251922t7b2f6979j5a94115b0079c10a@mail.gmail.com>
	<3cc7a0df0904260309g4486ad02u9bc8ebe886fc9d8@mail.gmail.com>
Date: Tue, 28 Apr 2009 09:24:54 +0530
Message-ID: <3cc7a0df0904272054l1fe78063jfde4ff73e6ae960d@mail.gmail.com>
Subject: Re: [PATCH] Onenand Reset IOBE bit in SYS_CFG register in
	onenand_release
From: Gaurav Singh <gausinghnsit@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Linux mtd group <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I think that the interrupt mode will help when there is high load on
> the CPU. Will run tests in interrupt and polling mode in two
> scenarios. 1. Copy of a large file to ONENAND with no CPU load. 2.
> Copy of a Large file to ONENAND with an infinite loop running in the
> background - this generates CPU load. Little bit busy today but will
> run it and mail the results by tomorrow. In my opinion Scenario 2
> should give better results in interrupt mode.

Interrupt mode is giving better results than the normal polling mode.
In terms of time taken to copy both the modes are taking the same time
for both scenarios. But in the case of interrupt mode the CPU usage is
coming out to be less as indicated by top. Average CPU usage in
Scenario 2 is 40% for interrupt mode whereas it is 57% for polling
mode.

 diff --git a/drivers/mtd/onenand/onenand_base.c
 b/drivers/mtd/onenand/onenand_base.c
 index 0e168d8..9b2f9aa 100644
 --- a/drivers/mtd/onenand/onenand_base.c
 +++ b/drivers/mtd/onenand/onenand_base.c
 @@ -2728,6 +2728,13 @@ void onenand_release(struct mtd_info *mtd)
        /* Deregister partitions */
        del_mtd_partitions (mtd);
  #endif
 +       /* Reset the IOBE bit in SYS_CFG Register */
 +        if ( this->wait == onenand_interrupt_wait ) {
 +               int syscfg = this->read_word(this->base +
ONENAND_REG_SYS_CFG1);
 +               syscfg &= ~ONENAND_SYS_CFG1_IOBE;
 +               this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1);
 +       }
        /* Deregister the device */
        del_mtd_device (mtd);

Regards
Gaurav Singh
