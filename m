Received: from mail05b.webhosting-verizon.net ([209.238.3.61])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17NHPg-0002Tu-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 19:21:08 +0100
From: "David Cooper" <david@forcedpotato.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Ilguiz Latypov" <ilatypov@superbt.com>,
	"Linux MTD" <linux-mtd@lists.infradead.org>
Subject: RE: X Windows Performance with DOC 2000 
Date: Wed, 26 Jun 2002 14:30:10 -0400
Message-ID: <AIEOIMKIOAAJKHJOGAEFMEGFCEAA.david@forcedpotato.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <16562.1024643052@redhat.com>
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

I tried using SysRq-P (after attempting a "mount" of the DoC once X is
running from the IDE) and it shows me the registers and so forth but I am
yet to decipher this into which instructions are causing the problem (I need
to work on it further).

In the meantime, I tried using the latest M-Systems driver just for fun.
This does allow X to run from the DoC.  Looks like there is some conflict
(for me anyway) between X and the MTD driver.

I'll keep proding away.

Cheers,

David Cooper
-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of David Woodhouse
Sent: Friday, June 21, 2002 3:04 AM
To: David Cooper
Cc: Ilguiz Latypov; Linux MTD
Subject: Re: X Windows Performance with DOC 2000



david@forcedpotato.com said:
>  - Mount operation mount /dev/nftla2 /mnt/doc causes the shell to
> hang. - Viewing the process "mount" using top shows that it is running
> continuously and using 84% CPU time. - All attempts to kill the mount
> process are futile.

OK, here we can find some clues. _What_ is it doing? Use SysRq-P a few
times to see where it's looping, look it up in your kernel image. If you
compile with '-g' you can get gdb to tell you the precise line.

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
