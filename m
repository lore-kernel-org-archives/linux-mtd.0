Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Sdwf-0001Kh-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 14:25:22 +0100
Date: Thu, 11 Jul 2002 08:25:17 -0500
Subject: Re: ECC in Nand_write_page
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
To: "Steve Tsai" <startec@ms11.hinet.net>
From: Ken Offer <koffer@arlut.utexas.edu>
In-Reply-To: <003701c228c4$7decfee0$5501a8c0@synso.com.tw>
Message-Id: <A4461AAE-94D1-11D6-A71C-000393467F1A@arlut.utexas.edu>
Content-Transfer-Encoding: 7bit
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

On Thursday, July 11, 2002, at 05:19  AM, Steve Tsai wrote:

> The board I used will display the message, "nand_write_ecc: Failed ECC
> write", so I try to trace the function nand_write_ecc, I found it can
> not write the ECC code into OOB sometime because the ECC in OOB are not
> set as 0xff. There are two conditions to cause the problem, one
> condition is the erase does not success, another condition is that the
> page  was written before. Nand_write_page could write partial page to
> the flash. Does it cause the ECC in OOB was written and ECC can not be
> written next time. For example, nand_write_page write 100 byte 
> the first
> time and if it want to write 412 bytes to the same page next time, it
> will fail. Does anyone have this problem?

I have read that some NAND memory devices can read partial pages 
but must write full pages.  Could this be your problem?  In such 
cases you might have to read the page, make a write to part of 
the page and then write out the modified full page.

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
