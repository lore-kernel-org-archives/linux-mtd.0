Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbvPB-0004Fx-Bi
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 15:10:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/5] UBI: fastmap: add few todos
Date: Tue,  5 Jun 2012 18:11:54 +0300
Message-Id: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Hi Richard,

thanks for the patches. I have am sorry for bugging you with my nitpicks, but
I would read your code and review it with much more pleasure if you could bear
with me and address them. It should not be too difficult to do. Here are some
patches with a bunch of my nit-picks mostly about coding style, but there are
also few serious things like ignoring endiannes.

I've pushed these to the fastmap branch. Please, complain of send patches on
top.

Artem.
