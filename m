From: David Woodhouse <dwmw2@infradead.org>
To: timg@tpi.com
In-Reply-To: <200310060713.13344.timg@tpi.com>
References: <200310021344.14931.timg@tpi.com>
	 <1065287933.16005.2.camel@imladris.demon.co.uk>
	 <200310060713.13344.timg@tpi.com>
Content-Type: text/plain
Message-Id: <1065446123.22491.191.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 06 Oct 2003 14:15:24 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Patches to nanddump.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-10-06 at 07:13 -0600, Tim Gardner wrote:
> Using getopt will break command line option backward compatibility, which is 
> fine with me because it would clean up some parsing code. Any objections?

Nope. It's mostly a debugging tool anyway.

-- 
dwmw2
