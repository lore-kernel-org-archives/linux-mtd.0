Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0AY6-0003L1-J9
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 15:58:03 +0000
Received: by wmec201 with SMTP id c201so55663041wme.1
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2015 07:57:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56507B3B.4080608@gmail.com>
References: <564CEB61.2000601@gmail.com> <20151118215755.GL31303@sirena.org.uk>
 <564D0098.4030107@gmail.com> <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Sat, 21 Nov 2015 16:57:01 +0100
Message-ID: <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Martin Sperl <martin@sperl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 November 2015 at 00:22, Brian Norris <computersforpeace@gmail.com> wr=
ote:
> On Fri, Nov 20, 2015 at 08:05:48PM +0100, Michal Suchanek wrote:

>> If it's desirable that a partial transfer is reported as error then a
>> particular error value should be defined for this case and drivers
>> that can continue the transfer in a driver-specific way (such as
>> spi-nor) can check for this error and handle it appropriately and pass
>> through any other error.
>
> Based on Mark's further comments (and my own intuition), I'd rather not
> try to interpret different error codes to mean "truncated but keep
> going" vs. "truncated for other reason, stop now", unless we really have
> to.
>
> I think if we do what Heiner was proposing from the beginning -- expose
> a reasonable max SPI message length -- then I think we'll cover the bulk
> of what we want. SPI NOR drivers can then try "small enough" transfers,
> and if we see any errors, those are unexpected, and we abort.
>
> Sound OK?

It sounds ok.

We actually have use case for both cases even in spi-nor.

Write transfers a page at a time and when whole page cannot be written
an error should be reported and propagated. When the master controller
cannot write like 260 bytes at once the flash becomes effectively
read-only.

Read can do arbitrary size blocks so the limit should be checked and
the transfer done in appropriately sized chunks.

On 21 November 2015 at 00:07, Brian Norris <computersforpeace@gmail.com> wr=
ote:

>> 64k limit on the other hand is something more usable from driver
>> writer standpoint and some banked mmap access to flash memories would
>> have similar granularity.
>
> Right.
>
>> I would also like to point out that the limit depends on the transfer
>> settings. For example, a SPI controller can have no limit on transfer
>> size but when accessing a flash memory through mmap interface the mmap
>> window limits the amount of data you can transfer at once. This
>> particular case may be fixable by moving the mmap window transparently
>> inside the driver.
>
> Hmm, I'm not sure I have much opinion on that one without having a
> non-theoretical case. It seems like it'd be best if the SPI master
> driver can work as best as it can to respect a single reasonable "max
> mesage size", even if that means choosing the lowest common denominator
> of all limitations.

I don't have an actual example either. All the cases I can think of
fall into two categories

1) it can be handled transparently
2) something is broken

maybe master driver could recalculate the limit when the transfer
parameters are changed if really needed.

On 21 November 2015 at 15:10, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Am 21.11.2015 um 14:49 schrieb Mark Brown:
>> On Fri, Nov 20, 2015 at 01:56:13PM +0100, Martin Sperl wrote:
>>
>>>> Every line of code that's in a driver that could be in the core is a
>>>> maintainence burden, people will want to start doing things like
>>>> combining functions in fun ways and if we want to try to do things lik=
e
>>>> figure out if we can coalesce adjacent transfers in the core (which we
>>>> really ought to) it won't know what the limitations that exist are.
>>
>>> this =E2=80=9Ccolaesce=E2=80=9D of transfers into one could be one of t=
hose
>>> =E2=80=9Ctransformation=E2=80=9D I am talking about - and this one woul=
d be implemented
>>> in core making certain assumptions (like starting on a page, ...)
>>
>> Why would we want to force that assumption?  It massively reduces the
>> utility for DMA controllers that don't have such limitations.
>>
>>>>> I wonder if such a variant-construct does not create more headaches i=
n
>>>>> the long run as each spi_driver wanting to do something =E2=80=9Csome=
thing=E2=80=9D
>>>>> special would then need to get updated for any additional constraint=
=E2=80=A6
>>
>>>> I'm sorry but I don't understand what you mean here.  However we
>>>> implement things anything that wants to know about constraints is goin=
g
>>>> to need to be updated to use them.
>>
>>> That is what I want to avoid if possible - the one thing that may come
>>> handy (at least from my perspective) could be to give some hints to
>>> make optimal use of the HW
>>> Say:
>>> * preferred alignment on X byte boundry
>>> * preferred max spi_transfer.length
>>
>>> All the other possible constraints parameters should be opaque to
>>> a spi_device driver, so I would not want to include those inside the
>>> spi_master structure, as _then_ these get used.
>>
>> You're conflating two unrelated design decisions here.  Yes, it's
>> unfortunate that the SPI API was written to allow client drivers to see
>> the master structure but that doesn't mean that converting data into
>> code is a good idea, that's still a bad pattern independently of the
>> visibility issue.
>>
> Currently the only (?) way for a protocol driver like spi-nor to get
> info about HW restrictions described in the controller driver
> is via the master structure and its "constraint" members.
>
> As you say this visibility of the master structure is unfortunate:
> What could be a (maybe long-term) better way to propagate restrictions
> that can't be handled transparently in the core like max message size
> and SPI NOR to protocol drivers?
>

Actually, the fact that the maximum size of SPI transfer can be
limited is a fact which was already observed by some protocol driver
writers and handled in a driver-specific way. So adding this to the
core makes sense.

In most cases you practically cannot hit the limit because it is very
large. In the cases when some practically feasible transfer can trip
the limit it should be reported as master limitation.

As the possibility to coalesce something is protocol-specific the
protocol driver is in the position to make decision how a limitation
should be handled and should know about the limitation.

Thanks

Michal
