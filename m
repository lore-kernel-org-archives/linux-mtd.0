Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAfFq-0005TW-Oj
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2011 09:23:55 +0000
Received: by iyb39 with SMTP id 39so2581134iyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Apr 2011 02:23:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1301671910.2789.98.camel@localhost>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
Date: Fri, 15 Apr 2011 17:23:52 +0800
Message-ID: <BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
Subject: Re: UBI memory usage on large page nand
From: Nicholas <ciliwung36@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem,

Thanks for the information. Indeed it has flexibility to be freed or consum=
ed.
Due to my case, i need to use maximum memory space while in the
meantime i also need to write files into nand via ubi.
8KB page of nand flash will consume 16MB for a single volume on a
single UBI MTD.

1. Is there any idea to reduce the memory consumption ?
2. For smaller buffer allocation, can it be made for several attempts
of read / write ?

Regards,
Alex

On Fri, Apr 1, 2011 at 11:31 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> Hi,
>
> I agree UBI/UBIFS uses more memory than it could. There is some room for
> optimizations.
>
> On Thu, 2011-03-31 at 11:07 +0800, Nicholas wrote:
>> Hi there,
>>
>> I've a short of memory usage issue while using large page size of nand f=
lash.
>> Before, i was using 2KB page size of nand flash, i found UBI/UBIFS memor=
y
>> consumption on normal zone are :
>>
>> 7 0xC0180858: =C2=A0 1024K, ubi_attach_mtd_de,
>> 8 0xC0180834: =C2=A0 1024K, ubi_attach_mtd_de,
>> 9 0xC00ED300: =C2=A0 1008K, =C2=A0 =C2=A0 =C2=A0ubifs_get_sb,
>> 10 0xC00ED31C: =C2=A0 1008K, =C2=A0 =C2=A0 =C2=A0ubifs_get_sb,
>> 11 0xC00FE7EC: =C2=A0 1008K, =C2=A0 =C2=A0ubifs_lpt_init,
>> 11 0xC00F95AC: =C2=A0 1008K, ubifs_mount_orpha,
>>
>> Then, i'm using 8KB page size of nand flash, and found the result as bel=
ow :
>> 4 0xC0180858: =C2=A0 4096K, ubi_attach_mtd_de,
>> 5 0xC0180834: =C2=A0 4096K, ubi_attach_mtd_de,
>> 6 0xC00FE7EC: =C2=A0 4064K, =C2=A0 =C2=A0ubifs_lpt_init,
>> 7 0xC00ED31C: =C2=A0 4064K, =C2=A0 =C2=A0 =C2=A0ubifs_get_sb,
>> 8 0xC00F95AC: =C2=A0 4064K, ubifs_mount_orpha,
>> 9 0xC00ED300: =C2=A0 4064K, =C2=A0 =C2=A0 =C2=A0ubifs_get_sb,
>>
>> My environment contains 2 mtd partitions for UBI.
>>
>> Before, it took 6MB of memory consumption and now it takes 24MB.
>> Do you have any suggestion how to reduce the memory consumption since dr=
am size
>> is pretty limited for other usage.
>
> I think this is mainly because your eraseblock size became larger. UBI
> and UBIFS allocate many buffers of eraseblock size for various purposes.
> The buffers are often allocated once on attach/mount and released only
> on detach/unmount. All of these buffers are allocated with vmalloc()
> call, so you can find them by grepping.
>
> The simplest thing you can try is to allocate these buffers when they
> are actually needed, and then free them when they are not needed. This
> should help.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
