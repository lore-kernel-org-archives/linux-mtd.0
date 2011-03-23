Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2NzT-0007H1-JR
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 13:20:48 +0000
Date: Wed, 23 Mar 2011 15:16:14 +0200
From: Phil Carmody <ext-phil.2.carmody@nokia.com>
To: ext Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] ubifs: debugfs operations may return both ERRs and
	NULLs
Message-ID: <20110323131614.GC18296@esdhcp04044.research.nokia.com>
References: <1300873889-18336-1-git-send-email-ext-phil.2.carmody@nokia.com>
	<1300884116.2735.45.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1300884116.2735.45.camel@localhost>
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23/03/11 14:41 +0200, ext Artem Bityutskiy wrote:
> On Wed, 2011-03-23 at 11:51 +0200, Phil Carmody wrote:
> > I knew I invented IS_ERR_OR_NULL for something, and this was probably
> > it. NULL has lost all information about what the error was, and the most
> > appropriate error code is ENODEV. However, that's the only error code
> > that the debugfs functions can return. So basically, any error = ENODEV.
> > 
> > Signed-off-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
> 
> The debugfs code may change and gain more error codes, so I do not think
> it is good idea to treat any error as ENODEV. I think only NULL should
> be translated to ENODEV instead.
> 
> I'll try to re-work your patch accordingly and push it unless you send a
> new one.

I had a version like that before I simplified it (and rebased).
I wonder if it's possible to extract it from the garbage in git?

Phil
