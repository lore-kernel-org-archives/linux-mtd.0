Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm5TG-000095-5Q
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 14:20:11 +0000
Received: by eyd9 with SMTP id 9so1797144eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 06:20:08 -0800 (PST)
Subject: Re: mount ubi volume fails: No such device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lh_post@yahoo.com>
In-Reply-To: <194189.91256.qm@web30207.mail.mud.yahoo.com>
References: <194189.91256.qm@web30207.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 16:19:14 +0200
Message-ID: <1297001954.4460.2.camel@localhost>
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

On Mon, 2011-01-31 at 02:35 -0800, Lars Michael wrote:
> Hi,
> 
> I am trying to mount an UBI volume, but it fails:
> 
> # mount -t ubifs ubi0_0 /mnt/ubi
> mount: mounting ubi0_0 on /mnt/ubi failed: No such device
>  
> Using mkfs.ubifs and ubinize I have prepared an image containing three
> volumes. On the target I have used ubiformat to flash the image and
> ubiattach to attach to mtd1.
> 
> Target kernel: 2.6.29, platform m68k (mcf54418). The UBI tools on the
> host are built from git://git.infradead.org/mtd-utils.git.
> 
> Everything looks fine to me, see below, but how do I mount a volume? I
> have tried various ways to refer to the device (like ubi0:datafs,
> ubi0_0) without luck.
> 
> Thanks for any help!

Do you have ubifs in /proc/filesystems?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
