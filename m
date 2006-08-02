Received: from host46-203-static.38-85-b.business.telecomitalia.it
	([85.38.203.46] helo=dave-tech.it)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8HSp-0006mf-9b
	for linux-mtd@lists.infradead.org; Wed, 02 Aug 2006 10:12:52 -0400
Message-ID: <44D0B33A.2080702@dave-tech.it>
Date: Wed, 02 Aug 2006 16:14:18 +0200
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How to generate a patch limited to MTD subsystem
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm facing the following problem.
I'm working on custom hardware with kernel 2.6.15. I suspect I need to 
update the MTD subsystem with latest sources. How to do that without 
migrating to latest kernel? In other words I need to generate a patch 
from latest MTD code against MTD code included in v2.6.15 kernel. Is it 
possible? How?


TIA,
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
