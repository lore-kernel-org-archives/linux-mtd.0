Received: from rproxy.gmail.com ([64.233.170.192])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CnwR7-0007xK-Dm
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 05:06:10 -0500
Received: by rproxy.gmail.com with SMTP id z35so332429rne
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 02:06:07 -0800 (PST)
Message-ID: <f6d36a4405011002065bef7372@mail.gmail.com>
Date: Mon, 10 Jan 2005 12:06:07 +0200
From: pavel livshits <spavell@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Adding Partition to MTD
Reply-To: pavel livshits <spavell@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using Monta Vista Linux CEE for PXA271. I would like to add
additional (forth) partition to MTD "Bulverdo flash" for test file
system purpose.
Where are the changes other then another name to static struct
mtd_partition bulverde_partitions[]?

Regards,
Pavel
