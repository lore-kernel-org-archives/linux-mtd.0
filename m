Received: from ussvlmgty03.spansion.com ([12.151.36.115])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnqEo-0004yM-9h
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 09:56:14 +0000
Message-ID: <4C739735.3090408@spansion.com>
Date: Tue, 24 Aug 2010 11:56:05 +0200
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Re: protection on cfi-flash
References: <AANLkTinWBxKC0F-awnJktD7JfJofg3XqT-1onPcQypws@mail.gmail.com>
In-Reply-To: <AANLkTinWBxKC0F-awnJktD7JfJofg3XqT-1onPcQypws@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: fransmeulenbroeks@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > I would expect flash_erase to get some error code in that case and
 > report it back (or if that is not possible do a readback of the data
 > to see if the erase was successful).

Erasing or programing a locked sector does not immediately issue an
error on the S29GL01GP. The status you get from the device in this
case shows a couple of toggle bit cycles before it goes back to read
array mode.

It is the responsibility of higher layers to verify erase and/or program
operations. This verification step is done e.g. in flash file systems
but not in the MTD chip driver.

--Gernot

PS: Feel free to get in direct touch with me regarding adding locking
     support to the AMD/Spansion chip driver. I can help you with this.
