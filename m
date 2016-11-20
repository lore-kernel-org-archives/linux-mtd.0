Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8On4-0008NA-7d
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 09:52:02 +0000
Date: Sun, 20 Nov 2016 10:51:41 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ralf Schlatterbeck <rsc@runtux.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: init_constants_early: too small LEBs?
Message-ID: <20161120105141.69e66105@bbrezillon>
In-Reply-To: <20161119212508.GA5237@runtux.com>
References: <20161119212508.GA5237@runtux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ralf,

On Sat, 19 Nov 2016 22:25:08 +0100
Ralf Schlatterbeck <rsc@runtux.com> wrote:

> I'm trying to get an ubifs on a 2MB NOR flash.
> 
> I'm following the usual steps for generating everything from inside the 
> embedded system:
> ubiformat /dev/mtd7
> ubiattach /dev/ubi_ctrl -m 7 -d 7
> ubimkvol /dev/ubi7 -N testvol -s 1968KiB
> 
> But when I try to mount I'm getting:
> # mount -t ubifs /dev/ubi7_0 /mnt/
> mount: mounting /dev/ubi7_0 on /mnt/ failed: Invalid argument
> 
> and the kernel log tells me:
> Nov 19 21:07:33 board kernel: UBIFS error (pid 1504):
> init_constants_early: too small LEBs (3968 bytes), min. is 15360 bytes
> 
> Any advice on what to try next?
> 
> Should I use a jffs2 on top of UBI using gluebi or run jffs2 on the
> naked md device instead?

Why not putting JFFS2 directly on your MTD device (no UBI in the
middle).

> I'd really like to be bad block tolerant but
> don't know if this makes sense with NOR-Flash (of this size) at all.

You shouldn't need UBI, AFAIR, JFFS2 already deals with
wear-leveling/bad-block problems.

Regards,

Boris
