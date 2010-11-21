Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJxNS-00029o-7W
	for linux-mtd@lists.infradead.org; Sun, 21 Nov 2010 00:01:54 +0000
Received: by wyf22 with SMTP id 22so5898696wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 Nov 2010 16:01:51 -0800 (PST)
Date: Sun, 21 Nov 2010 01:01:47 +0100
From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: block2mtd and ubi
Message-ID: <20101121000145.GF9645@vicerveza.homeunix.net>
References: <20101120175856.GD9645@vicerveza.homeunix.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20101120175856.GD9645@vicerveza.homeunix.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 20, 2010 at 06:58:56PM +0100, Lluís Batlle i Rossell wrote:
> Hello,
> 
> I'm trying to use the qemu mipsel malta board to boot an ubifs image, prepared
> with 'ubinize', and using block2mtd on /dev/hda, where qemu receives the image
> through -hda ubifs.img.
> 
> The problem I have summarizes in this UBI complain while booting:
> block2mtd: mtd0: [/dev/hda] erase_size = 512KiB [524288]
> UBI: attaching mtd0 to ubi0
> UBI: physical eraseblock size:   524288 bytes (512 KiB)
> UBI: logical eraseblock size:    524160 bytes
> UBI: smallest flash I/O unit:    1
> UBI: VID header offset:          64 (aligned 64)
> UBI: data offset:                128
> UBI warning: check_what_we_have: 1008 PEBs are corrupted
> corrupted PEBs are: 0 1 2 3 4 5 6 7 .....
> UBI error: check_what_we_have: too many corrupted PEBs, refusing this device
> UBI error: ubi_init: cannot attach mtd0
Solved!

The first PEBs were corrupt because I was using 'dd' wrong. Nevertheless,
filling the rest of image with zeros gave corrupt PEBs on the rest. joer on #mtd
(oftc irc) helped me suggesting maybe 0xff would work. And appending 0xff
instead of 0x00 worked great.

It's a pity that the same 'ubinize' cannot do that job automatically, and give
an image filling all the memory blocks. That would easy down a lot the job for
block2mtd.

Regards,
Lluís.
