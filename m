From: David Woodhouse <dwmw2@infradead.org>
To: Michael <xemc@yahoo.com>
In-Reply-To: <20041217231645.79122.qmail@web52701.mail.yahoo.com>
References: <20041217231645.79122.qmail@web52701.mail.yahoo.com>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 12:39:26 +0000
Message-Id: <1103632766.6111.74.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Rootfs choice ideas
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-12-17 at 15:16 -0800, Michael wrote:
> And we can modify files freely.

Yes but you don't _have_ to modify files freely. You can exercise a
little restraint :)

> However, there seem to be some disadvantages:
>  1. Instead of versioning a fixed filesystem image (which you could
> do  with cramfs or initrd), you now manage a collection of files
> each of which could change independently.

Yes. This is usually done in packages -- by RPM or more usefully on an
embedded system by something smaller like ipkg. Take a look at the
Familiar distribution.

>  2. It would be hard or impractical to check the entire image for
> consistency, as you could with a cramfs image.

'rpm -Vva'

Not sure if ipkg stores checksums of the installed files.

>  3. I could perhaps run into problems when updating it, for
> instance if the update fails part-way through.

You reattempt the update after you come back up.

>  4. There seems to be some overhead in scanning the rootfs at boot
> time (yeah, there are recent changes that speed this up), and
> garbage collection running in the background. (which is a seperate
> issue)

These are true. We're trying to improve it.

> So, it's acting very much like a desktop (which can possibly
> develope cruft), and very little like an embedded device (which
> typically can't change).
> 
> Does anyone share some of these same concerns (or perhaps others as
> well)?  What schemes have you used or seen, and how do they
> compare?

Basically it's up to you -- if you can manage to live with a read-only
file system, as presumably you could since you seem to consider
writeability a disadvantage, then you might as well stick with cramfs.

-- 
dwmw2
