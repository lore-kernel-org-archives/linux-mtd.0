Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXme6-0008L7-D5
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 05:33:21 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so5814979vbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 11 Nov 2012 21:33:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <509CF7DA.8060505@corscience.de>
References: <CAF9kqNHybAtg8od-h=B8qKKVuWhkieBnXfUuhxW53aHvEdeDZg@mail.gmail.com>
 <509CE712.60303@corscience.de>
 <CAF9kqNFLvf+Kzesk9XZOvy61v6LzqUA+cnmxtPLK7kPfTLpKSw@mail.gmail.com>
 <509CF7DA.8060505@corscience.de>
Date: Mon, 12 Nov 2012 07:33:14 +0200
Message-ID: <CAF9kqNEbMHg-_-=KJFyBnM462TPsFo=iwZEWHJ1d4jc1+D1Rzw@mail.gmail.com>
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

HI,
I have managed to build latest image and apply MALLOC patch.
After that system is fully working:

UBIFS: recovery needed
UBIFS: recovery deferred
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: mounted read-only
UBIFS: file system size:   515708928 bytes (503622 KiB, 491 MiB, 3997 LEBs)
UBIFS: journal size:       25804800 bytes (25200 KiB, 24 MiB, 200 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: LZO
UBIFS: reserved for root:  5182151 bytes (5060 KiB)
Loading file '/boot/uInitrd' to addr 0x01100000 with size 5472032
(0x00537f20)...
Done
Loading file '/boot/uImage' to addr 0x00800000 with size 1435120 (0x0015e5f=
0)...
Done
## Booting kernel from Legacy Image at 00800000 ...
....

If someone need u-boot image I can provide it

On Fri, Nov 9, 2012 at 2:32 PM, Andreas Bie=DFmann
<biessmann@corscience.de> wrote:
> Dear Dimax,
>
> On 09.11.2012 12:41, Dimax wrote:
>> HI Andreas,
>> Thanks for your help. I'm not so advanced in Linux knowledge and will
>> ask for deeper explanations.
>
> all of us started some time ...
>
>> Or more exactly I understand what you
>> mean but do not know how to do it.
>> Please see below
>>
>> On Fri, Nov 9, 2012 at 1:20 PM, Andreas Bie=DFmann
>> <biessmann@corscience.de> wrote:
>>> Dear Dimax,
>>>
>>> On 09.11.2012 10:35, Dimax wrote:
>>>> 1. Problem Description
>>>> ---------------------------------
>>>
>>> <snip>
>>>
>>>> Error reading superblock on volume 'ubi:rootfs'!
>>>> UBIFS not mounted, use ubifs mount to mount volume first!
>>>> UBIFS not mounted, use ubifs mount to mount volume first!
>>>> Wrong Image Format for bootm command
>>>> ERROR: can't get kernel image!
>>>>
>>>
>>> we discussed that already:
>>> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145526
>>> And a possible solution exists here:
>>> http://patchwork.ozlabs.org/patch/195174/
>>>
>>
>> This is what I'm trying to do. I'm working now on building an u-boot
>> image with suggested patch.
>
> Ok
>
>>>> 1.3 Recovery
>>>>
>>>> 2. Fixing
>>>> =3D=3D=3D=3D=3D=3D
>>>> 2. Make rootfs partition read only
>>>
>>> No, just use a /boot ro. All you need is kernel and initrd which should
>>> be located in /boot. You can use a raw mtd for that too to avoid that
>>> ubifs fails (as I understood is your fear).
>>
>> Please explain how to get initrd in /boot ?
>
> cp <initrd provided by debian distro> /boot
> BTW: debian will install the initrd into /boot
>
>> And what is a row mtd ?
>
> I mean a RAW mtd section. You can access the mtd with tools from
> mtd-utils to write raw data on it (without an file system). These data
> can you get out of the mtd from u-boot, again without interaction with
> an fs.
>
>>> Another alternative is to have two logical ubifs in a physical ubi
>>> section. One of them is ro, the other rw mounted.
>>>
>> How can I arrange it?
>
> You can leave your mtdparts setting in u-boot as is and just create two
> different ubifs filesystems in it. Lets call the first one <boot> and
> the second one <fs>. So you will end up with these commands (not
> checked, please read man page before using them):
>
> % ubiformat -y -q /dev/mtd1
> % ubiattach -p /dev/mtd1
> % ubimkvol /dev/ubi0 -N boot -s 10MiB
> % ubimkvol /dev/ubi0 -N fs -m
> % mount -t ubifs ubi0:fs /target
> % mkdir /target/boot
> % mount -t ubifs ubi0:boot /target/boot
> % debootstrap ...
>
> Then configure your /etc/fstab and ensure the /boot is mounted ro
> always. Just mount rw for an kernel update and then remount ro right
> after the update.
>
>>>> 3. Fix u-boot settings
>>>> And here I'm not sure how to do all this.
>>>
>>> Just provide a correct cmdline so that the kernel knows about your
>>> special nand organization. u-boot also want to know that to load the
>>> kernel from appropriate position. Read about the mtdpart parameter in
>>> u-boot, that should be sufficient for your needs.
>>>
>> OK
>> Will do it
>>
>>>> 2.3. u-boot
>>>> I assume I should start with changing partitioning in u-boot:
>>>> Currently I have
>>>> mtdparts mtdparts=3Dorion_nand:0xa0000@0x0(u-boot),0x400000@0x100000(u=
Image),0x1fb00000@0x500000(rootfs)
>>> ---------------------------------^----------------------------^
>>>
>>> you will waste some space here! BTW did you think about your block size=
?
>>>
>> Where exactly?
>
> Well, there is a gap of 0x60000 between u-boot and uImage section.
>
>> I actually do not understand why should I have uImage partition as
>> uImage is located now under /boot in rootfs partition as far as I
>> understand. But this is what I took from other discussion thread.
>
> Well, as mentioned above you can have a RAW mtd which could hold for
> example the uImage.
>
>>>> How to split rootfs into two partitions?
>>>
>>> You could handle it on a directory basis, just mount /boot from another=
 fs.
>>>
>>
>> How can I do it?
>
> Just mount /boot as another fs, as described above.
>
> Best regards
>
> Andreas Bie=DFmann
