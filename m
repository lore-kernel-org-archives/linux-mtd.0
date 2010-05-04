Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9IXi-00033L-S1
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 13:52:12 +0000
Subject: Re: [PATCH v2] mtdchar: allow mmap() on MTD RAM/ROM char devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20100429161320.3b179f6c@wker>
References: <1272461518.7750.31.camel@localhost>
	<1272471640-27073-1-git-send-email-agust@denx.de>
	<20100429161320.3b179f6c@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 04 May 2010 16:45:55 +0300
Message-ID: <1272980755.3702.9.camel@localhost>
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

On Thu, 2010-04-29 at 16:13 +0200, Anatolij Gustschin wrote:
> Hi Artem,
> 
> On Wed, 28 Apr 2010 18:20:40 +0200
> Anatolij Gustschin <agust@denx.de> wrote:
> 
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > ---
> > v1 -> v2:
> >  - Fixed compilation breakage on x86_64 while compiling
> >    as module, since on x86_64 phys_mem_access_prot() is
> >    not exported. Sorry for the breakage.
> > 
> >  drivers/mtd/mtdchar.c |   30 +++++++++++++++++++++++++++++-
> >  1 files changed, 29 insertions(+), 1 deletions(-)
> 
> Is this patch ok now?

Not sure, I did not really review it, but it compiles now and I've
pushed it to my l2-mtd-2.6 / dunno tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
