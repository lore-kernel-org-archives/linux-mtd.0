Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189mjg-0005a4-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 13:30:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021107135052.GA13914@pc.ilinx> 
References: <20021107135052.GA13914@pc.ilinx>  <20021106204530.GE12743@pc.ilinx> <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <6557.1036 
To: "Brian J. Murrell" <e88cd5ffd87e620fdc30b3e6db510d03@interlinx.bc.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Nov 2002 14:00:34 +0000
Message-ID: <7374.1036677634@passion.cambridge.redhat.com>
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

e88cd5ffd87e620fdc30b3e6db510d03@interlinx.bc.ca said:
>  I hope I am understanding the question/scenario you are proposing,
> but the answer seems to simple, so I am sure I am missing something.

> When/if someone makes that UML mapping driver, it would have it's

<PEDANT>
	YM "its"
</PEDANT>

(Sorry, customers being bloody stupid at me today and I have to be nasty to 
_someone_ or my brain will explode :)

> CONFIG_MTD_UML (or whatever they will call it) outside of the
> CONFIG_MEMORY bus protected portions of the MTD Config.in files.

But the options for the _chips_ it's able to find in that mapping are 
disabled because CONFIG_MEMORY_BUS is turned off.

A better plan would be to allow the chip configuration to be enabled iff 
there is at least one mapping driver enabled. 

--
dwmw2
