Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TF7yU-0002tt-W0
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 18:29:16 +0000
Received: by pbbrq8 with SMTP id rq8so8494605pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 11:29:12 -0700 (PDT)
Message-ID: <505CB1ED.8010909@gmail.com>
Date: Fri, 21 Sep 2012 23:59:01 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Subject: i.MX6S/GPMI-NAND issue on 3.5.4
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm facing some issue with GPMI-NAND driver on i.MX6 solo.
I've a TOSHIBA 4KiB page NAND connected to the GPMI.
(4KiB + 128 bytes OOB)

I tested it using the following,

1) U-boot v2012.04
2) Freescale's U-boot for i.MX6
3) Freescale's Kernel 3.0.15
	Result: 0x98 0xAC 0x90 0x26 (Correct)

4) Linux v3.5.4 stable
	Result: 0x98 0xA8 0x90 0x20 (Incorrect)

When I issue a READID command, 1, 2 & 3 gives me correct results, 
whereas the 3.5.4 version gives me some different result.

Any help would be very much appreciated.

Regards,
Vikram
