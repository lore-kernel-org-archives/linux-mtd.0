Received: from mika.eatserver.nl ([195.20.9.75])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9a3g-0004BD-Ir
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 08:34:21 +0000
Message-ID: <4BE12D86.2070605@aimvalley.nl>
Date: Wed, 05 May 2010 10:34:14 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>
Subject: Re: Some questions on bit-flips and JFFS2
References: <201005031505.18604.muehlfelder@enertex.de>
	<4BDFE8D6.1050704@aimvalley.nl>
	<201005041659.26262.muehlfelder@enertex.de>
In-Reply-To: <201005041659.26262.muehlfelder@enertex.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thorsten Mühlfelder wrote:

.
.
.

>> Maybe, as said check/ask your hardware supplier.
>> Maybe "refreshing" the block helps (that is saving the data, erasing the
>> block(s) and reprogramming all data). You could try this.
> 
> I've already thought about something like this:
> 1. After first succesful bootup dump a mtd0 image and calculate a md5sum of 
> it:
> nanddump -o -b -f mtd0.img /dev/mtd0
> 2. Before each shutdown dump the image again and check if the md5sum has 
> changed.
> 3. If it has changed write the initial dump back:
> flash_eraseall /dev/mtd0
> nandwrite -p /dev/mtd0 mtd0.img
> 
> Would this be the right method?
> 


yes that's the idea, given that "refreshing" really helps to prevent
(actually delay) future read disturbs.

But this won't work well. nanddump doesn't tell you the single=corrected
bit errors.
Only if there's an uncorrectable error (2 or more bits flip) a change will
be detected and the data will be refreshed. A read disturb tends to be
unstable though, meaning sometimes it's there and sometimes not.
This means you may miss an uncorrectable error (2 bits flip).

Another problem is a sudden reboot (e.g. crash or power-loss). There's no
check then.

It much more easier to let UBI/UBIFS deal with this suff. It's designed for
this.
u-boot support UBIFS (read-only). This means you can put a kernel image
on UBIFS and make u-boot read/boot it.


hth,
Norbert van Bolhuis.
