Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QTZcL-0004Ts-Mr
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 13:13:18 +0000
Date: Mon, 6 Jun 2011 15:11:12 +0200 (CEST)
From: Peter Wippich <pewi@gw-instruments.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: nandwrite with raw oob data
In-Reply-To: <1307362246.3112.45.camel@localhost>
Message-ID: <alpine.LSU.2.00.1106061449030.26001@redbean.intranet.gw-instruments.de>
References: <alpine.LSU.2.00.1106051821580.26001@redbean.intranet.gw-instruments.de>
	<1307362246.3112.45.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem,

On Mon, 6 Jun 2011, Artem Bityutskiy wrote:

> On Sun, 2011-06-05 at 18:40 +0200, Peter Wippich wrote:
>> Dear all,
>>
>> I run into the same problem as outlined here before:
>> http://lists.infradead.org/pipermail/linux-mtd/2011-March/034516.html
>>
>> Going a little bit deeper it looks to me that writing any nand flash data
>> with raw (precomputed ECC) OOB data is not possible at all with a recent
>> Kernel and nandwrite version.
>>
>> What happens here is that nandwrite will set MTD_MODE_RAW when noecc is
>> specified. Doing so will force the kernel driver to write OOB data only on
>> a normal write. Obviously this will fail when someone is trying to write
>> normal data to flash in MODE_RAW.
>>
>> Question: is this realy the intended behaviour ???
>>
>> It may be easy to fix this on kernel level, but may be there is some good
>> reason I don't know to do it as it is. And I don't want to break things.
>>
>> Any comments welcome.
>
> I think that is just broken stuff which is rarely used. Please, send a
> set of fixes, but please, try to:
>
> 1. Fix both nandwrite and the kernel.
> 2. Test that non-raw functionality is not broken.
>

Digged a little bit deeper. The problem is much simpler:

Indeed write_oob can be used to write the data block. This is just what 
happens when writing in MODE_RAW. However, the initialization 
of the mtd_oob_ops structure used is to lazy and causes the write to fail 
later on. I will send a trivial patch later on.

Cheers,

Peter
