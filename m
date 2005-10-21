Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ET17N-0002ds-KX
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2005 13:55:54 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Sat, 22 Oct 2005 07:02:13 +1300
References: <B7803DC652E2F9458758AEBB6A5FD60F19526E@ZMY16EXM67.ds.mot.com>
In-Reply-To: <B7803DC652E2F9458758AEBB6A5FD60F19526E@ZMY16EXM67.ds.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510220702.13494.manningc2@actrix.gen.nz>
Cc: M Sudharshana-A18475 <sudharshana@motorola.com>
Subject: Re: NAND Low level flash routiens
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 21 October 2005 16:44, M Sudharshana-A18475 wrote:
> Hi,
> 	I do believe NAND flash manufacturers give low level flash
> routines to erase/program data on the flash memory. While providing
> them, they do mention unit of erase is of minimum 4K. 
I have never heard of a NAND with 4K erase units (unless these were the very 
old 256-byte page devices).
Most have programming pages used today are 512+16 or 2k+64 byte pages with 
erase sizes of 16k and 128K respectively.

> Would this still 
> hold good with low level flash routines that some embedded device
> manufacturers? Or would this erase be of the unit of sector size which
> are usually of 64K/128K/256K ?

I suggest you read the Toshiba NAND flash appliocation guide. it will tell you 
almost everything you need to know.
