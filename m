Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCFBq-0006Kb-3j
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 01:30:05 +0000
Subject: Re: Enable notifications for linux-mtd
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20171107092628.461ff68a@bbrezillon>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <46cc2db3-fa2d-61ab-5e78-c88d9f371584@ozlabs.org>
Date: Wed, 8 Nov 2017 09:29:35 +0800
MIME-Version: 1.0
In-Reply-To: <20171107092628.461ff68a@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

> Is there a way to send notifications to the submitter/author when the
> status of a linux-mtd patch is changed?

Absolutely - that's just something I can turn on in your project's
config. I assume your co-maintainers are OK with this?

> Not sure we'll need a notification for any kind of change, but having
> one when the patch is marked as Accepted would be good.

Currently, the notifications are for all state changes (there's no
config to do it selectively). Will this be a problem?

Cheers,


Jeremy
