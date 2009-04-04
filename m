Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200904040920.06981.david-b@pacbell.net>
References: <200903260042.42091.david-b@pacbell.net>
	<a95a62fe0904031300i82bdf42h5bc854a002e0091e@mail.gmail.com>
	<1238855797.4068.6.camel@macbook.infradead.org>
	<200904040920.06981.david-b@pacbell.net>
Content-Type: text/plain
Date: Sat, 04 Apr 2009 17:29:12 +0100
Message-Id: <1238862552.4068.42.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-04-04 at 09:20 -0700, David Brownell wrote:
> On Saturday 04 April 2009, David Woodhouse wrote:
> > think I'm going to add a WARN_ON(&mtd->dev.parent) into the core code.
> 
> I hope you mean WARN_ON(!mtd->dev.parent) ... :)

If I didn't, I'd probably change my mind fairly quickly... :)

-- 
dwmw2
