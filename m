Received: from [195.134.130.80] (helo=pip5.mpl.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19i9lI-0004ij-LA
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2003 10:30:17 +0100
Message-ID: <3F28E204.5040505@elsoft.ch>
Date: Thu, 31 Jul 2003 11:31:48 +0200
From: =?ISO-8859-1?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
 <d.mueller@elsoft.ch>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <3F27DAA6.4050806@elsoft.ch>
	<200307301821.39997.tglx@linutronix.de>
In-Reply-To: <200307301821.39997.tglx@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem mounting JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

Thomas Gleixner wrote:
> On Wednesday 30 July 2003 16:48, David Müller (ELSOFT AG) wrote:
> 
>>Hello
>>
>>I'm trying to get a JFFS2 filesystem on a 64MB NAND flash device working
>>on an ARM based system (running Linux-2.4.21 and the latest MTD CVS code).
>>
>>I prepare the JFFS2 image on my host system like this
>>
>>temp> mkfs.jffs2 --version
>>mkfs.jffs2: revision 1.38
>>
>>temp> mkfs.jffs2 -d targetfs -o targetfs.img -e 16 -l -q -v -n
>>
>>
>>and burn it into the NAND device on the target. If i later try to mount
>>it under Linux with "mount -t jffs2 /dev/mtdblock/1 /mnt", i get the
>>following output:
> 
> 
> How do you burn it into the NAND device ? Are you updating the OOB area ?
> read http://linux-mtd.infradead.org/tech/nand.html
> use nandwrite from the util directory, if you can do it from a running system
> 
> 

I'm using U-Boot's http://sourceforge.net/projects/u-boot "nand" command
to erase and write the NAND flash.

If i use the nandwrite command

# nandwrite --version
nandwrite 1.2

# nandwrite --jffs2 /dev/mtd/1 /tmp/targetfs.img

and mount it, the error is gone but the mounted filesystem is empty (no
files, not directories).

If i write the image using U-Boot's command, then there is the reported
error but the mounted filesystem is populated with directories and some
files (see below) although some files are missing or corrupt.


# ll /mnt/
total 0
drwxr-xr-x    2 0        0               0 Apr 23  2003 bin
drwxr-xr-x    2 0        0               0 Apr  2  2003 dev
drwxr-xr-x    2 0        0               0 Apr  2  2003 dev-state
drwxr-xr-x    2 0        0               0 Apr  2  2003 etc
drwxr-xr-x    2 0        0               0 Apr  2  2003 home
drwxr-xr-x    2 0        0               0 Apr  2  2003 lib
drwxr-xr-x    2 0        0               0 Apr  2  2003 proc
drwxr-xr-x    2 0        0               0 Apr  2  2003 root
drwxr-xr-x    2 0        0               0 Apr  2  2003 sbin
drwxr-xr-x    2 0        0               0 Apr  2  2003 tmp
drwxr-xr-x    2 0        0               0 Apr  2  2003 usr
drwxr-xr-x    2 0        0               0 Apr  2  2003 var
# ll /mnt/bin/
total 391
-rwxr-xr-x    1 0        0          400168 Apr 23  2003 armdemo



>>jffs2: Erase block size too small (16KiB). Using virtual blocks size
>>(32KiB) instead
> 
> 
> That's due to memory consumption. If we have 16KiB eraseblock size we need too 
> much memory to keep track of all eraseblocks. So we use virtual 32KiB blocks 
> instead.
> 
> 

Yes, i know. This was the reason why i had to upgrade to the latest
version of the JFFS2 code, as the version i used before was unable to
handle it.


What really bothers me is this error:

Ino #14 is absent but node not REF_PRISTINE. Reading.
ARGH. About to write node to 0x00004000 on flash, but there are data
already there:
0x00004000: 85 19 02 e0 20 03 00 00 10 25 f5 2e 0e 00 00 00
Write of 1576 bytes at 0x00004000 failed. returned -5, retlen 0
Not marking the space at 0x00004000 as dirty because the flash driver
returned retlen zero
Error writing new dnode: -5



Dave
