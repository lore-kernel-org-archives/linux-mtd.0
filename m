Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZfyP-0003Bx-Uq
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 09:13:18 +0000
Received: by pzk28 with SMTP id 28so1146612pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 02:13:15 -0700 (PDT)
Subject: Re: "warning!: only 995 of 1984 eraseblocks have valid erase counter"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
Date: Thu, 23 Jun 2011 12:14:01 +0300
In-Reply-To: <o4krv69m77vomji84cs3flljf6obpgfgcs@4ax.com>
References: <o4krv69m77vomji84cs3flljf6obpgfgcs@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308820444.19443.0.camel@sauron>
Mime-Version: 1.0
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

On Sun, 2011-06-19 at 12:37 +0200, Gilles wrote:
> Hello
> 
> 	After "make" built rootfs.ubifs, I ran ubinize before uploading the
> file to a web server.
> 
> I then downloaded that file on a uClinux appliance, and ran the
> following command to format /dev/mtd2 with the image:
> =========
> ubiformat /dev/mtd2 -s 512 -f rootfs.ubi.img
> =========
> 
> This command triggers the following warning:
> =========
> ...
> libscan: scanning eraseblock 1982 -- 99 % complete  MTD_ioctl
> MTD_read
> libscan: scanning eraseblock 1983 -- 100 % complete  MTD_ioctl
> MTD_read
> 
> ubiformat: 995 eraseblocks have valid erase counter, mean value is 14
> ubiformat: 989 eraseblocks are supposedly empty
> ubiformat: warning!: only 995 of 1984 eraseblocks have valid erase
> counter
> ubiformat: mean erase counter 14 will be used for the rest of
> eraseblock
> ubiformat: continue? (yes/no)
> =========
> 
> Running just "ubiformat /dev/mtd2 -s 512" triggers the same warning.
> 
> I don't know what the warning really means, and what the consequences
> are when answering "yes". Could someone tell me?

I think it is self-explanatory. Please, ask specific question. WRT to
consequences - it should not be critical.

-- 
Best Regards,
Artem Bityutskiy
