Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LV09e-0006uf-Li
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 09:04:17 +0000
Message-ID: <498AAE92.9090100@nokia.com>
Date: Thu, 05 Feb 2009 11:17:06 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: 3GB limit? *2* GB limit?!
References: <oqvdrrrpaf.fsf@castrovalva.Ivy.NET>	<1233733240.5138.28.camel@localhost.localdomain>
	<8bd0f97a0902040754j1ed15757gfcf1e03fdd8083d2@mail.gmail.com>
In-Reply-To: <8bd0f97a0902040754j1ed15757gfcf1e03fdd8083d2@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Miles Nordin <carton@ivy.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> On Wed, Feb 4, 2009 at 02:40, Artem Bityutskiy wrote:
>> On Tue, 2009-02-03 at 19:58 -0500, Miles Nordin wrote:
>>> -----8<-----
>>> # uname -a
>>> Linux fishstick 2.6.25-gentoo-r8 #2 SMP PREEMPT Wed Feb 4 05:23:36 UTC 2009 i686 AMD Phenom(tm) 9850 Quad-Core Processor AuthenticAMD GNU/Linux
>>> # ls -l /dev/mtd*
>>> ls: cannot access /dev/mtd*: No such file or directory
>>> # modprobe block2mtd block2mtd=/dev/sdj,128KiB
>>> # modprobe mtdchar
>>> # ls -l /dev/mtd*
>>> crw-rw---- 1 root root 90, 0 Feb  4 06:29 /dev/mtd0
>>> crw-rw---- 1 root root 90, 1 Feb  4 06:29 /dev/mtd0ro
>>> fishstick devices # ubiformat /dev/mtd0
>>> ubiformat: mtd0 (RAM-based), size 3246391296 bytes (3.0 GiB), 131072 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 1 bytes
>>> libscan: scanning eraseblock 16384 -- 66 % complete  libmtd: error!: cannot seek mtd0 to offset 18446744071562067968
>>>         error 22 (Invalid argument)
>>> ubiformat: error!: failed to scan mtd0 (/dev/mtd0)
>>> # fdisk /dev/sdj
>>> Device contains neither a valid DOS partition table, nor Sun, SGI
>> MTD user-space interface is 32-bit, and is simited by 2GiB. You have to
>> upgrade it to use larger devices.
> 
> you mean the MTD user-space code he is currently using, not current
> MTD user-space in general ?
> -mike

>From 2.6.29, the internal MTD API will support 64-bit sizes,
however, presently it only supports 32-bits (probably only 1GiB
safely).

However, in any case, the MTD ioctls use unsigned 32-bit integers
for sizes, so they must be hacked or 64-bit ioctls added to use
MTD's that are 4GiB or over.
