Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RPX8t-0002eP-Ng
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 10:18:29 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>
 <4EBECB89.2020102@newsguy.com>
Date: Sun, 13 Nov 2011 11:18:16 +0100
In-Reply-To: <4EBECB89.2020102@newsguy.com> (Mike Dunn's message of "Sat, 12
 Nov 2011 11:39:53 -0800")
Message-ID: <87vcqoiavr.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> On 11/10/2011 12:05 AM, Robert Jarzmik wrote:
>> +static struct nand_ecclayout docg3_oobinfo = {
>> +	.eccbytes = 8,
>> +	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14},
>> +	.oobfree = {{0, 7}, {15, 1} },
>> +	.oobavail = 8,
>> +};
>> +

I took a different approach.  I check an internal docg3 register to see if the
page was written. Or I could had have checked the Hamming code, as I don't think
it can be 0xff whatever the pagesize 7 bytes values.

The reason behind is that the Hamming code is Ham(64, 57), ie. Ham(2^6,
2^6-6-1). The means the 6 bits are enough to cover all codewords possibilities,
and 0xff is not one of them.

So unless a bitflip in Hamming code, 0xff in it means blank page. And I think
the ECC engine is even smarter, with the ECCCONF1_PAGE_IS_WRITTEN.

>
> Just FYI, per Ivan's suggestion, I changed this to use the last oob byte as a
> "page programmed" flag for the purpose of detecting bit flips when reading a
> blank page.  Maybe something to keep in mind.  You can have a look at the latest
> G4 driver patch to see exactly how I use it.
I personally think this should be provided by the MTD API. A function
is_page_blank(ofs) could tell if the page was written or not. Now if the
function is NULL, the upper layer (UBIFS, ...) could decide _by itself_ to
assign a free OOB byte to that meaning. But IMHO it's not the drivers duty to
take these decisions to restrict the OOB, let it be done at an upper level.

Cheers.

-- 
Robert
