Received: from smtp.scorch.co.nz ([27.110.127.199] helo=scorch.co.nz)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUoLI-0004jO-7z
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2010 22:36:36 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Huge ubi or ubifs sync slowdown since 2.6.32
Date: Tue, 21 Dec 2010 11:36:22 +1300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201012211136.22254.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi All

I've been looking into a ubifs performance regression on linux-omap 2.6.37.

My test is pretty simple, copy a 2Mbyte file and sync.

# sync; date; cp 2Mbyte-file foo; sync; date

On 2.6.32 and earler, the time between the two dates was around 3 seconds.
On linux-omap master it is around 14 seconds. Ouch!

At first I thought the problem was due to changes in the OMAP nand drivers, 
but raw randwrite speed is actually a bit faster. This suggest the finger 
should be pointed at ubi or ubifs.

I then thought that perhaps the layout of my ubinized image might be a 
contributing factor so I erased the partition, ubiformatted and ubimkvoled. 
The problem persisted,

Any suggestions as to what might be broken or how to debug this deeper?

Thanks

Charles
