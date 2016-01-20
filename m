Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aM1QF-0003ZQ-4z
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2016 22:40:16 +0000
Subject: Re: Block device emulation on top of ubi volumes with read/write
 support
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Charles Godson <cestgodson@gmail.com>
References: <CADC-h+GSekez10TVYV3pJsiD=YPY=WawG5cN_ZrJJb0zP7Xu=g@mail.gmail.com>
 <CAAEAJfAM9XEV2oU7PngdpPjryGttQw8Zj+uqhJ40mZEKvTX59A@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, w@1wt.eu,
 Daniel Ehrenberg <dehrenberg@chromium.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56A00CB2.3050505@nod.at>
Date: Wed, 20 Jan 2016 23:39:46 +0100
MIME-Version: 1.0
In-Reply-To: <CAAEAJfAM9XEV2oU7PngdpPjryGttQw8Zj+uqhJ40mZEKvTX59A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.01.2016 um 22:50 schrieb Ezequiel Garcia:
> On 20 January 2016 at 18:33, Charles Godson <cestgodson@gmail.com> wrote:
>> Hi Ezequiel,
>>
>> Hope this email finds you well.
>>
>> I could have sent this directly to linux-kernel@vger.kernel.org or
>> linux-mtd@lists.infradead.org, but I thought there may be a quick answer to
>> this one.
>>
> 
> I'm Ccing linux-mtd, and some interested folks.
> 
>> I am looking into enabling ext4 support on top of NAND flash. I am currently
>> using squashfs on top of UBI volumes (with your read-only block device
>> emulation), and that works exceptionally well for me (thanks for the quality
>> code!).
>>
>> I've looked at your earlier work, where you started with block device
>> emulation with RW support (e.g. https://lwn.net/Articles/525957/). I haven't
>> seen much progress there, and in 2014 you''ve introduced RO version.
>>
>> I was wondering why the switch?
>>
> 
> I guess there are two reasons: first, because even though UBI
> does wear-leveling, we feared [1] that a regular filesystem would wear out
> blocks by doing a crazy amount of writes.
> 
> To be honest, it wasn't the main obstacle, so I added the
> write-support as an option
> with a big fat warning message. It was later asked to drop the option,
> and I fell for the
> safer read-only instead of leaving write support there.

Yes. UBI is *not* a FTL and doing a proper RW block driver on top of UBI
will be hard. Especially if you want decent performance, power cut tolerance
and a good lifetime of your NAND.

We have UBIFS for reasons. :-)

> The read-only version was much much simpler, and it was tempting to keep things
> simple. This is the second reason.
> 
> You may restart this discussion, write support and see how it goes. I'm not
> entirely opposed to the idea.
> 
> BTW, why can't you just use UBIFS instead?

Please use UBIFS. Are you missing some ext4 feature?

Thanks,
//richard
