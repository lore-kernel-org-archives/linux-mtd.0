Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gl4bX-00014g-6v
	for linux-mtd@lists.infradead.org; Fri, 17 Nov 2006 09:22:13 -0500
Subject: Re: 2.6 Kernel not mounting JFFS2 partition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Glen Johnson <gjohnson@valcom.com>
In-Reply-To: <455DC28D.30507@valcom.com>
References: <455CC35B.5080705@valcom.com> <1163766854.5597.39.camel@sauron>
	<455DC28D.30507@valcom.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 17 Nov 2006 16:21:48 +0200
Message-Id: <1163773308.5597.44.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-17 at 09:09 -0500, Glen Johnson wrote:
> I am using uClinux so I may be moving out of the realm of linux-mtd.
> I went to the Red Hat JFFS2 web
> site, and used cvs to download the source for the "latest JFFS2
> source".  How do I get this code to=20
> compile with the uClinux way of doing things.  I tried the script and
> it seems to patch the code for a=20
> normal Linux distro.  Advice on this would be most helpful.

We moved to GIT. The utilities are available via

git-clone git://git.infradead.org/mtd-utils.git mtd-utils.git

command. Also see http://www.linux-mtd.infradead.org/doc/git.html

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
