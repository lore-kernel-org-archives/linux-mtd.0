Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DyCv2-0002fG-Hi
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 14:15:53 -0400
Received: from [10.0.10.193] (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id LAA16560
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 11:15:40 -0700
Message-ID: <42E920CC.2020105@mvista.com>
Date: Thu, 28 Jul 2005 11:15:40 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20050706144545.GA11447@zappa>
	<20050728121746.GA28368@zappa>	<Pine.LNX.4.63.0507281100060.21762@localhost.localdomain>
	<20050728180732.GA7840@zappa>
In-Reply-To: <20050728180732.GA7840@zappa>
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
> * Nicolas Pitre <nico@cam.org> [Thu, Jul 28, 2005 at 11:01:24AM -0400]:
> 
> 
>>>I switched off CONFIG_FPE_NWFPE=y which the XIP System seems to depend
>>>on!
>>
>>It sure doesn't.
>>
>>Something else must be going on.
> 
> 
> 
> Hm.. funny. Beside the trouble with my toolchains the working one
> creates definately only a bootable xipuImage if CONFIG_FPE_NWFPE is
> enabled.  I wonder myself, why...

Dunno about that option, but check the assembly code generated for the 
xip_* routines to see if any functions are called that are not marked 
__xipram?  If so, linux may be attempting to execute from flash memory 
while the flash is not in the proper (read array or whatever) state.

-- 
Todd
