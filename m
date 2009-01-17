Received: from sovereign.computergmbh.de ([85.214.69.204])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LOJH2-0002Ag-2v
	for linux-mtd@lists.infradead.org; Sat, 17 Jan 2009 22:04:15 +0000
Date: Sat, 17 Jan 2009 23:04:06 +0100 (CET)
From: Jan Engelhardt <jengelh@medozas.de>
Sender: jengelh@sovereign.computergmbh.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
In-Reply-To: <1232228261.27094.0.camel@macbook.infradead.org>
Message-ID: <alpine.LSU.2.00.0901172301380.14505@fbirervta.pbzchgretzou.qr>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	netfilter-devel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	linux-media@vger.kernel.org, mchehab@infradead.org,
	linux-raid@vger.kernel.org, netfilter@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jaswinder Singh Rajput <jaswinder@kernel.org>,
	oliver.hartkopp@volkswagen.de, spi-devel-general@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Saturday 2009-01-17 22:37, David Woodhouse wrote:
>On Sun, 2009-01-18 at 01:47 +0530, Jaswinder Singh Rajput wrote:
>> --- a/include/linux/dvb/audio.h
>> +++ b/include/linux/dvb/audio.h
>> @@ -24,9 +24,8 @@
>>  #ifndef _DVBAUDIO_H_
>>  #define _DVBAUDIO_H_
>>  
>> -#ifdef __KERNEL__
>>  #include <linux/types.h>
>> -#else
>> +#ifndef __KERNEL__
>>  #include <stdint.h>
>>  #endif
>
>That patch looks wrong, and unnecessary. It was fine before.

What itches my eye is

#ifndef __KERNEL__
#include <stdint.h>
#endif

I am not sure how much Linux header files are supposed to be usable
from C++, but in case someone does, <cstdint> should be used in C++0x
mode. Testing for C++0x with macros however looks even more out of
place in such header files.
Thoughts?
