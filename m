Received: from uproxy.gmail.com ([66.249.92.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ex7uR-0002sN-Ui
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2006 14:14:59 -0500
Received: by uproxy.gmail.com with SMTP id m3so170780ugc
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jan 2006 11:14:50 -0800 (PST)
Message-ID: <6934efce0601121114v63ffb32brd20ced641161c3cf@mail.gmail.com>
Date: Thu, 12 Jan 2006 11:14:17 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: James Hughes <JHughes@linx.co.uk>
In-Reply-To: <DB1B6B12D0E2F0469EB35A9586066B6ECE79AD@stivesemail.stives.linx.gbr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <DB1B6B12D0E2F0469EB35A9586066B6ECE79AD@stivesemail.stives.linx.gbr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> In fact, all I know is the register function in the driver is being calle=
d -
> i.e. the function in
>
>         module_init(init_sandgate2)
>
> the init_sandgate2 function IS being called.
>
> This function simply does the following :
>
>         return driver_register(&sandgate2_flash_driver);
>
> and a printk in the function does display.
>
> I am not sure what there is to fix. The driver gets registered, but probe=
 is
> never called. Its correctly added to the driver structure (in fact a dire=
ct
> copy from the mainstone variant, but with name changes to match sandgate2=
) -
> what else is there to debug?

This is very different than what I am expecting...
Actually there is no mainstone map in 2.6.10 look at the lubbock one
for reference.
http://sosdg.org/~coywolf/lxr/source/drivers/mtd/maps/lubbock-flash.c?v=3D2=
.6.10

If the map isn't doing the probe, then maybe it expects physmap stuff?
 I've always used the platform specfic map file, so I'm not going to
be any help with the physmap.  Also I don't think the phymap stuff is
optimized yet.
