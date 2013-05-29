Message-ID: <51A64580.2010206@newsguy.com>
Date: Wed, 29 May 2013 11:14:24 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: fix eccstrength for ecc8
References: <20130528234534.GA22340@home.buserror.net>
In-Reply-To: <20130528234534.GA22340@home.buserror.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 prabhakar@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/28/2013 04:45 PM, Scott Wood wrote:
> Commit 44df4d11b8f573e9efcba94d63e6a1ad148c76d0 ("mtd: nand: fix
> incorrect ecc strength values") set eccstrength to 4 for IFC, but it is
> 8 in one configuration.
> 
> Signed-off-by: Scott Wood <scottwood@freescale.com>


Acked-by: Mike Dunn <mikedunn@newsguy.com>

Missed that... Sorry about that Scott.

Thanks,
Mike
