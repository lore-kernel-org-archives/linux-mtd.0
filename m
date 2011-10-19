Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGX2h-00055r-6y
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 14:22:51 +0000
Received: by wwj40 with SMTP id 40so1709225wwj.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Oct 2011 07:22:48 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] jffs2: implement mount option parsing and
	compression overriding
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andres Salomon <dilinger@queued.net>
Date: Wed, 19 Oct 2011 17:22:28 +0300
In-Reply-To: <20111016181516.489cbbf9@queued.net>
References: <20111016181516.489cbbf9@queued.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319034155.25389.81.camel@sauron>
Mime-Version: 1.0
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-10-16 at 18:15 -0700, Andres Salomon wrote:
> Currently jffs2 has compile-time constants (and .config options)
> controlling whether or not the various compression/decompression
> drivers are built in and enabled.  This is fine for embedded
> systems, but it clashes with distribution kernels.  Distro kernels
> tend to turn on everything; this causes OpenFirmware to fall
> over, as it understands ZLIB-compressed inodes.  Booting a kernel
> that has LZO compression enabled, writing to the boot partition,
> and then rebooting causes OFW to fail to read the kernel from
> the filesystem.  This is because LZO compression has priority
> when writing new data to jffs2, if LZO is enabled.
> 
> This patch adds mount option parsing, and a single supported
> option ("compr=none").  This adds the flexibility of being
> able to specify which compressor overrides on a per-superblock
> basis.  For now, we can simply disable compression;
> additional flexibility coming soon.

Pushed both to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
