Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLL28-0005Rt-7r
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 09:07:02 -0500
Message-ID: <441EB6F5.7020704@intel.com>
Date: Mon, 20 Mar 2006 17:06:45 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: tglx@linutronix.de, linux-mtd@lists.infradead.org
References: <1142181850.19916.507.camel@localhost.localdomain>
In-Reply-To: <1142181850.19916.507.camel@localhost.localdomain>
Content-Type: multipart/mixed; boundary="------------010205010109080309030403"
Cc: 
Subject: Re: [PATCH] Fixup in NAND bad block management +
	fixofmisspring.(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010205010109080309030403
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Thomas,

I appologize for delay. I was away on vacation.

I your point of view regarding BB mabnagement is clear.
Fixup of badblockpos is rather suitable.

There was another very small fix for a missprint in nand_base.c. I think 
it shouldn't raise many objections.
If you don't have any would you please check in the patch below ?

Thanks,
Alexey








--------------010205010109080309030403
Content-Type: text/plain;
 name="miss_print_fixup.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="miss_print_fixup.diff"

diff -aur b/drivers/mtd/nand/nand_base.c c/drivers/mtd/nand/nand_base.c
--- b/drivers/mtd/nand/nand_base.c	2006-02-09 20:05:28.447558688 +0300
+++ c/drivers/mtd/nand/nand_base.c	2006-02-09 20:14:58.182945744 +0300
@@ -1700,7 +1710,7 @@
 			len += num;
 			fsbuf += num;
 		}
-		ofs += mtd->oobavail;
+		ofs += mtd->oobsize;
 	}
 	return this->oob_buf;
 }

--------------010205010109080309030403--
