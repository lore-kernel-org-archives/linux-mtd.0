Subject: Re: [PATCH 1/1] mtd: msm_nand: Add initial msm nand driver support.
From: David Woodhouse <dwmw2@infradead.org>
To: Murali Nalajala <mnalajal@codeaurora.org>
Date: Thu, 06 Jan 2011 15:33:44 +0000
In-Reply-To: <1293785680-19850-1-git-send-email-mnalajal@codeaurora.org>
References: <1293785680-19850-1-git-send-email-mnalajal@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1294328027.20779.6.camel@i7.infradead.org>
Mime-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org,
	Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, swetland@google.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-31 at 14:24 +0530, Murali Nalajala wrote:
> 
> +#define NAND_CMD_STATUS             0x0C
> +#define NAND_CMD_RESET              0x0D 

Er, what?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
