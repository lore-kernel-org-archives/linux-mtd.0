Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWmxT-0006HZ-R1
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 11:41:12 +0000
Received: by mail-vc0-f177.google.com with SMTP id p16so3703836vcq.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2012 03:41:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <509CE712.60303@corscience.de>
References: <CAF9kqNHybAtg8od-h=B8qKKVuWhkieBnXfUuhxW53aHvEdeDZg@mail.gmail.com>
 <509CE712.60303@corscience.de>
Date: Fri, 9 Nov 2012 13:41:10 +0200
Message-ID: <CAF9kqNFLvf+Kzesk9XZOvy61v6LzqUA+cnmxtPLK7kPfTLpKSw@mail.gmail.com>
Subject: Re: UBIFS failure on SheevaPlug Basic
From: Dimax <dimax.main@gmail.com>
To: =?ISO-8859-1?Q?Andreas_Bie=DFmann?= <biessmann@corscience.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI Andreas,
Thanks for your help. I'm not so advanced in Linux knowledge and will
ask for deeper explanations. Or more exactly I understand what you
mean but do not know how to do it.
Please see below

On Fri, Nov 9, 2012 at 1:20 PM, Andreas Bie=DFmann
<biessmann@corscience.de> wrote:
> Dear Dimax,
>
> On 09.11.2012 10:35, Dimax wrote:
>> 1. Problem Description
>> ---------------------------------
>
> <snip>
>
>> Error reading superblock on volume 'ubi:rootfs'!
>> UBIFS not mounted, use ubifs mount to mount volume first!
>> UBIFS not mounted, use ubifs mount to mount volume first!
>> Wrong Image Format for bootm command
>> ERROR: can't get kernel image!
>>
>
> we discussed that already:
> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145526
> And a possible solution exists here:
> http://patchwork.ozlabs.org/patch/195174/
>

This is what I'm trying to do. I'm working now on building an u-boot
image with suggested patch.

>> 1.3 Recovery
>>
>> 2. Fixing
>> =3D=3D=3D=3D=3D=3D
>> 2. Make rootfs partition read only
>
> No, just use a /boot ro. All you need is kernel and initrd which should
> be located in /boot. You can use a raw mtd for that too to avoid that
> ubifs fails (as I understood is your fear).

Please explain how to get initrd in /boot ?
And what is a row mtd ?

> Another alternative is to have two logical ubifs in a physical ubi
> section. One of them is ro, the other rw mounted.
>
How can I arrange it?

>> 3. Fix u-boot settings
>> And here I'm not sure how to do all this.
>
> Just provide a correct cmdline so that the kernel knows about your
> special nand organization. u-boot also want to know that to load the
> kernel from appropriate position. Read about the mtdpart parameter in
> u-boot, that should be sufficient for your needs.
>
OK
Will do it

>> 2.3. u-boot
>> I assume I should start with changing partitioning in u-boot:
>> Currently I have
>> mtdparts mtdparts=3Dorion_nand:0xa0000@0x0(u-boot),0x400000@0x100000(uIm=
age),0x1fb00000@0x500000(rootfs)
> ---------------------------------^----------------------------^
>
> you will waste some space here! BTW did you think about your block size?
>
Where exactly?
I actually do not understand why should I have uImage partition as
uImage is located now under /boot in rootfs partition as far as I
understand. But this is what I took from other discussion thread.

>> How to split rootfs into two partitions?
>
> You could handle it on a directory basis, just mount /boot from another f=
s.
>

How can I do it?

> Best regards
>
> Andreas Bie=DFmann
