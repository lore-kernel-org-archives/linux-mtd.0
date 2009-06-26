Subject: RE: [PATCH][MTD][NAND]: fix omap2.c compile failure and warning
From: David Woodhouse <dwmw2@infradead.org>
To: "Singh,
	Vimal" <IMCEAEX-_O=TI_OU=BD_CN=RECIPIENTS_CN=X0094262@dlee86.itg.ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E739404321C60D1@dbde02.ent.ti.com>
References: <1246022509-16194-1-git-send-email-tom.leiming@gmail.com>
	,<1246028984.663.9.camel@macbook.infradead.org>
	<19F8576C6E063C45BE387C64729E739404321C60D1@dbde02.ent.ti.com>
Content-Type: text/plain
Date: Fri, 26 Jun 2009 17:18:59 +0100
Message-Id: <1246033139.663.35.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "david-b@pacbell.net" <david-b@pacbell.net>,
	"tom.leiming@gmail.com" <tom.leiming@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jzhang@ti.com" <jzhang@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-26 at 21:15 +0530, Singh, Vimal wrote:
> 
> That's correct David. I think 'cond_resched()' would be fine here.

Got a patch? I have you down as the person responsible for this driver,
given that jzhang@ti.com is bouncing... 

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
