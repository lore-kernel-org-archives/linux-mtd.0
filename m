Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eznj3-0008H7-NU
	for linux-mtd@lists.infradead.org; Thu, 19 Jan 2006 23:18:18 -0500
Received: from 202-154-140-137.ras.actrix.co.nz (unknown [202.154.140.137])
	by desire.actrix.co.nz (Postfix) with ESMTP id D1E00150EF
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jan 2006 17:18:00 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Fri, 20 Jan 2006 17:19:28 +1300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200601201719.28405.manningc2@actrix.gen.nz>
Subject: Reading the AUTOPLACED OOB data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

Last I recall, an interface function to read the autoplaced available oob data 
(as required by YAFFS, and perhaps others) was imminent. 

There is nand_read_oob() which reads the **raw** oob data, but there is no 
function that allows just reading the AUTOPLACED stuff, AFAIK.

Did this happen? If so I can't see it in CVS.

Is anyone actively working on this?

Thanx

-- Charles
