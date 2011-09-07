Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1NcO-0000bG-0U
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 19:17:04 +0000
Date: Wed, 7 Sep 2011 21:17:41 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs: max 4K writepage size
Message-ID: <20110907191741.GO32018@logfs.org>
References: <CAMjNe_fdRw=5-MjOii8aGfEvejPo-dR6Rpf1=JQf_gMJ3U9jfQ@mail.gmail.com>
	<20110907065621.GL32018@logfs.org>
	<CAMjNe_fd8S08SG45kOASDkUFPMuT0WoOHZ1cGnTqk5pKj7DxgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_fd8S08SG45kOASDkUFPMuT0WoOHZ1cGnTqk5pKj7DxgA@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 September 2011 23:00:30 +0530, srimugunthan dhandapani wrote:
> 
> I was able to do  basic mount-copy-unmount once.
>  Let me test more with multiple mount unmount cycles and see if there
> are problems.

I'm always happy when I can fix bugs.  Though not always happy to
discover that the d*ckhead who created them was me.

> I think we have to give mklogfs /dev/mtdblock0 instead of /dev/mtd0

You can use mtd0 instead of /dev/mtd0, similar to jffs2.  Any /dev/foo
gets interpreted by some common code in the kernel.  As it's not a
block device, mount fails.  mtd0 doesn't start with /dev/, so it must
be special somehow and gets passed to the filesystem.  Jffs2 and logfs
are can then do something with this string.

And yes, this sounds really stupid.  Having /dev/mtd0 do the right
thing would certainly be less confusing than the current state.

> I updated wikipedia with steps to use logfs
> http://en.wikipedia.org/wiki/LogFS

Cool!  Thanks!

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
