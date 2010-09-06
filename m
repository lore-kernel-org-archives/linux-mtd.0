Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTm-0008T1-LU
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:08 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 00/13] UBI reliability improvements
Date: Mon,  6 Sep 2010 11:54:44 +0300
Message-Id: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

here is a set of patches which should improve UBI reliability. I wrote them
during my trip to LinuxCon Brazil.

Patches 1-5 should be interesting for Matthieu CASTET - they improve -EUCLEAN
errors handling a little.

Patches 6-13 should be interesting for Matthew L. Creech - they presimably have
to help in catching why in his setup UBIFS refers unmapped LEB. I'm not sure
they will help, but there is a chance - my theory is that UBI decides that the
LEB is corrupted and wipes it. With this patch-set UBI should instead preserve
corrupted LEBs, so we could take a look what happened.

Please, reveiw, test. I tested them a little as well, but not extensively.

Artem.
