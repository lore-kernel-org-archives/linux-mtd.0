Date: Sun, 17 Dec 2017 15:53:05 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Willy Tarreau <w@1wt.eu>, Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171217155305.16c5bb4f@bbrezillon>
In-Reply-To: <CAAEAJfBUyhvi68A6QEJRywq9hxMBYuJ4m+O6ogBtV1nkeBR_og@mail.gmail.com>
References: <20171217120503.GA3323@1wt.eu>
 <CAAEAJfBUyhvi68A6QEJRywq9hxMBYuJ4m+O6ogBtV1nkeBR_og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 17 Dec 2017 11:27:51 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 17 December 2017 at 09:05, Willy Tarreau <w@1wt.eu> wrote:
> > Hello,
> >
> > I recently bought a Linksys WRT1900ACS which hosts an Armada 385 and a
> > NAND flash. While I could get OpenWRT to work flawlessly on it using
> > kernel 4.4, mainline 4.14.6 fails with a lot of such messages :
> >
> >     pxa3xx-nand f10d0000.flash: Wait time out!!!
> >  
> 
> Boris,
> 
> Any idea why this issue is on v4.14, but not observed on v4.4?

I have absolutely no idea.

> 
> Also, is this somehow related to Armada 385 only?

I doubt it. My guess is that almost nobody uses JFFS2 these days, which
may explain why this problem has not been detected before.
