Received: from outgoing.andrews-space.com ([67.90.236.103]
 helo=mail.andrews-space.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGgqn-00086c-BK
 for linux-mtd@lists.infradead.org; Thu, 29 Jan 2015 04:37:06 +0000
From: Ben Leinweber <BLeinweber@andrews-space.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: OOB buffers with syndrome calculating controller
Date: Thu, 29 Jan 2015 04:30:43 +0000
Message-ID: <e547116b3c3841ff9e611fb47e36a070@svrExchange2013.hq.andrews-space.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My company is currently trying to integrate a NAND flash chip into our prod=
uct, and we have acquired in NAND flash controller IP core. I am responsibl=
e for writing the driver for this IP core.

The IP core automatically calculates the ECC on write and computes the synd=
romes on read. I am writing to this list because I am somewhat confused by =
how the default syndrome read/write functions handle the error codes in the=
 internal NAND layer OOB buffers and am looking for a little help.

The way that the IP core writes data to the flash chip is as follows:
  |-------Data Column-------/~/------Data Column------|----Spare Column----=
-|
  Data-0 ECC-0 Data-1 ECC-1 /~/ Data-14 ECC-14 Data-15 USR-OOB Data-15 ECC-=
15
   512B   16B   512B   16B       512B    16B    272B    192B    240B    16B

This is for an 8kB page with 448 bytes in the spare column.

So the final chunk of data is split into two pieces and the final ECC data =
physically resides at the end of the spare column. When doing a normal non-=
raw read/write, all of this is handled by the controller and the driver onl=
y need concern itself with the data and the user OOB data. When performing =
a read, the controller automatically calculates the syndrome data and provi=
des it to the driver through some registers.

Now to my questions.

1. The nand_read_page_raw_syndrome() reads each ECC chunk and stores them f=
irst in chip->oob_poi buffer, storing the user OOB data after. nand_write_p=
age_raw_syndrome() also assumes that the ECC data is at the front of the ch=
ip->oob_poi and user OOB data is after.

Isn't this reverse from just about all of the defined nand_ecclayout struct=
ures? Almost all of them store the ECC data at the end of the OOB so as to =
never risk overwriting the bad block marker. Is there a reason that the dat=
a is stored in this order? Is there actually a consumer of the ECC data out=
side of the Flash driver?

2. nand_page_read_syndrome() appears to assume that the controller will ret=
urn the ECC bytes when reading from a page in non-raw mode. It writes these=
 bytes to the chip->oob_poi buffer. But my controller does not return the E=
CC bits when reading from it. I do not have direct access to the ECC bits i=
n non-raw mode. Again, is there a consumer of the ECC data when read that w=
ay or may I just read the user OOB into chip->oob_poi?

3. nand_read_oob_syndrome() seeks for each of the ECC chunks, and reads the=
m in to the chip->oob_poi buffer before reading in the user OOB into the ch=
ip->oob_poi. nand_write_oob_syndrome() assumes that the ECC data is there a=
nd goes out of its way to write to write to each of the columns which conta=
in ECC data before writing the user data in the OOB. I'm confused why it bo=
thers writing to these locations at all. It's not writing to the normal dat=
a columns. Is there really an external entity which is providing ECC data t=
hat needs to be threaded into the flash like this?



I understand that these functions probably were not written with my control=
ler in mind, but I'm trying to understand the logic behind them and whether=
 or not what they are doing is actually necessary in my case.

Thanks for any help!

Ben Leinweber
Andrews Space, Inc.

PROPRIETARY INFORMATION NOTICE: Except where otherwise noted, this Electron=
ic Mail (e-mail) is the property of Andrews Space, Inc. and is intended onl=
y for the use of the individual or entity to which it is sent. You may not =
possess, use, copy or disclose this document or any information in it, for =
any purpose without permission. Neither receipt nor possession of this docu=
ment alone, from any source, constitutes such permission. Possession, use, =
copying or disclosure by anyone without the express written permission of A=
ndrews Space, Inc. is not authorized and may result in criminal and/or civi=
l liability. If you receive this message in error, please notify the sender=
, do not make any use of the information in it and destroy it and all copie=
s.
