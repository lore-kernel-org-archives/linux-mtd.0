Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kiT4-0000ac-CB
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 11:58:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <000601c35cc8$46de3c50$73dea8c0@lair>
References: <000601c35cc8$46de3c50$73dea8c0@lair>
Message-Id: <1060253873.25209.61.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 11:57:53 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 ram memory usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-07 at 10:42, =C3=98yvind Harboe wrote:
> I've made some changes to JFFS2 locally to reduce memory usage.
>=20
> The change I did was to disable compresssion as I have lots
> of flash and little ram(Atmel EB40a 2MB flash + 256k ram +
> eCos and my app).

You could also remove the actual compression routines if you're going to
do that. Other users, especially eCos users, may want to individually
select the compression algorithms available too.

> My usage of JFFS2 is intermittant and hence I'd like to
> reduce peak memory usage(much better with compression
> disabled) and idle memory usage(perhaps unmounting JFFS2
> when I'm not using it?).

Finding a way to eliminate the 'totlen' field of the jffs2_raw_node_ref
structure might be productive. Or possibly making the jffs2_raw_node_ref
contain doubly-linked lists if that then means we can discard obsolete
nodes immediately rather than keeping them around.

--=20
dwmw2
