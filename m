Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18K0iG-0002X5-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 18:27:05 +0000
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E4A6@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: 'shadow' <saturn@structure.biochem.nchu.edu.tw>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Write error on the nand flash !
Date: Thu, 5 Dec 2002 13:57:37 -0500 
MIME-Version: 1.0
Content-Type: text/plain
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

shadow [mailto:saturn@structure.biochem.nchu.edu.tw] wrote:
> If I copy the larger file to nand flash, the system will tell me some 
> wrong ? These is my error log..
[snip]
> nand_write_ecc: to = 0x001fc000, len = 512
> nand_write_page: Failed write verify, page 0x00000fe0 

My patch at
 http://lists.infradead.org/pipermail/linux-mtd/2002-October/006218.html
fixes a problem with nand_write_page that could cause this. It is
not in the latest CVS version of nand.c.

Dave
