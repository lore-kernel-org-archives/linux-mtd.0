Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nscwd-0001BJ-S5
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2010 14:13:01 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: RFC: direct MTD support for SquashFS
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
	<87d3z1unm9.fsf@tac.ki.iif.hu>
	<bffbecbb1003190030x4236abere54649131408cacc@mail.gmail.com>
Date: Fri, 19 Mar 2010 15:12:44 +0100
In-Reply-To: <bffbecbb1003190030x4236abere54649131408cacc@mail.gmail.com>
	(Phillip Lougher's message of "Fri, 19 Mar 2010 07:30:47 +0000")
Message-ID: <87aau4tn6r.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Phillip Lougher <phillip.lougher@gmail.com> writes:

> On Fri, Mar 19, 2010 at 1:05 AM, Ferenc Wagner <wferi@niif.hu> wrote:
>
>> Ferenc Wagner <wferi@niif.hu> writes:
>>
>>> Phillip Lougher <phillip.lougher@gmail.com> writes:
>>>
>>>> On Thu, Mar 18, 2010 at 4:38 PM, Ferenc Wagner <wferi@niif.hu> wrote:
>>>>
>>>> +static int fill_bdev_super(struct super_block *sb, void *data, int si=
lent)
>>>> +{
>>>> + =C2=A0 =C2=A0struct squashfs_sb_info *msblk;
>>>> + =C2=A0 =C2=A0struct squashfs_bdev *bdev;
>>>> + =C2=A0 =C2=A0int err =3D squashfs_fill_super2(sb, data, silent, &squ=
ashfs_bdev_ops);
>>>> + =C2=A0 =C2=A0if (err)
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;
>>>> +
>>>> + =C2=A0 =C2=A0bdev =3D kzalloc(sizeof(*bdev), GFP_KERNEL);
>>>> + =C2=A0 =C2=A0if (!bdev)
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;
>>>> +
>>>> + =C2=A0 =C2=A0bdev->devblksize =3D sb_min_blocksize(sb, BLOCK_SIZE);
>>>> + =C2=A0 =C2=A0bdev->devblksize_log2 =3D ffz(~bdev->devblksize);
>>>> +
>>>> + =C2=A0 =C2=A0msblk =3D sb->s_fs_info;
>>>> + =C2=A0 =C2=A0msblk->backend_data =3D bdev;
>>>> + =C2=A0 =C2=A0return 0;
>>>> +}
>>>>
>>>> This function looks rather 'back-to-front' to me. =C2=A0I'm assuming t=
hat
>>>> squashfs_fill_super2() will be the current fill superblock function?
>>>
>>> Yes, with the extra parameter added.
>>>
>>>> This function wants to read data off the filesystem through the
>>>> backend, and yet the backend (bdev, mblk->backend_data) hasn't been
>>>> initialised when it's called...
>>>
>>> It can't be, because msblk =3D sb->s_fs_info is allocated by
>>> squashfs_fill_super(). =C2=A0Now it will be passed the ops, so after
>>> allocating msblk it can also fill out the ops. =C2=A0After that it can =
read,
>>> and squashfs_read_data() will call the init, read and free operations of
>>> the backend.
>>
>> And here we indeed have a rather fundamental problem. =C2=A0This isn't
>> specific to the discussed plugin system at all. =C2=A0Even in the current
>> code, to set msblk->block_size squashfs_fill_super() calls
>> squashfs_read_table() to read the superblock, which in turn calls
>> squashfs_read_data(), which uses msblk->block_size to allocate enough
>> buffer heads, but msblk->block_size just can't be set at this point.
>> msblk->bytes_used is preset with a dummy value to make the read
>> possible, but msblk->block_size is not. =C2=A0Fortunately, one buffer he=
ad is
>> allocated each time nevertheless. =C2=A0I wonder what a correct solution
>> would look like..
>
> Block_size is known to be zero (the structure has been zeroed out at
> alloc), and so it is known that the one block alloced in this case
> will be correct.

If block_size=3D0 is always a good dummy value for this single call,
that's great.  Fixing this in a general way in the backend framework
might require allocating and partly initializing squashfs_sb_info in the
backend specific fill_super() function, before calling squashfs_fill_super()
for finalizing it.  Even though it may be possible to work around this
for the bdev or mtd backends, it probably isn't worth it.

> Congratulations you've managed to really piss me off in your third or
> so email.

Sorry, I'm not sure I understand.  If you mean that I made an ass of
myself by my questions, that's OK, I'm certainly a newbie and I
admittedly have no idea what I'm fiddling with.  Please feel free to
ignore stupid questions.  On the other hand, if you mean that I hurt
your feelings in any way, I'd like to apologize: it certainly wasn't my
intention, but I might have chosen inappropriate terms.  Sorry for that.
--=20
Cheers,
Feri.
