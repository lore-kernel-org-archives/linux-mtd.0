Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VLVq-00017p-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 23:48:34 +0000
content-class: urn:content-classes:message
Subject: RE: linux/completion.h missing 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Jan 2002 17:59:09 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F096A3F@sekhmet.ad.newisys.com>
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

I am working on the kernel tree for PowerPC that I got from denx.de. It =
did not have linux/completion.h . On further investigation, the file =
include/linux/compatmac.h seems to have taken over. I have no clue how =
and when this happened. All I had to do was take away the =
linux/completion.h and include compatmac.h and everything worked like a =
charm.

And no, I was not lying.

Navin.

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Monday, January 28, 2002 5:29 PM
To: Navin Boppuri
Cc: linux-mtd@lists.infradead.org
Subject: Re: linux/completion.h missing=20



navin.boppuri@newisys.com said:
> There is a missing file that jffs2_fs_sb.h looks for and does not
> find. The file name is completion.h which is supposed to be in the
> include/linux/ directory. I have the latest 2.4. kernel and I dont see
> this file. What's going on? Where do I get this?=20

It's been there since 2.4.7-pre7. Your kernel tree is missing some files =
or=20
you lied about it being the latest.


--
dwmw2
