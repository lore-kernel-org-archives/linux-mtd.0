Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox3di-0008Re-En
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 20:04:03 +0000
Received: by pwj3 with SMTP id 3so1270432pwj.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 13:03:59 -0700 (PDT)
Message-ID: <4C951B2A.1000706@gmail.com>
Date: Sat, 18 Sep 2010 13:03:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v4] mtd: nand: Expand nand_ecc_layout, deprecate ioctl
	ECCGETLAYOUT
References: <4C5CA4A1.1040000@broadcom.com>	
	<1282154806-9420-1-git-send-email-norris@broadcom.com>	
	<4C6DD170.1060807@renesas.com> <4C6E9C23.6060703@broadcom.com>	
	<1282646703.24044.162.camel@localhost>
	<4C746DE0.7000104@gmail.com>	 <1283163647.12995.43.camel@brekeke>
	<1284830690.1721.3.camel@brekeke>
In-Reply-To: <1284830690.1721.3.camel@brekeke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/18/2010 10:24 AM, Artem Bityutskiy wrote:
> Brian,
> 
> would you address the small things I noticed in a follow-up patch?

Artem,

Yes, I will. I'm sorry for the delay; I've been a little busy and
putting some things off. Would you like a patch for the comments against
your l2 tree or try and squash it with my previous commit and base it
off of mtd-2.6 or some other option?

Brian
