Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14fjUN-0004Pu-00
	for mtd-list@infradead.org; Wed, 21 Mar 2001 14:21:27 +0000
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14fjUK-0004Pk-00
	for mtd@infradead.org; Wed, 21 Mar 2001 14:21:25 +0000
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Wed, 21 Mar 2001 14:21:16 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Wed, 21 Mar 2001 14:21:16 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: mtd_info_t.erasesize
Date: Wed, 21 Mar 2001 14:21:15 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A911A@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

When I issue an erase command, e.g. erase /dev/mtd0 0x10000 1
I get the follwing output :

Erase Unit Size 0x2000, Erase Total 100 Units
Performing Flash Erase of length 8192 at offset 0x10000MTD_ioctl
MTD_ioctl
MTD : 5
Performing Flash Erase of length 8192 at offset 0x12000MTD_ioctl
MTD_ioctl
MTD : 5
Performing Flash Erase of length 8192 at offset 0x14000MTD_ioctl
MTD_ioctl
MTD : 5
Performing Flash Erase of length 8192 at offset 0x16000MTD_ioctl
MTD_ioctl
MTD : 5
Performing Flash Erase of length 8192 at offset 0x18000MTD_ioctl
MTD_ioctl
MTD : 5
Performing Flash Erase of length 8192 at offset 0x1a000MTD_ioctl
MTD_ioctl
MTD : 5
Performing Flash Erase of length 8192 at offset 0x1c000MTD_ioctl
MTD_ioctl
MTD : 5
Performing Flash Erase of length 8192 at offset 0x1e000MTD_ioctl
MTD_ioctl
MTD : 5

What bugs me here is that an sector of size 0x10000 (64KB) is erased
in 8 erase calls to the flash chip sector, basically making the life of
the=20
flash chip 1/8th of what it should be.
While 8k sector size is correct for the first 8 sectors on the device
(it is bb cfi flash from intel), it is certainly not correct for the
rest (4MB - 8KB of the device).

Shouldn't the device geometry be exported through the mtd_info_t
structure
or am I missing something obvious (which is not unlikely 8-) )...

Regards,

K.D.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
