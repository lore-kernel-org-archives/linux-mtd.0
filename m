Date: Wed, 27 Oct 2010 09:31:15 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: commit 432dc821 breaks machines
In-Reply-To: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
Message-ID: <alpine.LFD.2.00.1010270930230.23421@dwoodhou-mobl2.ger.corp.intel.com>
References: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: H Hartley Sweeten <hartleys@visionengravers.com>,
	linux-mtd@lists.infradead.org,
	linux-embedded <linux-embedded@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Oct 2010, Guennadi Liakhovetski wrote:

> Hi
>
> commit 432dc821c90114f9b0e00f6752a700e937516ade
> Author: H Hartley Sweeten <hartleys@visionengravers.com>
> Date:   Thu Aug 19 18:18:21 2010 -0700
>
>    mtd: cleanup Kconfig dependencies
>
> breaks machines by undefining macros like CONFIG_MTD_MAP_BANK_WIDTH_*.

Thanks. This should be fixed in today's linux-next.

-- 
dwmw2
