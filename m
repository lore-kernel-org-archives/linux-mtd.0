Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DBzFv-00009v-10
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 12:57:59 -0500
Message-ID: <4239C51B.70101@mvista.com>
Date: Thu, 17 Mar 2005 10:57:47 -0700
From: "Mark A. Greer" <mgreer@mvista.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <42323A97.5070105@mvista.com>
	<20050317163526.GB10864@wohnheim.fh-wedel.de>
In-Reply-To: <20050317163526.GB10864@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Embedded PPC Linux list <linuxppc-embedded@ozlabs.org>
Subject: Re: [PATCH 2.6.12] mtd: Remove MTD map file for Chestnut platform.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:

>On Fri, 11 March 2005 17:40:55 -0700, Mark A. Greer wrote:
>  
>
>>Remove Chestnut mtd map file.
>>
>>The chestnut now sets up its MTD map from its platform-specific file so 
>>the map file drivers/mtd/maps/chestnut.c is no longer needed.  This 
>>patch removes the file & the Kconfig/Makefile hooks.
>>
>>Please apply.
>>    
>>
>
>Applied to mtd cvs.  It will make its way to Linus eventually...
>
>Thanks!
>  
>

Jörn,

Thanks for looking into this but Andrew has already pushed that through 
from his end.  (I had posted an earler patch with the map removal in it 
before I broke it out and sent that part to you and the rest to Andrew 
again.)

Sorry for wasting your time.

Mark
