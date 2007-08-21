Received: from smtpauth03.prod.mesa1.secureserver.net ([64.202.165.183])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1INbQl-0004Li-BM
	for linux-mtd@lists.infradead.org; Tue, 21 Aug 2007 17:38:34 -0400
Message-ID: <46CB5B67.9060400@techmoninc.com>
Date: Tue, 21 Aug 2007 16:38:47 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Using DOCBoot?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

RE: http://www.infradead.org/pipermail/linux-mtd/2005-July/012960.html

I am having difficulties with the same DOC that I've been attempting to
get up and running using a DOC2000 MD2202-D32-x.  I located a document
that says DOCBoot will do what I need -- at this point, I'm only
attempting to load a kernel image (about 700KB) to boot from a different
device.  The issue is the same as the above link.  I get verbiage that
makes me think that the DOC will boot via the DOCBoot and then (after
recompiling with all the extra debug messages) I get Loading Kernel. .
.  page: 0x0000 and it scrolls through 0xFFFF and I get Loading Kernel
page:  0xFFFFCANNOT FIND IMAGE ON DEVICE.

I have gone through all the readme to find that I need to make a module
for the diskonchip, and that I need to show_firmware_partition=1 to get
/dev/mtd1.  So, I'm getting closer, but I cannot figure out where to go now.

Any help would be greatly appreciated.

Thanks,
Andy
