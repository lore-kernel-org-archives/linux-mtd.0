Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5GlQ-00021X-H3
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 12:14:13 +0000
Received: by wyb28 with SMTP id 28so2390817wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 05:14:11 -0700 (PDT)
Subject: Re: NAND device: all blocks bad after restart, how to recover?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lars.michael@yahoo.com>
In-Reply-To: <759739.22764.qm@web30205.mail.mud.yahoo.com>
References: <759739.22764.qm@web30205.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 15:11:50 +0300
Message-ID: <1301573510.2828.53.camel@localhost>
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

On Fri, 2011-03-25 at 07:03 -0700, Lars Michael wrote:
> We investigated more and have found that the FlexBus on the Coldfire
> can cause problems for the NAND device. When the FlexBus devices are
> removed
> the NAND device comes back to life, and is again accessible. So now I 
> can get back to the UBI part of the project :-)

Good! :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
