Received: from nproxy.gmail.com ([64.233.182.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EwldF-0003P7-47
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 14:27:43 -0500
Received: by nproxy.gmail.com with SMTP id k27so175226nfc
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jan 2006 11:27:38 -0800 (PST)
Message-ID: <6934efce0601110936k6d03d7ecn4fb357792c85de9d@mail.gmail.com>
Date: Wed, 11 Jan 2006 09:36:44 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Mark Brown <broonie@sirena.org.uk>
In-Reply-To: <20060105210954.GA8423@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20051229232138.GA32463@plexity.net>
	<20060105210954.GA8423@sirena.org.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Make physmap into a platform device driver...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> My patch is below - it probably ought to have the re-addition of write
> protection methods which I had stripped out since I've got partially
> written support for paging in chips and thought the two might end up
> related.

One thing I would like to see is the addition of something like:

<code>
       info->map.cached =3D ioremap_cached(res->start, info->map.size);
       dev_dbg(dev, "cached %p, %lu bytes\n", info->map.cached, info->map.s=
ize);

       if (info->map.cached =3D=3D NULL) {
               dev_err(dev, "failed to ioremap_cached() region\n");
               err =3D -EIO;
               goto exit_free;
       }
</code>

The problem is how do we populate info->map.inval_cache?

drivers/mtd/maps/mainstone-flash.c does it as follows.

<code>
static void mainstone_map_inval_cache(struct map_info *map, unsigned long f=
rom,
                                       ssize_t len)
{
         consistent_sync((char *)map->cached + from, len, DMA_FROM_DEVICE);
}

 static struct map_info mainstone_maps[2] =3D { {
         .size =3D         WINDOW_SIZE,
         .phys =3D         PXA_CS0_PHYS,
         .inval_cache =3D  mainstone_map_inval_cache,
 }, {
         .size =3D         WINDOW_SIZE,
         .phys =3D         PXA_CS1_PHYS,
         .inval_cache =3D  mainstone_map_inval_cache,
} };
</code>

Is the consistent_sync() and ioremap_cached() generic enough to
include in a platflash.c?
