Received: from dns.possio.com ([62.95.65.150] helo=master.possio.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18IuWM-0003UM-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 17:38:14 +0000
Received: from [62.95.65.76] by master.possio.com (NTMail 7.00.0018/NT0065.00.5d386785) with ESMTP id msunaaaa for linux-mtd@lists.infradead.org; Mon, 2 Dec 2002 19:08:40 +0100
Message-ID: <3DEBA120.5A06F15@possio.com>
Date: Mon, 02 Dec 2002 19:06:24 +0100
From: Stefan Thomasson <stefan.thomasson@possio.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How to access cfi_intelext_read_fact_prot_reg 
Content-Type: text/plain; charset=us-ascii
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

Hi,

I am having trouble using cfi_intelext_read_fact_prot_reg 

So far the only thing I have succeeded to do is getting a
Unable to handle kernel NULL pointer dereference at virtual address 
00000040.

This occurs  as far as I can tell when the function
tries to setup map, cfi or cfi_pri_intelext.
mtd->priv seem to be uninitialized and this will result in the NULL ptr.

So, the question is where is mtd->priv setup?

I have tried to follow how its done when erasing a block in mtdchar 
ioctl without success. 

In mtd_ioctl
printk(KERN_NOTICE "mtd  = %p .\n",mtd );
printk(KERN_NOTICE "priv  = %p .\n",mtd->priv );

Results in 
mtd  = c0467260 .
priv  = 00000000 .

and later on in cfi_intelext_erase_varsize

printk(KERN_NOTICE "MMmtd  = %x .\n",mtd );
printk(KERN_NOTICE "MMpriv  = %x .\n",mtd->priv );
 MMmtd  = c0467060 .
 MMpriv  = c036b738 .

Running 2.4.18-rmk5-pxa1.

Regards
Stefan
