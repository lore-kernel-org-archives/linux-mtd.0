Subject: Re: [PATCH v2 1/2] Documentation: mtk-quadspi: update DT bindings
To: Rob Herring <robh@kernel.org>, Guochun Mao <guochun.mao@mediatek.com>
References: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
 <1485315515-29942-2-git-send-email-guochun.mao@mediatek.com>
 <20170127222936.d342eloplti27p4s@rob-hp-laptop>
CC: Brian Norris <computersforpeace@gmail.com>, John Crispin
 <john@phrozen.org>, David Woodhouse <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King
 <linux@armlinux.org.uk>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <90bfb55c-eb01-af2f-d2f7-49f1f33da3b2@atmel.com>
Date: Mon, 30 Jan 2017 13:49:52 +0100
MIME-Version: 1.0
In-Reply-To: <20170127222936.d342eloplti27p4s@rob-hp-laptop>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 27/01/2017 à 23:29, Rob Herring a écrit :
> On Wed, Jan 25, 2017 at 11:38:34AM +0800, Guochun Mao wrote:
>> Add "mediatek,mt2701-nor" for nor flash node's compatible.
>>
>> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
>> ---
>>  .../devicetree/bindings/mtd/mtk-quadspi.txt        |    8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
Applied to the github spi-nor tree.

Thanks!
