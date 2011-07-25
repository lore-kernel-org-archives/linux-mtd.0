Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QlOg8-0002QB-BO
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2011 17:10:53 +0000
Received: by wwf22 with SMTP id 22so3112470wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Jul 2011 10:10:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201107251148.51262.brian.foster@maxim-ic.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
Date: Mon, 25 Jul 2011 10:10:46 -0700
Message-ID: <CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 25, 2011 at 2:48 AM, Brian Foster <brian.foster@maxim-ic.com> w=
rote:
> Massive apologies if this is not the correct list or
> not the correct way of reporting MTD-utils bugs.
> My searches failed to find anything .... =A0;-\

This is exactly the right place! Sorry it was difficult to find.

> MTD-utils 1.4.5, when `mtdinfo -a' tries to print the
> eraseblock regions of NOR-Flash, it open(2)s the nil
> pointer (NULL). =A0The problem seems to be in mtdinfo.c's
> print_region_info(), which assumes there is always a MTD
> /dev node name (args.node). =A0However, in the case of `-a',
> args.node is always NULL. =A0Oops!

I don't have a test case that can reproduce the bug, as I don't have
devices with "region info", but I can see the problem fairly clearly.
It seems that the basic issue we need to solve is how to find the
correct file devfs/udev path for a device using only its mtd_info
object (e.g., use its major/minor number?). Then we could fix this
line in print_region_info() for cases where args.node =3D=3D NULL:
        fd =3D open(args.node, O_RDONLY | O_CLOEXEC);

Also, is "region_info" a potential candidate for exporting via sysfs?
That would make this support easier to include in libmtd.

Brian
