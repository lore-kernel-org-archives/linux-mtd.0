Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16W6Rf-0004iQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 01:55:23 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Problems with mounting a JFFS2 file system image 
Date: Wed, 30 Jan 2002 20:05:52 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F096A45@sekhmet.ad.newisys.com>
From: "Navin Boppuri" <navin.boppuri@newisys.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

That solved it. Thanks a lot.

Navin.

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, January 29, 2002 6:57 PM
To: Navin Boppuri
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with mounting a JFFS2 file system image=20



navin.boppuri@newisys.com said:
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: =
0x8519 instead

Your host and target have different endianness. Use the '-b' or '-l' =
option
to mkfs.jffs2.


--
dwmw2
