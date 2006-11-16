Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gkiou-0003R2-Up
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 10:06:35 -0500
Subject: Re: cfi_cmd0001.c broken w.r.t Erase Suspend solved, patch included
From: Artem Bityutskiy <dedekind@infradead.org>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <45585ECD.3090108@transmode.se>
References: <45574BB5.5010601@transmode.se>  <45585ECD.3090108@transmode.se>
Content-Type: text/plain; charset=utf-8
Date: Thu, 16 Nov 2006 16:46:29 +0200
Message-Id: <1163688389.5597.23.camel@sauron>
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

On Mon, 2006-11-13 at 13:02 +0100, Joakim Tjernlund wrote:
> JFFS2 error: (1) jffs2_link_node_ref: Adding new ref c7a5b830 at
> (0x05ea06f8-0x05ea076c) not immediately after previous
> (0x05ea06f8-0x05ea076c
> )
> kernel BUG in jffs2_link_node_ref at fs/jffs2/nodelist.c:1098!
> Oops: Exception in kernel mode, sig: 5 [#1]

I is difficult to help without being able to reproduce this. I would
suggest you to add prints at jffs2_link_node_ref() and realize what's
going on.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
