Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkb5a-0003gq-FA
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 12:46:07 +0000
Received: from mfilter11-d.gandi.net (mfilter11-d.gandi.net [217.70.178.131])
 by relay4-d.mail.gandi.net (Postfix) with ESMTP id 9D13117213D
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 13:45:54 +0100 (CET)
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by mfilter11-d.gandi.net (mfilter11-d.gandi.net [10.0.15.180]) (amavisd-new,
 port 10024)
 with ESMTP id dEASbGC95qjo for <linux-mtd@lists.infradead.org>;
 Tue, 10 Jan 2012 13:45:53 +0100 (CET)
Received: from [192.168.1.60] (LSt-Amand-152-31-13-96.w193-253.abo.wanadoo.fr
 [193.253.216.96]) (Authenticated sender: a.gambier@ftemaximal.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D48E01720CD
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 13:45:52 +0100 (CET)
Message-ID: <4F0C3339.6070909@ftemaximal.fr>
Date: Tue, 10 Jan 2012 13:46:49 +0100
From: Alexandre Gambier <a.gambier@ftemaximal.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi everyone,

I use UBI volume and UBIFS on top of a NAND device with an embedded 
video meter.
Everything works fine except that when a UBI volume is mounted the 
following warning is outputted :
"UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB 
handling, reserved 0, need 20"

I create the UBI volume using the autosize options.
Does anyone have an idea about what is it and what can I do to fix this 
and make sure my UBI volumes work fine.

Best regards,
Alex

Here is the whole log:

UBI: attaching mtd7 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB 
handling, reserved 0, need 20
UBI: attached mtd7 to ubi0
UBI: MTD device name:            "UserData"
UBI: MTD device size:            256 MiB
UBI: number of good PEBs:        2036
UBI: number of bad PEBs:         12
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 2036
UBI: number of PEBs reserved for bad PEB handling: 0
UBI: max/mean erase counter: 2/1
UBI: image sequence number: 0
UBI: background thread "ubi_bgt0d" started, PID 1207
UBI volume:  ubi0
Volume name: userdata
UBIFS: mounted UBI device 0, volume 1, name "userdata"
UBIFS: file system size:   260757504 bytes (254646 KiB, 248 MiB, 2021 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: zlib
UBIFS: reserved for root:  0 bytes (0 KiB)

-- 
Best regards.

Alexandre Gambier
Fte Maximal France SAS
