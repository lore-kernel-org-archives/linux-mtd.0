Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZgTV-0005PD-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 00:32:21 +0100
Message-ID: <FA06AA2C99BCD511951200005A99441001E3ECC3@irvexch1.sextantifs.com>
From: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 30 Jul 2002 16:30:41 -0700
Subject: RE: jffs2_scan_eraseblock() - errors
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> > jffs2_scan_eraseblock() - Node at 0xXXXXXX {0x1985, 0xe002,
> > 0x1985c002) has invalid CRC)
> 
> 
> It's harmless. We were in the middle of writing that node when we lost
> power, and hadn't finished writing the payload -- hence the CRC fails.
> That's sort of what the CRC is there for. 

Questions then:
1. Does this node get reclaimed? I get this same message now with each
reboot.

2. It appears that the mount operation gets slower once this error condition
occurs. Is this possible/expected?

3. If the file-system becomes corrupted, what is the failure condition and
how do you correct it? Test for it?
