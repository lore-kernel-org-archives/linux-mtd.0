Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SteH-0002so-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 07:11:25 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0GZ400FAZH66SJ@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Fri, 12 Jul 2002 08:10:54 +0200 (MEST)
Date: Fri, 12 Jul 2002 08:11:32 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: ECC in Nand_write_page
In-reply-to: <003701c228c4$7decfee0$5501a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <0GZ400FB0H66SJ@smtp-out.bhp.t-online.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <003701c228c4$7decfee0$5501a8c0@synso.com.tw>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thursday, 11. July 2002 12:19, Steve Tsai wrote:
> The board I used will display the message, "nand_write_ecc: Failed ECC
> write", so I try to trace the function nand_write_ecc, I found it can
> not write the ECC code into OOB sometime because the ECC in OOB are not
> set as 0xff. There are two conditions to cause the problem, one
> condition is the erase does not success, another condition is that the
> page  was written before. Nand_write_page could write partial page to
> the flash. Does it cause the ECC in OOB was written and ECC can not be
> written next time. For example, nand_write_page write 100 byte the first
> time and if it want to write 412 bytes to the same page next time, it
> will fail. Does anyone have this problem?

Do you use latest CVS code ?
Which filesystem do you use ?
There's only JFFS2, which can handle the nand problem correct.

Read http://www.linux-mtd.infradead.org/tech/nand.html !

1. If an erase fails, the JFFS2 does not use this block.

2. JFFS2 writes only full pages

3. ECC is definitely not written, if you write 100 bytes

	/* Calculate and write the ECC if we have enough data */
	if ((col < mtd->eccsize) && (last >= mtd->eccsize)) {
		nand_calculate_ecc (&this->data_buf[0], &(ecc_code[0]));
		for (i = 0; i < 3; i++)
			this->data_buf[(mtd->oobblock + oob_config.ecc_pos[i])] = ecc_code[i];
		if (oob_config.eccvalid_pos != -1)
			this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] = 0xf0;
	}

	/* Calculate and write the second ECC if we have enough data */
	if ((mtd->oobblock == 512) && (last == mtd->oobblock)) {
		nand_calculate_ecc (&this->data_buf[256], &(ecc_code[3]));
		for (i = 3; i < 6; i++)
			this->data_buf[(mtd->oobblock + oob_config.ecc_pos[i])] = ecc_code[i];
		if (oob_config.eccvalid_pos != -1)
			this->data_buf[mtd->oobblock + oob_config.eccvalid_pos] &= 0x0f;
	}


-- 
Thomas
___________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
