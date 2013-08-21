Received: from saarni.dnainternet.net ([83.102.40.136])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC5Cm-0005gd-QC
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 09:59:59 +0000
Message-ID: <52148F7B.7090409@iki.fi>
Date: Wed, 21 Aug 2013 12:59:23 +0300
From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
 <20130821073028.GB31788@brian-ubuntu> <87li3v79uo.fsf@nemi.mork.no>
 <20130821084154.GE31788@brian-ubuntu>
In-Reply-To: <20130821084154.GE31788@brian-ubuntu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@logfs.org>,
 linux-usb@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21.08.2013 11:41, Brian Norris wrote:
> On Wed, Aug 21, 2013 at 09:59:27AM +0200, Bjørn Mork wrote:
>> Brian Norris <computersforpeace@gmail.com> writes:
>>> On Tue, Aug 06, 2013 at 03:03:29PM +0300, Jussi Kivilinna wrote:
>>>> Patch fixes alauda not to use stack as URB transfer_buffer. URB buffers need to
>>>> be DMA-able, which stack is not.
>>>>
>>>> Patch is only compile tested.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
>>>> ---
>>>>  drivers/mtd/nand/alauda.c |   74 ++++++++++++++++++++++++++++++++++-----------
>>>>  1 file changed, 56 insertions(+), 18 deletions(-)
>>>
>>> Just FYI, this driver is being removed, so I'm obviously not taking this
>>> patch :)
>>
>> I think you should apply it anyway. The driver is still in v3.11 AFAICS,
>> and the patch should also go to the maintained stable kernels. You
>> cannot remove the driver from them, and I don't see a later driver
>> removal as a valid reason not to fix a known bug with a patch.
> 
> Seriously?
> 
> The reasons given for removal:
> 
>   "The driver has very low utility.  Devices in question are limited to
>   about 400kB/s and the only known user (me) discarded the hardware
>   several years back."
> 
> And:
> 
>   "Maybe we should just remove the driver and not spend any more time on
>   it?"
> 
> So you're suggesting applying an untested (compile-only) fix for an
> unobserved bug for the theoretical user of old, slow hardware who wants
> to use a recent stable kernel, when the last known user has given up on
> the driver entirely?
> 
> Anyway, just because you complained, I rebased and applied this to
> l2-mtd.git before the driver removal. I'll defer to dwmw2 whether this
> patch gets squashed out of existence.

If this is the case, please ignore this patch. I should not have marked it for stable in first place, since it is just compile-tested.

-Jussi

> 
> Brian
> 
