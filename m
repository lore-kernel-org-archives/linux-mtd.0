Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHlXD-0002Fe-Hw
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 12:36:19 -0500
Received: by wproxy.gmail.com with SMTP id i24so712683wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Mar 2006 09:36:11 -0800 (PST)
Message-ID: <f9d2a5e10603100936s43f3d7bdoe8d118b9009ff925@mail.gmail.com>
Date: Fri, 10 Mar 2006 10:36:08 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: "Josh Boyer" <jwboyer@gmail.com>
In-Reply-To: <625fc13d0603100506k31e3da28kd51f65712447165b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <E1FErAE-00004u-2M@canuck.infradead.org>
	<44079DE4.3070804@singnet.com.sg>
	<625fc13d0603100506k31e3da28kd51f65712447165b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Terence Soh <gopher@singnet.com.sg>
Subject: Re: Cramfs on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > I hear that cramfs on NAND flash is not a good idea because of the bad
> > blocks. Is this still true? There was talks some time  ago about making
> > cramfs work on top on NAND.
> > <http://lists.infradead.org/pipermail/linux-mtd/2004-May/009784.html>
>
> Yes, it's still true.  CRAMFS expects it's data to be contiguous so
> unless you have something similar to a flash translation layer that
> hides the bad blocks, insanity will ensue.
>
> > If this is true, are there any recommendations of what other fs to use.
> > I already have one partition of jffs2 to store read-write files.
>
> Could you use a read-only JFFS2 partition?

The other solution is to use an ftl ontop of the flash, and then put a
cramfs on that. Of course, that depends on you living somewhere where
algorithms are not restricted to those with the license to use them.
(iirc)
