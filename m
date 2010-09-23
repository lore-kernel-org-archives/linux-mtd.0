Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyrtK-0003eW-NW
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 19:55:39 +0000
Received: by qwe4 with SMTP id 4so293729qwe.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 12:55:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1285244894.29268.104.camel@localhost>
References: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
	<AANLkTinHKU1BfmtZyEKFwUVFJz9YoPr93D7tP6jqXeJE@mail.gmail.com>
	<1284278043.1783.10.camel@brekeke>
	<201009220343.33025.vapier.adi@gmail.com>
	<1285244894.29268.104.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 23 Sep 2010 15:55:17 -0400
Message-ID: <AANLkTinFYHz9Ncw9NWPgQoAM=8H7S9J11Gaybsrov1AT@mail.gmail.com>
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	when OOB says "bad")
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

On Thu, Sep 23, 2010 at 08:28, Artem Bityutskiy wrote:
> On Wed, 2010-09-22 at 03:43 -0400, Mike Frysinger wrote:
>> here's a POC that works for me. =C2=A0with a simple tweak to `flash_eras=
eall`, i
>> can now recover my mtd devices with funky OOB layouts.
>>
>> ive only extended MEMERASE64 as i believe the non-64 variants are EOL ? =
=C2=A0or
>> should i also extend the 32bit interface as well ?
>
> We need something consistent. This patch will just erase the bad
> eraseblock. This will not mark it as good in the BBT (neither in-ram nor
> on-flash). If the erasure succeeds, the block will still be marked as
> bad in BBT, but after reboot, if the BBT is not on-flash, it will be
> treated as good eraseblock, because scanning will not find the bad block
> marker anymore. If the BBT is on-flash, it'll stay bad. This is
> inconsistent.

i dont think the current BBT API supports marking bad blocks as good ?
 if it does, could you highlight it for me ?

>> +struct erase_info_user64_flags {
>> + =C2=A0 =C2=A0 __u64 start;
>> + =C2=A0 =C2=A0 __u64 length;
>> + =C2=A0 =C2=A0 __u32 flags;
>> +};
>
> I think it needs to have som more room for possible future extentions.
> Also, good tone for ioctls is to make them to be multiple of 64-bit -
> less pain in mixed 32/64 bit setups.
>
> Please, add some
>
> u8 padding[12]
>
> field and add a comment that this has to be zero, and may be used in
> future.
>
> Then in future we may extend ioctls and add more fields.

well, the idea i have with flags is that we carve one bit out to mean
"extend".  so if in the future we wanted to extend the struct, we set
that flag and the kernel knows that userspace wants the larger
version.  that gives you a way of extending things indefinitely at the
cost of 1 bit.

which also means i should probably carve that bit out now and have the
kernel return an error when it is set today.

>> +#define MEMERASE64_FLAGS =C2=A0 =C2=A0 _IOW('M', 23, struct erase_info_=
user64_flags)
>
> I do not like the name. We may add something else, not just flags later.

i was going to use "MEMERASE2", but that didnt scale well with "MEMERASE264=
".

> May be MEMERASE64_EXTENDED ?

OK
-mike
