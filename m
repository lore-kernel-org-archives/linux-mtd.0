Received: from lennier.cc.vt.edu ([198.82.162.213])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LP54K-0007kJ-M2
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 01:06:20 +0000
From: "Matt Witherspoon" <spoon@naxs.net>
To: linux-mtd@lists.infradead.org
Date: Mon, 19 Jan 2009 20:05:31 -0500
MIME-Version: 1.0
Subject: Re: BUG in jffs2 with MTD map using cached mapping
Message-ID: <4974DD0B.1686.AA118F3@spoon.naxs.net>
In-reply-to: <49677171.3080300@users.sourceforge.net>
References: <49677171.3080300@users.sourceforge.net>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: Quoted-printable
Content-description: Mail message body
Cc: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I=B4m replying to this again from a different address; hopefully I can get=
 the reply-to header right 
this time so it will make it through.

On 9 Jan 2009 at 10:47, Anders Grafstr=F6m wrote:
> Matt Witherspoon wrote:
> > I performed a bisection and the offending commit is
> > 205c109a7a96d9a3d8ffe64c4068b70811fef5e8. Before this commit, neither =
the BUG
> > nor the node CRC failure occured.
> I'd say that the BUG_ON is a secondary error. A broken error path.
> http://lists.infradead.org/pipermail/linux-mtd/2008-April/021473.html

You may be right in that it=B4s related, but that patch doesn=B4t really f=
ix the root problem (bogus 
CRC errors).

Before commit 205c109a7a96d9a3d8ffe64c4068b70811fef5e8 (jffs2: convert to =
new aops) 
everything was fine. I never got CRC errors and certainly no BUGs. I never=
 saw any file 
corruption.

After 205c10 (and still in 2.6.28), I see the CRC error and the BUG when I=
 copy a file. Copied 
files end up being truncated.

By applying the patch that Anders is referring to, I no longer get the BUG=
. However, I do still 
get CRC errors and copied files are still truncated.

If I simply comment out the BUG_ON, I still get the CRC errors but files a=
ppear to be copying 
okay. I have done various diffs on copied files (after rebooting, etc) and=
 still have not seen 
any corruption or truncation.

I still don=B4t know what to make of this. Any help would be great.
