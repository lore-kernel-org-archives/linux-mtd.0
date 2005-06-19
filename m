From: David Woodhouse <dwmw2@infradead.org>
To: "Li, Aubrey" <Aubrey.Li@analog.com>
In-Reply-To: <E21A9A52FF03B249B20F0DC563DEBB311B814609@nwd2exm3.ad.analog.com>
References: <E21A9A52FF03B249B20F0DC563DEBB311B814609@nwd2exm3.ad.analog.com>
Content-Type: text/plain
Date: Sun, 19 Jun 2005 14:24:35 +0100
Message-Id: <1119187476.24842.78.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Soft link of JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-06-18 at 12:07 -0400, Li, Aubrey wrote:
> Doesn't JFFS2 support soft link?

Yes, it does.

> What should I do to over this hurdle?

Make 100% sure that alignment fixups are working correctly on your
platform and show more details of the failure so we can try to diagnose
it.

-- 
dwmw2
