Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gl3VP-0000MJ-Qy
	for linux-mtd@lists.infradead.org; Fri, 17 Nov 2006 08:11:49 -0500
Subject: Re: 2.6 Kernel not mounting JFFS2 partition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Glen Johnson <gjohnson@valcom.com>
In-Reply-To: <455CC35B.5080705@valcom.com>
References: <455CC35B.5080705@valcom.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 17 Nov 2006 14:34:14 +0200
Message-Id: <1163766854.5597.39.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2006-11-16 at 15:00 -0500, Glen Johnson wrote:
> 1. "eraseall /dev/mtd2" which ended with "Erased 2048 Kibyte @ 0 -- 100%
> complete."
At this point it is nice to make sure if the erase functionality works.
Try to read /dev/mtd2 and make sure it contains only 0xFFs.

> 8. mount -t jffs2 mtd2 /mnt/ Once again many error messages/info
> messages. Finally it died with these last lines:
> You cannot use older JFFS2 filesystems with newer kernels

Download newer JFFS2 utilities and use newer mkfs.jffs2. It will
probably solve your problems.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
