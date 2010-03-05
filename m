Received: from mail.nethra.us.com ([74.85.3.131])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nnf90-0001kV-TD
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 21:33:19 +0000
Message-ID: <4B917881.9000600@nethra.us.com>
Date: Fri, 05 Mar 2010 13:32:49 -0800
From: Blair Barnett <bbarnett@nethra.us.com>
MIME-Version: 1.0
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Subject: Re: ONFI 4GB and beyond NAND support
References: <4B907BC1.4030907@nethra.us.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9C10DBEB@dlee01.ent.ti.com>
	<4B916483.9040900@nethra.us.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9C18C4EC@dlee01.ent.ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9C18C4EC@dlee01.ent.ti.com>
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


>> It appears a simple fix for the erasesize is to use 0x7 as the mask, but
>> the oobsize is a little more problematic.
>>     
>
> I had similar concerns.
> What we did was to just assume that the OOB size was 128 instead of 224.
> We just don't use and our driver sis not concerned about the other 96 bytes.
>   
>> The code
>> mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);
>>
>> doesn't really work to create a 224 byte oobsize value, not to mention I
>> don't know where to look to create the ECC structure required.
>>     
> As I said above just assume that the OOB is 128 bytes
>
>   
O.K., thanks for the feedback. I thought the bigger OOB size is there 
for allowing more ECC bytes, since the page size is much bigger than 
before and will require more error correction bytes.

I'll work on an ONFI implementation and get it out to the list in the 
next few weeks.

-blair
