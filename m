From: David Woodhouse <dwmw2@infradead.org>
To: Clay Douglass <clay.douglass@conformative.com>
In-Reply-To: <6.0.3.0.2.20040414113058.01bf6710@mail.conformative.com>
References: <6.0.3.0.2.20040414113058.01bf6710@mail.conformative.com>
Content-Type: text/plain
Message-Id: <1081965232.6169.21.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Wed, 14 Apr 2004 13:53:52 -0400
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: List of supported devices?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-04-14 at 11:33 -0500, Clay Douglass wrote:
> A couple, hopefully quick questions. I have downloaded all the source and 
> documentation I could find. I found many parts "IDs" in various files. I 
> was wondering if there is some more central place to look to see if a given 
> part is supported? Or some better way (magic grep pattern?) to collect the 
> supported parts "IDs"...

If it supports the Common Flash Interface, it's probably supported. I
think the StrataFlash parts you mention _do_ support CFI. If they don't
do CFI, the table in jedec_probe.c is where you want to look. The rest
is obsolescent.

-- 
dwmw2
