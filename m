Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ye160-00089n-Tc
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2015 12:53:14 +0000
Message-ID: <551E8D21.7050507@dave-tech.it>
Date: Fri, 03 Apr 2015 14:52:49 +0200
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>	<1425643938-24749-2-git-send-email-rnd4@dave-tech.it>
 <20150315100752.3458ccfe@bbrezillon>
In-Reply-To: <20150315100752.3458ccfe@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Sorry for the later feedback, but unfortunately I had to move to other
stuff before coming back to this topic

Il 15/03/2015 10:07, Boris Brezillon ha scritto:
> Hi Andrea,
> 
> On Fri,  6 Mar 2015 13:12:17 +0100
> rnd4@dave-tech.it wrote:
> 
>> From: Andrea Scian <andrea.scian@dave.eu>
>>
>> MLC NANDs have more bit flips that SLC. When looking for bad block
>> marker we have a lot of false positive if we check for the whole byte. To
>> avoid this tolerate a few (4 here) bit flips for byte.
> 
> I'm not sure sure we want to accept 4 bitflips for all MLC NANDs. IMHO
> this value should be chip dependent.

I agree

> I know there is currently no way to retrieve this information,

For this reason I just put a hardcoded value.

> so here are two suggestions:
> 
> 1/ make this value depend on the required NAND ecc strength
> (badblockbits = ecc_strength / 10 ?)
> 2/ let each controller change this value after nand_scan_ident
> depending on the detected chip until we find a generic solution to
> select this value

I'll try to figure out how to solve this
Any suggestion is welcome!

Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
