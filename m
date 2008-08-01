Subject: Re: mtdsuper.c BLOCK=n compile error
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@kernel.org>
In-Reply-To: <1217632851.3719.47.camel@shinybook.infradead.org>
References: <20080801223056.GK19682@cs181140183.pp.htv.fi>
	<1217630912.3719.41.camel@shinybook.infradead.org>
	<20080801225858.GM19682@cs181140183.pp.htv.fi>
	<1217632851.3719.47.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Sat, 02 Aug 2008 00:26:11 +0100
Message-Id: <1217633171.3719.50.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-08-02 at 00:20 +0100, David Woodhouse wrote:
> Er, why is the second bdput() there _anyway_?

Oh, I see. I have to stop posting patches -- I think it's past my
bedtime.

http://git.infradead.org/users/dwmw2/random-2.6.git?a=commitdiff;h=10f8e16418a5a69eda36cdbfc4ad17531c52fe92


-- 
dwmw2
