Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16id2r-0003Tq-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 15:09:33 +0000
Message-Id: <200203061610.g26GAw806457@skylab.outpostsentinel.com>
Date: Wed, 06 Mar 2002 10:19:41 -0500
To: linux-mtd@lists.infradead.org
CC: strtok@hotmail.com
From: Chris Fowler <strtok@hotmail.com>
Subject: Lost DOC2000 after trying to load grub
Reply-To: strtok@hotmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Help.  I decided to replace my doc-lilo with grub.  I did the following:

[root@cas8]# ./doc_loadbios /dev/mtd0 grub_firmware
Performing Flash Erase of length 16384 at offset 0
Performing Flash Erase of length 16384 at offset 16384
Performing Flash Erase of length 16384 at offset 32768
Performing Flash Erase of length 16384 at offset 49152
Performing Flash Erase of length 16384 at offset 65536
Performing Flash Erase of length 16384 at offset 81920
Writing the firmware of length 94528 at 0... Done.
[root@cas8]# restart

Now when it boots I get a grub propmt.  I'm not sure what to do to make the doc-lilo boot now.  So I do not know what to type at grub>

But that is not the main problem.  I decided to replace my orignal software.  Between major changes I've been using getimage and putimage.  I did a putimage <image name> and get
 Error: Too much bad sector

So I do a dformat /win:D000 /s:DOC504.exb /FIRST /NOFORMAT /Y and I get the following error:

Error writing EXB

Status code 26 (flUnknownMedia) received from flPlaceExbByBuffer.
Format Failed.

I know this has something to do with:
[root@cas8]# ./doc_loadbios /dev/mtd0 grub_firmware

How do I revocer without replaceing the chip?

Thanks,
Chris Fowler
