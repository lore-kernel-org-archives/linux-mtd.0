Date: Tue, 10 May 2016 13:52:58 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Cc: Rob Herring <robh@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Russell King <linux@arm.linux.org.uk>, Josh Wu <rainyfeeling@outlook.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] mtd: atmel_nand: remove compatible "atmel,sama5d4-nfc"
Message-ID: <20160510115258.GS2890@piout.net>
References: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
 <20160509201324.GA9845@rob-hp-laptop>
 <B256D81BAE5131468A838E5D7A243641D6487F5A@penmbx01>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D6487F5A@penmbx01>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/05/2016 at 04:50:37 +0000, Yang, Wenyou wrote :
> 
> 
> > -----Original Message-----
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: 2016年5月10日 4:13
> > To: Yang, Wenyou <Wenyou.Yang@atmel.com>
> > Cc: Brian Norris <computersforpeace@gmail.com>; David Woodhouse
> > <dwmw2@infradead.org>; Pawel Moll <pawel.moll@arm.com>; Mark Brown
> > <broonie@kernel.org>; Ian Campbell <ijc+devicetree@hellion.org.uk>; Kumar
> > Gala <galak@codeaurora.org>; linux-kernel@vger.kernel.org; linux-
> > mtd@lists.infradead.org; devicetree@vger.kernel.org; Ferre, Nicolas
> > <Nicolas.FERRE@atmel.com>; Alexandre Belloni <alexandre.belloni@free-
> > electrons.com>; Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>;
> > Russell King <linux@arm.linux.org.uk>; Josh Wu <rainyfeeling@outlook.com>;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH 0/2] mtd: atmel_nand: remove compatible "atmel,sama5d4-
> > nfc"
> > 
> > On Mon, May 09, 2016 at 02:51:17PM +0800, Wenyou Yang wrote:
> > > It is a datasheet bug, for current SoCs, the RB_EDGE3(i.e. bit 27) of
> > > HSMC_SR register does not exist, the RB_EDGE0 (i.e. bit 24) is the
> > > ready/busy line edge status bit. So the compatible "atmel,sama5d4-nfc"
> > > is unneeded.
> > 
> > The compatible is needed if the SOC still exists. You can list both for the sama5d4
> > if the block is the same.
> 
> The NFC IP of SAMA5D4 is same as SAMA5D2's, SAMA5D4 hase this issue.  This compatible can be removed. 
> 

Well, I agree with Rob, we don't remove an existing compatible. Simply
make it do the right thing (i.e. the same as sama5d3-nfc).

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
