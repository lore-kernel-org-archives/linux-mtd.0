From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@infradead.org>
In-Reply-To: <E1CyZQx-0005qR-9M@phoenix.infradead.org>
References: <E1CyZQx-0005qR-9M@phoenix.infradead.org>
Content-Type: text/plain
Date: Tue, 08 Feb 2005 17:54:19 +0000
Message-Id: <1107885259.19262.495.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/include/mtd mtd-abi.h,1.8,1.9
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-08 at 17:45 +0000, Nicolas Pitre wrote:
> +#define OTPSELECT		_IOR('M', 13, int)
> +#define OTPGETREGIONCOUNT	_IOW('M', 14, int)

No ints in ioctls please. Choose something with a fixed size.

-- 
dwmw2
