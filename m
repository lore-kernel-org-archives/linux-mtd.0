Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRj2D-0004UU-VV
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 16:47:18 +0000
Date: Mon, 25 Jul 2016 09:47:08 -0700
From: Greg KH <greg@kroah.com>
To: Richard Weinberger <richard@nod.at>
Cc: Rajeev Kumar <rajeev_kumar@mentor.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] MTD: UBI: speed up init by moving status messages to
 debugfs
Message-ID: <20160725164708.GB7540@kroah.com>
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <5795EA91.2030304@nod.at> <5795F6AE.8070508@mentor.com>
 <5795F8CE.4050605@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5795F8CE.4050605@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 25, 2016 at 01:32:30PM +0200, Richard Weinberger wrote:
> These days I'd not print all of them. But we do already and I know
> setups which parse dmesg and grep for some of these values.

That's horrid and should not be tolerated, please never grep the kernel
log for anything.

> Either to see whether attach worked or just to gather debug infos for
> QA.
> I don't want to risk breaking existing stuff.

We do not claim that kernel log messages are an "ABI" that can not be
changed or broken at all.

thanks,

greg k-h
