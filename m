Received: from h0040f44728e3.ne.client2.attbi.com ([24.62.221.37]
	helo=intel-srvr.patcameron.ne.mediaone.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1953eb-00054V-Ky
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 14:05:46 +0100
MIME-Version: 1.0
content-class: urn:content-classes:message
Date: Mon, 14 Apr 2003 09:05:13 -0400
Message-ID: <6D31D5429FA6884CBE9ECAB6C9B5E6A9444D@intel-srvr.patcameron.ne.mediaone.net>
From: "Thomas Cameron" <tom@ceisystems.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Which is simpler...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

	I have been working on a project recently, which uses a
DiskOnChip for storage.  However, I have had a number of problems
getting the DOC to work as I would like.  My question is this.  Would it
be easier to simply use a CompactFlash?

	My end goal is to use some sort of flash-based storage, and a
jffs2 or yaffs root filesystem.  Is it possible to use these filesystems
on a DiskOnChip at this point, or is support for this still forthcoming?
Additionally, what would be the easiest way to implement one of these
filesystems on a DiskOnChip.

Thanks for any help,
Thomas Cameron
