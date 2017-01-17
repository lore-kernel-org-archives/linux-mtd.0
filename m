Date: Tue, 17 Jan 2017 14:32:08 +1100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, devicetree@vger.kernel.org, Guochun Mao
 <guochun.mao@mediatek.com>, Richard Weinberger <richard@nod.at>, Russell
 King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] arm: dts: mt2701: add nor flash node
Message-ID: <20170117143208.03c9af83@free-electrons.com>
In-Reply-To: <20170113175628.1793f433@bbrezillon>
References: <1484291609-20195-1-git-send-email-guochun.mao@mediatek.com>
 <1484291609-20195-3-git-send-email-guochun.mao@mediatek.com>
 <20170113151747.6bc85245@bbrezillon>
 <d7b866ad-5b2f-62d3-3aa3-6fa42803d625@gmail.com>
 <b850b751-1d8d-0053-cf1f-d5314542e5c3@gmail.com>
 <20170113172825.75d545a3@bbrezillon>
 <86c997be-f500-eaa1-3ba5-d21cff6223b7@gmail.com>
 <20170113175628.1793f433@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, 13 Jan 2017 17:56:28 +0100, Boris Brezillon wrote:

> because both compatible are referring to very specific IP version. It's
> not the same as
> 
> 	compatible = "mediatek,mt8173-nor", "mediatek,mt81xx-nor";

mt81xx-nor is a bogus compatible string, and DT binding maintainers
will not accept it. They don't want compatible strings with "wildcards".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
