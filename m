Subject: Re: [PATCH V8 0/4] pxa3xx_nand: add two chip select support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lei Wen <leiwen@marvell.com>
Date: Wed, 20 Jul 2011 07:51:47 +0300
In-Reply-To: <1310701473-31632-1-git-send-email-leiwen@marvell.com>
References: <1310481336-13230-1-git-send-email-leiwen@marvell.com>
	<1310701473-31632-1-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311137512.20738.134.camel@sauron>
Mime-Version: 1.0
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>, Yu Tang <ytang5@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-14 at 20:44 -0700, Lei Wen wrote:
> V2:
> Choose to at most keep original pxa3xx_nand_info structure to reduce
> patch size
> 
> V3:
> Seperate original one patch into a patch set
> 
> V4:
> Further seperate patch into small pieces:
> Mainly change make in two patch, which seperate do
> the new structure definition and two chip select support add.
> 
> V5:
> Merge platform change patch and two chip feature into one patch.
> Clean some format issue.
> 
> V6:
> Add suspend and resume enhancement as a part of this patch set.
> 
> V7:
> Fix build bug
> Fix zylonite machine cannot resume back
> 
> V8:
> Fix typos and code style

Pushed the series to the l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy
