Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qej8D-0006Hq-UC
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 07:36:19 +0000
Date: Thu, 7 Jul 2011 09:36:12 +0200
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBIFS: fix master node recovery
Message-ID: <20110707093612.166bb7d0@wker>
In-Reply-To: <1310019338.3149.97.camel@sauron>
References: <1309944626-30195-1-git-send-email-agust@denx.de>
	<1310019338.3149.97.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 07 Jul 2011 09:15:33 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> Anatolij,
> 
> On Wed, 2011-07-06 at 11:30 +0200, Anatolij Gustschin wrote:
> > When the 1st LEB was unmapped and written but 2nd LEB not,
> > the master node recovery doesn't succeed after power cut.
> > We see following error when mounting UBIFS partition on NOR
> > flash:
> > 
> > UBIFS error (pid 1137): ubifs_recover_master_node: failed to recover master node
> 
> Could you please provide some numbers - when this error happens, what is
> offs2, sz, and c->leb_size when this error happens?

offs2 = 261120, sz = 512, c-leb_size = 262016. There are 384 unused
bytes at the end of the LEB 2: 262016 - 261120 - 512 = 384.

Anatolij
