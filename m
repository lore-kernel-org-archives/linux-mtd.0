Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKr51-000285-Ao
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 12:02:52 +0000
Subject: Re: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=koi8-r
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A694157DD@dekaexchange07.deka.local>
Date: Fri, 13 May 2011 08:02:47 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB7DF571-A065-41C3-83FC-6300192D93A2@prograde.net>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-3-git-send-email-mlcreech@gmail.com>
	<1305198589.2713.97.camel@localhost>
	<1305273513.14423.15.camel@localhost>
	<0A40042D85E7C84DB443060EC44B3FD32A694157DD@dekaexchange07.deka.local>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Matthew L. Creech" <mlcreech@gmail.com>,
	"'dedekind1@gmail.com'" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any many shops/projects feel strongly the other way.

I don't buy the "tabs are fragile" argument. It makes no sense. Even if =
a project uses spaces but some people indent to 8, some to 4 and some to =
3 you still end up with a hard-to-read mess. Mandating the use of spaces =
is solving the wrong problem.

The problem is that there must be agreement on what the indentation =
value is. Once you have that it then the code is readable and clean =
regardless of whether you use spaces or tabs to do it.

-Mike

On May 13, 2011, at 6:59 AM, Atlant Schmidt wrote:

> Artem:
>=20
>  I don't know what the coding standards are like on
>  your project, but in very much of the C/C++ developer
>  world, <tab>s are frowned upon in code as being fragile,
>  primarily because there are varying standards for just
>  how wide a <tab> should be. By default, they're 8 spaces,
>  but I've worked at several shops where they are only
>  4 spaces and one shop where they are deemed to be 3!
>=20
>  Because of this, many coding standards (such as the
>  WebKit coding standards and my current employer's
>  standard) outright ban <tab> characters in code and
>  I'd recommend you do so as well, no matter what the
>  current scripts enforce. (It's certainly easy enough
>  to expand all the tabs in an existing code base so
>  as to bring it into compliance with a "no tabs" rule.)
>=20
>                            Atlant
>=20
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Artem =
Bityutskiy
> Sent: Friday, May 13, 2011 03:59
> To: Matthew L. Creech
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is =
set
>=20
> On Thu, 2011-05-12 at 14:09 +0300, Artem Bityutskiy wrote:
>> On Fri, 2011-05-06 at 18:58 -0400, Matthew L. Creech wrote:
>>> +   if (c->space_fixup) {
>>> +           err =3D ubifs_fixup_free_space(c);
>>> +           if (err)
>>> +                   goto out;
>>> +   }
>>> +
>>>    dbg_gen("re-mounted read-write");
>>>    c->remounting_rw =3D 0;
>>>    err =3D dbg_check_space_info(c);
>>=20
>> Note, I've moved the 'ubifs_fixup_free_space()' a bit down to make =
sure
>> we first print "re-mounted" and "deferred recovery completed" =
messages,
>> and then start fixing up. I think this is a bit neater.
>=20
> I do not know if that was me or you, but I've found out that the a lot
> of code uses spaces for indentation instead of tabs, and checkpatch.pl
> complains:
>=20
> WARNING: please, no spaces at the start of a line
> #119: FILE: fs/ubifs/sb.c:746:
> +                       err =3D PTR_ERR(lprops);$
>=20
> ERROR: code indent should use tabs where possible
> #120: FILE: fs/ubifs/sb.c:747:
> +                       goto out;$
>=20
> .... a lot of this ....
>=20
> But I've just fixed this.
>=20
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
> This e-mail and the information, including any attachments, it =
contains are intended to be a confidential communication only to the =
person or entity to whom it is addressed and may contain information =
that is privileged. If the reader of this message is not the intended =
recipient, you are hereby notified that any dissemination, distribution =
or copying of this communication is strictly prohibited. If you have =
received this communication in error, please immediately notify the =
sender and destroy the original message.
>=20
> Thank you.
>=20
> Please consider the environment before printing this email.
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
