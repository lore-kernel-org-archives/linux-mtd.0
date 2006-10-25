Subject: Re: [PATCH] [PATCH] [MTD] MAPS: Support for BIOS flash chips on
	the nvidia ck804 southbridge
From: David Woodhouse <dwmw2@infradead.org>
To: Ryan Jackson <rjackson@lnxi.com>
In-Reply-To: <20061024174606.GE21009@localdomain>
References: <20061024174606.GE21009@localdomain>
Content-Type: text/plain
Date: Wed, 25 Oct 2006 15:39:18 +0300
Message-Id: <1161779958.27622.94.camel@shinybook.infradead.org>
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

On Tue, 2006-10-24 at 11:46 -0600, Ryan Jackson wrote:
> From: Dave Olsen <dolsen@lnxi.com>
> 
> Add support for accessing BIOS flash chips connected to the NVIDIA ck804 southbridge.

This is very reminiscent of the changes you made recently to the
amd76xrom driver. Can they be merged?

Please fix 'KB' to 'KiB' and 'MB' to 'MiB' if you really mean powers of
two and not powers of ten.

-- 
dwmw2
