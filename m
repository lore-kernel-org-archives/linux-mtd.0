Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dyb3a-0003yB-Mv
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 16:02:21 -0400
Received: from [10.0.10.193] (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id NAA26301
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2005 13:02:07 -0700
Message-ID: <42EA8B3F.3040403@mvista.com>
Date: Fri, 29 Jul 2005 13:02:07 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20050706144545.GA11447@zappa>
	<20050728121746.GA28368@zappa>	<Pine.LNX.4.63.0507281100060.21762@localhost.localdomain>	<20050728180732.GA7840@zappa>
	<42E920CC.2020105@mvista.com> <20050729065012.GA8186@ku-gbr.de>
In-Reply-To: <20050729065012.GA8186@ku-gbr.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:

> To be sure:
> Any xip_* function only calls functions marked __xipram (which are
> located in RAM then hopefully also) and only __xipram marked functions
> call functions located still in flash?

Nico's comments in cfi_cmdset_0001.c describe it better than I did:

* No interrupt what so ever can be serviced while the flash isn't in array
  * mode.  This is ensured by the xip_disable() and xip_enable() functions
  * enclosing any code path where the flash is known not to be in array 
mode.
  * And within a XIP disabled code path, only functions marked with __xipram
  * may be called and nothing else (it's a good thing to inspect generated
  * assembly to make sure inline functions were actually inlined and 
that gcc
  * didn't emit calls to its own support functions). Also configuring 
MTD CFI
  * support to a single buswidth and a single interleave is also 
recommended.

The reason for "single buswidth and a single interleave" is to avoid 
division operations to compute various things driven by those two 
parameters, which will probably call a library function placed by 
default in flash to do the divide; if a single buswidth and interleave 
is configured then the derived values are compiled as constants and need 
not be computed at runtime.

Yes, it's all a little delicate. ;)

-- 
Todd
