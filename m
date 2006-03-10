Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHkN1-0000N5-BQ
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 11:21:46 -0500
Received: by wproxy.gmail.com with SMTP id i21so752667wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Mar 2006 08:21:38 -0800 (PST)
Message-ID: <625fc13d0603100821i22409112xc60e8a26f4167191@mail.gmail.com>
Date: Fri, 10 Mar 2006 10:21:38 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <4411A3D9.6050505@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>
	<Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>
	<625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>
	<44119E8F.1000504@yandex.ru>
	<625fc13d0603100753r33fde8b8n3b9ff39f24b37b72@mail.gmail.com>
	<4411A3D9.6050505@yandex.ru>
Cc: linux-mtd@lists.infradead.org, Adam Ward <adamward2005@yahoo.co.uk>
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
> > Sorta.  If there isn't enough physical space to write nodes out, then
> > you can't really have a writeable filesystem.  It'll actually just
> > return -ENOSPC for everything instead of -EROFS, but the effect is the
> > same.
> I mean, if I ask to mount read-write, but end-up with RO, this is bad.
> Shouldn't I explicitely request RO mount?

Oh, the mount will still show it as being RW from what I recall.  But
you won't actually be able to write anything.  Which is also
confusing.  Especially in the case where it won't even let you
_delete_ things.

> > Take a look at jffs2_calc_trigger_levels in build.c.
> > c->resv_blocks_deletion is the number of blocks needed to delete
> > something.  c->resv_blocks_write is the number of blocks needed to
> > write something.
> Ok, but where is the code that switches it to RO mode in case of lack of
> eraseblocks?

It doesn't do that.  It just returns -ENOSPC.  Sorry if I've confused anyon=
e.

josh
