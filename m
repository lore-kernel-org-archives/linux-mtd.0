Received: from f147.law11.hotmail.com ([64.4.17.147] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189RF8-00031V-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 14:33:18 +0000
From: "J B" <mad_flasher@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Cc: linux-mtd@lists.infradead.org
Subject: cfi_cmdset_0020.c
Date: Wed, 06 Nov 2002 09:03:03 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F147brL1SCeX8KShPdH00000308@hotmail.com>
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

Jörn,
     I have a couple of questions reguarding the patch you released a while 
ago to support the M58LW064A STMicro flash chip.  I noticed that you set the 
eccsize in the mtd_info structure to 8, and in your patch for jffs2, you 
used this as the size of the wbuf for writes in nor_wbuf.c.  Isn't this 
value really the minimum buffer size for the flash chip?  If so, since your 
patch for jffs2 is based on NAND chips, wouldn't it make more sense to use 
the oobblock variable in the mtd_info structure to represent the size of the 
buffer?  There could be other reasons you used eccsize that I am missing and 
if so please forgive my ignorance ;).  Also, is there a reason you decided 
to use the minimum buffer size for the wbuf?  According to the datasheet for 
those chips, the buffer can hold up to 32 bytes.  Wouldn't using the maximum 
buffer available make things more efficient?

Thanks,
J


_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
