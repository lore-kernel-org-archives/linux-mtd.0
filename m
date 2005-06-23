Received: from rproxy.gmail.com ([64.233.170.207])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlGBY-0003bm-PI
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 21:07:17 -0400
Received: by rproxy.gmail.com with SMTP id c16so217168rne
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2005 18:07:15 -0700 (PDT)
Message-ID: <61cc712d0506221807dca6e1b@mail.gmail.com>
Date: Wed, 22 Jun 2005 18:07:15 -0700
From: Kylo Ginsberg <kylo.ginsberg@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <61cc712d05062213393c397c6d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <61cc712d05062213393c397c6d@mail.gmail.com>
Subject: Re: jffs2 root fs: how to overwrite it?
Reply-To: Kylo Ginsberg <kylo.ginsberg@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/22/05, Kylo Ginsberg <kylo.ginsberg@gmail.com> wrote:
> I have a jffs2 root file system.  As part of the user upgrade process,
> running from linux, I need to blow the root fs away and replace it
> with a new version.

For posterity: the tool I was looking for was pivot_root.

Cheers,
Kylo
