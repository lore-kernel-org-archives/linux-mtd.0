Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm4St-0007t8-Le
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 13:15:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
Date: Sun,  6 Feb 2011 15:17:45 +0200
Message-Id: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

here is a better patch for recovery fix. Comparing to the previous
patch-set now we make sure we keep write-buffer offset aligned to
@c->max_write_size (64 in case of CFI NOR) as much as possible.

Also, I've merged the "Add comments" patch with the patch which adds
the code.

You can find these patches also in the UBIFS git tree, 'cfi-nor-fix-v2'
branch:
git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v2

Please, test. These patches may break NAND setups as well, so anyone
who is interested in having stable UBIFS in the next release, please,
also test.

Thanks,
Artem.

P.S.:
Version 1 can be found here:
http://lists.infradead.org/pipermail/linux-mtd/2011-February/033840.html
and
git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v1
