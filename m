Received: from pd9e41b01.dip.t-dialin.net ([217.228.27.1] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1756Zx-0004gF-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 16:08:38 +0100
Message-Id: <200205071513.g47FDpn06147@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, Jarkko Lavinen <jlavi@iki.fi>
Subject: Re: Benchmarking JFFS2
Date: Tue, 7 May 2002 17:13:51 +0200
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
References: <20020506151930.A15109@kosh.hut.fi> <28528.1020448474@redhat.com> <25024.1020783726@redhat.com>
In-Reply-To: <25024.1020783726@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tuesday, 7. May 2002 17:02, David Woodhouse wrote:
> jlavi@iki.fi said:
> >  I have caught the message 8 times. It doesn't occur rather seldom
> > when I have been benchmarking JFFS2 over the weekend.
> >
> > On five cases the first line was "Unknown INCOMPAT nodetype C002 at
> > 0020293C" (address varies).
>
> Er, this means it's marked as obsolete on the flash but not in memory. I
> have a vague recollection of having seen this and worked out the cause.
> Is this with the latest code from the jffs2-2_4-branch of CVS? Does it also
> happen with the trunk code?
Yep, this happens with the trunk code too. As I can remember, it happend, 
when I removed a directory and had a power loss before everything was written 
to flash. On the next mount I got some errors and was not able to remove 
the remains of this directory.

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
