From: "Kyungmin Park" <kmpark@infradead.org>
To: <vwool@ru.mvista.com>
Subject: bug in drivers/mtd/onenand/onenand_base.c?
Date: Thu, 22 Mar 2007 20:44:45 +0900
Message-ID: <000001c76c77$80f44a70$06100a3b@user001b2c71e3>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vitaly Wool,

Sorry, I'm not office so I can't access my computer.
To help your work I send the URL related this problem.
This problem is reported previous time but not commit it.

Please check this mail. It would help your work.
http://linux.omap.com/pipermail/linux-omap-open-source/2007-March/009395.htm
l

I saw your mtd git tree related with yaffs. I tested the yaffs on onenand
before. But as you know it failed.
Now with your patch how many bytes are needed in yaffs if ecc provided?
Maybe we need to modify onenand read & write function to support read/write
with oob simultaneously.
Currently it only supports separated read or oob function only, instead of
both.

If the yaffs requires less or equal with 20 bytes, it will work with
OneNAND. Of course, if the page is 1KB, it can't. Since it has only 10 bytes
OOB.

I hope yaffs can run with OneNAND.

Thank you,
Kyungmin Park
