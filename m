From: David Woodhouse <dwmw2@infradead.org>
To: llandre <r&d@wawnet.biz>
In-Reply-To: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
References: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
Content-Type: text/plain
Message-Id: <1079538886.16952.88.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 17 Mar 2004 15:54:47 +0000
Content-Transfer-Encoding: 7bit
cc: Andrea Scian <andrea.scian@wawnet.biz>
cc: tglx@linutronix.de
cc: linux-mtd@lists.infradead.org
cc: Matteo Bortolin <matteo.bortolin@wawnet.biz>
Subject: Re: Bug in nand_select_chip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-03-17 at 16:44 +0100, llandre wrote:
> The old function, with chip==0, sets the nCE pin low:

> The new function, with chip==0, sets the nCE pin high:

> 1) Why did the code change this way?

To handle multiple chips. More correctly, should should say
"The new function, with chip == N, sets nCE on chip #N high."

To deselect _all_ chips you use chip == -1.

All callers of nand_select_chip() were changed at the same time
though... this shouldn't cause a problem.

-- 
dwmw2
