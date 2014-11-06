Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmReH-0001SO-20
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 18:19:09 +0000
Message-ID: <545BBB26.2040207@imgtec.com>
Date: Thu, 6 Nov 2014 15:17:10 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: <computersforpeace@gmail.com>, Ionela Voinescu
 <ionela.voinescu@imgtec.com>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
 <20141106160548.GB21363@kroah.com> <545BB0BB.3040905@imgtec.com>
 <20141106174459.GA3945@kroah.com> <545BB7F1.5050400@imgtec.com>
In-Reply-To: <545BB7F1.5050400@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: abrestic@chromium.org, linux-mtd@lists.infradead.org,
 james.hartley@imgtec.com, dehrenberg@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Brian, Ionela:

On 11/06/2014 03:03 PM, Ionela Voinescu wrote:
> On 11/06/14 17:44, Greg KH wrote:
>> On Thu, Nov 06, 2014 at 05:32:43PM +0000, Ionela Voinescu wrote:
>>> On 11/06/14 16:05, Greg KH wrote:
>>>> On Thu, Nov 06, 2014 at 03:51:17PM +0000, Ionela Voinescu wrote:
[snip]
>>>
>>> For now I am submitting this for staging, but I am interested in having
>>> a discussion about the best way to integrate it and hopefully merge
>>> this in drivers/mtd/spinand/.

[..]
>> Then why not just go directly for drivers/mtd/?  Why even stop at
>> drivers/staging/ at all?  I need an ACK from the MTD maintainer to get
>> this into staging as well.
>>
> of that generic framework and this is what I want to start here.
> Therefore, I've added in staging this initial version, because as I see
> thing, we can either find the good way to do it, detailed above, or have it
> as it is, in staging.
> 

How about picking Sourav's v2 as a starting point:

http://lists.infradead.org/pipermail/linux-mtd/2013-July/047434.html

And then try to use that to support Micron's MT29F and Gigadevice's GD5F ?

Brian: Any ideas or suggestion on how to proceed?
-- 
Ezequiel
