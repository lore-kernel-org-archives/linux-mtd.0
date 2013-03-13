Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFhbP-00066t-9D
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 09:04:04 +0000
Message-ID: <1363165492.9457.10.camel@sauron.fi.intel.com>
Subject: [PATCH 00/10] mtd: remove dead map drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Date: Wed, 13 Mar 2013 11:04:52 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Adding the PPC list]

This patch-set removes a bunch of dean MTD map drivers. The way I judged
whether a driver is dead or not was looking at driver's dependencies in the
Kconfig file. Whenever I saw a driver depending on a Kconfig symbol which is
not defined anywhere, I treated the driver as dead.

The motivation for this patch-set is to clean up the MTD subsystem a little and
lessen the maintenance burden. Indeed, the less drivers we have, the easier it
is to do MTD framework refactoring.

Thanks,
Artem.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Best Regards,
Artem Bityutskiy
