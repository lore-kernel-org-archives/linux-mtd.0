Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELJUS-0000t4-Tv
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 07:56:36 -0400
Message-ID: <433D2815.6040603@ru.mvista.com>
Date: Fri, 30 Sep 2005 15:57:09 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: more flexible HW ECC support for nand_base
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi  Thomas,

as you might recall, during the PNX4008 LSP development we came across 
the MTD problem which turned to be a shipstopper for hardware ECC 
support on SanDisk MLC controller.  The patch (quite inmature) suggested 
and a kind of struggle around it are in September linux-mtd e-mail 
archive ;-)
The problem basically is that the MTD NAND core assumes that layout is 
like "(data bytes) (possible ecc data) (oob data)", and more often just 
"(data bytes) (oob data)". To perform ECC data reading, the NAND chip 
driver needs to set the special option like NAND_HWECC_SYNDROME.
On the other hand, the page layout may vary from chip to chip. For 
SanDisk MLC it looks like 
"(data)(ecc)(oob)(data)(ecc)(oob)(data)(ecc)(oob)(data)(ecc)(oob)" what 
can't be handled properly by nand_base since it doesn't even try to read 
OOB data in loop (i. e. eccsteps times).

After some local discussions, we suggest the following modification to 
the MTD NAND core to allow driver to specify its own layout of nand 
page. Namely, the solution proposed is to provide the `page_layout' 
field in nand_chip structure, that will point to array of structures like

struct page_layout_item {
    int length;
    enum {
        SPARE, DATA, OOB, ECC,
    } type;
}

Any standard types like NAND_HW512_6 will be replaced then by standard 
layouts like
    nand_layout_512_6 = {
        { 512, DATA },
        { 6, ECC },
    };
The rest of page, if any, might be considered as OOB data or explicitly 
defined, like
        { 10, OOB }

Another part of the problem is nand_read_oob()/nand_write_oob() 
functions that also make assumptions on NAND flash page layout. It's 
suggested that they go to nand_chip structure, i. e. it will become a 
specific chip driver's responsibility to provide those; and if driver 
does not provide one, the current implementation can be used. If 
nand_chip provides its own layout, it must read/write oob data according 
to the layout.

These steps should provide backward compatibility and the ability for 
particular driver owners to update their drivers accordingly with as 
less pain as possible.

Any comments are welcome,

Best regards,
  Vitaly
