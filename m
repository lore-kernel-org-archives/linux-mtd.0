From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Mike Frysinger'" <vapier.adi@gmail.com>,
	"'David Brownell'" <david-b@pacbell.net>
References: <893387.4342.qm@web180301.mail.gq1.yahoo.com>
	<AANLkTi=RqZjXojM0XD0RhYj23fY+zrunFRtFTYGd3POp@mail.gmail.com>
In-Reply-To: <AANLkTi=RqZjXojM0XD0RhYj23fY+zrunFRtFTYGd3POp@mail.gmail.com>
Subject: RE: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
Date: Wed, 11 Aug 2010 17:26:07 +0530
Message-ID: <02b001cb394c$2e7ec9f0$8b7c5dd0$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: dwmw2@infradead.org, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Wed, Aug 11, 2010 at 00:32:00, Mike Frysinger wrote:
> On Tue, Aug 10, 2010 at 09:07, David Brownell wrote:
> >> On Tue, Aug 10, 2010 at 12:47:05, Mike Frysinger wrote:
> >> it is necessary
> >> > that you do these things from kernel space instead of
> >> standard
> >> > userspace.
> >
> > Hard to get userspace to do this stuff if
> > you're doing a network boot, and thus need
> > to have the MAC address working early.. it's
> > easy if the kernel can get the MAC address,
> > else not possible to boot.  Right?
> 
> no, that isnt true at all.  you can easily have a small initramfs to
> handle all of your random setup.  if that's too much overhead, you can
> add a late initcall to your boards file that is run after the MTD
> devices are probed and let that read the required information.  all of
> this is more than documented:
> http://www.denx.de/wiki/view/DULG/EthernetDoesNotWorkInLinux
> 

I looked around in the kernel and found mtd_notifier callbacks which get
called upon addition of MTD device. Inside this callback, I am checking
for the device in which I am interested and doing a mtd->read to get the
MAC address. So this patch can be dropped.

Thanks,
Sudhakar
