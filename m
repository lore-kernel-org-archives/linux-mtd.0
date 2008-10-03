Subject: Re: [JFFS2] Request help on EBS option in Linux-2.6.21.5
From: David Woodhouse <dwmw2@infradead.org>
To: zheng shi <neversetsun@gmail.com>
In-Reply-To: <8f6e22a70810011900x188b2d85j90d125a707a0cf09@mail.gmail.com>
References: <8f6e22a70810011900x188b2d85j90d125a707a0cf09@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 03 Oct 2008 08:03:58 +0100
Message-Id: <1223017438.3328.14.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-10-02 at 10:00 +0800, zheng shi wrote:
> 
> 
> I'm using JFFS2 in linux-2.6.21.5.
> 
> When I enabled JFFS2 summary support (EXPERIMENTAL) option, the EBS
> mechanism did promote mount time.
> But unfortunately files (size>10k) couldn't be written on flash
> permanently, i.e., though cp was done, but when remount the file just
> copied disappeared.

That's strange. Can you reproduce on an empty file system? Just mount it
empty, write the large file, then unmount. Take a snapshot of the
contents of the flash. Then mount it, confirm that the file is missing,
and show me the contents of the flash.

Also, build your kernel with CONFIG_JFFS2_FS_DEBUG=1 and capture all the
debug output (over a serial port) when you mount the offending file
system.

The 2.6.21.5 kernel isn't particularly interesting though -- please try
something more recent, first.

> I have tried -o sync with mount option.

That should make no difference.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
