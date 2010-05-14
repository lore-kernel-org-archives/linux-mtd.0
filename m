Subject: Re: [PATCH 1/2] mtd/chips: add SST39WF160x NOR-flashes
From: David Woodhouse <dwmw2@infradead.org>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20100514012023.GA30794@pengutronix.de>
References: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
	<1273797888.9999.591.camel@macbook.infradead.org>
	<20100514012023.GA30794@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 02:28:41 +0100
Message-ID: <1273800521.9999.726.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Guillaume LECERF <glecerf@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-05-14 at 03:20 +0200, Wolfram Sang wrote:
> My flashes don't have P_ID_SST_OLD, sadly, but P_ID_AMD_STD. Still, unlike
> other AMD_STD-flashes, my flashes need their custom unlock address. I couldn't
> find a way to distinguish this from the standard case with the regular unlock
> addresses. 

Makes sense; thanks for the clarification.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
