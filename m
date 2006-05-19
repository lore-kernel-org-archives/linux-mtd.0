Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh3fo-0008T8-41
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 08:02:25 -0400
Message-ID: <446DB3BA.2030403@ru.mvista.com>
Date: Fri, 19 May 2006 16:02:02 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [RFC] HW ECC handling in nand_base
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

after the discussion in IRC yesterday I came to the conclusion I would 
have to present my points on $Subject again.

So, coming back to the root of the problem. I was writing a driver for 
the NAND flash on Philips PNX4008 board with HW ECC support (Sandisk MLC 
controller). The HW ECC controller works in the following way there:
1. It stores 10-byte ECC starting from 518-th byte of each 512+16 page.
2. If the page is 2k size, i stores 10-byte ECC starting from 518th, 
(518 + 528)th, (518 + 2*528)th and (518 + 3*528)th bytes.
3. The ECC is generated automatically over preceding 518 bytes.
4. Before writing 518-byte chunk, one should trigger the ECC generation 
start.

What I found out was that the nand_base implementation couldn't handle that.
The problematic piece of code in nand_write_page is

        default:
                eccbytes = this->eccbytes;
                for (; eccsteps; eccsteps--) {
                        /* enable hardware ecc logic for write */
                        this->enable_hwecc(mtd, NAND_ECC_WRITE);
                        this->write_buf(mtd, &this->data_poi[datidx], 
this->eccsize);
                        this->calculate_ecc(mtd, 
&this->data_poi[datidx], ecc_code);
                        for (i = 0; i < eccbytes; i++, eccidx++)
                                oob_buf[oob_config[eccidx]] = ecc_code[i];
                        /* If the hardware ecc provides syndromes then
                         * the ecc code must be written immidiately after
                         * the data bytes (words) */
                        if (this->options & NAND_HWECC_SYNDROME)
                                this->write_buf(mtd, ecc_code, eccbytes);
                        datidx += this->eccsize;
                }
                break;

The problem here is that if SYNDROME is set, only ECC is written after 
each data write but all the rest of the OOB is written afterwards.
So, the controller expects (512 data, 6 OOB, 10 ECC) x 4 page layout, 
whereas the driver does ( (512 data, 10 ECC) x 4, 24 OOB) which is 
obviously incorrect.

Thinking about fixing that, I came to the conclusion that any easy fix 
will not be generic enough. I. e. for my particular case I could just do

-                        if (this->options & NAND_HWECC_SYNDROME)
-                                this->write_buf(mtd, ecc_code, eccbytes);
+                        if (this->options & NAND_HWECC_SYNDROME) {
                                  this->write_buf(mtd,  
&oob_buf[oobsel->eccbytes + (this->eccsteps - eccsteps) * (mtd->oobsize 
- oobsel->eccbytes) / 4], (mtd->oobsize - oobsel->eccbytes) / 4);
+                                this->write_buf(mtd, ecc_code, eccbytes);
+                        }


but that a) would have looked ugly anyway b) would have required 
implementing additional stuff in the specific PNX4008 driver to keep 
track of how many bytes have been written to a page to *not* write ECC 
c) wouldn't have solved other layout cases.

For instance, if we've got a controller expecting (512 data, 10 ECC, 6 
OOB) x 4 page layout, we should first write ECC and the OOB.
A separate case would be something like (512 data,  3 OOB, 10 ECC, 3 
OOB) x 4 page layout expectations.
Therefore, a comprehensive solution would have ended up dealing with a 
lot of cases, so I gave up the idea to fix the existing code.

After some more speculations :) I suggested another solution which I 
started a smooth transition to.
The solution actually is to have another structure that denotes the NAND 
page layout and proceed with it *sequentially* as it's the most common 
NAND use case anyway.
The types suggested are DATA, ECC, OOBAVAIL, and probably OOBOTHER (for 
things like the byte reserved for bad block check).
Ideally IMO both SW and HW ECC cases should be processed according to 
the layout. eg:

switch (this->type) {
case DATA:
       ...
case OOB:
        ...

...

This is far more convenient and easy-to-read than oobinfos and eccpos. 
Moreover, it allows to remove all oobinfo/eccpos use cases except where 
necessary for binary compatibility.
I do think that it's the most essential way of doing things for NAND as 
it's pretty similar to how NAND actually works.

Vitaly
         
**
