Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF2HK-0003Z8-Jn
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 09:10:47 +0000
Subject: Re: [PATCH/RFC v5 4/5]: core: Add dump device to call on oopses
	and panics
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20091126093657.GA25430@logfs.org>
References: <20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091013151751.59e217a7@marrow.netinsight.se>
	<20091013152235.188059d2@marrow.netinsight.se>
	<20091126093657.GA25430@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 11:09:47 +0200
Message-Id: <1259572187.7518.70.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-11-26 at 10:36 +0100, Jörn Engel wrote:
> Just stumbled across this patch.
> 
> On Tue, 13 October 2009 15:22:35 +0200, Simon Kagstrom wrote:
> > +void dump_kmsg(int panic)
> > +{
> > +	unsigned long len = ACCESS_ONCE(log_end);
> > +	struct dump_device *dump;
> > +	const char *s1, *s2;
> > +	unsigned long l1, l2;
> > +
> > +	s1 = "";
> > +	l1 = 0;
> > +	s2 = log_buf;
> > +	l2 = len;
> > +
> > +	/* Have we rotated around the circular buffer? */
> > +	if (len > log_buf_len) {
> 
> I believe this bit is wrong.  log_end is an unsigned int, so it can
> wrap relatively quickly.  If log_end just wrapped to 0 and dump_kmsg is
> called, the amount of printk buffer stored appears to be 0 as well.

Simon, if you want your patches to be merged to 2.6.33, we should
address this issue ASAP, otherwise it'll be too late.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
