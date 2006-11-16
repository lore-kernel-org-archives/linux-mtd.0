Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GkjEi-0003xx-7F
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 10:33:22 -0500
Subject: Re: Problem with copying more than 2kb file into the flash
From: Artem Bityutskiy <dedekind@infradead.org>
To: "s.balamurugan" <s.balamurugan@gdatech.co.in>
In-Reply-To: <455C7BEE.4000607@gdatech.co.in>
References: <455C7650.2000705@gdatech.co.in>
	<1163687929.5597.18.camel@sauron>  <455C7BEE.4000607@gdatech.co.in>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Nov 2006 17:31:52 +0200
Message-Id: <1163691112.5597.28.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please, be public.

On Thu, 2006-11-16 at 20:25 +0530, s.balamurugan wrote:
>        Thanks for ur kind reply.     Please tell exactly where is the
> problem, more than 20 days i was suffer with this problem.
> or give me detail explanation about jffs2 code flow. how the file was
> written to flash.

Sorry, this is a question of "tell me all about everything" type.

>                     but in jffs2_commit_write() function is not
> showing the correct size.
>                int jffs2_commit_write (struct file *filp, struct page
> *pg, unsigned start, unsigned end), the end parameter was show the
> wrong file size.
> and i want to know how jffs2_commit_write funciton was called.
> givve some idea

Sorry, -EDONTUNDERSTAND.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
