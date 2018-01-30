MIME-Version: 1.0
In-Reply-To: <1517333637-17331-3-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1517333637-17331-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1517333637-17331-3-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Jan 2018 12:53:33 -0600
Message-ID: <CAL_JsqLBUDNEWkcrNcrOmuYcR=Gbf2ALD=z4s9AP4poOcBxNRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: fsl-quadspi: spi-rx/tx-bus-width usage
 example
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 Han Xu <han.xu@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, suresh.gupta@nxp.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 30, 2018 at 11:33 AM, Yogesh Gaur
<yogeshnarayan.gaur@nxp.com> wrote:
> Added usage example by adding support for spi-rx-bus-width
> and spi-tx-bus-width binding.

Why not just add to existing example? Is there something unclear about
adding these properties to warrant an example? We don't need every
possible option enumerated.

Rob
