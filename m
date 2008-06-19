Subject: Re: [PATCH] jedec_probe: Fix SST 16-bit chip detection
From: David Woodhouse <dwmw2@infradead.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080619.163648.262833678.nemoto@toshiba-tops.co.jp>
References: <20080619.163648.262833678.nemoto@toshiba-tops.co.jp>
Content-Type: text/plain
Date: Thu, 19 Jun 2008 18:21:53 +0100
Message-Id: <1213896113.26255.1434.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-06-19 at 16:36 +0900, Atsushi Nemoto wrote:
> -               .devtypes       = CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> +               .devtypes       = CFI_DEVICETYPE_X16,

I believe you about the uaddr -- but can these devices really not be
used in 8-bit mode?

-- 
dwmw2
