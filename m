Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxbCr-00066U-5N
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 07:54:33 +0000
Received: by fxm4 with SMTP id 4so686753fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 00:54:31 -0700 (PDT)
Subject: Re: [PATCH v4] mtd: nand: Expand nand_ecc_layout, deprecate ioctl
	ECCGETLAYOUT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <4C96FF10.2010805@gmail.com>
References: <4C5CA4A1.1040000@broadcom.com>
	<1282154806-9420-1-git-send-email-norris@broadcom.com>
	<4C6DD170.1060807@renesas.com>  <4C6E9C23.6060703@broadcom.com>
	<1282646703.24044.162.camel@localhost>  <4C746DE0.7000104@gmail.com>
	<1283163647.12995.43.camel@brekeke> <1284830690.1721.3.camel@brekeke>
	<4C96FF10.2010805@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 10:52:40 +0300
Message-ID: <1284969160.2286.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-19 at 23:28 -0700, Brian Norris wrote:
> >> Oh, does it mean you will stop loving MTD and we won't see steady flow
> >> of improvements for you? :-( BTW, I think you have been doing great job
> >> - MTD subsystem needs love badly!
> 
> No, this doesn't mean I will stop loving MTD, although as may be readily
> apparent by my delay, I may work a bit slower :) In fact, I will
> probably be picking up some more work shortly.

Nice :-)

> From the context, I assume you meant include/mtd/mtd-abi.h, not
> linux/mtd/mtd.h; am I correct?

Probably yes :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
