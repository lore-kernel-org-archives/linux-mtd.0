Received: from web20401.mail.yahoo.com ([216.136.226.120])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x5vv-0006Rx-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 13:50:11 +0100
Message-ID: <20020415125009.52383.qmail@web20401.mail.yahoo.com>
Date: Mon, 15 Apr 2002 05:50:09 -0700 (PDT)
From: Zhiwei Yu <linux_vpn@yahoo.com>
Subject: problem of booting from DOC
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I am working with DOC 2000.  The mtd driver and nftl
driver works fine on my system if I boot from harddisk
or network, but every time I use lilo to write boot
loader into the MBR of DOC(actually boot=/dev/nftla1),
I get error message like "Sorry don't know how to
handle device 0x5d01".  For now I'm using the patched
lilo from CVS and add "bios=0x80" in my lilo.conf,but
I still can not solve this problem.  

Is there anything that I miss or I should use other
boot loader?  Thanks for your help.

--------------
Zhiwei Yu



__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
