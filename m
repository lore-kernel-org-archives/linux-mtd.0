Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBWBw-00024D-ON
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 07:00:32 -0500
Message-ID: <43FB00B4.9040706@yandex.ru>
Date: Tue, 21 Feb 2006 14:59:48 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <43EB96DC.3030900@eptar.com>
	<43F74BF1.1080307@ru.mvista.com>	<1140337326.2480.674.camel@localhost.localdomain>	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
In-Reply-To: <1140471467.2480.793.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>,
	Charles Manning <manningc2@actrix.gen.nz>,
	Vitaly Wool <vwool@ru.mvista.com>, yaffs@stoneboat.aleph1.co.uk,
	linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> Wake up please. Thats going to be reality for NAND based stuff in the
> future. The controllers will expose the raw FLASH but claim the OOB area
> for their own purpose - hardware based error correction.
One of my colleagues said a very interesting argument against this.

Look, consider all those CompactFlash cards. They are NAND flash based. 
They have a kind of block device emulation built-in. And I bet they use 
OOB to store the logical block number corresponding to this physical 
block. The block device over Flash device emulation is so widespread, so 
vendors will never forbid OOB usage.

 From this point of view, OOB is no going to go.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
