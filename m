Received: from ns1.nougen.com ([216.185.81.251] helo=mail.nougen.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16c32w-0006ul-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Feb 2002 11:30:27 +0000
Message-ID: <003a01c1b6de$e88a0980$f801a8c0@minibm>
From: "Chung Ming" <min@hello.org>
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.44.0202112157400.1558-100000@lapdancer.baythorne.internal>
Subject: Re: "No Flash Chips Recognized." error.
Date: Sat, 16 Feb 2002 19:41:41 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi David, now I can't get any reply from this DoC millenium, no "DiskOnChip
found at address.." anymore just "possible DoC with unknow chipID found at
....." .

I wonder if DoC got damaged or they just keep using different flash? I will
buy a new one and test again.

Regards.

Ming.


----- Original Message -----
From: David Woodhouse
To: Chung Ming
Cc: linux-mtd@lists.infradead.org
Sent: Monday, February 11, 2002 9:58 PM
Subject: Re: "No Flash Chips Recognized." error.


On Mon, 11 Feb 2002, Chung Ming wrote:

> "DiskOnChip found at address 0xEE000"
> No Flash Chips Recognized.

Try this and tell me what it says...

Index: doc2001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/doc2001.c,v
retrieving revision 1.35
diff -u -r1.35 doc2001.c
--- doc2001.c 2001/10/02 15:05:13 1.35
+++ doc2001.c 2002/02/11 14:02:35
@@ -228,8 +228,10 @@
  }
  }

- if (nand_flash_ids[i].name == NULL)
+ if (nand_flash_ids[i].name == NULL) {
+ printk("Chip with mfr %02x, id %02x unknown. Tell dwmw2\n");
  return 0;
+ }
  else
  return 1;
 }



--
dwmw2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
