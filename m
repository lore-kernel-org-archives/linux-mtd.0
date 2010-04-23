Date: Thu, 22 Apr 2010 23:07:37 -0400
From: Andrew Morton <akpm@linux-foundation.org>
To: Stefani Seibold <stefani@seibold.net>
Subject: Re: [PATCH] Fix a huge latency problem in the MTD CFI and LPDDR
	flash drivers.
Message-Id: <20100422230737.95e441ef.akpm@linux-foundation.org>
In-Reply-To: <1272002584.5347.2.camel@wall-e.seibold.net>
References: <1271623604.7050.0.camel@wall-e.seibold.net>
	<1271787391.16051.4.camel@wall-e.seibold.net>
	<1272002584.5347.2.camel@wall-e.seibold.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Apr 2010 08:03:04 +0200 Stefani Seibold <stefani@seibold.net> wrote:

> David did not respond to my request since more than a month. Can u apply
> the patch to linux next?

The patch is rather too fundamental for there to be benefit in me
carrying it.

Hopefully Artem can look at it soon, although he's somewhat busy with
real-life things at present.
