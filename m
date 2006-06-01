Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FlmkY-0005wM-A6
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 08:58:09 -0400
Message-ID: <447EE43B.7050705@yandex.ru>
Date: Thu, 01 Jun 2006 16:57:31 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>	<20060530185017.GG26220@wohnheim.fh-wedel.de>	<1149062982.32620.67.camel@sauron.oktetlabs.ru>	<Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>	<1149086997.32620.101.camel@sauron.oktetlabs.ru>	<Pine.LNX.4.64.0605311105170.16927@localhost.localdomain>	<447DC80E.6040604@yandex.ru>	<Pine.LNX.4.64.0605311314060.16927@localhost.localdomain>	<447EAD4E.2010709@yandex.ru>
	<20060601113319.GA5662@wohnheim.fh-wedel.de>
In-Reply-To: <20060601113319.GA5662@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> I don't understand how that layer would not introduce overhead.  But
> maybe you have some explanation in diff -up format.  That would
> certainly make things easier to understand.

I wrote this already. Sketck:

1. add a 'void *capabilities' field to mtd_info.

2. create mtd_capps.c like this:

#include <mtd_capps.h>

/*
  * Called from mtd_add_device() or like such, i.e., on MTD device
  * initialization.
  */
int mtd_capabilities_init(struct mtd_info *mtd)
{
	struct mtd_capabilities *caps;

	caps =3D mtd->capabilities =3D kmalloc(sizeof(struct mtd_capabilities), =

GFP_KERNEL);
	if (!mtd->capabilities)
		return -ENOMEM;

	switch (mtd->type) {
	case MTD_NORFLASH:
		caps->can_milk_goat =3D 0;
		caps->can_pass_iq_tests =3D 1;
		/* ETC */
		break;
	case MTD_NANDFLASH:
		/* ETC */
		break;
	/* ETC */
	default:
		return -EINVAL;
	}
=09
	return 0;
}

/*
  * Called from mtd_del_device() or like such, i.e., on MTD device
  * de-initialization.
  */
void mtd_capabilities_free(struct mtd_info *mtd)
{
	kfree(mtd->capabilities);
}

3. create mtd_capps.h like this:

struct mtd_capabilities {
	int can_milk_goat;
	int can_pass_iq_tests;
	/* ETC */
};

/* Can this flash milk goats ? */
#define mtd_can_milk_goat(mtd) \
	((struct mtd_capabilities*)(mtd->capabilities))->can_milk_goat

-----

Well, in this case word "layer" becomes not very appropriate. It'll be a =

distinct *unit* within MTD. But the idea to have all the=20
application-dependent stuff in one place, not scattered over drivers, sta=
ys.

--=20
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
