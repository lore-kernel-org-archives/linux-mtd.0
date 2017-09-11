Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1drLK7-00058X-SQ
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 09:48:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by bes.se.axis.com (Postfix) with ESMTP id 3E1872E085
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 11:47:47 +0200 (CEST)
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 3qtO9_XxNYt4 for <linux-mtd@lists.infradead.org>;
 Mon, 11 Sep 2017 11:47:46 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
 by bes.se.axis.com (Postfix) with ESMTPS id 572442E07D
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 11:47:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0E1F1E07B
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 11:47:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5EF61E079
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 11:47:45 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
 by boulder03.se.axis.com (Postfix) with ESMTP
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 11:47:45 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
 by thoth.se.axis.com (Postfix) with ESMTP id C8BC72F10
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 11:47:45 +0200 (CEST)
Date: Mon, 11 Sep 2017 11:47:40 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
CC: Cristian Ionescu-Idbohrn <cii@axis.com>, Jonas Holmberg <jonashg@axis.com>
Subject: Actual usage of files in ubifs
Message-ID: <alpine.DEB.2.11.1709111143420.14549@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Is there a (simple) way to find out exactly how much space each specific 
file uses in an ubifs fils system?

I looked into running mkfs.ubifs with some form of option to give me the 
info, the closest I got was -g 3 which output a lot of sizes but it was 
not obvious exactly what they meant.

I suppose it would be fully possible to add code to mkfs.ubifs to output 
this information, as it surely must be there at some point, since it 
selects the compression algorithm on a file per file basis, debending on 
the amount of compression acheived for each algorithm.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
