Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SbwJ-0004dw-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 09:40:03 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SbwG-0004dd-00
	for mtd@infradead.org; Tue, 13 Feb 2001 09:40:01 +0000
Received: from aldur3.axis.se (aldur3.axis.se [10.0.2.45])
	by roma.axis.se (8.9.3/8.9.3) with ESMTP id KAA06577
	for <mtd@infradead.org>; Tue, 13 Feb 2001 10:36:27 +0100 (MET)
Received: from pcjohana (pcjohana.axis.se [10.13.7.10])
	by aldur3.axis.se (8.9.3/8.9.3/Debian 8.9.3-21) with SMTP id KAA13997
	for <mtd@infradead.org>; Tue, 13 Feb 2001 10:36:27 +0100
Message-ID: <003f01c095a0$08f12020$0a070d0a@axis.se>
Reply-To: "Johan Adolfsson" <johan.adolfsson@axis.com>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "mtd" <mtd@infradead.org>
References: <3A886BED.9339AC4F@danielind.com>  <10792.982055747@redhat.com>
Subject: MTD device minor numbers, documentation wrong?
Date: Tue, 13 Feb 2001 10:33:34 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The 2.4.0 Documentation/devices.txt says that
even MTD minor numbers are readonly, but that doesn't seem to
be correct when trying things in real life.
Is the documentation wrong, or do I have the wrong version of it?
Or are we doing something wrong when registering partitions?

...
 31 char        MPU-401 MIDI
                  0 = /dev/mpu401data   MPU-401 data port
                  1 = /dev/mpu401stat   MPU-401 status port
    block       ROM/flash memory card
                  0 = /dev/rom0         First ROM card (rw)
                      ...
                  7 = /dev/rom7         Eighth ROM card (rw)
                  8 = /dev/rrom0        First ROM card (ro)
...

 90 char        Memory Technology Device (RAM, ROM, Flash)
                  0 = /dev/mtd0         First MTD (rw)
                  1 = /dev/mtdr0        First MTD (ro)
                    ...
                 30 = /dev/mtd15        16th MTD (rw)
                 31 = /dev/mtdr15       16th MTD (ro)




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
