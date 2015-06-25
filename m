Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8Alk-0007KS-3G
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 17:16:57 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/6] mtd: docg3: Don't do ERR_PTR(0)
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-7-git-send-email-richard@nod.at>
 <20150617184144.GH4917@ld-irv-0074> <5588FC61.5070202@nod.at>
 <871th2kvia.fsf@belgarion.home> <20150625022940.GT4917@ld-irv-0074>
Date: Thu, 25 Jun 2015 19:14:18 +0200
In-Reply-To: <20150625022940.GT4917@ld-irv-0074> (Brian Norris's message of
 "Wed, 24 Jun 2015 19:29:40 -0700")
Message-ID: <87wpyrk8wl.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, maximlevitsky@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> Hi Robert,
>
> On Tue, Jun 23, 2015 at 10:41:33PM +0200, Robert Jarzmik wrote:
>> Richard Weinberger <richard@nod.at> writes:
>> 
>> > Am 17.06.2015 um 20:41 schrieb Brian Norris:
>> >> Have you tested this patch?
>> >
>> > nah, I don't own such a device.
>> But I do. If you resend a patch, please Cc me. You can even ask for a test from
>> time to time if you want a confirmation, I have a 2 floors docg3 device.
>
> Do you want to be on a MAINTAINERS entry for this driver?
Sure.

Here is the patch, after the scissors.

Cheers.

-- 
Robert

---8<---
>From 20002639eac1bd7a81b0613c4bd15ae7522c269d Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 25 Jun 2015 19:07:48 +0200
Subject: [PATCH] MAINTAINERS: mtd: docg3: add docg3 maintainer

Add myself as maintainer of the NAND based MSystems DiskOnChip G3
driver.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aca2886..87d87c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6687,6 +6687,12 @@ T:	git git://linuxtv.org/anttip/media_tree.git
 S:	Maintained
 F:	drivers/media/usb/msi2500/
 
+MSYSTEMS DISKONCHIP G3 MTD DRIVER
+M:	Robert Jarzmik <robert.jarzmik@free.fr>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/devices/docg3*
+
 MT9M032 APTINA SENSOR DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
-- 
2.1.4
