Received: from uproxy.gmail.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXSAs-0007BU-ES
	for linux-mtd@lists.infradead.org; Sat, 22 Apr 2006 20:10:16 -0400
Received: by uproxy.gmail.com with SMTP id j3so678576ugf
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 Apr 2006 17:09:55 -0700 (PDT)
Message-ID: <625fc13d0604221709h6ce815e2y1d502fcfdbf7927c@mail.gmail.com>
Date: Sat, 22 Apr 2006 19:09:55 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060422171133.GF6629@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [HOWTO] Using git for mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/22/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> Next version with the FIXMEs filled in.  If anyone has comments, spots
> errors, etc., please tell me.
>
> 1. Clone Linus' tree
>
>   $ git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux-2.6.git mtd
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
>

Huh?

These look odd to me.  Here are the steps I use (note git 1.3.0 is required=
)

1. git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
-2.6.git
linux-git

This clones the latest of Linus' tree.

2. git clone --reference linux-git git://git.infradead.org/mtd-2.6.git mtd

This clones the MTD tree, however it uses the previous tree created as
a reference to pull objects from so you don't have two copies of the
exact some git objects lying around.

The reason I do this is two fold.  One is that I want to have the
latest 2.6 tree available to me anyway.  If you don't want/need that,
then just clone the mtd-2.6 tree outright.  The second reason is that
I don't have to do wonky things like 'git fetch mtd'.  A fetch doesn't
merge the changes into the tree.  It just gets the objects.

By using --reference, you get the benefit of sharing the bulk of the
git objects and the simplicity of being able to just do 'git pull' in
both trees to update them.  You also avoid having to locally merge in
the mtd-2.6 changes, which is something David would really like to
avoid.  That way he can pull directly from your tree and doesn't get
extraneous merges.  Which also makes it easier for him to have Linus
pull from _his_ tree, because Linus hates extraneous merges.

The rest of your steps seem fine.

josh
