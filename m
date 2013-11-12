Message-ID: <52825414.4000806@ti.com>
Date: Tue, 12 Nov 2013 11:15:16 -0500
From: Santosh Shilimkar <santosh.shilimkar@ti.com>
MIME-Version: 1.0
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 11/12] mtd: nand: davinci: don't request AEMIF address
 range
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-12-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8D64@DNCE04.ent.ti.com>
In-Reply-To: <4F5844B3A985794BA902E12C070812375F8D64@DNCE04.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rob Landley <rob@landley.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 11 November 2013 12:12 PM, Khoronzhuk, Ivan wrote:
> The AEMIF driver registers are used to setup timings for each chip
> select. The same registers range is used to setup NAND settings.
> The AEMIF and NAND drivers not use the same registers in this range.
> 
> In case with AEMIF driver, the memory address range is requested
> already by AEMIF, so we cannot request it twice, just ioremap.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
