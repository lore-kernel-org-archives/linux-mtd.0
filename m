Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189oW9-0005vI-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 15:24:25 +0000
Date: Thu, 7 Nov 2002 16:54:33 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Brian J. Murrell" <e88cd5ffd87e620fdc30b3e6db510d03@interlinx.bc.ca>,
   linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021107155433.GD31118@wohnheim.fh-wedel.de>
References: <20021107153336.GB31118@wohnheim.fh-wedel.de> <20021107135052.GA13914@pc.ilinx> <20021106204530.GE12743@pc.ilinx> <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <7374.1036677634@passion.cambridge.redhat.com> <15366.1036683254@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15366.1036683254@passion.cambridge.redhat.com>
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

On Thu, 7 November 2002 15:34:14 +0000, David Woodhouse wrote:
>>  Shouldn't the current mapping drivers be disabled as well, unless we
>> are dealing with hardware or mmapping host memory? 
> 
> Yeah. Aren't most of them arch-specific already though?

Correct. Physmap depends on gen_probe, which itself would depend on
any mapping driver. This cyclic dependency should go away, I guess,
but the idea is really nice.

>>> A better plan would be to allow the chip configuration to be enabled iff
>>> there is at least one mapping driver enabled.

How could this be done in an elegant manner? I fear something like
if [ "$CONFIG_THISMAP" = "y" -o
     "$CONFIG_THATMAP" = "y" -o
     ...
     "$CONFIG_LASTMAP" = "y" ]

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
