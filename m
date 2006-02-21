Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBWHD-0002Kb-IS
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 07:06:17 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <43FB00B4.9040706@yandex.ru>
References: <43EB96DC.3030900@eptar.com> <43F74BF1.1080307@ru.mvista.com>
	<1140337326.2480.674.camel@localhost.localdomain>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<43FB00B4.9040706@yandex.ru>
Content-Type: text/plain
Date: Tue, 21 Feb 2006 13:06:53 +0100
Message-Id: <1140523614.2480.931.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>,
	Charles Manning <manningc2@actrix.gen.nz>,
	Vitaly Wool <vwool@ru.mvista.com>, yaffs@stoneboat.aleph1.co.uk,
	linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-02-21 at 14:59 +0300, Artem B. Bityutskiy wrote:
> Thomas Gleixner wrote:
> > Wake up please. Thats going to be reality for NAND based stuff in the
> > future. The controllers will expose the raw FLASH but claim the OOB area
> > for their own purpose - hardware based error correction.
> One of my colleagues said a very interesting argument against this.
> 
> Look, consider all those CompactFlash cards. They are NAND flash based. 
> They have a kind of block device emulation built-in. And I bet they use 
> OOB to store the logical block number corresponding to this physical 
> block. The block device over Flash device emulation is so widespread, so 
> vendors will never forbid OOB usage.

I did nowhere say, that oob usage will be forbidden.

>  From this point of view, OOB is no going to go.

The CF controller does its own closed proprietary magic and looking at
the robustness of those cards I dont want to know what it does.

The OOB usage of a closed device is in no way relevant for a discussion
about a robust, sane and quite generic solution for handling NAND flash
devices inside of Linux.

I don't care what those chips do unless they run Linux inside.

	tglx
