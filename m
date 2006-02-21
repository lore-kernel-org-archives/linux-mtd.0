Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBPkf-00068W-Ua
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 00:07:55 -0500
Received: by wproxy.gmail.com with SMTP id i27so1034018wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Feb 2006 21:07:52 -0800 (PST)
Message-ID: <c56937870602202107y6eecca2bs2e99e00ac8407495@mail.gmail.com>
Date: Tue, 21 Feb 2006 10:37:52 +0530
From: "Santhosh N" <san.mlists@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <c56937870602200210i2e35c47bk3285228e2babb02c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c56937870602200210i2e35c47bk3285228e2babb02c@mail.gmail.com>
Subject: Re: Nand flash problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I think, I wrote too many things in my previous mail. I have tried to
summarize my problem below.

The CLE and ALE lines of the NAND flash is connected to the address
lines of the processor(PXA255). Also the /CE is connected to GPIO-78
of the PXA255, with alternate function 2(nCS2) enabled.
On sending the page read command to the NAND flash, the processor
brings the /CE on low, only while the read command(00h,01h,50h) is
been sent. For all other times(send address and read data), it
maintains the /CE on high.
Whereas, for the read ID operation, the processor brings /CE on low at
appropriate times. Thereby making this operation successful.

May be it is some timing issue. Not sure as of now. I am trying hard
to find out where the problem is. Hope somebody here, who has already
faced the problem, helps me out.

Thanks in advance,
Santhosh N

> Hi All,
>
> I am facing a problem in reading the NAND flash chip on our board.
>
> I have a PXA255 based board having NAND flash(Samsung K9F5608U0B, 32MiB
> 8-bit pagesize-512). I am trying to boot linux kernel 2.6.14 on it. I
> have written a board based driver for the NAND flash.
> After booting, the kernel throws out the messages "Bad eraseblock
> <num> at <addr>" for the pages from 0 to 2139. This happens everytime
> I try to boot. After this I decided to try out things in the
> bootloader first, so that I can save time in transfering the binary.
> The way the NAND flash chip is connected to the processor and the
> things that I have tried are mentioned below.
>
> The NAND flash chip is connected to the processor in the following way
> on our board:
> CLE,ALE   -->  Connected to address lines of the processor.
> -RE         -->  nOE
> -WE        -->  nWE
> R/-B       <--  GPIO-18 (AltFnIN-1 =3D RDY)
> -WP        -->  GPIO-41
> -CE         -->  GPIO-78 (AltFnOut-2 =3D nCS2)
> GND       -->  Low
> The memory addresses 0x08000000, 0x08000008 and 0x08000010 are mapped
> to I/O-RW, Command-W and Address-W respectively.
>
> First I tried reading out the ID of the chip. On sending the
> NAND_CMD_READID and address 0x00, the chip gives back the Manufacturer
> ID and the Chip ID properly. On observing the I/O to the NAND flash
> through an oscilloscope, I see that all the lines are behaving
> properly.
>
> After this, I tried to read the OOB area in the 0th page. On sending
> the NAND_CMD_READOOB, the address(3 cycles) and reading back 16
> bytes(with tR delay), the chip gives back 0x00 for all the bytes read.
> I tried this for the first 2 pages in all the blocks on the chip. But
> got the same result. This gives me the reason why, the kernel is
> showing all the blocks as bad blocks. On observing the I/O to the NAND
> flash through an ocsillscope, I noticed a strange thing happening. By
> following the above sequence to read OOB area, I noticed that the -CE
> is lowered by the processor, only while the command is sent. For all
> the times, the address is written and the data is read back, the -CE
> is maintained high. This means the NAND flash chip is not receiving
> the address and the 16 bytes, read after this are junk.
>
> Has anybody here, has faced a similar kind of problem? Is there
> anything that I can do at the processor end, to handle the nCS2
> properly?
>
> Any inputs, for helping me to solve this problem are welcome.
>
> Thanks in advance,
> Santhosh N
>
