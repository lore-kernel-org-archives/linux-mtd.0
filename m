Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184IAx-0000I9-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 10:51:43 +0100
Received: from f93.pav1.hotmail.com ([64.4.31.93] helo=hotmail.com)
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 184D5L-00077o-00
	for linux-mtd@lists.infradead.org; Wed, 23 Oct 2002 05:25:35 +0100
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wipro.com
Subject: mtd and low level api's can be used together..?
Date: Wed, 23 Oct 2002 04:14:40 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F93mP9CDBHy3SpwBGpE00004c4c@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Friends,

One of my modules needs to do raw write to an address offset in a
partition meant only for it. Plan to use the partition number to get
base for that. Can I continue using low level api's for this module
only while rest of the system uses standard read()/write()/open()/close
() api's to operate on OTHER partitions which will have cramfs and
jffs2?. If yes, what are the things that needs to be considered..like
ensuring operation on flash is serailised etc?.

Thanks and Regards,
Vijay


_________________________________________________________________
Get faster connections -- switch to MSN Internet Access! 
http://resourcecenter.msn.com/access/plans/default.asp
