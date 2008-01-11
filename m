Received: from 85-10-209-111.clients.your-server.de ([85.10.209.111]
	helo=mail.road.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDGRU-0001J5-5K
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 09:44:54 +0000
From: Uli Luckas <u.luckas@road.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][CFI] Wrong cache invalidation bug fix
Date: Fri, 11 Jan 2008 10:44:41 +0100
References: <62cbdcd90712030834o28f9126fs841b3b9d46324fb7@mail.gmail.com>
	<62cbdcd90712130248mc82d9cdp781fde10dd73d1b3@mail.gmail.com>
	<62cbdcd90712130254u64a3ae1eq95b24a4cd2a2f450@mail.gmail.com>
In-Reply-To: <62cbdcd90712130254u64a3ae1eq95b24a4cd2a2f450@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200801111044.43036.u.luckas@road.de>
Cc: Andrey.Lisov@intel.com, dwmw2@infradead.org, joern@logfs.org,
	alexey.korolev@intel.com, massimo cirillo <maxcir@gmail.com>, Nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, 13. December 2007, massimo cirillo wrote:
> Hi David,
>
> Could you please apply the patch? It has been tested and acknowledged
> by Nicolas and J=F6rn.
>
> Description
> This patch fixes improper setting of cache invalidation regions and
> solves the issue of data corrupting.
>
What happend to this patch? As it fixes a grave bug, shouldn't it be pushed=
=20
out for 2.6.24?

regards,
Uli

=2D-=20

=2D------ ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit
