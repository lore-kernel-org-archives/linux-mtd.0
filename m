Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SIJnO-0007Qm-Vb
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2012 13:10:43 +0000
Received: by wibhj13 with SMTP id hj13so1503995wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Apr 2012 06:10:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1334214713.13842.34.camel@sauron.fi.intel.com>
References: <1334179707-31754-1-git-send-email-snijsure@grid-net.com>
 <1334214713.13842.34.camel@sauron.fi.intel.com>
Date: Thu, 12 Apr 2012 06:10:32 -0700
Message-ID: <CALr9Q3ZtT+8GA_EW_JptUEZOq3+k80rTBAh4mtdHufHhct3_AQ@mail.gmail.com>
Subject: Re: [PATCH v3] Add security.* XATTR support for the UBIFS
From: Subodh Nijsure <subodh.nijsure@gmail.com>
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

On Thu, Apr 12, 2012 at 12:11 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Wed, 2012-04-11 at 14:28 -0700, subodh.nijsure@gmail.com wrote:
>> +#ifdef CONFIG_UBIFS_FS_XATTR
>> +
>> + =C2=A0 =C2=A0 err =3D ubifs_init_security(dir, inode, &dentry->d_name)=
;
>> + =C2=A0 =C2=A0 if (err) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ubifs_err("cannot initialize=
 extended attribute, error %d",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 err);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_cancel;
>> + =C2=A0 =C2=A0 }
>> +
>> +#endif
>
> Suboodh,
>
> would you please first create a preparational patch which removes
> the CONFIG_UBIFS_FS_XATTR completely and makes xattr support to be
> always present.
>
> And then you could add the security stuff on top of this without the
> #ifdef churn.
>
> Thanks!

I will do that.

In general modification will be to move all the  real code within
#ifdef CONFIG_UBIFS_FS_XATTR/#endif to fs/ubifs/xattr.c, without ifdef
of course.
And for cases where its not defined within #ifndef
CONFIG_UBIFS_FS_XATTR/#endif, provide inline static implementation of
functions that always return "success", where required, in ubifs.h

-Subodh
