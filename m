Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16blJk-0005qw-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 16:34:36 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Weird status information on JFFS2 File System 
Date: Fri, 15 Feb 2002 10:45:30 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F096A75@sekhmet.ad.newisys.com>
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

I have two uniform sector (64K each 16 bit) Flash devices connected to a =
32 bit bus. So, my sector size is actually 128K. For a 1MB file system, =
what should be the optimal size of the reserved space for garbage =
collection? I only have 8 sectors for 1MB out of which 5 sectors are =
already being taken up by GC. Do I really need 5*128K GC area for 3*128K =
available space left on the flash?=20

Thanks a lot.

Navin.

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Friday, February 15, 2002 10:10 AM
To: Navin Boppuri
Cc: Chris Vagnini; linux-mtd@lists.infradead.org
Subject: Re: Weird status information on JFFS2 File System=20



navin.boppuri@newisys.com said:
>  Is there some way I can change the 5 erase blocks default to a
> smaller size? What are the implications of doing that?

grep RESERVED fs/jffs2/nodelist.h

The danger in reducing it too far is that you'll run out of free space=20
entirely, so that garbage collection cannot continue and your file =
system=20
gets entirely stuck. We ought to be able to reduce it to only a block or =

two, but the code wants auditing for safety first - we have to ensure =
that=20
we never expand while garbage-collecting.

--
dwmw2
