From: dwmw2@infradead.org (David Woodhouse)
Date: 18 Feb 2003 15:05:07 +0000
Subject: Grub 0.93 grub-2003-01-08-doc.patch DOC2000 trouble
In-Reply-To: <Pine.LNX.4.44.0302180947080.11781-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
References: <Pine.LNX.4.44.0302180947080.11781-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
Message-ID: <1045580706.2279.2.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-02-18 at 14:53, Ilguiz Latypov wrote:
> On Sat, 15 Feb 2003, Jeb Campbell wrote:
> >          --disable-auto-linux-mem-opt \
> 
> What is this option for?

Presumably it prevents Grub from passing 'mem=xxxx' on the command line
when booting a Linux kernel. This was originally added because Grub was
briefly slightly better at working out the actual amount of memory in
the system.

Then for a long time Linux was much better, but Grub would still pass
its incorrect value on the command line, overriding the kernel's probe.

And now we just disable it and let Linux work it out for itself.

-- 
dwmw2
