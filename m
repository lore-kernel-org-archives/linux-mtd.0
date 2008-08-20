Message-ID: <48ABC998.8040303@nokia.com>
Date: Wed, 20 Aug 2008 10:36:56 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: OneNAND Cache Read Operation
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I finally got around to trying OneNAND Cache Read Operation.

I got the same results as you.  Just a 1 - 2 % increase in speed
on OMAP3.  It seems that the OMAP memory controller (GPMC) is not
capable of transferring the data from bufferRAM fast enough to
achieve the maximum OneNAND read speed.

Regards
Adrian
