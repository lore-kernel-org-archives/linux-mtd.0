Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnoUE-0008Pi-VU
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 08:04:03 +0000
Received: by bwz13 with SMTP id 13so6203735bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 01:04:00 -0700 (PDT)
Subject: Re: mtdchar : writing image with oob and NOP=1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C56801D.3040300@parrot.com>
References: <4C56801D.3040300@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 11:02:31 +0300
Message-ID: <1282636951.24044.132.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-02 at 10:21 +0200, Matthieu CASTET wrote:
> Hi,
> 
> We need to write our bootloader with a special ecc (use by cpu rom).
> 
> For that we use MTD_MODE_RAW, write and MEMWRITEOOB. This work fine, but 
> from my understanding this will do a first page program with oob set to 
> 0xff and then program again oob.
> 
> But some recent nand support only 1 program per page (NOP=1).
> How can we program nand with NOP=1 with a custom ecc ?
> 
>  From what I see in mtdchar either datbuf is set (and oobbuf is null) or 
> oobbuf is set (and datbuf is null).
> 
> So this mean we need to add an ioctl to do that ?

Certainly not ioctl. MEMWRITEOOB should handle this and hide from users,
I think.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
