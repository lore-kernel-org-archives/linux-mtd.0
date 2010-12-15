Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PStyJ-0007mF-K3
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 16:12:58 +0000
Date: Wed, 15 Dec 2010 16:12:13 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] MTD: m25p80: add debugging trace in sst_write()
Message-ID: <20101215161213.GC9937@n2100.arm.linux.org.uk>
References: <1292414372-17085-1-git-send-email-nicolas.ferre@atmel.com>
	<4D08C1C8.3090100@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D08C1C8.3090100@ru.mvista.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
	dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 15, 2010 at 04:25:28PM +0300, Sergei Shtylyov wrote:
>> +	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %zd\n",
>> +			dev_name(&flash->spi->dev), __func__, "to",
>
>    What's the point of printing "to" as variable? :-)

One valid reason to do this is if you have several formatting strings
all the same.  GCC can merge identical strings together.

So, if you have:

 "%s: %s %s 0x%08x, len %zd", dev_name(), __func__, "to"
 "%s: %s %s 0x%08x, len %zd", dev_name(), __func__, "from"
 "%s: %s %s 0x%08x, len %zd", dev_name(), __func__, "foo"

Then you end up with one long string and three short strings instead of

 "%s: %s to 0x%08x, len %zd", dev_name(), __func__
 "%s: %s from 0x%08x, len %zd", dev_name(), __func__
 "%s: %s foo 0x%08x, len %zd", dev_name(), __func__

which'd be three long strings.
