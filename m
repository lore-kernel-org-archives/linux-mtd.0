Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTURY-00052Y-Lj
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 07:41:49 +0000
Received: by bwz1 with SMTP id 1so4418965bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 00:41:46 -0700 (PDT)
Subject: l2-mtd-2.6.git to linux-next
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse
	<dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 10:37:30 +0300
Message-ID: <1307345850.3135.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-next@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stephen,

as we've discussed, please, include l2-mtd-2.6.git tree to linux-next:

git://git.infradead.org/users/dedekind/l2-mtd-2.6.git master

David, Stephen would like to see your explicit ack.

To make a long story short, currently the MTD subsystem maintenance is a
team work:

1. David is the maintainer who has the ultimate authority to merge or
   reject patches, and who holds the biggest MTD experience/knowledge.

2. David is busy with other projects and has no time to routinely
   review patches and merge them to the mtd-2.6.git tree. And I help him
   with my "level 2" l2-mtd-2.6.git tree.

By including l2-mtd-2.6.git into linux-next we want to solve the
following problem: because of lack of time dwmw2 does not always merges
patches to the mtd-2.6.git tree, and often we are in a situation when
MTD patches are exposed to linux-next for a day or 2, during the merge
window, and then they are merged.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
