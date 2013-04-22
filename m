Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUOpB-0002uV-2o
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 22:03:06 +0000
From: Marek Vasut <marex@denx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 17/18] fs: Fix copyright symbol in printk()
Date: Tue, 23 Apr 2013 00:02:55 +0200
References: <1366665870-8998-1-git-send-email-marex@denx.de>
 <1366667786.7319.17.camel@shinybook.infradead.org>
In-Reply-To: <1366667786.7319.17.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201304230002.55533.marex@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear David Woodhouse,

> On Mon, 2013-04-22 at 23:24 +0200, Marek Vasut wrote:
> > Use regular ASCII "(C)" string instead of UTF8 "=A9" string in
> > printk() as the later produces the following output on dmesg
> >=20
> > instead of the expected one:
> >   jffs2: version 2.2. (NAND) \xffffffc2\xffffffa9 2001-2006 Red Hat, In=
c.
> >=20
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: David Woodhouse <dwmw2@infradead.org>
>=20
> You appear to have discovered a problem with printk. Let's *fix* it
> rather than regressing to the 20th century to work around it though?

Should printk() even be capable of printing UTF8 stuff like that? How shoul=
d I=20
go about this?

Best regards,
Marek Vasut
