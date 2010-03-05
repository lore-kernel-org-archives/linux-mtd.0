Received: from mail.nethra.us.com ([74.85.3.131])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NndoQ-0004Fz-7n
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 20:07:59 +0000
Message-ID: <4B916483.9040900@nethra.us.com>
Date: Fri, 05 Mar 2010 12:07:31 -0800
From: Blair Barnett <bbarnett@nethra.us.com>
MIME-Version: 1.0
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Subject: Re: ONFI 4GB and beyond NAND support
References: <4B907BC1.4030907@nethra.us.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9C10DBEB@dlee01.ent.ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9C10DBEB@dlee01.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paulraj, Sandeep wrote:
>   
>> I have two questions for the MTD gang, but couldn't find the answer in
>> the archives, nor elsewhere on the web.
>>
>> 1. What's the plan, if any, for the MTD NAND layer to support the ONFI
>> standard?
>>     
> I guess somebody has to write the necessary code and send the patch.
> ONFI NANds get all the necessary info from a param table I believe. 
>   
O.K. That's fair.
>   
>> 2. What's the plan, if any, for the MTD NAND layer to support 4 GB NANDs
>> (and greater)?
>>     
> This is already there for more than a year. Use the latest kernels
>   
Let's see. I'm using 2.6.33, so that seems like a pretty new kernel. I 
think the problem may in the code for figuring out the NAND geometry in 
nand_get_flash_type(). If type->pagesize == 0,  0x46 is the extid value. 
Unfortunately, this decodes in the NAND code to the following geometry:

Writesize = 4096 bytes
oobsize= 128 bytes
erasesize = 64 K bytes (extid & 0x03)

Reading the chip's ONFI Page parameters, one gets this geometry:

writesize = 4096 bytes
oobsize = 224 bytes
erasesize = 1024 K bytes

It appears a simple fix for the erasesize is to use 0x7 as the mask, but 
the oobsize is a little more problematic.

The code
mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);

doesn't really work to create a 224 byte oobsize value, not to mention I 
don't know where to look to create the ECC structure required.

Do you have a preference for how to fix this?

-blair
