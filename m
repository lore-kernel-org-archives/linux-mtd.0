Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OE0EM-0004JC-Pk
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 13:19:39 +0000
Received: by pvg13 with SMTP id 13so89613pvg.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 May 2010 06:19:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1273799074.9999.653.camel@macbook.infradead.org>
References: <1273074054-11849-1-git-send-email-kirill@shutemov.name>
	<1273799074.9999.653.camel@macbook.infradead.org>
Date: Mon, 17 May 2010 16:19:34 +0300
Message-ID: <AANLkTikvUvzQMjoM26PowGWVqAopdSSjKvE-NzSB2xMJ@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: Do not corrupt backing device of device node
	inode
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Jan Kara <jack@suse.cz>, Artem Bityutskiy <dedekind1@gmail.com>,
	linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 14, 2010 at 4:04 AM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Wed, 2010-05-05 at 18:40 +0300, Kirill A. Shutemov wrote:
>> We cannot modify file->f_mapping->backing_dev_info, because it will corr=
upt
>> backing device of device node inode, since file->f_mapping is equal to
>> inode->i_mapping (see __dentry_open() in fs/open.c).
>>
>> Let's introduce separate inode for MTD device with appropriate backing
>> device.
>
> I hate the fact that we have to do this -- is it really the only option?
>
> Is it _just_ for the backing_device_info? Can't that be done
> differently?

Yes, it's ugly, but I don't see options.

>> @@ -85,11 +88,27 @@ static int mtd_open(struct inode *inode, struct file=
 *file)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> =C2=A0 =C2=A0 =C2=A0 }
>>
>> - =C2=A0 =C2=A0 if (mtd->backing_dev_info)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file->f_mapping->backing_dev=
_info =3D mtd->backing_dev_info;
>> + =C2=A0 =C2=A0 if (!mtd->inode) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtd->inode =3D new_inode(mtd=
_inode_mnt->mnt_sb);
>
> I believe that would be a race condition, if it wasn't for the BKL.

Ok, I'll fix it.

> And what happens when you close the chardevice and call iput() on the
> inode so it's destroyed, and then you re-open the device? You never set
> mtd->inode =3D NULL, so won't it now try to igrab a stale pointer?

inode destroys only on del_mtd_device() so it's safe to re-open chardevice.

> You won't have seen this in your testing unless you made it prune the
> icache between the close and open calls.
>
> --
> David Woodhouse =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Open Source Technology Centre
> David.Woodhouse@intel.com =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Corporatio=
n
>
>
