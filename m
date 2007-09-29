Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IbYAG-0007Bw-VV
	for linux-mtd@lists.infradead.org; Sat, 29 Sep 2007 09:59:11 +0100
Subject: Re: [PATCH 2/4 try2] ubi-utils: migrate ubimirror
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200709280941.38303.alexs@linux.vnet.ibm.com>
References: <200709271952.06870.alexs@linux.vnet.ibm.com>
	<200709272014.35040.alexs@linux.vnet.ibm.com>
	<1190917677.14666.5.camel@august>
	<200709280941.38303.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 29 Sep 2007 11:55:39 +0300
Message-Id: <1191056139.7774.12.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: haver@vnet.ibm.com, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-09-28 at 09:41 +0200, Alexander Schmidt wrote:
> >        {PATH_MAX}
> >               Maximum number of bytes in a pathname, including the=20
> >               terminating null character.
>=20
> That makes sense, I will resend when I've figured out how to send
> patch series which don't bounce from the mtd-list...

The series looks good to me.

The infradead.org has a rule so that if one mail A refers mail B (via
In-reply-to or Reference:), then mail A has to have Re: prefix in the
subject. Otherwise, the mail is trapped and waits for moderation.

At the moment one of the infradead.org servers is dead and I cannot
approve your series which looks perfectly fine.

So what you can do is to just add Re: to the subject of all the mails
but the first one (0/4). Yes, it is weird but such is life at
infradead.org.

Or just wait when the server is up again and the postings are moderated.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
