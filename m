Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCEa7-0003ua-OI
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 20:00:49 +0000
Received: by mail-vc0-f176.google.com with SMTP id ha11so562432vcb.21
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2013 13:00:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52148F7B.7090409@iki.fi>
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
 <20130821073028.GB31788@brian-ubuntu> <87li3v79uo.fsf@nemi.mork.no>
 <20130821084154.GE31788@brian-ubuntu> <52148F7B.7090409@iki.fi>
Date: Wed, 21 Aug 2013 13:00:15 -0700
Message-ID: <CAN8TOE9Ed=2YgV7L7gHB7FZC8OyE9=vr=6rVUQDPoK54NHh3ZA@mail.gmail.com>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
From: Brian Norris <computersforpeace@gmail.com>
To: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@logfs.org>,
 linux-usb@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?ISO-8859-1?Q?Bj=F8rn_Mork?= <bjorn@mork.no>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 21, 2013 at 2:59 AM, Jussi Kivilinna <jussi.kivilinna@iki.fi> w=
rote:
> On 21.08.2013 11:41, Brian Norris wrote:
>> On Wed, Aug 21, 2013 at 09:59:27AM +0200, Bj=F8rn Mork wrote:
>>> Brian Norris <computersforpeace@gmail.com> writes:
>>>> On Tue, Aug 06, 2013 at 03:03:29PM +0300, Jussi Kivilinna wrote:
>>>>> Patch fixes alauda not to use stack as URB transfer_buffer. URB buffe=
rs need to
>>>>> be DMA-able, which stack is not.
>>>>>
>>>>> Patch is only compile tested.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
>>>>> ---
>>>>>  drivers/mtd/nand/alauda.c |   74 ++++++++++++++++++++++++++++++++++-=
----------
>>>>>  1 file changed, 56 insertions(+), 18 deletions(-)
>>>>
>>>> Just FYI, this driver is being removed, so I'm obviously not taking th=
is
>>>> patch :)
>>>
>>> I think you should apply it anyway. The driver is still in v3.11 AFAICS=
,
>>> and the patch should also go to the maintained stable kernels. You
>>> cannot remove the driver from them, and I don't see a later driver
>>> removal as a valid reason not to fix a known bug with a patch.
>>
>> Seriously?
>>
>> The reasons given for removal:
>>
>>   "The driver has very low utility.  Devices in question are limited to
>>   about 400kB/s and the only known user (me) discarded the hardware
>>   several years back."
>>
>> And:
>>
>>   "Maybe we should just remove the driver and not spend any more time on
>>   it?"
>>
>> So you're suggesting applying an untested (compile-only) fix for an
>> unobserved bug for the theoretical user of old, slow hardware who wants
>> to use a recent stable kernel, when the last known user has given up on
>> the driver entirely?
>>
>> Anyway, just because you complained, I rebased and applied this to
>> l2-mtd.git before the driver removal. I'll defer to dwmw2 whether this
>> patch gets squashed out of existence.
>
> If this is the case, please ignore this patch. I should not have marked i=
t for stable in first place, since it is just compile-tested.

Yes, that's a good point. Quoting Documentation/stable_kernel_rules.txt:

"It must be obviously correct and tested."

Seeing as it was not tested, I am dropping the patch entirely (it is
not stable material, and there is no point including it along with the
driver removal).

Thanks,
Brian
