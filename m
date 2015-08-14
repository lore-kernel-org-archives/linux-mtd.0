Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQA2e-0004xo-5C
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 08:08:44 +0000
Received: by oio137 with SMTP id 137so40455502oio.0
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 01:08:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMqctQUgbukQ-h9vznwu2JrNBaZJeuL1jQiAgG59s9qHzS14Q@mail.gmail.com>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <8AC930D6-9BEE-4AA8-99AC-962027CCF336@sigma-star.at>
 <CAOMqctQUgbukQ-h9vznwu2JrNBaZJeuL1jQiAgG59s9qHzS14Q@mail.gmail.com>
Date: Fri, 14 Aug 2015 09:08:22 +0100
Message-ID: <CAPcvp5Ee8=mpPcw+nsNfwyw9-ojyNB7cZk9ygrJj-rZWQ4qwkw@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: Michal Suchanek <hramrach@gmail.com>
Cc: David Gstir <david@sigma-star.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 August 2015 at 08:25, Michal Suchanek <hramrach@gmail.com> wrote:
> Hello,
>
> On 12 August 2015 at 19:19, David Gstir <david@sigma-star.at> wrote:
>> Hi!
>>
>
>>> - Encryption in UBI was preferred as it removed the complexity from userspace,
>>>   though I suppose there is no reason why this can't be done within the MTD
>>>   layer rather than in UBI and thus benefit all MTD users.
>>
>> Generally speaking, I'd argue for moving encryption to the highest layer possible. So, if you exclusively use UBIFS and need encryption, add it to UBIFS or even your userspace application.
>> The main reason for this is that disk encryption on lower layers (e.g block-level) has fewer security guarantees, like no authentication of encrypted data for example. So it cannot prevent "evil maid" attacks.
>> There is a nice writeup on this topic here: [2], which focuses on the commonly used XTS mode, but makes valid points for disk encryption in general.
>>
>> So, when you do encryption in UBI or MTD, be aware of the security implications and know your thread model.
>>
>> [2] http://sockpuppet.org/blog/2014/04/30/you-dont-want-xts/
>
> Thanks for the pointers.
>
> Obviously, full disk encryption is not ideal but it's also last resort
> in the sense that you can cut & paste state of the art solution and it
> works on any kind of disk with minimum requirements on the implementor
> and reviewer.
>
> From the notes about internal and external flash it seems that this is
> upposed to protect against removing an external flash memory which is
> attached to a device. This is probably a decent solution for the
> problem. Knowing more details would help here.

Yes that was the intent of this work - to provide moderate protection
from someone removing an external flash chip and retrieving its data.

Many SOMs provide internal flash and a means of protection such as
security fuses that prevent JTAG access etc. Thus to retrieve the
internal key you would need an increased level of skill (i.e. rather
than removing an external chip and wiring it to another board (perhaps
a reference board) - you'd now have to skim the SOM or similar).
Combined with application/system security you can also make it much
harder for the user to access the external flash via software hacking
such as accessing a console prompt, exploiting vulnerabilities etc.

This implementation provides a balance between
implementation/integration complexity and protection. If other users
can benefit from this then it's something they can just switch on -
rather than having to add a variety of userspace components to their
distribution, etc.

At present my implementation makes an assumption that the key is
stored in another MTD partition, I took this approach because it was
easy. However I'm not sure if this is useful to the general case - or
if the general case is in fact users on SOMs protecting external flash
with keys on internal flash. It would be possible to extend the
UBI/MTD API to add ioctl's (or similar) such that a user can provide a
key during mount/attach time. This makes it slightly more complex for
a user to use - as rather than updating a .config they now have to add
an initramfs that reads a key from one MTD partition and provides it
to the kernel.

>
> Adding encryption to UBIFS itself is much more difficult.

Whilst experimenting with this stuff, I actually was successful in
adding encryption to UBIFS.

To support compression, UBIFS provides functions thats get called when
data needs to be compressed. This calls use a crypto framework, e.g.
crypto_comp_compress. I extended this to actually use encryption. This
worked - though it only encrypted the data and not file names etc, I
also recall that compression can be turned off or not always applied.

Much like the UBI encryption - I could have also tried to provided
UBIFS encryption by intercepting the ubi_leb_write and ubi_write
calls.

>
> Adding encryption to every application is not really feasible unless
> you have a single-purpose device with one application.


Thanks,

Andrew Murray

>
> Thanks
>
> Michal
