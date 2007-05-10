Received: from an-out-0708.google.com ([209.85.132.243])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmBzG-0002qz-O4
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 12:59:31 -0400
Received: by an-out-0708.google.com with SMTP id d17so159080and
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 May 2007 09:59:29 -0700 (PDT)
Message-ID: <97c001730705100959n17412b71n9a691840d47593e7@mail.gmail.com>
Date: Thu, 10 May 2007 11:59:28 -0500
From: Meher <mail2meher@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: BBT structure for NAND flash
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

HI,
      We have an ARM-9 based board with NAND flash. The ROM boot
laoder will load the kernel loader from NAND and the kernel loader
will load the kernel and pass the file system information to the
kernel. To have a good bad block management scheme for the boot loader
I am planning to use the BBT table generated using MTD API.
   I would like to understand what will be the structure of the BBT
table created using MTD layer? When I set the parameters to created
user defined BBT table say at the end of the flash will the NAND
driver in linux kernel actually create the BBT at the last two blocks
of the physcial NAND block? Can I have my ROM bootlaoder read this BBT
so that it can identify any non-factory bad blocks that arised due to
upgrading of kernel loader.



-- 
Regards,
Meher
