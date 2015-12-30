Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEK8z-0002iu-7v
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 17:02:38 +0000
Subject: Re: Testing generic empty page bit flips recovery
To: Steve deRosier <derosier@gmail.com>
References: <5683E5CC.6020008@ti.com> <20151230154055.662b4df8@bbrezillon>
 <5683F960.90901@ti.com> <20151230170207.45e7fb01@bbrezillon>
 <56840911.7080404@ti.com>
 <CALupW3BqcfHJWYBPjQJr-tBhPZNxSWWBouBF31UY2Cc=h9vwfA@mail.gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
From: "Franklin S Cooper Jr." <fcooper@ti.com>
Message-ID: <56840E13.1020206@ti.com>
Date: Wed, 30 Dec 2015 11:02:11 -0600
MIME-Version: 1.0
In-Reply-To: <CALupW3BqcfHJWYBPjQJr-tBhPZNxSWWBouBF31UY2Cc=h9vwfA@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/30/2015 10:52 AM, Steve deRosier wrote:
> On Wed, Dec 30, 2015 at 8:40 AM, Franklin S Cooper Jr. <fcooper@ti.com> wrote:
>> One thing that confuses me is if I repeatedly call nanddump
>> I continue to get the "ECC: 4 corrected bitflips" message
>> and the "ECC corrected" count increases by 4 each time. If
>> these bits are being corrected which is apparent from
>> looking at the output of nanddump shouldn't sequential calls
>> indicate that no bitflips needed to be corrected since it
>> was corrected previously?
>>
> Hi Franklin,
>
> I'm making a guess at the source of your confusion, but I've had to
> answer this to repeated colleagues recently, so I'll give it a try.
>
> I think you're expecting the "correction" to actually be written and
> fixed on-flash. This is not the case.
>
> Bitflip corrections are applied as the flash data is read. Every time.
> So once a bit is flipped on the NAND, it will always stay that way on
> the physical device until erased and rewritten. Which doesn't happen
> for something as minor as a single bit-flip. So from that point on, it
> will always read and correct the flip and report it to the kernel log.
>
> UBI will move the data once the threshold gets hit, but up until that
> point it will continue to read the same bitflip and correct it.
>
> Hope that helps.
>
> - Steve

Steve,
That makes perfect sense. Thanks for explaining.
