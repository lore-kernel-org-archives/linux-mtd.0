Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmROx-0002TW-Sy
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 18:03:20 +0000
Message-ID: <545BB7F1.5050400@imgtec.com>
Date: Thu, 6 Nov 2014 18:03:29 +0000
From: Ionela Voinescu <ionela.voinescu@imgtec.com>
MIME-Version: 1.0
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
 <20141106160548.GB21363@kroah.com> <545BB0BB.3040905@imgtec.com>
 <20141106174459.GA3945@kroah.com>
In-Reply-To: <20141106174459.GA3945@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: abrestic@chromium.org, dehrenberg@chromium.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@imgtec.com,
 computersforpeace@gmail.com, james.hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/06/14 17:44, Greg KH wrote:
> On Thu, Nov 06, 2014 at 05:32:43PM +0000, Ionela Voinescu wrote:
>> On 11/06/14 16:05, Greg KH wrote:
>>> On Thu, Nov 06, 2014 at 03:51:17PM +0000, Ionela Voinescu wrote:
>>>> Hi,
>>>>
>>>> These patches add support for GigaDevice 4Gb SPI NAND flash.
>>>> This is an initial version, adding it to staging, as there is no existing
>>>> framework for SPI NAND as there is for SPI NOR in MTD.
>>>>
>>>> Therefore, I want to start an early discussion about this in order to find
>>>> the best way to integrate it. I am at the beginning regarding both upstreaming
>>>> and understanding all of the MTD layer, so your comments and ideas are
>>>> welcomed.
>>>>
>>>> I've structured this driver similar to the existing Micron SPI NAND
>>>> (mt29f_spinand), in order to make it easier to understand the common code.
>>>> I know there is an atempt to add support for a generic SPI NAND based
>>>> framework from Sourav Poddar but that never got merged, and it would be
>>>> a valid option to consider.
>>>>
>>>> http://lists.infradead.org/pipermail/linux-mtd/2013-July/047373.html
>>>>
>>>> This initial version does not implement all the functionality and I will
>>>> add to it once we decide on a structure. This is based on linux-next.
>>>>
>>>> Thank you and I welcome all comments,
>>> If you want to add code to the staging tree, you need a TODO file that
>>> lists what is needed to be done to the driver in order to get it out of
>>> the staging tree.  Otherwise I don't know why the code is in staging at
>>> all, and not in the "real" part of the kernel.
>>>
>>> thanks,
>>>
>>> greg k-h
>> Hi Greg,
>>
>> For now I am submitting this for staging, but I am interested in having
>> a discussion about the best way to integrate it and hopefully merge
>> this in drivers/mtd/spinand/.
> Then why not just go directly for drivers/mtd/?  Why even stop at
> drivers/staging/ at all?  I need an ACK from the MTD maintainer to get
> this into staging as well.
>
> thanks,
>
> greg k-h
Because the right way to do it in drivers/mtd would be to add a generic
SPI NAND framework and above that have the device specific part.
That would accommodate both my driver and the existing Micron
mt29f_spinand, also in staging, and prepare the ground for other drivers.
But that requires a discussion with the community regarding the structure
of that generic framework and this is what I want to start here.

Therefore, I've added in staging this initial version, because as I see thing,
we can either find the good way to do it, detailed above, or have it
as it is, in staging.

Thank you,
Ionela.
