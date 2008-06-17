Subject: Re: [PATCH RESEND] mtdpart: Avoid divide-by-zero on out-of-reach path
From: David Woodhouse <dwmw2@infradead.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080617.230923.05598528.anemo@mba.ocn.ne.jp>
References: <20080616.233039.01916379.anemo@mba.ocn.ne.jp>
	<20080616145704.GB20814@logfs.org>
	<1213628634.26255.781.camel@pmac.infradead.org>
	<20080617.230923.05598528.anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2008 15:10:19 +0100
Message-Id: <1213711819.26255.1066.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-06-17 at 23:09 +0900, Atsushi Nemoto wrote:
> On Mon, 16 Jun 2008 16:03:54 +0100, David Woodhouse <dwmw2@infradead.org> wrote:
> > > David seems to like long lines.  Sometimes even for good reasons.
> > 
> > Sometimes I do, yes. But at a quick glance I don't think I would argue
> > that we should keep _those_ ones. They could be wrapped without
> > detriment.
> 
> Then, should I revise these patches with holding long lines?

As Jörn says, it's probably better to do things one logical step at a
time. Why not follow up with a third patch which wraps the long lines in
the whole file (as long as that doesn't make it harder to read).

-- 
dwmw2
