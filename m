From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
In-Reply-To: <3F96FA57.470FECC7@mvista.com>
References: <3F96FA57.470FECC7@mvista.com>
Content-Type: text/plain
Message-Id: <1066897909.29915.456.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 23 Oct 2003 09:31:50 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: TX49 NAND supported?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-22 at 14:44 -0700, Alice Hennessy wrote:
 There is also a small change in nand.c to add
> a missing case statement.

Applied; thanks. For the tx49 drivers, please could you correct 'MB' to
'MiB' throughout, switch to C99 struct initialisers, add $Id$ and 
MODULE_AUTHOR, and also add the appropriate magic to Makefile.common,
Config.in and Kconfig. Thanks.

You have an account and should be able to commit those directly.

-- 
dwmw2
