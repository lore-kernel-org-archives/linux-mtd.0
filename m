Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OUHV3-00036H-IL
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2010 11:00:10 +0000
Subject: Re: [UBIFS] 2.6.27-backport bug
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C2C51E2.7030308@parrot.com>
References: <4C2C51E2.7030308@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Jul 2010 13:56:14 +0300
Message-ID: <1277981774.27484.49.camel@localhost>
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

Thanks, although I do not maintain 2.6.27 port anymore [1], I will of
course push your patch a bit later, when I find time to process my MTD
input queue :-)

[1] http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
