Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Jh5u-0000N8-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 21:30:10 +0000
Date: Wed, 4 Dec 2002 16:00:40 -0600
Subject: Re: Problem: 51MB partition max size on jffs2
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
To: tglx@linutronix.de
From: Ken Offer <koffer@arlut.utexas.edu>
In-Reply-To: <200212041847.56760.tglx@linutronix.de>
Message-Id: <D3E3F7BC-07D3-11D7-937A-000393467F1A@arlut.utexas.edu>
Content-Transfer-Encoding: 7bit
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

On Wednesday, December 4, 2002, at 11:47  AM, Thomas Gleixner wrote:

> Latest CVS code ?

I tried it with an older version (circa 20020819) and the latest code 
(20021202).  Same result.  I am going to try the change Dave Ellis 
<DGE@sixnetio.com> suggested.

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
