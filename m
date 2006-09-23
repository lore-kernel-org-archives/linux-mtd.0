Subject: Re: 2.6.19 -mm merge plans
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@osdl.org>
In-Reply-To: <1158917046.24527.662.camel@pmac.infradead.org>
References: <20060920135438.d7dd362b.akpm@osdl.org>
	<1158917046.24527.662.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Sat, 23 Sep 2006 11:44:27 +0100
Message-Id: <1159008267.24527.908.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Rongkai.Zhan" <rongkai.zhan@windriver.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-09-22 at 10:24 +0100, David Woodhouse wrote:
> Merged, with the exception of the unlock addr one which I'm still not
> sure about -- about to investigate harder. 

Please drop it (fix-the-unlock-addr-lookup-bug-in-mtd-jedec-probe.patch).

Returning the first value in the array is intentional -- it should be
automatically shifted to make it work if it's a x16 chip, and the right
thing should happen. If _that_ isn't working, give details and we'll
work out a proper fix.

-- 
dwmw2
