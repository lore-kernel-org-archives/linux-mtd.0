Received: from [216.166.168.36] (helo=vpmail.theglobal.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6VBg-00050m-OI
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 14:14:08 +0100
From: Tim Gardner <timg@tpi.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 6 Oct 2003 07:13:13 -0600
References: <200310021344.14931.timg@tpi.com>
	<1065287933.16005.2.camel@imladris.demon.co.uk>
In-Reply-To: <1065287933.16005.2.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Message-Id: <200310060713.13344.timg@tpi.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: Patches to nanddump.c
Reply-To: timg@tpi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using getopt will break command line option backward compatibility, which=
 is=20
fine with me because it would clean up some parsing code. Any objections?

On Saturday 04 October 2003 11:19, David Woodhouse wrote:
>
> Looks generally sane. Can you use getopt please. Example in mkfs.jffs2.=
c

--=20
Tim Gardner - timg@tpi.com 406-443-5357
TriplePoint, Inc. - http://www.tpi.com
PGP: http://www.tpi.com/PGP/Tim.txt
