Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFs8i-0004mG-7x
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 18:10:04 +0000
Received: by ewy3 with SMTP id 3so1411676ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 11:10:02 -0700 (PDT)
Subject: Re: [RFC] mtd: nand: Fix bad block identification issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <4DBAFD79.4000004@gmail.com>
References: <1303906161-24175-1-git-send-email-parth.saxena@ti.com>
	<1304011843.2737.3.camel@localhost>
	<19F8576C6E063C45BE387C64729E739404E1A21866@dbde02.ent.ti.com>
	<1304099084.2737.59.camel@localhost>  <4DBAFD79.4000004@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 Apr 2011 21:05:52 +0300
Message-ID: <1304100352.2737.61.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>, "Saxena,
	Parth" <parth.saxena@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-29 at 11:03 -0700, Brian Norris wrote:
> As promised (but too late?):
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>

No, not late, I rebase my l2 tree with no shame :-) But once the patch
hits the real mtd tree, then we never change it. So, I've added you tag,
thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
