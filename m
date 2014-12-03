Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xw7uZ-0002Yl-1R
 for linux-mtd@lists.infradead.org; Wed, 03 Dec 2014 11:15:59 +0000
Message-ID: <547EF06A.4020706@imgtec.com>
Date: Wed, 3 Dec 2014 08:13:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: =?gbk?Q?=22Qi_Wang_=CD=F5=C6=F0_=28qiwang=29=22?= <qiwang@micron.com>,
 Brian Norris <computersforpeace@gmail.com>, "abrestic@chromium.org"
 <abrestic@chromium.org>, "ionela.voinescu@imgtec.com"
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 6/6] mtd: spi-nand: Support common SPI NAND devices
References: <71CF8D7F32C5C24C9CD1D0E02D52498A77136EBD@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A77136EBD@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
Cc: =?gbk?Q?=22Frank_Liu_=C1=F5=C8=BA_=28frankliu=29=22?=
 <frankliu@micron.com>,
 =?gbk?Q?=22Peter_Pan_=C5=CB=B6=B0_=28peterp?= =?gbk?Q?andong=29=22?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/03/2014 06:52 AM, Qi Wang ÍõÆð (qiwang) wrote:
>> +
>> +static struct nand_ecclayout ecc_layout_gd5f = {
>> +	.eccbytes = 128,
>> +	.eccpos = {
>> +		128, 129, 130, 131, 132, 133, 134, 135,
>> +		136, 137, 138, 139, 140, 141, 142, 143,
>> +		144, 145, 146, 147, 148, 149, 150, 151,
>> +		152, 153, 154, 155, 156, 157, 158, 159,
>> +		160, 161, 162, 163, 164, 165, 166, 167,
>> +		168, 169, 170, 171, 172, 173, 174, 175,
>> +		176, 177, 178, 179, 180, 181, 182, 183,
>> +		184, 185, 186, 187, 188, 189, 190, 191,
>> +		192, 193, 194, 195, 196, 197, 198, 199,
>> +		200, 201, 202, 203, 204, 205, 206, 207,
>> +		208, 209, 210, 211, 212, 213, 214, 215,
>> +		216, 217, 218, 219, 220, 221, 222, 223,
>> +		224, 225, 226, 227, 228, 229, 230, 231,
>> +		232, 233, 234, 235, 236, 237, 238, 239,
>> +		240, 241, 242, 243, 244, 245, 246, 247,
>> +		248, 249, 250, 251, 252, 253, 254, 255
>> +	},
>> +	.oobfree = { {1, 127} }
>> +};
>> +
>> +static struct nand_ecclayout ecc_layout_mt29f = {
>> +	.eccbytes = 32,
>> +	.eccpos = {
>> +		8, 9, 10, 11, 12, 13, 14, 15,
>> +		24, 25, 26, 27, 28, 29, 30, 31,
>> +		40, 41, 42, 43, 44, 45, 46, 47,
>> +		56, 57, 58, 59, 60, 61, 62, 63,
>> +	 },
>> +};
>> +
> 
> As they are using On die ecc, oob layout definition is defined by SPI NAND vendors. 
> Part of oob is protected by ecc, and the rest is unprotect.
> I am thinking if we can define a variable to indicate the range, what is protect, 
> and what is unprotect. 

Yes, we should add the free out-of-band regions.

> This would be very useful for filesystem, which want to write data into OOB.
> 
> For example, Jffs2 program clean marker data to oob first when format operation, 
> then will program main data into NAND flash main area when normal write operation. 
> That mean JFFS2 can only store clean marker into unprotect area of oob. 

Yeah, but are these devices capable of writing to the OOB region only
(without messing with the data) ?

If I understand this correctly, supporting JFFS2 would mean implementing
a sort of read-modify-write operation to be able to write the OOB
without touching the main area, and viceversa.

I'd say JFFS2 is not the target filesystem for these SPI NAND devices,
and UBI-based filesystems should be used instead (UBI don't use OOB).

> But for YAFFS2, it program main data and spare area data together into NAND flash, then
> YAFFS2 can store data into protect area of OOB.

Well, frankly, I'm not too worried about YAFFS2. It was never mainlined,
and probably it will never be.

Do you have any reason for *not* using a UBI-based FS?
-- 
Ezequiel
