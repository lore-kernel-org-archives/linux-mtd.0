Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKRWY-0000ph-H5
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 08:13:19 +0000
Received: by bwz5 with SMTP id 5so6079781bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Nov 2010 00:13:16 -0800 (PST)
Subject: Re: block2mtd and ubi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>
In-Reply-To: <20101121000145.GF9645@vicerveza.homeunix.net>
References: <20101120175856.GD9645@vicerveza.homeunix.net>
	<20101121000145.GF9645@vicerveza.homeunix.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Nov 2010 10:12:42 +0200
Message-ID: <1290413562.2289.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-11-21 at 01:01 +0100, Lluís Batlle i Rossell wrote:
> On Sat, Nov 20, 2010 at 06:58:56PM +0100, Lluís Batlle i Rossell wrote:
> > Hello,
> > 
> > I'm trying to use the qemu mipsel malta board to boot an ubifs image, prepared
> > with 'ubinize', and using block2mtd on /dev/hda, where qemu receives the image
> > through -hda ubifs.img.
> > 
> > The problem I have summarizes in this UBI complain while booting:
> > block2mtd: mtd0: [/dev/hda] erase_size = 512KiB [524288]
> > UBI: attaching mtd0 to ubi0
> > UBI: physical eraseblock size:   524288 bytes (512 KiB)
> > UBI: logical eraseblock size:    524160 bytes
> > UBI: smallest flash I/O unit:    1
> > UBI: VID header offset:          64 (aligned 64)
> > UBI: data offset:                128
> > UBI warning: check_what_we_have: 1008 PEBs are corrupted
> > corrupted PEBs are: 0 1 2 3 4 5 6 7 .....
> > UBI error: check_what_we_have: too many corrupted PEBs, refusing this device
> > UBI error: ubi_init: cannot attach mtd0
> Solved!
> 
> The first PEBs were corrupt because I was using 'dd' wrong. Nevertheless,
> filling the rest of image with zeros gave corrupt PEBs on the rest. joer on #mtd
> (oftc irc) helped me suggesting maybe 0xff would work. And appending 0xff
> instead of 0x00 worked great.
> 
> It's a pity that the same 'ubinize' cannot do that job automatically, and give
> an image filling all the memory blocks. That would easy down a lot the job for
> block2mtd.

Use ubiformat - it should get it right:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_flash_img

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
