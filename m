Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6gF9-0000h8-H9
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 09:38:48 +0000
Received: by qyk32 with SMTP id 32so951336qyk.15
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 02:38:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1301900656.2760.6.camel@localhost>
References: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
	<1301900656.2760.6.camel@localhost>
Date: Mon, 4 Apr 2011 11:38:42 +0200
Message-ID: <BANLkTi=WTWa4yj+ysta8jiHs9r4MX5Gf_g@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Use empty_iops and empty_fops consistently
From: Sedat Dilek <sedat.dilek@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Jens Axboe <jaxboe@fusionio.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: sedat.dilek@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 4, 2011 at 9:04 AM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Mon, 2011-04-04 at 01:55 +0200, Sedat Dilek wrote:
>> Follow the nomenclature as we did for empty_aops and rename
>> to empty_iops and empty_fops.
>>
>> This patch is on top of linux-2.6-block.git#for-linus.
>>
>> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
>> CC: Artem Bityutskiy <dedekind1@gmail.com>
>> CC: Adrian Hunter <adrian.hunter@nokia.com>
>> CC: Jens Axboe <jaxboe@fusionio.com>
>> ---
>> =C2=A0fs/ubifs/xattr.c | =C2=A0 =C2=A08 ++++----
>> =C2=A01 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
>> index 3299f46..16f19f5 100644
>> --- a/fs/ubifs/xattr.c
>> +++ b/fs/ubifs/xattr.c
>> @@ -80,8 +80,8 @@ enum {
>> =C2=A0 =C2=A0 =C2=A0 SECURITY_XATTR,
>> =C2=A0};
>>
>> -static const struct inode_operations none_inode_operations;
>> -static const struct file_operations none_file_operations;
>> +static const struct inode_operations empty_iops;
>> +static const struct file_operations empty_fops;
>>
>> =C2=A0/**
>> =C2=A0 * create_xattr - create an extended attribute.
>> @@ -131,8 +131,8 @@ static int create_xattr(struct ubifs_info *c, struct=
 inode *host,
>>
>> =C2=A0 =C2=A0 =C2=A0 /* Re-define all operations to be "nothing" */
>> =C2=A0 =C2=A0 =C2=A0 inode->i_mapping->a_ops =3D &empty_aops;
>> - =C2=A0 =C2=A0 inode->i_op =3D &none_inode_operations;
>> - =C2=A0 =C2=A0 inode->i_fop =3D &none_file_operations;
>> + =C2=A0 =C2=A0 inode->i_op =3D &empty_iops;
>> + =C2=A0 =C2=A0 inode->i_fop =3D &empty_fops;
>>
>> =C2=A0 =C2=A0 =C2=A0 inode->i_flags |=3D S_SYNC | S_NOATIME | S_NOCMTIME=
 | S_NOQUOTA;
>> =C2=A0 =C2=A0 =C2=A0 ui =3D ubifs_inode(inode);
>
> Well, this re-naming looks strange for me. I could understand if you had
> a global exported empty_*ops which you could share and shrink the .data
> size a bit. But this re-naming just looks useles, if you take into
> account the breakage and the men-hours we spend to write e-mails to this
> thread - really did not worth it. Or I miss something?
>

Sorry for having flooded your inbox.
The last days might be the first time I noticed UBIFS at all and
looked into its code.
I did so because I fell over a build-error when pulling
linux-block-2.6.git#for-linus into linux-next (next-20110404).

The current code in linux-next (next-20110404) looks in the meantime like t=
his:

[ fs/ubifs/xattr.c ]
...
static const struct inode_operations none_inode_operations;
static const struct file_operations none_file_operations;
...
        /* Re-define all operations to be "nothing" */
        inode->i_mapping->a_ops =3D &empty_aops;
        inode->i_op =3D &none_inode_operations;
        inode->i_fop =3D &none_file_operations;
...

First seeing this was strange to me, so you try via code-grep-ping to
understand the correlations in the complete fs-tree.
So, let's do some code-grep:

$ egrep 'empty_aops|mpty_iops|empty_fops' -r fs/ include/linux/
fs/ubifs/xattr.c:       inode->i_mapping->a_ops =3D &empty_aops;
fs/open.c:      static const struct file_operations empty_fops =3D {};
fs/open.c:              f->f_op =3D &empty_fops;
fs/inode.c:const struct address_space_operations empty_aops =3D {
fs/inode.c:EXPORT_SYMBOL(empty_aops);
fs/inode.c:     static const struct inode_operations empty_iops;
fs/inode.c:     static const struct file_operations empty_fops;
fs/inode.c:     inode->i_op =3D &empty_iops;
fs/inode.c:     inode->i_fop =3D &empty_fops;
fs/inode.c:     mapping->a_ops =3D &empty_aops;
fs/nilfs2/page.c:       mapping->a_ops =3D &empty_aops;
include/linux/fs.h:extern const struct address_space_operations empty_aops;

Hope you can understand now, why I did this.

It's up to you how you name your variables, function-names etc.

- Sedat -
