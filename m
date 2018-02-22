Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eoqZY-0003mX-OC
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 13:06:10 +0000
Date: Thu, 22 Feb 2018 14:05:42 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Bean Huo <beanhuo@outlook.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-elections.com" <boris.brezillon@free-elections.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, beanhuo
 <beanhuo@micron.com>
Subject: Re: [PATCH v1 1/3] mtd: physmap: add dual die entry in devicetree
 binding
Message-ID: <20180222140542.47340842@bbrezillon>
In-Reply-To: <DM2PR12MB001463BD62775C388AEBFD3FA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB001463BD62775C388AEBFD3FA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
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

On Wed, 21 Feb 2018 19:32:32 +0000
Bean Huo <beanhuo@outlook.com> wrote:

> From: beanhuo <beanhuo@micron.com>
> 
> This commit adds the dual die entry in the devicetree binding
> for the daul die stacked parallel NOR.
> 
> Signed-off-by: beanhuo <beanhuo@micron.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> index 4a0a48b..782bacc 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> @@ -29,6 +29,8 @@ file systems on embedded devices.
>   - use-advanced-sector-protection: boolean to enable support for the
>     advanced sector protection (Spansion: PPB - Persistent Protection
>     Bits) locking.
> + - dual-die-stack: boolean to enable support for the devices with the
> +   two dies in stack.

How about making that more future proof and adding a property that
directly contains the number of dies (num-dies)?

>  
>  For JEDEC compatible devices, the following additional properties
>  are defined:



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
