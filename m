Received: from uproxy.gmail.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXeOB-0003tw-ER
	for linux-mtd@lists.infradead.org; Sun, 23 Apr 2006 09:12:52 -0400
Received: by uproxy.gmail.com with SMTP id j3so731007ugf
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Apr 2006 06:12:33 -0700 (PDT)
Message-ID: <625fc13d0604230605s4ef156aev67d498eed9be629b@mail.gmail.com>
Date: Sun, 23 Apr 2006 08:05:57 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060423122721.GC19326@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
	<20060423122721.GC19326@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [HOWTO] Using git for mtd (v3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/23/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> On Sat, 22 April 2006 19:11:33 +0200, J=F6rn Engel wrote:
>
> 1. Clone Linus' tree
>
>   $ git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux-2.6.git mtd
>
>   The mtd git server is behind a slow DSL line and does not have
>   enough network bandwith for people to clone the full tree on a
>   regular basis.
>
> 2. Change into soon-to-be mtd tree
>
>   $ cd mtd
>
> 3. Setup mtd remotes file
>
>   $ vi .git/remotes/mtd
>   URL: git://git.infradead.org/mtd-2.6
>   Pull: master:mtd
>
> 4. Fetch mtd tree
>
>   $ git fetch mtd

Does that really do what you want though?  It will fetch the objects
from the mtd-2.6 tree, but it doesn't merge them into your local tree
from what I remember.  So to actually get the changes into the source,
you'd have to do 'git fetch mtd'; 'git merge', no?

josh
