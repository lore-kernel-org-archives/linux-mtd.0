Received: from mail-in-05.arcor-online.net ([151.189.21.45])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HwJz0-0002WE-OM
	for linux-mtd@lists.infradead.org; Thu, 07 Jun 2007 11:33:09 -0400
In-Reply-To: <1181227676.2785.47.camel@pmac.infradead.org>
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<1180769992.14025.1.camel@localhost.localdomain>
	<4662E7EA.70506@ru.mvista.com>
	<d067769912d2ed5c9e1b4770b77303dd@kernel.crashing.org>
	<46630256.8050909@ru.mvista.com>
	<1181227676.2785.47.camel@pmac.infradead.org>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <ae47d6480bac81f4488ca0e749869ede@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Thu, 7 Jun 2007 17:32:57 +0200
To: David Woodhouse <dwmw2@infradead.org>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, ppcdev <linuxppc-dev@ozlabs.org>,
	linux-mtd@lists.infradead.org, Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>     That's the way the cookie crumbles in Linux MTD for now. It's
>> *always* detecting this by probing -- you only can say what [not] to
>> probe.
>
> You could hook it up to the chip drivers directly if you want, and
> bypass the probe code. I'm not sure it's worth it.

In most cases it is probably not worth it.  It is good
to hear that the option to bypass the probe if needed
is available though.


Segher
