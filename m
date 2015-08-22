Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTDY7-00075v-Qq
 for linux-mtd@lists.infradead.org; Sat, 22 Aug 2015 18:29:52 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] nand: pxa3xx: Remove unused platform-data flash
 specification
References: <1440182848-8254-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Sat, 22 Aug 2015 20:25:11 +0200
Message-ID: <87vbc72naw.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> The driver supports board files specificating the flash
> device, by passing a pxa3xx_nand_flash struct (with
> flash parameters) in the platform data struct.
>
> Currently this support is not being used by any board file.
> Moreover, we'd like to deprecate such usage in favor of
> using the device table in nand_ids.c.
>
> So let's remove the ad-hoc flash specification.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

-- 
Robert
