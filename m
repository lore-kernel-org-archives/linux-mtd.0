Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1It7pM-0005Dp-Sm
	for linux-mtd@lists.infradead.org; Fri, 16 Nov 2007 15:30:19 -0500
Received: by wa-out-1112.google.com with SMTP id v33so1074725wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Nov 2007 12:29:26 -0800 (PST)
Message-ID: <6934efce0711161229k5361ed1fh559df5a92ec0bcfe@mail.gmail.com>
Date: Fri, 16 Nov 2007 12:29:26 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] adding physical address to point()
In-Reply-To: <20071116100159.GA17372@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <473CE5EC.9040902@gmail.com>
	<20071116003221.GC13834@lazybastard.org> <473CF1A3.3080306@gmail.com>
	<20071116012317.GF13834@lazybastard.org> <473D30D5.2010702@gmail.com>
	<20071116100159.GA17372@lazybastard.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Nov 16, 2007 2:01 AM, J=F6rn Engel <joern@logfs.org> wrote:
> On Thu, 15 November 2007 21:55:33 -0800, Jared Hulbert wrote:
> >
> > Adding the ability to get a physical address from point() in addition
> > to virtual address.  This physical address will be required for axfs
> > and cramfs with XIP.
> >
> > Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> Reviewed-by: Joern Engel <joern@logfs.org>

David,

Please apply this patch.

You can pull this from git://git.infradead.org/users/jehulber/mtd.git
