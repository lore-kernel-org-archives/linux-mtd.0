Date: Thu, 20 Mar 2014 11:54:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 2/3] mtd: davinci-nand: add dts property for
 NAND_NO_SUBPAGE_WRITE option
Message-ID: <20140320185452.GB21018@ld-irv-0074>
References: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1395335184-4745-3-git-send-email-ivan.khoronzhuk@ti.com>
 <532B2183.2080309@ti.com>
 <20140320172912.GW31517@norris-Latitude-E6410>
 <532B2766.6090506@ti.com>
 <D69011BE-C37F-4085-B992-45F6F32AF1D0@gmail.com>
 <532B2D3F.6050004@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <532B2D3F.6050004@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 Russell King - ARM Linux <linux@arm.linux.org.uk>, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Murali Karicheri <m-karicheri2@ti.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, rob@landley.net, galak@codeaurora.org,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 David Woodhouse <dwmw2@infradead.org>, Warner Losh <imp@bsdimp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 20, 2014 at 02:02:39PM -0400, Santosh Shilimkar wrote:
> On Thursday 20 March 2014 01:44 PM, Warner Losh wrote:
> > I though sub page writing was one of the fields in the onfi and/or jedec(toggle) meta data structures. Have you looked there?
> > 
> Am not sure if I follow you. The limitation is from the TI NAND controller(AEMIF) and
> not the NAND memory. 

That doesn't match the patch description, which says "that flash doesn't
support subpage writing". Flash != flash controller.

Which one is it? If it's a controller limitation, I think we should be
able to pull this from a "compatible" property, no?

Brian
