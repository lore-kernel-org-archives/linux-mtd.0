Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iis2-0003wL-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 21:22:47 +0000
Received: from GATEKEEPER ([192.168.2.103])
	by skylab.outpostsentinel.com (8.11.2/8.11.2) with SMTP id g26MOA809512
	for <linux-mtd@lists.infradead.org>; Wed, 6 Mar 2002 17:24:10 -0500
Message-Id: <200203062224.g26MOA809512@skylab.outpostsentinel.com>
Date: Wed, 06 Mar 2002 16:32:52 -0500
To: linux-mtd@lists.infradead.org
From: Chris Fowler <strtok@hotmail.com>
Subject: nandwrite + nanddump
Reply-To: strtok@hotmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

Maybe someone can help me on this one.  I used nanddump to dump a DOC2000 into a file.

# nanddump /dev/mtd0 DOC

I then use nandwrite to write to a new DOC

#nandwrite /dev/mtd0 DOC 0

The NEW doc would not boot.  I expected this to be a replacement for getimage.exe and putimage.exe.  Was I wrong?

Thanks,
Chris Fowler
