Date: Tue, 16 May 2017 12:00:09 -0700
From: Darren Hart <dvhart@infradead.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 04/53] mutex, futex: adjust kernel-doc markups to
 generate ReST
Message-ID: <20170516190009.GA29495@fury>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <7b4ff1adb57ad96d8f12a05d8c661a3d8c4d2be1.1494935649.git.mchehab@s-opensource.com>
 <20170516173540.GA28967@fury> <20170516152418.6f68b2af@vela.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170516152418.6f68b2af@vela.lan>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 16, 2017 at 03:24:18PM -0300, Mauro Carvalho Chehab wrote:
> Em Tue, 16 May 2017 10:35:40 -0700
> Darren Hart <dvhart@infradead.org> escreveu:
> 
> > On Tue, May 16, 2017 at 09:15:56AM -0300, Mauro Carvalho Chehab wrote:
> > > There are a few issues on some kernel-doc markups that was
> > > causing troubles with kernel-doc output on ReST format:
> > > 
> > > ./kernel/futex.c:492: WARNING: Inline emphasis start-string without end-string.
> > > ./kernel/futex.c:1264: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > ./kernel/futex.c:1721: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > ./kernel/futex.c:2338: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > ./kernel/futex.c:2426: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > ./kernel/futex.c:2899: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > ./kernel/futex.c:2972: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > 
> > > Fix them.
> > > 
> > > No functional changes.
> > > 
> > > Acked-by: Darren Hart (VMware) <dvhart@infradead.org>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > > ---  
> > 
> > 
> > What was the difference from v1? Quick scan didn't reveal anything obvious to
> > me... (context left intact in case you want to point it out inline), but just a
> > "Changes since v1" below the --- is always appreciated - even it it's "no
> > changes, new commit log".
> 
> From v1, the .. note:: got removed. That's pretty much the same version
> found on one of my replies + the addition of the warnings it produces
> without the patch.

Thanks Mauro. This still seems reasonable to me.

-- 
Darren Hart
VMware Open Source Technology Center
