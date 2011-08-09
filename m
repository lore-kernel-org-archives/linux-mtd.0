Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqhPY-0008Ui-VN
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 08:11:42 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 9/9] faq: general: add bug reporting FAQ
Date: Tue, 9 Aug 2011 10:10:16 +0200
References: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
	<1312832239-21759-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312832239-21759-10-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201108091010.16868.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 08 August 2011 21:37:19 Brian Norris wrote:
> It's surprising to note that we do not have a general "how to send a bug
> report" FAQ. This patch provides a starting point and (most importantly)
> directs UBI/UBIFS users to the appropriate bug reporting information.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  faq/general.xml |   54 +++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
>  mail.xml        |    4 +++-
>  2 files changed, 57 insertions(+), 1 deletions(-)
>=20
> diff --git a/faq/general.xml b/faq/general.xml
>[ ... ]
> +<H2>How do I report bugs?</H2>
> +</A>
> +
> +<P>
> +First, you need to figure out what you're reporting a bug against. This =
website
> +(and its accompanying <A HREF=3D"../mail.html">mailing list</A>) support=
s several
> +related aspects of Linux, from the MTD kernel subsystem to its user-space
> +utilities, including the generic MTD and NAND interface layers, several =
MTD
> +hardware drivers, the UBI volume management system, several flash filesy=
stems
> +(e.g., JFFS2, UBIFS), and the user-space MTD utils. People on the mailin=
g list
> +will often support the YAFFS/YAFFS2 filesystems; however, YAFFS has its =
own
> +dedicated <A HREF=3D"http://www.yaffs.net/">website</A> and
> +<A HREF=3D"http://stoneboat.aleph1.co.uk/cgi-bin/mailman/listinfo/yaffs"=
>mailing
> +list</A>, and its code is kept out of tree.

 A pedantic point that perhaps doesn't matter, but....
 Not quite sure what is meant by =E2=80=9Ckept out of tree=E2=80=9D?
 Two interpertations I can think of:  YAFFS(2) is not
 in the UBI(FS) trees;  and/or  YAFFS(2) is not in the
 Linux kernel tree (albeit it is in the Android tree).

> +</P>
> +
> +<P>
> +Now, bug reports for any of the above areas are more than welcome on the

 =E2=80=9CAny=E2=80=9D?  Including YAFFS(2)?

 _Assuming_ YAFFS(2) wasn't meant to be included
 in the =E2=80=9Cany=E2=80=9D, then I suggest moving the above
 YAFFS(2) remarks  =E2=80=94 which are useful =E2=80=94  to later,
 perhaps after the other-FAQs list (below)?
 This resolves the pedantic confusion over =E2=80=9Cany=E2=80=9D,
 and also takes what is basically an aside out of
 the main flow of text / information.

> +<A HREF=3D"../mail.html">MTD mailing list</A>, provided you include suff=
icient
> +information for reproducing and debugging your problem. This means:
> +</P>
> +
> +<UL>
> +	<LI>include all kernel 'oopses', stack traces, debug messages, or
> +	relevant logs along with a clear description of the problem you're
> +	having, what system(s) are affected, and anything else you think might
> +	help understand your issue;</LI>
> +
> +	<LI>include information about flash parameters found from
> +	"<CODE>mtdinfo -a</CODE>" (or the less useful info from
> +	"<CODE>cat /proc/mtd</CODE>");</LI>

 I always suggest using =E2=80=98&nbsp;=E2=80=99 for spaces in
 inline  <code>=E2=8B=AF</code>  to prevent (what can be)
 horribly confusing inappropriate linebreaks.

 Thanks for addressing the how-to-report-bugs issue.
cheers!
	-blf-

>[ ... ]

=2D-=20
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
