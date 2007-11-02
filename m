Subject: Re: UBI Used In Commercial Products ??
From: David Woodhouse <dwmw2@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20071031T224633-341@post.gmane.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D577@orsmsx413.amr.corp.intel.com>
	<loom.20071031T215155-403@post.gmane.org>
	<B1EDF20A6EAAD74EA65E46F774F1784502C6D843@orsmsx413.amr.corp.intel.com>
	<loom.20071031T224633-341@post.gmane.org>
Content-Type: text/plain
Date: Thu, 01 Nov 2007 20:36:52 -0400
Message-Id: <1193963812.489.5.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-10-31 at 23:01 +0000, Sergei Sharonov wrote:
> Disclaimer: that was about 2 years ago and jffs2 might have improved,
> processor (ARM9) was not a speed demon either.

The last two years would include all the optimisation work we've done
having started using JFFS2 on OLPC, with its 1GiB of NAND flash.

We're still pushing the limits of the JFFS2 design, at that size, but it
isn't as bad as it was.

-- 
dwmw2
