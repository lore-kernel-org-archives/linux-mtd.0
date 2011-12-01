Received: from gate.crashing.org ([63.228.1.57])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RWGSe-0003T4-BA
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 23:54:41 +0000
Message-ID: <1322783661.3729.39.camel@pasglop>
Subject: Re: [PATCH 1/2] MTD: NAND: ndfc: fix compilation error
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: dedekind1@gmail.com
Date: Fri, 02 Dec 2011 10:54:21 +1100
In-Reply-To: <1321998220.2222.22.camel@koala>
References: <1321942850-20012-1-git-send-email-tinamdar@apm.com>
 <1321998220.2222.22.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Tanmay Inamdar <tinamdar@apm.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-22 at 23:43 +0200, Artem Bityutskiy wrote:
> On Tue, 2011-11-22 at 11:50 +0530, Tanmay Inamdar wrote:
> > This patch fixes compilation error in ndfc flash driver
> > ---
> >  drivers/mtd/nand/ndfc.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> Tony Breeds <tony@bakeyournoodle.com> sent a fix for this a bit earlier.

Any reason this isn't in Linus tree yet ?

Ben.
