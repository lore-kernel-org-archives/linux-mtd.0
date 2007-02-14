Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHGQn-0007Zo-Gr
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 04:28:10 -0500
Received: by ug-out-1314.google.com with SMTP id m2so121568uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Feb 2007 01:28:03 -0800 (PST)
Message-ID: <6b5362aa0702140128h69cc8f11k48bec5b739640ded@mail.gmail.com>
Date: Wed, 14 Feb 2007 14:58:02 +0530
From: "Brijesh Singh" <brijesh.s.singh@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBI bad block Management
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
   The flash devices are getting of bigger in Size.The Init Scan time
will increase with bigger Size flash.How long are we going to rely on
MTD for Bad block Management.Even MTD doesn't maintain List but calls
the hardware, if hardware supports it.
This can be done in two ways,
1:) Straight right the bitmap,and if changed erase it.We can do it in
One reserved block.
           If allowed bad blocks are 20%,it will be erased 20% times
of total PEB count.
2:)Keep a Queue in Scan of Bad blocks.Ec header contains one field
called last bad block.Which is PEb no.So if block is found bad,next
block to be written first will have Bad block no in EC.So it is
maintained across reboots.
3:)Keep a Log in reserved Block.When it is getting full,create bitmap
and write it on the block.This will reduce the erasing of that block.

So we can maintain Bad block Map in UBI if it is necessary.
