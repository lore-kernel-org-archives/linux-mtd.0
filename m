Subject: Re: SV: SV: Jffs2 crach in 2.6.25.6.atmel.1
From: David Woodhouse <dwmw2@infradead.org>
To: Eirik Aanonsen <eaa@wprmedical.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417C8D@wpr01.wprmedical.local>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
	<1218203287.12232.165.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
	<1218877876.3184.185.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8D@wpr01.wprmedical.local>
Content-Type: text/plain
Date: Sun, 17 Aug 2008 14:17:40 +0100
Message-Id: <1218979060.3184.291.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2008-08-17 at 14:34 +0200, Eirik Aanonsen wrote:
> I'm trying to figure out where to extract the c node from in the jffs2
> code. 

Make a global variable. At mount time, store it in that global variable.

-- 
dwmw2
