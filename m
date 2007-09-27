Received: from vsnlchnsym02.vsnlxchange.com ([59.163.96.4])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Iay1U-0003Hx-Ee
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 14:23:45 -0400
Received: from vsnlchnsym02.vsnlxchange.com (unknown [127.0.0.1])
	by vsnlchnsym02.vsnlxchange.com (Symantec Mail Security) with ESMTP id
	E320F520003 for <linux-mtd@lists.infradead.org>;
	Thu, 27 Sep 2007 23:34:04 +0530 (IST)
From: "Gangadhar Kodishala" <gangadhark@tataelxsi.co.in>
To: <linux-mtd@lists.infradead.org>
Subject: 
Date: Thu, 27 Sep 2007 11:03:59 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: 7bit
Message-ID: <VSNLCHNFE002syCCr8H0000c0ce@VSNLCHNFE002.VSNLXCHANGE.COM>
Reply-To: gangadhark@tataelxsi.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have a NAND flash of 64 MB on my board with separate partitions for root
file system and data.

My board boots up with the root file system (jffs2) on NAND flash. This root
file system partition is made smaller enough to hold all the root file
system data.

I created another partition on NAND to use specifically for the data. I
would like to create a JFFS2 file system on this data partition, mount it
and use it to store my application code and data files,

I do not know exactly how to create the JFFS2 file system on data partition.


Could you please explain me how to do this ?

Thank you.

Best Regards,
Gangadhar

No virus found in this outgoing message.
Checked by AVG Free Edition. 
Version: 7.5.488 / Virus Database: 269.13.30/1030 - Release Date: 9/25/2007
8:02 AM
 


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.

Contact your Administrator for further information.
