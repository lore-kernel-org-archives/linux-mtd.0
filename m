Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16j04Q-0005Le-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 15:44:42 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFA43@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'Herman Theron' <HEtheron@csir.co.za>, strtok@hotmail.com,
	linux-mtd@lists.infradead.org
Subject: RE: Lost DOC2000 after trying to load grub
Date: Thu, 7 Mar 2002 07:56:06 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

If i understand eraseall utility correctly it erases the whole diskonchip
completely . After that bad block table is lost and it's unsafe to use such
diskonchip afterwards . 

Vadim

-----Original Message-----
From: Herman Theron [mailto:HEtheron@csir.co.za]
Sent: Wed, March 06, 2002 10:47 PM
To: strtok@hotmail.com; linux-mtd@lists.infradead.org
Subject: Re: Lost DOC2000 after trying to load grub


Hi Chris!

When I tried Grub, I followed the same route you did..... Use the
"eraseall" utility to clean the flash. Then you can use dformat again.

Have you tried the latest stock lilo? It supports DOC devices.

Cheers
Herman

 

****************************************
Herman Theron
Hermanus Magnetic Observatory
CSIR
PO Box 32
Hermanus
7200
South Africa
E-mail: hetheron@csir.co.za
Phone: +27 28 3121196
Fax: +27 28 3122039
Cel: +27 833 206 311

>>> Chris Fowler <strtok@hotmail.com> 03/06/02 05:19PM >>>
Help.  I decided to replace my doc-lilo with grub.  I did the
following:

[root@cas8]# ./doc_loadbios /dev/mtd0 grub_firmware
Performing Flash Erase of length 16384 at offset 0
Performing Flash Erase of length 16384 at offset 16384
Performing Flash Erase of length 16384 at offset 32768
Performing Flash Erase of length 16384 at offset 49152
Performing Flash Erase of length 16384 at offset 65536
Performing Flash Erase of length 16384 at offset 81920
Writing the firmware of length 94528 at 0... Done.
[root@cas8]# restart

Now when it boots I get a grub propmt.  I'm not sure what to do to make
the doc-lilo boot now.  So I do not know what to type at grub>

But that is not the main problem.  I decided to replace my orignal
software.  Between major changes I've been using getimage and putimage. 
I did a putimage <image name> and get
 Error: Too much bad sector

So I do a dformat /win:D000 /s:DOC504.exb /FIRST /NOFORMAT /Y and I get
the following error:

Error writing EXB

Status code 26 (flUnknownMedia) received from flPlaceExbByBuffer.
Format Failed.

I know this has something to do with:
[root@cas8]# ./doc_loadbios /dev/mtd0 grub_firmware

How do I revocer without replaceing the chip?

Thanks,
Chris Fowler




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/ 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
