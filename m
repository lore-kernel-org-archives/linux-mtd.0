Received: from msr11.hinet.net ([168.95.4.111] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SuNv-0002vN-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 07:58:35 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: <tglx@linutronix.de>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: ECC in Nand_write_page
Date: Fri, 12 Jul 2002 14:58:26 +0800
Message-ID: <000601c22971$86a72760$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <0GZ400FB0H66SJ@smtp-out.bhp.t-online.de>
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

Hi,
I am using 20020619 and JFFS2 file system. I did not set the following
option. Will it cause the error? Thanks.

CONFIG_MTD_NAND_ECC_JFFS2=y
CONFIG_JFFS2_FS_NAND=y

Steve Tsai

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org] On Behalf Of Thomas
Gleixner
Sent: Friday, July 12, 2002 2:12 PM
To: Steve Tsai; Linux MTD mailing list
Subject: Re: ECC in Nand_write_page


On Thursday, 11. July 2002 12:19, Steve Tsai wrote:
> The board I used will display the message, "nand_write_ecc: Failed ECC

> write", so I try to trace the function nand_write_ecc, I found it can 
> not write the ECC code into OOB sometime because the ECC in OOB are 
> not set as 0xff. There are two conditions to cause the problem, one 
> condition is the erase does not success, another condition is that the

> page  was written before. Nand_write_page could write partial page to 
> the flash. Does it cause the ECC in OOB was written and ECC can not be

> written next time. For example, nand_write_page write 100 byte the 
> first time and if it want to write 412 bytes to the same page next 
> time, it will fail. Does anyone have this problem?

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
			this->data_buf[(mtd->oobblock +
oob_config.ecc_pos[i])] = ecc_code[i];
		if (oob_config.eccvalid_pos != -1)
			this->data_buf[mtd->oobblock +
oob_config.eccvalid_pos] = 0xf0;
	}

	/* Calculate and write the second ECC if we have enough data */
	if ((mtd->oobblock == 512) && (last == mtd->oobblock)) {
		nand_calculate_ecc (&this->data_buf[256],
&(ecc_code[3]));
		for (i = 3; i < 6; i++)
			this->data_buf[(mtd->oobblock +
oob_config.ecc_pos[i])] = ecc_code[i];
		if (oob_config.eccvalid_pos != -1)
			this->data_buf[mtd->oobblock +
oob_config.eccvalid_pos] &= 0x0f;
	}


-- 
Thomas
___________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
