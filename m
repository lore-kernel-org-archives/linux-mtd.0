Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VF1R-0004IP-CP
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 19:29:33 +0100
Date: Wed, 25 Jun 2003 19:29:54 +0100
Mime-Version: 1.0 (Apple Message framework v552)
To: paul.vangool@rinconnetworks.com
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <20030625182431.GA15901@rinconnetworks.com>
Message-Id: <03E9F4D1-A73B-11D7-A51A-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: No space left on almost empty JFFS2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wednesday, Jun 25, 2003, at 19:24 Europe/London, Paul van Gool wrote:

> Creating am image with '-e 0x10000' and running with it, results in:
> [snip]

Did you erase the flash properly?  It looks like it's got messed up=20
somehow.

Re- the other point.  You need, afaik, to have at least five empty=20
erase blocks
before jffs2 will try to write to the flash.  This is, yes, half a=20
mibibit.

Unless this has changed, J=F6rn?

-J.
