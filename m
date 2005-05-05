Received: from rproxy.gmail.com ([64.233.170.197])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTVK3-0006HU-Ft
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 21:38:40 -0400
Received: by rproxy.gmail.com with SMTP id c16so327738rne
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2005 18:38:43 -0700 (PDT)
Message-ID: <61cc712d050504183852868c04@mail.gmail.com>
Date: Wed, 4 May 2005 18:38:43 -0700
From: Kylo Ginsberg <kylo.ginsberg@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: smallest jffs2 file system possible
Reply-To: kylo@kylo.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would like to create the smallest jffs2 file system possible.  We
want to have a small separate mount point to store a small number=20
(<5) of small text files (<1k each).

Empirically I've determined that this minimum size is effectively 5 *
N, where N is the physical erase block size of the underlying flash
part.  Is this correct?  Are there any workaround or patches to enable
building a smaller file system?  Is a different f/s recommended for
such an application (must be r/w, don't care about compression
particularly).

Thanks,
Kylo
