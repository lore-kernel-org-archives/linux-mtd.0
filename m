Received: from msr95.hinet.net ([168.95.4.195] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SqLT-0002WF-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 03:39:48 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Ken Offer'" <koffer@arlut.utexas.edu>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: ECC in Nand_write_page
Date: Fri, 12 Jul 2002 10:39:36 +0800
Message-ID: <003701c2294d$5dcd6e40$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <A4461AAE-94D1-11D6-A71C-000393467F1A@arlut.utexas.edu>
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

I don't think nand_write_page can write partial page, if someone enable
ECC. For example, when I write the partial page to the page 100, it will
write ECC code into the page also, but when I write the other data to
the empty area of the same page, I can write data into  the empty area
of the page, but I can not write the ECC code, because the area storing
ECC code was written at the previous time.  


Steve Tsai


-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org] On Behalf Of Ken Offer
Sent: Thursday, July 11, 2002 9:25 PM
To: Steve Tsai
Cc: LinuxMTD
Subject: Re: ECC in Nand_write_page


On Thursday, July 11, 2002, at 05:19  AM, Steve Tsai wrote:

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

I have read that some NAND memory devices can read partial pages 
but must write full pages.  Could this be your problem?  In such 
cases you might have to read the page, make a write to part of 
the page and then write out the modified full page.

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
