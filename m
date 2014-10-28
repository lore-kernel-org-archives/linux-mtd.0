Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj3N4-00032T-Mq
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 09:47:23 +0000
Message-ID: <544F6611.1000801@ti.com>
Date: Tue, 28 Oct 2014 11:46:57 +0200
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Frans Klaver <frans.klaver@xsens.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: omap: fix mtd devices not showing up
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <1414420445-9020-1-git-send-email-frans.klaver@xsens.com>
In-Reply-To: <1414420445-9020-1-git-send-email-frans.klaver@xsens.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/27/2014 04:34 PM, Frans Klaver wrote:
> Since commit 6d178ef2fd5e ("mtd: nand: Move ELM driver and rename as
> omap_elm"), I don't have any mtd devices present on my am335x. This
> changes the link order of the omap_elm and omap2 objects, causing them
> to probe in the wrong order.
> 
> To fix this, make elm_config defer probing until the omap_elm driver is
> actually loaded.
> 
> Signed-off-by: Frans Klaver <frans.klaver@xsens.com>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger
