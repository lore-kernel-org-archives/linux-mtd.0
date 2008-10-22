Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KsfBC-0007TW-72
	for linux-mtd@lists.infradead.org; Wed, 22 Oct 2008 14:59:22 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2866576rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Oct 2008 07:59:20 -0700 (PDT)
Message-ID: <8bd0f97a0810220759h837794eo76c4413d6072dcf9@mail.gmail.com>
Date: Wed, 22 Oct 2008 10:59:20 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Bryan Wu" <cooloney@kernel.org>
Subject: Re: [BUG] re-modprobe a nand controller driver module will cause
	system crash.
In-Reply-To: <386072610810212024l52cd86cen79061d7111c421ba@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <386072610810160356p3807f538la5087debe0c76866@mail.gmail.com>
	<386072610810212024l52cd86cen79061d7111c421ba@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2008 at 23:24, Bryan Wu wrote:
> Did anyone meet this issue before?

actually i think we can see the same issue with the m25p80 driver ?
if i build it as a module and load/unload it, it crashes with same
name errors ...

root:/> rmmod m25p80
root:/> modprobe m25p80
m25p80 spi0.2: w25x10 (128 Kbytes)
Creating 3 MTD partitions on "m25p80":
0x00000000-0x00040000 : "bootloader(spi)"
mtd: partition "bootloader(spi)" extends beyond the end of device
"m25p80" -- size truncated to 0x20000
kobject_add_internal failed for 31:0 with -EEXIST, don't try to
register things with the same name in the same directory.
<crash message>
-mike
