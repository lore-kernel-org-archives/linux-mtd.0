Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CV8aD-0001y6-2T
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2004 08:13:50 -0500
Date: Fri, 19 Nov 2004 14:13:46 +0100 (CET)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.61.0411191342340.19129@mag.sysgo.com>
Message-ID: <Pine.LNX.4.61.0411191412470.19207@mag.sysgo.com>
References: <418F5E68.3010200@sysgo.de> <20041108120624.GE13105@home.fluff.org>
	<418F6CA7.6000808@sysgo.de> <1099943453.10812.16.camel@tubarao>
	<4194D39A.9000700@sysgo.de> <1100274921.3549.13.camel@justakiss>
	<4194E233.70902@sysgo.de> <1100277677.3549.22.camel@justakiss>
	<419C7E72.8040005@sysgo.de> <1100789053.3171.96.camel@tubarao>
	<1100791607.623.10.camel@justakiss>
	<Pine.LNX.4.61.0411191342340.19129@mag.sysgo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: tharbaugh@lnxi.com, Alexander Hoffmann <ahoffmann@sysgo.de>,
	Erwin Authried <eauth@softsys.co.at>
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 Nov 2004, Marius Groeger wrote:

> So what seems to be needed as a fix would be this: once a chip is 
> found to be MTD_UADDR_UNNECESSARY, uaddr stuff should be done, at 
> all, any more.

Please change this to "should NOT be done" :-)

Cheers,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.imerva.com
