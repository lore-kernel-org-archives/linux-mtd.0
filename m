Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVJTE-0001Qb-Fw
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 14:18:01 +0000
From: Sandeep Jain <Sandeep_Jain@mentor.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Sandeep
 Jain <Sandeep_Jain@mentor.com>
Subject: [PATCH v1 0/2] mtd: lock module while used
Date: Thu, 4 Aug 2016 19:46:32 +0530
Message-ID: <1470320194-9602-1-git-send-email-Sandeep_Jain@mentor.com>
In-Reply-To: <Sandeep Jain <Sandeep_Jain@mentor.com>
References: <Sandeep Jain <Sandeep_Jain@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*** BLURB HERE ***

Jim Baxter (1):
  mtd: Add hooks to call get and put on mtd devices.

Vladimir Zapolskiy (1):
  mtd: m25p80: lock module while used

 drivers/mtd/devices/m25p80.c |   15 +++++++++++++++
 drivers/mtd/mtdpart.c        |   18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
1.7.9.5
