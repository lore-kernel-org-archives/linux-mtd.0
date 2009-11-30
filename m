Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF2ff-0001F0-Tw
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 09:35:56 +0000
Date: Mon, 30 Nov 2009 10:35:41 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH/RFC v5 4/5]: core: Add dump device to call on oopses and
	panics
Message-ID: <20091130093541.GA14254@logfs.org>
References: <alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091013151751.59e217a7@marrow.netinsight.se>
	<20091013152235.188059d2@marrow.netinsight.se>
	<20091126093657.GA25430@logfs.org>
	<1259566071.7518.48.camel@localhost>
	<20091130074603.GA30911@logfs.org>
	<1259571118.7518.56.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1259571118.7518.56.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
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

On Mon, 30 November 2009 10:51:58 +0200, Artem Bityutskiy wrote:
> 
> How about this patch on top of the existing one (untested):
> 
> +	/*
> +	 * Have we ever rotated around the circular buffer? If we never did,
> +	 * we have to have zeroes at the end.
> +	 */
> +	if (log_buf[end]) {
> +		s1 = log_buf + end;
> +		l1 = log_buf_len - end;
> +	} else {
> +		s1 = "";
> +		l1 = 0;

So now you are assuming that a) the buffer is initially zeroed and b)
noone ever writes NUL to it.  Is that correct?

I'm not sure whether those assumptions are valid.  If they are, then
this will obviously work.  Otherwise we can just always assume the
wrapped case.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface.
-- Doug MacIlroy
