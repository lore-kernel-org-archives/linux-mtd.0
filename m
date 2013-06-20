Received: from mail1.bemta5.messagelabs.com ([195.245.231.141])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UpYn1-0004re-R9
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2013 06:56:16 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: CFC - RW - power-donw ?
Date: Thu, 20 Jun 2013 08:55:49 +0200
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67043D97FA@wetmex10>
From: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've a question regarding a PC that needs to boot from CFC (Compact
Flash card), hope this is the correct place to ask.

I would need a PC to boot from a CFC-card that has R/W enabled.

At this time I have been testing it with EXT2/EXT3 but when POWERING
down abruptly it seems that the CFC-ext2/ext3 file system gets
corrupted, finally resulting in a NON bootable system.

At this time I have partitioned the CFC into 2 partitions 1-FAT16 (to
store the kernel) and 1-ext2/ext3 partition that has the root-file
system.

What would be the correct file-system (and/or mount /build options) to
put on a CFC ... so that it is able to survive abrupt-power downs ?

Or is the somewhere a guide (URL) that explains me some more stuff
regarding this.

Thanks and Regards,
Noel
