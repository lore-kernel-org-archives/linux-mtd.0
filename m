Received: from h24-66-30-3.wp.shawcable.net ([24.66.30.3] helo=iders01.iders.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vIXy-0006v1-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2002 14:54:02 +0100
Received: from athlon ([200.123.101.135])
	by iders01.iders.ca (8.12.2/8.12.2/Debian -11) with SMTP id g3ADrwbY027343
	for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2002 08:53:58 -0500
Message-ID: <008f01c1e097$2dce41a0$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: What is smallest JFFS2 size (#blocks)
Date: Wed, 10 Apr 2002 08:54:05 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hello,

We plan to use JFFS2 to store several
text configuration files, but we don't 
expect the total size of the files to 
be more than 10k or so.

What is the smallest possible size
for a JFFS2 file system, in number
of blocks? I'm sure it's at least 2...

Thanks,
Derek Ross.
