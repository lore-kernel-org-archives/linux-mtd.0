From: David Woodhouse <dwmw2@infradead.org>
To: Jun Sun <jsun@mvista.com>
In-Reply-To: <20031022181528.T19834@mvista.com>
References: <20031022181528.T19834@mvista.com>
Content-Type: text/plain
Message-Id: <1066898206.29915.458.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 23 Oct 2003 09:36:47 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove unnecessary inclusion of <asm/setup.h>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-22 at 18:15 -0700, Jun Sun wrote:
> I don't see any purpose of including this file.  Furthermore
> <asm/setup.h> does not even exist on MIPS and other arches.

Applied; thanks.

-- 
dwmw2
