Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvW2-0004Xo-5K
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:21:15 -0400
Message-ID: <433BC08C.2030302@inf.u-szeged.hu>
Date: Thu, 29 Sep 2005 12:23:08 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <433A640D.6030200@cetrtapot.si>
	<433BA402.3040703@inf.u-szeged.hu>	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
In-Reply-To: <433BBB19.9060905@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:

> Ferenc Havasi wrote:
>
>> The first way stores a reference in the first (usable) erase block. (If
>> it is not free, it moves the data to somewhere else, and reserve). It
>> stores only a reference to it at umount, and a "mount-log" at mount
>> (just to mark that it is invalid in case of unclean umount). It means
>> one page write at mount, one page write at umount. If the erase block
>> consist 16 pages than it is necesarry to erase the first erase block
>> after every 8 mounts. So the typical timelife of it is about 8*100.000
>> mounting, I think it is big enough.
>
> This spoils the overall wear-leveling, which is no good. But should work.

It concept of goodness is subjective. IMHO if someting has such a design
what works well and fit to the concept of the real thing (the flash)
that is good.

>> The other way is to specify the cenratlized summary information with
>> mount option (not to use the first erase block to store this pointer).
>> In this case some other system have to store it (typically on an other
>> file system), and the new location after umount can be read using sysfs.
>
> This also spoils wear-levelling...

It think it is the method which is really does not spoil the
wear-leveling. The selection of the storing place uses exactly the same
function what JFFS2 uses to store any other data.

> And I don't like CS in general as it is not tolerant to unclean
> reboots... Albeit, if this does not matter to a specific system - this
> will work.

Yes, CS was designed for clean umounts. And it can be combinated with
EBS, too.

> Nevertheless, I don't believe CS will make JFFS2 usable on 256MB
> flashes, due to memory consumprion issues. Nor it will not (IMO) make
> it scalable, which is sad :-(

Yes, it does not solve the memory problems of JFFS2. It is yet another
mount time speed up.

Bye,
Ferenc
