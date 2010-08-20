Subject: Re: [PATCH 2/2] mtd: nand: Increase NAND_MAX_OOBSIZE
From: David Woodhouse <dwmw2@infradead.org>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1282332973-12077-2-git-send-email-norris@broadcom.com>
References: <1282332973-12077-1-git-send-email-norris@broadcom.com>
	<1282332973-12077-2-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Aug 2010 20:43:05 +0100
Message-ID: <1282333385.25239.88.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 12:36 -0700, Brian Norris wrote:
> An increase in NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE is necessary
> in order to support many new chips. Among those:
> 
> Toshiba TC58TxG4S2FBAxx  8KB page, 576B OOB
> Micron MT29F64G08CBAAA   8KB page, 448B OOB

Ick, don't we have a better fix for this in the works?

-- 
dwmw2
