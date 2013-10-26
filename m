Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Va0Td-0005gk-PW
 for linux-mtd@lists.infradead.org; Sat, 26 Oct 2013 09:48:14 +0000
Received: by mail-wg0-f49.google.com with SMTP id x12so4896095wgg.16
 for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2013 02:47:52 -0700 (PDT)
Message-ID: <1382780870.5901.20.camel@karhu.quadriga.com>
Subject: Re: [PATCH] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Sat, 26 Oct 2013 10:47:50 +0100
In-Reply-To: <1379470659-12158-1-git-send-email-b32955@freescale.com>
References: <1379470659-12158-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-09-18 at 10:17 +0800, Huang Shijie wrote:
> -	if (ubi->mtd->numeraseregions != 0) {
> +	if (ubi->mtd->numeraseregions > 1) {

The purpose of this code is to refuse "composite" mtd devices, simply
because UBIFS authors never had any of them and did not know how to deal
with them.

numeraseregions == 0 means "no erase regions". This is the ABI, as we
expose this piece of information via sysfs, see
"Documentation/ABI/testing/sysfs-class-mtd".

numeraseregions > 1 means that this is some kind of a composite flash
consisting of several regions with different eraseblock sizes. I've
never saw these, but I guess there is always one large "main" region and
some small special-purpose regions.

What is 'numeraseregions == 1'? How is it different to 'numeraseregions
== 0'?

Is the "main" area covered by mtd->size, or 'mtd->size' spans the entire
chip and includes all the regions?

What is the flash you are dealing with? Surely this is not gpmi-nand?

-- 
Best Regards,
Artem Bityutskiy
