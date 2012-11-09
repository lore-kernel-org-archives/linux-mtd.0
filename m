Received: from moutng.kundenserver.de ([212.227.126.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWnl7-0001kQ-Ps
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 12:32:30 +0000
Message-ID: <509CF7DA.8060505@corscience.de>
Date: Fri, 09 Nov 2012 13:32:26 +0100
From: =?ISO-8859-1?Q?Andreas_Bie=DFmann?= <biessmann@corscience.de>
MIME-Version: 1.0
To: Dimax <dimax.main@gmail.com>
Subject: Re: UBIFS failure on SheevaPlug Basic
References: <CAF9kqNHybAtg8od-h=B8qKKVuWhkieBnXfUuhxW53aHvEdeDZg@mail.gmail.com>
 <509CE712.60303@corscience.de>
 <CAF9kqNFLvf+Kzesk9XZOvy61v6LzqUA+cnmxtPLK7kPfTLpKSw@mail.gmail.com>
In-Reply-To: <CAF9kqNFLvf+Kzesk9XZOvy61v6LzqUA+cnmxtPLK7kPfTLpKSw@mail.gmail.com>
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

Dear Dimax,

On 09.11.2012 12:41, Dimax wrote:
> HI Andreas,
> Thanks for your help. I'm not so advanced in Linux knowledge and will
> ask for deeper explanations.=20

all of us started some time ...

> Or more exactly I understand what you
> mean but do not know how to do it.
> Please see below
>=20
> On Fri, Nov 9, 2012 at 1:20 PM, Andreas Bie=DFmann
> <biessmann@corscience.de> wrote:
>> Dear Dimax,
>>
>> On 09.11.2012 10:35, Dimax wrote:
>>> 1. Problem Description
>>> ---------------------------------
>>
>> <snip>
>>
>>> Error reading superblock on volume 'ubi:rootfs'!
>>> UBIFS not mounted, use ubifs mount to mount volume first!
>>> UBIFS not mounted, use ubifs mount to mount volume first!
>>> Wrong Image Format for bootm command
>>> ERROR: can't get kernel image!
>>>
>>
>> we discussed that already:
>> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145526
>> And a possible solution exists here:
>> http://patchwork.ozlabs.org/patch/195174/
>>
>=20
> This is what I'm trying to do. I'm working now on building an u-boot
> image with suggested patch.

Ok

>>> 1.3 Recovery
>>>
>>> 2. Fixing
>>> =3D=3D=3D=3D=3D=3D
>>> 2. Make rootfs partition read only
>>
>> No, just use a /boot ro. All you need is kernel and initrd which shoul=
d
>> be located in /boot. You can use a raw mtd for that too to avoid that
>> ubifs fails (as I understood is your fear).
>=20
> Please explain how to get initrd in /boot ?

cp <initrd provided by debian distro> /boot
BTW: debian will install the initrd into /boot

> And what is a row mtd ?

I mean a RAW mtd section. You can access the mtd with tools from
mtd-utils to write raw data on it (without an file system). These data
can you get out of the mtd from u-boot, again without interaction with
an fs.

>> Another alternative is to have two logical ubifs in a physical ubi
>> section. One of them is ro, the other rw mounted.
>>
> How can I arrange it?

You can leave your mtdparts setting in u-boot as is and just create two
different ubifs filesystems in it. Lets call the first one <boot> and
the second one <fs>. So you will end up with these commands (not
checked, please read man page before using them):

% ubiformat -y -q /dev/mtd1
% ubiattach -p /dev/mtd1
% ubimkvol /dev/ubi0 -N boot -s 10MiB
% ubimkvol /dev/ubi0 -N fs -m
% mount -t ubifs ubi0:fs /target
% mkdir /target/boot
% mount -t ubifs ubi0:boot /target/boot
% debootstrap ...

Then configure your /etc/fstab and ensure the /boot is mounted ro
always. Just mount rw for an kernel update and then remount ro right
after the update.

>>> 3. Fix u-boot settings
>>> And here I'm not sure how to do all this.
>>
>> Just provide a correct cmdline so that the kernel knows about your
>> special nand organization. u-boot also want to know that to load the
>> kernel from appropriate position. Read about the mtdpart parameter in
>> u-boot, that should be sufficient for your needs.
>>
> OK
> Will do it
>=20
>>> 2.3. u-boot
>>> I assume I should start with changing partitioning in u-boot:
>>> Currently I have
>>> mtdparts mtdparts=3Dorion_nand:0xa0000@0x0(u-boot),0x400000@0x100000(=
uImage),0x1fb00000@0x500000(rootfs)
>> ---------------------------------^----------------------------^
>>
>> you will waste some space here! BTW did you think about your block siz=
e?
>>
> Where exactly?

Well, there is a gap of 0x60000 between u-boot and uImage section.

> I actually do not understand why should I have uImage partition as
> uImage is located now under /boot in rootfs partition as far as I
> understand. But this is what I took from other discussion thread.

Well, as mentioned above you can have a RAW mtd which could hold for
example the uImage.

>>> How to split rootfs into two partitions?
>>
>> You could handle it on a directory basis, just mount /boot from anothe=
r fs.
>>
>=20
> How can I do it?

Just mount /boot as another fs, as described above.

Best regards

Andreas Bie=DFmann
