Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZINzW-0007aL-Si
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2015 21:25:24 +0000
Subject: Re: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
 <1425643938-24749-2-git-send-email-rnd4@dave-tech.it>
 <20150315100752.3458ccfe@bbrezillon> <551E8D21.7050507@dave-tech.it>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
To: beanhuo@micron.com
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55B15BA6.5050600@dave-tech.it>
Date: Thu, 23 Jul 2015 23:24:54 +0200
MIME-Version: 1.0
In-Reply-To: <551E8D21.7050507@dave-tech.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear Bean,

Il 21/07/2015 16:50, Bean Huo 霍斌斌 (beanhuo) ha scritto:
 > Hi,
 > What is status of this patch? I think 4 bits is make sense for all
 > MLC nand,
 > Bit flips on bad block mark should not be regarded as a bad block.
 >

I think that there was something wrong with your email, because I didn't 
see it in MTD ML archives, probably it has been blocked for some reason.

I didn't find a solution to implement Boris suggestions on how to choose 
the bad block bit threshold. In my implementation is still statically 
defined.

However I did some minor changes to the second patch, I'll send it in a 
few minutes.

Any feedback is welcome, of course ;-)

Kind Regards,

Andrea Scian


Il 03/04/2015 14:52, Andrea Scian ha scritto:
>
> Sorry for the later feedback, but unfortunately I had to move to other
> stuff before coming back to this topic
>
> Il 15/03/2015 10:07, Boris Brezillon ha scritto:
>> Hi Andrea,
>>
>> On Fri,  6 Mar 2015 13:12:17 +0100
>> rnd4@dave-tech.it wrote:
>>
>>> From: Andrea Scian <andrea.scian@dave.eu>
>>>
>>> MLC NANDs have more bit flips that SLC. When looking for bad block
>>> marker we have a lot of false positive if we check for the whole byte. To
>>> avoid this tolerate a few (4 here) bit flips for byte.
>>
>> I'm not sure sure we want to accept 4 bitflips for all MLC NANDs. IMHO
>> this value should be chip dependent.
>
> I agree
>
>> I know there is currently no way to retrieve this information,
>
> For this reason I just put a hardcoded value.
>
>> so here are two suggestions:
>>
>> 1/ make this value depend on the required NAND ecc strength
>> (badblockbits = ecc_strength / 10 ?)
>> 2/ let each controller change this value after nand_scan_ident
>> depending on the detected chip until we find a generic solution to
>> select this value
>
> I'll try to figure out how to solve this
> Any suggestion is welcome!
>
> Regards,
>

-- 

Andrea SCIAN

DAVE Embedded Systems
