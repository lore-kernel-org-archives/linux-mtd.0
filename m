Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yp9Aq-0003lb-2A
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 05:44:13 +0000
Date: Mon, 4 May 2015 07:43:41 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 4/4] mtd: sh_flctl: fix wrapped condition alignment
Message-ID: <20150504054341.GA26350@opentech.at>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
 <1430553430-21396-4-git-send-email-hofrat@osadl.org>
 <20150504052138.GX3521@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150504052138.GX3521@localhost>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 04 May 2015, Vinod Koul wrote:

> On Sat, May 02, 2015 at 09:57:10AM +0200, Nicholas Mc Guire wrote:
> > CodingStyle fix only - align function parameters to opening (.
> > 
> This doesnt look any better to me...
>
True it makes little difference when looking at these few lines
I guess though the issue is consistency.
 
thx!
hofrat
