Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F0Qdd-0006oY-PB
	for linux-mtd@lists.infradead.org; Sat, 21 Jan 2006 16:51:23 -0500
Message-ID: <43D2ACD7.7010602@inf.u-szeged.hu>
Date: Sat, 21 Jan 2006 22:51:19 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Alexey, Korolev" <alexey.korolev@intel.com>
References: <43C783D9.1030700@inf.u-szeged.hu> <43D0FC08.1010700@intel.com>
In-Reply-To: <43D0FC08.1010700@intel.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] JFFS2 kernel panics fixup on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexey,

Zoltan and me have verified your patch. We think it is OK, and have
commited into CVS. We hope the other maintainaers of MTD/JFFS2 will
agree with it.

We've deleted 3 lines from your patch, which is releted to
CONFIG_JFFS2_FORCED_BUFFER_FLUSH. We think its your private kernel
config option.

Thank you.

Ferenc
