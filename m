Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N1Dj5-0002cC-1R
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 06:34:19 +0000
Date: Fri, 23 Oct 2009 08:34:00 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH v7 5/5]: mtdoops: refactor as a kmsg_dumper
Message-ID: <20091023083400.2f52ae92@marrow.netinsight.se>
In-Reply-To: <1256272362.29885.197.camel@localhost>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094815.36f5872c@marrow.netinsight.se>
	<1256272362.29885.197.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Oct 2009 07:32:42 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2009-10-15 at 09:48 +0200, Simon Kagstrom wrote:
> > The last messages which happens before a crash might contain interesting
> > information about the crash. This patch reworks mtdoops using the
> > kmsg_dumper support instead of a console, which simplifies the code and
> > also includes the messages before the oops started.
> 
> Looks good, thanks for doing this. Did you actually test this with
> oopses and panics, with and without panic_on_oops?

Yes, I've tested it with the kinds of crashes I could think of on a
device (OpenRD) with a NAND flash. It works well for all cases I've
tested.

I wrote a small kernel module which registers a sysfs interface where
you can crash or cause problems for the kernel in various ways to test
this. If there is interest for it I could post it.

// Simon
