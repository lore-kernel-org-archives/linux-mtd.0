Date: Tue, 9 Feb 2010 09:00:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: dedekind1@gmail.com
Subject: Re: [patch for 2.6.33? 1/1] mtd/nand: fix build failure caused by typo
Message-Id: <20100209090059.b8a2e5b3.akpm@linux-foundation.org>
In-Reply-To: <1265717589.2006.147.camel@localhost>
References: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
	<1265717589.2006.147.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: hsweeten@visionengravers.com, peterhuewe@gmx.de, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 09 Feb 2010 14:13:09 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Tue, 2010-02-02 at 14:12 -0800, akpm@linux-foundation.org wrote:
> > From: Peter Huewe <peterhuewe@gmx.de>
> > 
> > Fix a build failure introduced by the patch
> > 
> >     mtd: orion_nand.c: add error handling and use resource_size()
> > 
> > The patch assigns something to a undeclared variable 'err', whereas the
> > rest of the code uses 'ret' for this task.
> 
> Andrew,
> 
> I think you should send this fix to Linus, since this is a build fix.
> dwmw2 seem to bu unavailable now.

OK, no probs, thanks.
