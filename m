Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oiu5e-0005we-HJ
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 19:02:23 +0000
Received: by wyf19 with SMTP id 19so9093092wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 12:02:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <893387.4342.qm@web180301.mail.gq1.yahoo.com>
References: <893387.4342.qm@web180301.mail.gq1.yahoo.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 10 Aug 2010 15:02:00 -0400
Message-ID: <AANLkTi=RqZjXojM0XD0RhYj23fY+zrunFRtFTYGd3POp@mail.gmail.com>
Subject: Re: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
To: David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 10, 2010 at 09:07, David Brownell wrote:
>> On Tue, Aug 10, 2010 at 12:47:05, Mike Frysinger wrote:
>> it is necessary
>> > that you do these things from kernel space instead of
>> standard
>> > userspace.
>
> Hard to get userspace to do this stuff if
> you're doing a network boot, and thus need
> to have the MAC address working early.. it's
> easy if the kernel can get the MAC address,
> else not possible to boot. =C2=A0Right?

no, that isnt true at all.  you can easily have a small initramfs to
handle all of your random setup.  if that's too much overhead, you can
add a late initcall to your boards file that is run after the MTD
devices are probed and let that read the required information.  all of
this is more than documented:
http://www.denx.de/wiki/view/DULG/EthernetDoesNotWorkInLinux

i still see these callbacks as unnecessary overhead to solve problems
that can already be done multiple ways with existing code.
-mike
