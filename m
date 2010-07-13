Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYcUL-0007DI-JX
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 10:13:22 +0000
Subject: Re: [UBIFS] 2.6.27-backport bug
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C2C51E2.7030308@parrot.com>
References: <4C2C51E2.7030308@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 13:08:12 +0300
Message-ID: <1279015692.31639.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-01 at 10:29 +0200, Matthieu CASTET wrote:
> Hi,
> 
> I know 2.6.27-backport is not supported anymore, but I found a bug, and 
> I post it for the record.
> 
> The bug happen with a kernel oops [1].
> 
> After investigation it happens because of programming a timer that is 
> already programmed (we don't check wbuf->no_timer in new_wbuf_timer_nolock)
> 

Pushed. BTW, if you back ported newer stuff to ubifs-v2.6.27, I can pull
it from you and we can make this tree more up-to-date.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
