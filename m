From: David Woodhouse <dwmw2@infradead.org>
To: "DiGiacomo, Mario" <mdigiaco@anteon.com>
In-Reply-To: <79E9503E1ABD5A479B45D36BEA17D31B093255@np-ex.anteon.com>
References: <79E9503E1ABD5A479B45D36BEA17D31B093255@np-ex.anteon.com>
Content-Type: text/plain
Message-Id: <1065628661.22298.223.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 08 Oct 2003 16:57:41 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Fdisk/mount problem with DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-08 at 11:53 -0400, DiGiacomo, Mario wrote:
> I'm trying to access an already-formatted 32M DOC on an AMD K6 running
> Linux 2.4.18 (and TrueFFS 5.1.4), and I'm having difficulty.  It
> _looks_ like everything is loading correctly (compiled into the
> kernel, not modules), but if I try to run mount or fdisk, the command
> hangs.

Known bug in 2.4.18. Fixed in 2.4.19 as are many other problems.

-- 
dwmw2
