Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtaRu-0008NJ-UL
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 06:17:33 +0000
Received: by iwn10 with SMTP id 10so774014iwn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 23:17:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1283846532.2979.0.camel@localhost>
References: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
	<1283846532.2979.0.camel@localhost>
Date: Thu, 9 Sep 2010 08:17:29 +0200
Message-ID: <AANLkTi=mrqg21uOXPJf=dOUq20YD1ocAZJpf1=fodtVM@mail.gmail.com>
Subject: Re: mks.jffs2 uid/gid for root inode
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
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

2010/9/7 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2010-09-03 at 14:12 +0200, Arno Steffen wrote:
>> I use mkfs.jffs2 to generate a partition out of a directory tree (not
>> the hole root-filesystem).
>> It seem the owner of the root point of this directory tree is always
>> root:root, althouh it might have other owners.
>>
>> Example
>>
>> mkfs.jffs2 -lnp -e 0x20000 -r /opt/rootfs/opt -o /mnt/hgfs/share/fs_opt.=
jffs2
>>
>> In my NFS-rootfs /opt/rootfs/opt is owned by user but flashing the
>> created jffs file will be mounted as owner root.
>> From my point of view this is a bug, as it doesn't care about the real
>> owner of this part of filetree.
>> Or did I misused the -r option?
>>
>> I hope you can give me a comment or some feedback, how to change this be=
haviour.
>
> Sounds like a bug. I'll take a look at this as soon as I have some time.
> Or you can send a patch.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)

Thanks, thought already nobody is interested in this. Regarding a
patch: I did look at the code, but my knowledge about the details is
to less.
