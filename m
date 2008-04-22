Subject: Re: [PATCH][MTD][NAND] PXA300 Zylonite controller support
From: David Woodhouse <dwmw2@infradead.org>
To: Dmitry Krivoschekov <dmitry.krivoschekov@gmail.com>
In-Reply-To: <480E164F.4000700@gmail.com>
References: <1200289475.1727.106.camel@localhost.localdomain>
	<1208878908.9212.623.camel@pmac.infradead.org>
	<480E164F.4000700@gmail.com>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 19:21:20 +0100
Message-Id: <1208888480.9212.639.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: eric.y.miao@gmail.com, podstavin@dev.rtsoft.ru,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-04-22 at 20:46 +0400, Dmitry Krivoschekov wrote:
> Hi David,
> 
> David Woodhouse wrote:
> > On Mon, 2008-01-14 at 08:44 +0300, Sergey Podstavin wrote:
> >> This is a fixed version for pxa3 nand controller from eric miao, 
> >> working on pxa300 Zylonite
> >
> > It doesn't apply, and it contains some very dodgy changes in
> > arch/arm/kernel/head.S.
> >
> > Please can I have a current, working version?
> >
> 
> can you instead of this consider a more recent (more clean?) version of
> that driver submitted by Eric Miao:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2008-February/020653.html

Looks like someone didn't try applying their own patch when they
received it back from the mailing list...

Applying [MTD] [NAND] support for pxa3xx
fatal: corrupt patch at line 1245
Patch failed at 0001.

-- 
dwmw2
