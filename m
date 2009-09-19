Subject: RE: [PATCH] [JFFS2] Fix csize integer overflow issue due to truncation
From: David Woodhouse <dwmw2@infradead.org>
To: Victor Gallardo <vgallardo@amcc.com>
In-Reply-To: <1253392841.6317.37.camel@macbook.infradead.org>
References: <25217471.1985431251223831787.JavaMail.nabble@isper.nabble.com>
	<0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
	<1253392841.6317.37.camel@macbook.infradead.org>
Content-Type: text/plain
Date: Sat, 19 Sep 2009 14:05:22 -0700
Message-Id: <1253394323.6317.39.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Prodyut Hazarika <phazarika@amcc.com>, linux-mtd@lists.infradead.org,
	Feng Kan <fkan@amcc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-09-19 at 13:40 -0700, David Woodhouse wrote:
> 
> +#define tn_csize(tn)           ((tn)->__csize & !TN_OVERLAP)

You'll want to fix that when you test, of course...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
