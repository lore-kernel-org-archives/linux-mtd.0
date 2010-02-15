Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh8BP-0005zP-OA
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 21:08:49 +0000
Received: by fxm1 with SMTP id 1so5589691fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 13:08:40 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 15 Feb 2010 22:08:40 +0100
Message-ID: <fcf894b71002151308i1a091f76rc6703734a0ea2164@mail.gmail.com>
Subject: Filesystem advice
From: =?UTF-8?Q?Volker_A=C3=9Fmann?= <volker.assmann@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Sorry if this post is a bit off-topic for this mailing list, but this
seams to be the best place to ask. We are currently using an embedded
linux system with a compact flash drive and ext3 as a filesystem. Due
to frequent power failures, we are often experiencing filesystem
corruption problems, and thus want to replace this setup with a better
option. My options / questions:

1. Replace ext3 with UBIFS or JFFS2 using the MTD-Blockdevice
emulation layer. Would this setup improve the reliability of our
system with respect to power failures, and if yes which is better
suited? Of course this approach would not improve the wear leveling,
but would it make it worse / probably confuse the integrated flash
controller?

2. Replace the Compact Flash module with an MTD device - this option
poses the problem that we can only deploy new hardware which is
connected through USB or the Compact Flash interface. I didn't find
any hardware which would support this setup - does something like this
exist?

3. In case both solutions are not viable, could you give an educated
guess on which traditional filesystem would be better suited for this
use case than ext3?

Thanks in advance and cheers,


      Volker A=C3=9Fmann
