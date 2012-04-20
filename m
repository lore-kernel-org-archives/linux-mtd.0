Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLGWb-0001aK-5v
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 16:17:33 +0000
Message-ID: <4F918C14.8070004@newsguy.com>
Date: Fri, 20 Apr 2012 09:17:24 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read, write}_page
 interfaces
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <4F8D20C4.9010607@parrot.com>
 <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
 <4F904238.4070600@newsguy.com>
 <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
In-Reply-To: <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, prabhakar@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 04/19/2012 03:06 PM, Brian Norris wrote:
> Hi Mike,
> 
> On Thu, Apr 19, 2012 at 9:50 AM, Mike Dunn <mikedunn@newsguy.com> wrote:
>> On 04/17/2012 08:44 PM, Brian Norris wrote:
>>
>>> Now, in future revisions of this ASIC, it may be possible to access
>>> OOB via DMA as well, but even if this happens, it doesn't make a lot
>>> of sense on this hardware to *always* pull OOB data.
>>
>>
>> No, it doesn't.  In fact, I'm not aware of any code within or on top of mtd that
>> does anything with the oob data when a page is read.  If oob is needed,
>> mtd_read_oob() is used.
> 
> I guess this may not be an issue for page read, but I know one use for
> write_page data+OOB. MLC NAND, for instance, requires that you write
> *once* to a page, so I introduced ioctl(MEMWRITE) which generically
> allows page, OOB, or both to be written. This trickles down to the
> nand_ecc_ctrl.write_page function, I think. There are probably other
> cases that I'm not really thinking of right now.


I was just thinking of read.


> 
>> Coincidentally, I recxently discovered that my docg4
>> driver is technically broken because I don't fill the chip->oob_poi buffer when
>> I read a page, but it never caused a problem with UBI/ubifs.
> 
> If, as you claim, chip->oob_poi is never used on page read, then why
> do you claim this is "broken" for docg4? (Note that I am not 100% sure
> of your claim. There are *potential* users through the mtd_read_oob()
> API, which can specify both oobbuf and datbuf.)


Broken because it's *supposed* to fill it, creating the *potential* users, as
you point out.  My point was just to illustrate that you are correct: the need
to read oob along with the page data need not be assumed.


> 
>> And the mtdutils
>> are fine because mtdchar requires use of an ioctl for oob access, and the
>> handler for this ioctl uses mtd_read_oob().
>>
>>> As mentioned
>>> previously, most normal applications (i.e., UBI(FS)) don't need to
>>> access this OOB data at all, so it seems silly to go to extra work to
>>> have the DMA controller return it to the MTD/NAND layers. I'm not
>>> familiar with the OOB/ECC schemes on enough other hardware to
>>> determine whether other drivers could make use of this same
>>> optimization. It would require hardware with internal buffers for
>>> error correction and an access mode that easily returns page data
>>> only...
>>
>>
>> The Freescale nand controllers might fall into this category.  Hardware handles
>> error detction *and* correction, so there's no need to read the oob at all if
>> it's not needed.  And fsl_ifc_nand was just mainlined, BTW.
> 
> Right, I noticed the new driver (merge in 3.4-rc, right?) but didn't
> study the details. From your description, it sounds like it could use
> this change. CC'ing Prabhakar, author of fsl_ifc_nand.c.
> 
> And have you seen the thread (on patch 2/2) in which Shmulik suggests
> using a boolean (has_oob) argument instead of a buffer (oob) argument?
> Unless there are objections, I plan to rewrite v2 under his
> suggestion.


Yes (after sending my post).  I think it's a very good suggestion.  Keeps the
code from becoming even more confusing than it already is.


> 
> Thanks for your thoughts!
> 
> Brian
> 
> P.S. It seems, Mike, like you dropped the CC list. This may or may not
> be intentional, but either way I suppose this discussion isn't
> particularly important for all the CC'd members...


Done because my smtp server has a recipient limit of 20 :(  Otherwise I would
have "replied all".

Thanks,
Mike
