Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HmAcK-0001cY-Sq
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 11:31:46 -0400
Received: from [10.191.255.159] (dhcp-255-159.norway.atmel.com
	[10.191.255.159])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id l4AFVfqK097216
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 May 2007 17:31:41 +0200 (CEST)
	(envelope-from hcegtvedt@atmel.com)
Subject: Re: [PATCH] fix Atmel NOR flash for command set 0002
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1178785968.11554.58.camel@localhost.localdomain>
References: <1178785968.11554.58.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Thu, 10 May 2007 17:31:32 +0200
Message-Id: <1178811092.11554.67.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-05-10 at 10:32 +0200, Hans-Christian Egtvedt wrote:
> Hello,
> 
> Trying to prod my co-worker backfired, so here is the patch with a
> changelog.

Oh, forgot to mention it is diffed against Linux 2.6.20, but as previous
mentioned a similar patch is already applied to the repository. I guess
Michael König ment the MTD repository.

<cut changelog>

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
