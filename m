Received: from scopuli.esotechnik.de ([79.143.188.15] helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyM7c-0000p7-Vs
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 19:08:51 +0000
Subject: Re: [PATCH v2 0/3] mtd concat device driver
To: Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20180907173515.19990-1-kernel@nospam.obeliks.de>
 <20180907173515.19990-2-kernel@nospam.obeliks.de>
 <7ea0a54e-fc10-8e21-aa2f-864c40297369@nospam.obeliks.de>
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Message-ID: <828f1767-a937-b081-fe9a-447f5b9f0a3b@nospam.obeliks.de>
Date: Fri, 7 Sep 2018 21:08:34 +0200
MIME-Version: 1.0
In-Reply-To: <7ea0a54e-fc10-8e21-aa2f-864c40297369@nospam.obeliks.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

it looks like I didn't even manage to correctly CC the device tree
maintainers and list, which was the main reason for sending out this
second roll. This is getting embarrassing, but I guess I will simply
prepare a 3rd roll and try even harder to send it to the right people
this time (without relying on any script magic).

Of course I'm happy to include any suggestions you have in the meantime.

Sorry for the disturbance!

Best regards,
Bernhard

Am 07.09.2018 um 20:12 schrieb Bernhard Frauendienst:
> Apologies, again, I seem not to be able to handle git-send-mail  > correctly, the cover letter got lost in operation (using 
get_maintainers > on a cover letter is not a good idea). Here it is 
again: > > > Hi everybody, > > when porting my router board from a 
mach-file based OpenWRT target to a > device-tree based target, I found 
that there is no generic way to create > a mtd_concat device from within 
the dts. The following patches attempt > to provide that possibility. > 
 > This is a second roll of that patch series, the first one can be seen 
at > [1]. Apologies for not including the correct recipients in the 
first > roll. > > In this first discussion, concerns were raised that a 
driver for a > "virtual" device like this might have no place in the 
device tree > system. However, I would argue that this very similar to 
specifying the > partitions of a mtd device, which can also done in the 
device tree. In > fact, I believe this is the only way to be able to 
specify the > partitions of such a concat device in the dts file (but 
I'm happy to be > corrected if I'm mistaken). > I have made the example 
in the dt-binding documentation a little bit > more expressive in this 
detail. > > In this second roll I have also addressed all issues that 
reviewers have > brought up so far, hopefully to their satisfaction. > > 
Best Regards > Bernhard > > [1] 
http://lists.infradead.org/pipermail/linux-mtd/2018-September/083832.html 
 > > > Bernhard Frauendienst (3): > mtd: core: add 
get_mtd_device_by_node > dt-bindings: add bindings for mtd-concat 
devices > mtd: mtdconcat: add dt driver for concat devices > > 
.../devicetree/bindings/mtd/mtd-concat.txt | 36 +++++ > 
drivers/mtd/Kconfig | 2 + > drivers/mtd/Makefile | 3 + > 
drivers/mtd/composite/Kconfig | 12 ++ > drivers/mtd/composite/Makefile | 
7 + > drivers/mtd/composite/virt_concat.c | 128 ++++++++++++++++++ > 
drivers/mtd/mtdcore.c | 38 ++++++ > include/linux/mtd/mtd.h | 2 + > 8 
files changed, 228 insertions(+) > create mode 100644 
Documentation/devicetree/bindings/mtd/mtd-concat.txt > create mode 
100644 drivers/mtd/composite/Kconfig > create mode 100644 
drivers/mtd/composite/Makefile > create mode 100644 
drivers/mtd/composite/virt_concat.c >
