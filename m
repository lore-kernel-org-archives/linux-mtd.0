Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RM0bt-0004YS-7K
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2011 16:57:50 +0000
Message-ID: <4EB2C77E.8020306@newsguy.com>
Date: Thu, 03 Nov 2011 09:55:26 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320274859-3270-1-git-send-email-mikedunn@newsguy.com>
	<20111103085824.GA28465@parrot.com> <4EB25B62.4070502@parrot.com>
In-Reply-To: <4EB25B62.4070502@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/03/2011 02:14 AM, Matthieu CASTET wrote:
> Ivan Djelic a écrit :
>>
>> Using this blank ecc value to detect blank pages after reading them is not that
>> reliable, because if a bitflip appears in an erased page, the HW ecc generator
>> will generate a completely different sequence of bytes. Your driver will think
>> the page is not blank, it will try to correct errors and fail. And UBIFS will
>> not appreciate that.
>>
>> I can see two cleaner alternatives to solve this issue:
>>
>> 1. When you program a page, before writing hwecc to oob, adjust it like this:
>>
>>    hwecc[i] ^= blank_read_hwecc[i]^0xff;
>>
>> The effect of this is that you now get 0xffs as ecc for blank pages, and bitflip
>> correction on erased pages for free. This is transparent to your controller,
>> because this "adjustment" cancels itself upon reading when calc_ecc^recv_ecc is
>> computed.
>>
>> 2. Use unprotected spare oob byte 15 as a programmming marker: remove it from
>> the oob_free list, and force it to 0 when you program a page. Now, you can
>> easily detect if a page is blank or has been programmed by checking this byte.
>> You can for instance count the number of bits set to 1 in the byte, and decide
>> it is blank if that number is greater than 4; this ensures you are robust to
>> bitflips in the marker byte itself.
>>
>> My preference would go to option 2 in your case.
>>
> Note that UBIFS except blank page to be 0xff.
>
> With option 1 you have nothing to do (ecc correct bit-flips), with option 2 you
> have to memset the page (data+spare) to 0xff to clear bit-flips.
>
> Also with option 2 you don't know how many bit-flip there are in the blank page.
> Because UBIFS (or mtd) don't check the page after a write , you can end writting
> a page with too many bit-flips without any error.
>
>


How about implementing both?  The oob byte 15 can be used to check if the page
is blank only in the event that bch decode fails due to the number of bit errors
exceeding four.

I really appreciate the advice, gentlemen!

Thanks,
Mike
