Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16RMuO-00005G-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 00:29:28 +0000
Message-ID: <3C474523.60E74892@daniel.com>
Date: Thu, 17 Jan 2002 15:41:55 -0600
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Herman Oosthuysen <Herman@WirelessNetworksInc.com>
CC: dennis noermann <dennis.noermann@noernet.de>,
 	linux-mtd@lists.infradead.org
Subject: Re: experience with max block erase
References: <Pine.LNX.4.33.0201170137210.18875-100000@chaingun.noernet.de> <002101c19f99$874d7e60$0100007f@localdomain.wni.com.wirelessnetworksinc.com>
Content-Type: text/plain; charset=us-ascii
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

Herman Oosthuysen wrote:

> 100 000 cycles is lot.  You have to erase the chip about ten times per hour
> continuously for 100 years to reach that number...

Let's state 100K cycles another way:

for a 8mbit chip (1024KB)

It's only 100K * 1024KB of data life (assuming a circular use- which is the
best case and what you will get with wear leveling).

If you want your product to last 8 years (pick a number), then the max data
rate that you can send to the flash chip is "only":
100000 * 1024/(8*365*24*60*60) = 0.4KB/sec!

That's not a lot. This does not even take into account the extra data generated
due to the overhead of any filesystem one may be using. Tack in another 20% for
that (not unusual for JFFS2 system- it depends on write sizes- this assumes a
small write size/write) then the data rate falls to 0.32KB/sec

OR let's say that the system is generating data (that needs to be saved to
flash) at the rate of 10KB/sec (not very high number too), then the life of the
system is only 0.32years! (Yikes!)

Vipin
