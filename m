Received: from fed1rmmtao09.cox.net ([68.230.241.30])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cx7xA-0004eD-30
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2005 13:13:13 -0500
Received: from laptop ([70.179.62.151]) by fed1rmmtao09.cox.net
	(InterMail vM.6.01.04.00 201-2131-117-20041022) with ESMTP
	id <20050204181304.RNVD8811.fed1rmmtao09.cox.net@laptop>
	for <linux-mtd@lists.infradead.org>; Fri, 4 Feb 2005 13:13:04 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Rick Adams <rgadams@cox.net>
To: linux-mtd@lists.infradead.org
Date: Fri, 4 Feb 2005 10:12:18 -0800
References: <E1Cx6oS-0004DA-Fy@canuck.infradead.org>
In-Reply-To: <E1Cx6oS-0004DA-Fy@canuck.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200502041012.18287.rgadams@cox.net>
Subject: Re: MTD JFFS2 Problems 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 04 February 2005 09:00 am, linux-mtd-request@lists.infradead.or=
g=20
wrote:
> Date: Fri, 4 Feb 2005 08:18:31 -0800 (PST)
From: Jeff Stevens <jsteve17@yahoo.com>
>Subject: MTD JFFS2 Problems
>To: linux-mtd@lists.infradead.org
>Message-ID: <20050204161831.32323.qmail@web41406.mail.yahoo.com>
>
>
>[root@gtvme root]# Write clean marker to block at
>0x00a20000 failed: -30
>Write clean marker to block at 0x00820000 failed: -30
>
I had a client that was experiencing the CLEANMARKER errors at boot (moun=
t of=20
the jffs2 root  filesystem). The problem was related to using the host=20
version of mkfs.jffs2 tool when they should have been using the target=20
version. They were also experiencing several other "weird" operations. Th=
is=20
issue is only applicable in a cross development environment. Unfortunatel=
y=20
Jeff, you did not give us enough information for me to tell what's going =
on.=20
Hope this helps.
--=20
Rick Adams
rick@theptrgroup.com
