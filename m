From: David Woodhouse <dwmw2@infradead.org>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200311162040.14052.joshua@joshuawise.com>
References: <200311150109.39539.joshua@joshuawise.com>
	 <1069021350.3450.65.camel@lapdancer.baythorne.internal>
	 <m3smknn68x.fsf@maxwell.lnxi.com>
	 <200311162040.14052.joshua@joshuawise.com>
Content-Type: text/plain
Message-Id: <1069057395.4490.0.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 17 Nov 2003 08:23:15 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: "Eric W. Biederman" <ebiederman@lnxi.com>
cc: Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-11-16 at 20:40 -0500, Joshua Wise wrote:
> The PXA does weird stuff sometimes. I found that it just Didn't Work when the 
> lower line wasn't masked.

That'll be because you take an alignment trap and don't actually make
the bus cycles you intended.

-- 
dwmw2
