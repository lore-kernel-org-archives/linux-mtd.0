Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoJ9K-0000Rl-Ai
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 09:03:08 -0400
Date: Wed, 16 May 2007 14:58:13 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516125813.GH5472@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<787b0d920705151626x3a11b81csf0f3747a695131b0@mail.gmail.com>
	<20070516111840.GB20482@mail.shareable.org>
	<84144f020705160508t275cb379k71bdd21c9e7d3d6e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84144f020705160508t275cb379k71bdd21c9e7d3d6e@mail.gmail.com>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	Jamie Lokier <jamie@shareable.org>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 May 2007 15:08:15 +0300, Pekka Enberg wrote:
> On 5/16/07, Jamie Lokier <jamie@shareable.org> wrote:
> >Given that the filesystem is still 'experimental', I'd concentrate on
> >getting it stable before worrying about immutable and xattrs unless
> >they are easy.
> 
> We will run into trouble if the on-disk format is not flexible enough
> to accommodate xattrs (think reiser3 here). So I'd worry about it
> before merging to mainline.

Adding xattrs would be fairly simple.  Inodes just need one extra
pointer for that.

Luckily inodes no longer need to be padded to 128 or 256 bytes.  They
are individually compressed, so their size is not limited to powers of
two.

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
