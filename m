Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139nuf-0002H9-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 13:04:21 +0100
Received: from ncc4.infomail.es ([195.235.39.6] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 139nuV-0002H3-00
	for mtd@infradead.org; Wed, 05 Jul 2000 13:04:20 +0100
Date: Wed, 05 Jul 2000 14:01:09 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: mtd@infradead.org
Subject: plilo problems
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E139nuV-0002H3-00@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi all!

I'm in the last step before successfully booting from the DiskOnChip. In
this step, as mentioned in the M-Systems docs, I run the patched lilo to
then update the firmware from DOS. But, when running:

/mnt/doc/sbin/plilo -C /mnt/doc/etc/lilo.conf -i /mnt/doc/boot/boot.b -m
/mnt/doc/boot/map

I get the following message:

First boot sector doesn't have a valid LILO signature

I'm using the plilo and boot.b files as shipped with the M-Systems drivers.

Thanks very much in advance



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
