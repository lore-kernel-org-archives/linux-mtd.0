Received: from [212.59.42.147] (helo=eurobird.dt.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATg4o-0003y6-6n
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 11:30:50 +0000
Message-ID: <3FD5B1EF.4060905@keymile.com>
Date: Tue, 09 Dec 2003 12:28:47 +0100
From: Axel Ludszuweit <alu@keymile.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: question about mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everybody,


I have a question, concerning the 
MEMGETINFO part of the mtd_ioctl function,
contained in .../mtd/drivers/mtd/mtdchar.c

I think, the right code is 


                .
                .
	case MEMGETINFO:
		if (copy_to_user((struct mtd_info_user *)arg, mtd,
                                         ^^^^^^^^^^^^^ 
				 sizeof(struct mtd_info_user)))
			return -EFAULT;
		break;
                .
                .

instead


                .
                .
	case MEMGETINFO:
		if (copy_to_user((struct mtd_info *)arg, mtd,
                                         ^^^^^^^^
				 sizeof(struct mtd_info_user)))
			return -EFAULT;
		break;
                .
                .

I have attached the patch file.
Is this correct or have I not understand the code?


----------------------------------------------------------------------------

--- mtd/drivers/mtd/mtdchar.c.ORIG      2003-12-09 10:55:14.000000000 +0100
+++ mtd/drivers/mtd/mtdchar.c   2003-12-09 10:57:01.000000000 +0100
@@ -283,7 +283,7 @@
        }

        case MEMGETINFO:
-               if (copy_to_user((struct mtd_info *)arg, mtd,
+               if (copy_to_user((struct mtd_info_user *)arg, mtd,
                                 sizeof(struct mtd_info_user)))
                        return -EFAULT;
                break;


----------------------------------------------------------------------------

--------------------------------------------

Axel Ludszuweit

Keymile GmbH
Wohlenbergstr. 3, D-30179 Hannover

Tel.: +49 511 / 978197-630
Fax : +49 511 / 978197-670
http://www.keymile.com
mailto:axel.ludszuweit@keymile.com

>> Be the FIRST on the LAST MILE <<
