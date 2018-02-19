Date: Mon, 19 Feb 2018 08:34:31 -0600
From: Rob Herring <robh@kernel.org>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, oss@buserror.net, leoyang.li@nxp.com
Subject: Re: [PATCH 1/4][v4] dt-bindings: mtd-physmap: Add endianness supports
Message-ID: <20180219143431.ulznksgjv6ng5e6p@rob-hp-laptop>
References: <20180215114904.23627-1-prabhakar.kushwaha@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180215114904.23627-1-prabhakar.kushwaha@nxp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 15, 2018 at 05:19:04PM +0530, Prabhakar Kushwaha wrote:
> Connection between flash and controller is not necessary to be always
> of same type. It may varies from platform to platform.
> 
> Adding endianness (optional) property to provide connection type
> information.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
> Changes for v2: updated subject
> Changes for v3: fixed typo for "big-endian"
> Changes for v4: Moved binding definition in mtd-physmap.txt
> as discussed at https://patchwork.ozlabs.org/patch/842543/
> 
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
