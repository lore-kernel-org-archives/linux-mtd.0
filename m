Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WU9zi-0002k7-L9
 for linux-mtd@lists.infradead.org; Sun, 30 Mar 2014 07:17:27 +0000
From: Leon Pollak <leonp@plris.com>
To: linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: What is wrong? - Cont
Date: Sun, 30 Mar 2014 10:16:51 +0300
Message-ID: <1762128.E80Aghzg1W@leonp.plris.com>
In-Reply-To: <20500571.Fgyz0I6ATm@leonp.plris.com>
References: <4315632.KkRm7kzq26@leonp.plris.com>
 <20140304083325.GJ13420@norris-Latitude-E6410>
 <20500571.Fgyz0I6ATm@leonp.plris.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Meanwhile, some more inputs:

First, to remind, the scenario:
After the first burning (from withing U-Boot), the NAND is write 
protected by HW and the partition is mounted as RO.
At some moment I need to update a small file. 
So I do: 
- HW write protect off, 
- remount RW, 
- update file, <---- The main point  <----
- sync, 
- remount RO, 
- write protect on.
At this moment, the console is full of error messages - crash or a lot 
of "Erase at 0x..... failed immediately: errno -5".
-------------------------------

Now two more test cases:

1. After burning JFFS2 from U-Boot and STILL WITHOUT working from flash, 
I boot into NFS, mount the partition as RW, keep it for 3-5 seconds and 
reboot into flashes.
This works FINE, updating passes silently, no crazy messages and/or 
crashes.

2. I added to the partition a flag file "first_time.dat" and in rc3.d 
added script:
if [ -e first_time.dat ] ; then
    'HW unlock flash'
    mount -o,remount,rw /home
    sleep 20
    mount -o,remount,ro /home
    'HW lock flash';
    rm first_time.dat
fi
Against my hopes, this DOES NOT helped. Crashes and messages appeared as 
"usual"....


Any help will be highly appreciated.
-- 
Leon
