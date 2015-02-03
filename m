Received: from mail-pa0-f42.google.com ([209.85.220.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIWJQ-000439-0j
 for linux-mtd@lists.infradead.org; Tue, 03 Feb 2015 05:46:13 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so91927505pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 21:45:50 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Subject: Re: UBIFS: Is it possible to get the compressed size of a file?
From: Andreas Dilger <adilger@dilger.ca>
In-Reply-To: <1422869610.8637.352.camel@sauron.fi.intel.com>
Date: Mon, 2 Feb 2015 22:45:47 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B8DF06B-EBC8-4C85-AEEA-C2C6A52B8789@dilger.ca>
References: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
 <, > <54912109.50505@huawei.com>
 <trinity-03861656-4f4e-47fd-bcc5-aa493202c0bd-1418900934280@3capp-1and1-bs05>
 <1422869610.8637.352.camel@sauron.fi.intel.com>
To: dedekind1@gmail.com,
 David Sterba <dsterba@suse.cz>
Cc: Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 "markus.heininger@online.de" <markus.heininger@online.de>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 2, 2015, at 2:33 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> Hi Markus,
>=20
> On Thu, 2014-12-18 at 12:08 +0100, markus.heininger@online.de wrote:
>> in our system we=C2=B4re using ring buffers where it is necessary to
>> remove old files from certain directories when the physical usage
>> of each directory is above a certain level which is different for =
each=20
>> folder.
>>=20
>> Evaluating the output of "df" after write access might be difficult
>> since there are several concurrent writing processes.
>>=20
>> But many thanks for your answer, it seems that there is no easy
>> way to get the information needed and we must investigate further on
>> our own.
>=20
> Yes, no easy way, but I think implementing what you need is possible. =
I
> do not have plans and time to work on this, but I can help by giving
> advises and review.
>=20
> The question has 2 major parts.
>=20
> 1. The interface
> 2. The implementation
>=20
> For the former, one need to carefully investigate if there is =
something
> like this already implemented for other file-systems. I think btrfs =
may
> have it. If it is, then UBIFS should use similar interface, probably.
>=20
> And whatever is the interface choice, it should be discussed in the
> linux-fsdevel@vger.kernel.org mailing list, which I am CCing.

One option that was discussed for btrfs was to use the first fe_reserved
field for the FIEMAP ioctl struct fiemap_extent to fe_phys_length to
hold the compressed size of each extent in the file.

http://lwn.net/Articles/607552/
http://thread.gmane.org/gmane.comp.file-systems.btrfs/37312

I'm not sure what happened to that patch series - I was looking forward
to it landing, and it was in very good shape I think.

I think FIEMAP would be a good userspace API to get this kind of
low-level allocation information about the compressed size of data.
For most files it would probably only need a single fiemap_extent
to return the allocation data.

Cheers, Andreas

> For the latter, I'd suggest to try this.
>=20
> a. 'struct ubifs_ino_node' has unused space, use it to add the
> compressed size field.
> b. maintain this field
> c. this field will only be correct for the part of the file which are =
on
> the media. The dirty data in the page cache has not yet been =
compressed,
> so we do not know its compressed size yet.
> e. when user asks for the compressed size, you have to sync the inode
> first, in order to make sure the compressed size is correct.
>=20
> And the implementation should be backward-compatible. That is, if new
> driver mounts the old media, you return something predicatable. I =
guess
> uncompressed size could be it.
>=20
>=20
> Hope this helps,
> Artem.
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe =
linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Cheers, Andreas
