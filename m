Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp5ad-0003sQ-Kh
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 09:32:28 -0400
Received: from mailgate.cabletime.com ([80.177.138.66] helo=cabletime.com)
	by anchor-post-30.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1Bp5ab-000LtV-0U
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 13:32:25 +0000
From: Andy Hawkins <a.hawkins@cabletime.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1090848742.2219.3.camel@adh>
Mime-Version: 1.0
Date: 26 Jul 2004 14:32:22 +0100
Content-Transfer-Encoding: 7bit
Subject: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We're using a 2.4.20 derived kernel, and a while back updated to a
recent MTD snapshot to get support for the Samsung NAND 128MiB on our
hardware).

However, we found that with this snapshot, we could no longer write to
the NOR flash on our board (I posted a message about this on 19th July,
but had no responses).

To see if this problem has now been fixed, I have just downloaded the
latest snapshot to try. However, I can no longer get this to compile.
After changing some Makefiles, I have now found that the new code uses
'kvec' in place of 'iovec'. Is this a 2.6 feature?

If so, are there any plans to make the current MTD code work with 2.4?

What would people recommend we do in order to get working MTD support
for the chips on our board for a 2.4 kernel?

Many thanks.

Andy
