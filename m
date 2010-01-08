Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTCq1-0002kG-P3
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 11:17:10 +0000
Received: by pzk31 with SMTP id 31so11594905pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 03:17:04 -0800 (PST)
MIME-Version: 1.0
From: Shweta Shetty <shyamashweta@gmail.com>
Date: Fri, 8 Jan 2010 16:46:44 +0530
Message-ID: <c58fcbf21001080316j4ff51fe6wcb20eefd0d57e101@mail.gmail.com>
Subject: Ubi2- using NandSim for simulating flash and mounting ubi.
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

To test ubi2 we intend to use NANDSIM. However we are facing certain problems.

>From what we have understood, the method of using NANDSIM is :
1>create an empty flash device (By default this uses the ram memory
but we can allocate other by the cache_file option)
2>mount ubi on it
3>mount ubifs on it
=> (Here we can load the previously stored image)
4>use it
5>while unmounting save the image on permanant storage

So as we can see, though NANDSIM can be effectively used for
simulating flash , it is of limited use in our project for testing
mount time as every time only the empty device is mounted.

>From the ubi code that we have now studied , there is a flag set for
an empty device and in such case , all the system does is that it
initialises all its data structures.Hence we cannot show the
performance of our project on NANDSIM.

Our we missing some crucial point?
We would be grateful for clarification.


-- 
Shweta Shetty
http://shweta-kaleidoscope.blogspot.com/
Humility is a strange thing. The minute you know you have got it you
have lost it.
