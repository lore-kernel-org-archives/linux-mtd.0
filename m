Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189oCN-0005jZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 15:03:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021107153336.GB31118@wohnheim.fh-wedel.de> 
References: <20021107153336.GB31118@wohnheim.fh-wedel.de>  <20021107135052.GA13914@pc.ilinx> <20021106204530.GE12743@pc.ilinx> <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <7374.1036677634@passion.cambridge.redhat.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: "Brian J. Murrell" <e88cd5ffd87e620fdc30b3e6db510d03@interlinx.bc.ca>,
    linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Nov 2002 15:34:14 +0000
Message-ID: <15366.1036683254@passion.cambridge.redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

joern@wohnheim.fh-wedel.de said:
>  Shouldn't the current mapping drivers be disabled as well, unless we
> are dealing with hardware or mmapping host memory? 

Yeah. Aren't most of them arch-specific already though?

--
dwmw2
