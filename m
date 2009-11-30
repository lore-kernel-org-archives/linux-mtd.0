Subject: Re: [PATCH/RFC v5 4/5]: core: Add dump device to call on oopses
	and panics
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind1@gmail.com
In-Reply-To: <1259576611.19465.374.camel@macbook.infradead.org>
References: <20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091013151751.59e217a7@marrow.netinsight.se>
	<20091013152235.188059d2@marrow.netinsight.se>
	<20091126093657.GA25430@logfs.org> <1259566071.7518.48.camel@localhost>
	<20091130074603.GA30911@logfs.org> <1259571118.7518.56.camel@localhost>
	<1259576611.19465.374.camel@macbook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 10:27:27 +0000
Message-ID: <1259576847.19465.376.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-30 at 10:23 +0000, David Woodhouse wrote:
> +       /* Theoretically, the log could move on after we do this, but
> +          there's not a log we can do about that. The new messages
> +          will overwrite the start of what we dump. */
> +       spin_lock_irqsave(&logbuf_lock, flags);
> +       end = log_end & LOG_BUF_MASK;
> +       chars = logged_chars;
> +       spin_unlock_irqrestore(&logbuf_lock, flags); 

Actually that's not true -- we _could_ hold the logbuf_lock until the
end of the function. Not entirely sure we _want_ to though...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
