Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKq5c-0001ng-M3
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 10:59:25 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'dedekind1@gmail.com'" <dedekind1@gmail.com>, "Matthew L. Creech"
	<mlcreech@gmail.com>
Date: Fri, 13 May 2011 06:59:20 -0400
Subject: RE: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A694157DD@dekaexchange07.deka.local>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-3-git-send-email-mlcreech@gmail.com>
	<1305198589.2713.97.camel@localhost>
	<1305273513.14423.15.camel@localhost>
In-Reply-To: <1305273513.14423.15.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem:

  I don't know what the coding standards are like on
  your project, but in very much of the C/C++ developer
  world, <tab>s are frowned upon in code as being fragile,
  primarily because there are varying standards for just
  how wide a <tab> should be. By default, they're 8 spaces,
  but I've worked at several shops where they are only
  4 spaces and one shop where they are deemed to be 3!

  Because of this, many coding standards (such as the
  WebKit coding standards and my current employer's
  standard) outright ban <tab> characters in code and
  I'd recommend you do so as well, no matter what the
  current scripts enforce. (It's certainly easy enough
  to expand all the tabs in an existing code base so
  as to bring it into compliance with a "no tabs" rule.)

                            Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Artem Bityutskiy
Sent: Friday, May 13, 2011 03:59
To: Matthew L. Creech
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set

On Thu, 2011-05-12 at 14:09 +0300, Artem Bityutskiy wrote:
> On Fri, 2011-05-06 at 18:58 -0400, Matthew L. Creech wrote:
> > +   if (c->space_fixup) {
> > +           err =3D ubifs_fixup_free_space(c);
> > +           if (err)
> > +                   goto out;
> > +   }
> > +
> >     dbg_gen("re-mounted read-write");
> >     c->remounting_rw =3D 0;
> >     err =3D dbg_check_space_info(c);
>
> Note, I've moved the 'ubifs_fixup_free_space()' a bit down to make sure
> we first print "re-mounted" and "deferred recovery completed" messages,
> and then start fixing up. I think this is a bit neater.

I do not know if that was me or you, but I've found out that the a lot
of code uses spaces for indentation instead of tabs, and checkpatch.pl
complains:

WARNING: please, no spaces at the start of a line
#119: FILE: fs/ubifs/sb.c:746:
+                       err =3D PTR_ERR(lprops);$

ERROR: code indent should use tabs where possible
#120: FILE: fs/ubifs/sb.c:747:
+                       goto out;$

.... a lot of this ....

But I've just fixed this.

--
Best Regards,
Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
