Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qei8c-0005Nw-8e
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 06:32:40 +0000
Received: by pwi3 with SMTP id 3so581643pwi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 23:32:35 -0700 (PDT)
Subject: Re: Attaching ubifs on a NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alex Levin <s.alex.levin@gmail.com>
Date: Thu, 07 Jul 2011 09:33:38 +0300
In-Reply-To: <CAALhOvBcocpY7igrzcsTyUPdPFZoJ+AkJ+X1LrWVBMjHs0CQLg@mail.gmail.com>
References: <CAALhOvBcocpY7igrzcsTyUPdPFZoJ+AkJ+X1LrWVBMjHs0CQLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310020422.3149.107.camel@sauron>
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

On Wed, 2011-07-06 at 17:34 +0300, Alex Levin wrote:
> Hi,
> 
> after ubiformatting the flash (NOR) and trying to attach ubi I get the
> following error:
> 
> UBI: attaching mtd2 to ubi0
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> UBI: logical eraseblock size:    262016 bytes
> UBI: smallest flash I/O unit:    1
> UBI: VID header offset:          64 (aligned 64)
> UBI: data offset:                128
> UBI warning: ubi_scan: 2 PEBs are corrupted
> corrupted PEBs are: 0 1
This is the reason. Most probably you did not format it properly.
Please, tell how exactly you formatted it, check dmesg, take a look here
for some hints:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy
