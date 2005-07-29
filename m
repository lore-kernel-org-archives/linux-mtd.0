Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DyOhE-0006u6-Tu
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 02:50:24 -0400
Received: from dsl-082-082-157-208.arcor-ip.net ([82.82.157.208]:40721
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1DyOkD-0004mO-8u
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2005 08:53:21 +0200
Received: from [10.10.0.17] (helo=sexmachine.doom)
	by zappa with esmtp (Exim 3.36 #1 (Debian)) id 1DyOhB-0001zF-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2005 08:50:13 +0200
Received: from konsti by sexmachine.doom with local (Exim 4.50)
	id 1DyOhA-00028W-8H
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 08:50:12 +0200
Date: Fri, 29 Jul 2005 08:50:12 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050729065012.GA8186@ku-gbr.de>
References: <20050706144545.GA11447@zappa> <20050728121746.GA28368@zappa>
	<Pine.LNX.4.63.0507281100060.21762@localhost.localdomain>
	<20050728180732.GA7840@zappa> <42E920CC.2020105@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42E920CC.2020105@mvista.com>
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-07-28 11:15 -0700 schrieb Todd Poynor:

> >Hm.. funny. Beside the trouble with my toolchains the working one
> >creates definately only a bootable xipuImage if CONFIG_FPE_NWFPE is
> >enabled.  I wonder myself, why...
> 
> Dunno about that option, but check the assembly code generated for the 
> xip_* routines to see if any functions are called that are not marked 
> __xipram?  If so, linux may be attempting to execute from flash memory 

Ok, I can check that. 
To be sure:
Any xip_* function only calls functions marked __xipram (which are
located in RAM then hopefully also) and only __xipram marked functions
call functions located still in flash?

> while the flash is not in the proper (read array or whatever) state.

Something like that seems to habben, indeed...

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
