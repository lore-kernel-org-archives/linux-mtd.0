Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHjvZ-00083J-10
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 10:53:24 -0500
Received: by wproxy.gmail.com with SMTP id i34so713968wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Mar 2006 07:53:13 -0800 (PST)
Message-ID: <625fc13d0603100753r33fde8b8n3b9ff39f24b37b72@mail.gmail.com>
Date: Fri, 10 Mar 2006 09:53:13 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <44119E8F.1000504@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>
	<Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>
	<625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>
	<44119E8F.1000504@yandex.ru>
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>,
	Adam Ward <adamward2005@yahoo.co.uk>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/10/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> Josh Boyer wrote:
> > Also, does your JFFS2 filesystem have free space available?  If a
> > minimum amount of free eraseblocks are not present, JFFS2 will mark
> > itself as read-only no matter what you do.
> >
> Hmm, is this sane behaviour?

Sorta.  If there isn't enough physical space to write nodes out, then
you can't really have a writeable filesystem.  It'll actually just
return -ENOSPC for everything instead of -EROFS, but the effect is the
same.

Take a look at jffs2_calc_trigger_levels in build.c.=20
c->resv_blocks_deletion is the number of blocks needed to delete
something.  c->resv_blocks_write is the number of blocks needed to
write something.

josh
