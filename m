Received: from sonic314-13.consmr.mail.bf2.yahoo.com ([74.6.132.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fheKT-0004T2-22
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 17:09:02 +0000
Received: from CPE000db93f888c-CM001404556d28.cpe.net.cable.rogers.com (EHLO
 [10.11.12.90]) ([99.246.128.134])
 by smtp426.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 5b8528084500be222f489aea2e119507 for <linux-mtd@lists.infradead.org>;
 Mon, 23 Jul 2018 17:08:46 +0000 (UTC)
To: linux-mtd@lists.infradead.org
From: Martin Vuille <jpmv27@yahoo.com>
Subject: UBIFS: Shrinking in place
Message-ID: <9744d48a-398d-3329-ca57-9df72fb26cc5@yahoo.com>
Date: Mon, 23 Jul 2018 13:08:45 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I need to shrink an existing UBIFS filesystem "in place" as a
prelude to shrinking the underlying UBI volume.

Back in 2010 (http://lists.infradead.org/pipermail/linux-mtd/2010-January/028667.html)
it was stated on this list that this is not supported.

Wondering whether anything has changed since then?

If still not supported, I would like to consider undertaking
that work, and I'm looking for some guidance how best to
approach it.

MV
