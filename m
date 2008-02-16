Subject: Re: jffs2 console printk storm
From: David Woodhouse <dwmw2@infradead.org>
To: Erez Zadok <ezk@cs.sunysb.edu>
In-Reply-To: <200802142216.m1EMGLDo032715@agora.fsl.cs.sunysb.edu>
References: <200802142216.m1EMGLDo032715@agora.fsl.cs.sunysb.edu>
Content-Type: text/plain
Date: Sat, 16 Feb 2008 13:52:32 +0000
Message-Id: <1203169952.31173.110.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-02-14 at 17:16 -0500, Erez Zadok wrote:
> Hi David,
> 
> This has been a problem I've seen for a while.  I've generated a jffs2 image
> of an empty directory (I don't recall the version of the jffs2 utils I've
> used to generate it).  I mount the jffs2 image something like this:
> 
> # cp jffs2-empty.img /tmp/fs.0
> # losetup /dev/loop0 /tmp/fs.0
> # modprobe block2mtd block2mtd=/dev/loop0,128ki
> # mount -t jffs2 mtd0 /n/lower/b0
> 
> Then I start running my tests in it (in /n/lower/b0).  I get a lot of these
> two kinds of console printk messages (esp. the first one):
> 
>   CLEANMARKER node found at 0x00810000, not first node in block (0x00800000)
>   Empty flash at 0x0080ff70 ends at 0x00810000
> 
> I don't know how serious the messages are, but jffs2 seems to work fine for
> me even with those many kernel messages scrolling off of my screen.

Your image is built with the wrong eraseblock size -- mkfs.jffs2
defaults to 64KiB eraseblocks, and you seem to have used that default,
but your flash "device" has 128KiB eraseblocks, since that's the
argument you gave to block2mtd.

Recreate your image with -e128KiB, or change the eraseblock size on your
virtual device.

-- 
dwmw2
