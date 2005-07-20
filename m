Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DvMQA-0005kI-QK
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 17:48:14 -0400
Received: by wproxy.gmail.com with SMTP id i20so1578995wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2005 14:48:05 -0700 (PDT)
Message-ID: <2db32b7205072014471289193b@mail.gmail.com>
Date: Wed, 20 Jul 2005 14:47:21 -0700
From: rolf liu <rolfliu@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1121895167.12397.0.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <2db32b72050720114074d1badb@mail.gmail.com>
	<1121895167.12397.0.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: suddently, can't use "cp jffs2.img /dev/mtd0" anymore
Reply-To: rolf liu <rolfliu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I did it every time before I want to write to it :)
It just works yesterday. Today I applied the patch and recompiled the
kernel 2.6.12.
It stops working :(


On 7/20/05, Josh Boyer <jdub@us.ibm.com> wrote:
> On Wed, 2005-07-20 at 11:40 -0700, rolf liu wrote:
> > Yesterday, I can use "cp jffs2.img  /dev/mtd0" to copy the jffs2 image
> > to mtd. Today, I applied the cvs snapshot of mtd to kernel and
> > compiled it. Suddenly, the "cp" command stops working.
> >
> > it tells me:
> > MTD do_write_buffer(): software timeout
> > cp: writing '/dev/mtd0' : Input/output error
> >
> > any idea?
>=20
> Did you erase the chip before writing to it like that again?  If not,
> you'll need to do:
>=20
> flash_eraseall /dev/mtd0
>=20
> Then try your copy again.
>=20
> josh
>=20
>
