Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fkhny-0005Hb-EN
	for linux-mtd@lists.infradead.org; Mon, 29 May 2006 09:29:15 -0400
Received: by ug-out-1314.google.com with SMTP id q2so283509uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 May 2006 06:29:03 -0700 (PDT)
Message-ID: <625fc13d0605290629h4aabd512q5f53e06a5399fcf7@mail.gmail.com>
Date: Mon, 29 May 2006 08:29:03 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Johannes Niess" <linux@johannes-niess.de>
In-Reply-To: <200605272120.19348.linux@johannes-niess.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <200605272120.19348.linux@johannes-niess.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd2block should not expand sparse loopback files
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/27/06, Johannes Niess <linux@johannes-niess.de> wrote:
> Hi list,


> The jffs2 is readable and writable as expected. BUT upon first mount a co=
uple
> of pdflush (pseudo kernel) processes become active and completely expand =
the
> sparse loopback file. Only after that disk activity has settled, "ls" and
> "du" give identical numbers of 1GB. Before mounting "ls" gives the maximu=
m
> size and "du" just counts occupied sectors, e. g. "ls" gives 1 GB and "du=
"
> only 1 MB.

JFFS2 is going through and adding cleanmarkers to the blocks that
don't have them.

> I guess that the "fill with 1's" flash strategy is taking its toll togeth=
er
> with the "Clean" markers. Can I switch that off? Using
> "mkfs.jffs2 --no-cleanmarkers"  does not help, as does  --eraseblock=3D0.

No you can't switch it off.  The filesystem will add them itself.

> block2mtd should not touch unused blocks at all in this setup. They shoul=
d
> only be written to on first use for storing real data.

This has nothing to do with block2mtd.  It's a result of using JFFS2.

> Please make transparent compression AND loop file expansion on demand
> possible. Thank you very much for your work!

Um.. why don't you make it possible and provide a patch?  Otherwise
you might want to seriously look into e2compr.

josh
