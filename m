Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHyHy-0005Jr-U2
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 14:12:51 +0000
Received: by wibhj13 with SMTP id hj13so3311109wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Apr 2012 07:12:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1334149853.14296.29.camel@moss-pluto>
References: <1334015486-20616-1-git-send-email-snijsure@grid-net.com>
 <1334061985.23411.3.camel@moss-pluto>
 <CALr9Q3Yto9VOhFNRQFVqP7Zi6RWWBaoDUu1zxsup7=+g7_pijQ@mail.gmail.com>
 <1334149853.14296.29.camel@moss-pluto>
Date: Wed, 11 Apr 2012 07:12:48 -0700
Message-ID: <CALr9Q3a89_wa48BfOriP=MEQAXa1Sgf+k_Ey=kuKN9Ydewwegw@mail.gmail.com>
Subject: Re: [PATCH v2] Add security.* XATTR support for the UBIFS
From: Subodh Nijsure <subodh.nijsure@gmail.com>
To: Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-security-module@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 11, 2012 at 6:10 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On Wed, 2012-04-11 at 06:00 -0700, Subodh Nijsure wrote:
>> On Tue, Apr 10, 2012 at 5:46 AM, Stephen Smalley <sds@tycho.nsa.gov> wro=
te:
>> > On Mon, 2012-04-09 at 16:51 -0700, subodh.nijsure@gmail.com wrote:
>> >> From: Subodh Nijsure <snijsure@grid-net.com>
>> >>
>> >> Also fix couple of bugs in UBIFS extended attribute length calculatio=
n.
>> >>
>> >> Changes Since V1:
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Instead of just handling security.s=
elinux extended attribute handle
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all security.* attributes.
>> >>
>> >> TESTING: Tested on =C2=A0MX28 based platforms using Micron MT29F2G08A=
BAEAH4 NAND
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0With these change we are able to la=
bel UBIFS filesystem with
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0security.selinux and run system wit=
h selinux enabled.
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This change also allows one to set =
other security.* extended
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attributesr, such as security.smack=
 security.evm, security.ima
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ran integck test on UBI filesystem.
>> >>
>> >> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
>> >> ---
>> >> =C2=A0fs/ubifs/dir.c =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++
>> >> =C2=A0fs/ubifs/file.c =C2=A0 =C2=A0| =C2=A0 =C2=A06 ++
>> >> =C2=A0fs/ubifs/journal.c | =C2=A0 12 +++-
>> >> =C2=A0fs/ubifs/super.c =C2=A0 | =C2=A0 =C2=A03 +
>> >> =C2=A0fs/ubifs/ubifs.h =C2=A0 | =C2=A0 =C2=A09 +++
>> >> =C2=A0fs/ubifs/xattr.c =C2=A0 | =C2=A0147 +++++++++++++++++++++++++++=
+++++++++++++++++++++----
>> >> =C2=A06 files changed, 167 insertions(+), 14 deletions(-)
>> >>
>> >> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> >> index ec9f187..f4e06c4 100644
>> >> --- a/fs/ubifs/dir.c
>> >> +++ b/fs/ubifs/dir.c
>> >> @@ -293,6 +293,7 @@ static int ubifs_create(struct inode *dir, struct=
 dentry *dentry, umode_t mode,
>> >> =C2=A0 =C2=A0 =C2=A0 ubifs_release_budget(c, &req);
>> >> =C2=A0 =C2=A0 =C2=A0 insert_inode_hash(inode);
>> >> =C2=A0 =C2=A0 =C2=A0 d_instantiate(dentry, inode);
>> >> + =C2=A0 =C2=A0 ubifs_init_security(dir, inode, &dentry->d_name);
>> >> =C2=A0 =C2=A0 =C2=A0 return 0;
>> >>
>> >> =C2=A0out_cancel:
>> >
>> > The ubifs_init_security() should occur before d_instantiate() so that
>> > the inode is not accessible to other threads before its security
>> > attributes have been set. =C2=A0And if it fails, you would ideally dro=
p the
>> > inode altogether and return an error to the creating process.
>> >
>>
>> I will look into moving ubifs_init_security() before d_instantiate().
>> Last time I had tried I had run into some issues and had to keep
>> creating inode and then creating xattr as two seperate items. I will
>> look through the UBIFS code that actually creates xattr ubi nodes.
>> Also I will wait for couple of days to send v3 patch with to see if
>> mtd folks have other comments this patch.
>
> I'd favor moving the call to ubifs_init_security() inside of
> ubifs_new_inode() so that it gets done as part of all inode creation.
> To do that, you'll need to pass the &dentry->d_name (const struct qstr
> *) down to ubifs_new_inode(). But you can see that it is done that way
> for ext4_new_inode(), for example.
>
> --

Okay, I will look at that code little bit mode.

UBIFS create_xattr() (fs/ubifs/xattr.c)  calls ubifs_new_inode() so it
can get tricky if I want to create xattr in ubifs_new_inode().

Also noticed that UBIFS doesn't d_instantiate() inode entry created to
hold extended attribute, not certain if that would be an issue.

I will look how other fs manage xattrs, I certainly don't want to
modify how UBIFS manages extended attributes.


-Subodh
