From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <403B1DDE.22464.B72D0@localhost>
References: <4034E8ED.5757.55A2D9@localhost>
	 <403B1DDE.22464.B72D0@localhost>
Content-Type: text/plain
Message-Id: <1077624009.7826.266.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Feb 2004 12:00:10 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-24 at 09:48 +0000, simon@baydel.com wrote:
> Comitted the sin of posting a reply with the reply text first, sorry.

And this time you committed the sin of including _far_ more of the
previous mail(s) than was necessary. But I'm not feeling cruel today so
I'll not continue to ignore you :)

> I have only managed to get this to fail if the jffs2 filesystem is mounted as root. I do 
> not seem to be able to get it to close and unmount the filesystem at shutdown. I 
> guess the BLKFLSBUF I do only flushes the buffer that is created when I open the 
> device and not the one that was created when the kernel opened the device. 

JFFS2 doesn't actually _use_ the mtdblock device. If you look closely at
the code, you'll see we never read or write to/from it, we just use the
minor number as an argument to get_mtd_device(). 

In fact, it's perfectly possible to use any _other_ device driver
instead of the mtdblock device, as long as it has the major number which
JFFS2 is looking for. 

I wonder if the rootfs-mounting is opening the _actual_ block device and
doing some I/O, and that's later getting flushed, causing corruption.
Although I can't comprehend why a failed attempt to mount, for example,
ext2 would cause the mtdblock device to consider its buffer _dirty_ and
try to write it back on close.

What happens if you use the 'mtdblock_ro' device instead? That shares
the major number, but doesn't share the caching.


-- 
dwmw2
