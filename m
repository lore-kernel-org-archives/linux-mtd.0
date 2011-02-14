Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PowCr-00006D-GF
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 11:03:02 +0000
Received: by wwb17 with SMTP id 17so4793251wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2011 03:02:59 -0800 (PST)
Subject: Re: mount ubi volume fails: No such device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lh_post@yahoo.com>
In-Reply-To: <953130.73844.qm@web30208.mail.mud.yahoo.com>
References: <953130.73844.qm@web30208.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Feb 2011 13:01:49 +0200
Message-ID: <1297681309.2854.16.camel@localhost>
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

On Mon, 2011-02-14 at 00:49 -0800, Lars Michael wrote:
> Here is how i made the UBI image:
> ./mkfs.ubifs -m 2048 -e 126976 -c 874 -v -Q -r ./rootfs rootfs.img
> ./mkfs.ubifs -m 2048 -e 126976 -c 36 -v -Q -r ./progfs progfs.img
> ./mkfs.ubifs -m 2048 -e 126976 -c 49 -v -Q -r ./datafs datafs.img
> ubinize -o ubi.img -p 128KiB -m 2048 -v ubi-config.ini

You also need to give this parameter to UBI: 
vid_hdr_offs=2048

I.e., modprobe ubi mtd=1 vid_hdr_offs=2048

Or if UBI is compiled-in, boot with the following kernel argument:

ubi.vid_hdr_offs=2048

With this option UBI will not use sub-pages at all. I think it makes
sense for  you to try how it works this way.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
