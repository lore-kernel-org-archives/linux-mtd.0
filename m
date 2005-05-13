Received: from rproxy.gmail.com ([64.233.170.205])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWY61-0000cl-6S
	for linux-mtd@lists.infradead.org; Fri, 13 May 2005 07:12:45 -0400
Received: by rproxy.gmail.com with SMTP id y7so218359rne
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2005 04:12:48 -0700 (PDT)
Message-ID: <f6d0cd06050513041258fb418f@mail.gmail.com>
Date: Fri, 13 May 2005 16:42:48 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1115913155.27158.48.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <81772B4336DEC14EBB8C519C4EC21051F80D90@pe2650.everest-co.com>
	<1115913155.27158.48.camel@sauron.oktetlabs.ru>
Cc: Ralph Walden <ralphw@everest-co.com>, linux-mtd@lists.infradead.org
Subject: Re: Oops at jffs2_build_remove_unlinked_inode
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am also facing the same problem. Is it updated on the MTD Snapshot
on the website as i don't have an access to CVS ?

Thanks
Niraj

Can i download this latest fix=20

On 5/12/05, Artem B. Bityuckiy <dedekind@infradead.org> wrote:
> > [<c01244b8>] (jffs2_build_remove_unlinked_inode+0x0/0xec) from
> > [<c01249bc>] (jff
> Your oops looks like the one that we've fixed recently. Please, try MTD
> from CVS.
>=20
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
