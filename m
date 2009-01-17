Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
From: David Woodhouse <dwmw2@infradead.org>
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
In-Reply-To: <1232223441.3966.22.camel@localhost.localdomain>
References: <1232223441.3966.22.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 18 Jan 2009 08:37:41 +1100
Message-Id: <1232228261.27094.0.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org,
	dbrownell@users.sourceforge.net, Andrew Morton <akpm@linux-foundation.org>,
	urs.thuermann@volkswagen.de, neilb@suse.de,
	netdev@vger.kernel.org, x86 maintainers <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, mchehab@infradead.org,
	bfields@fieldses.org, tiwai@suse.de, netfilter@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oliver.hartkopp@volkswagen.de,
	linux-mtd@lists.infradead.org, greg@kroah.com,
	spi-devel-general@lists.sourceforge.net,
	Ingo Molnar <mingo@elte.hu>, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-01-18 at 01:47 +0530, Jaswinder Singh Rajput wrote:
> --- a/include/linux/dvb/audio.h
> +++ b/include/linux/dvb/audio.h
> @@ -24,9 +24,8 @@
>  #ifndef _DVBAUDIO_H_
>  #define _DVBAUDIO_H_
>  
> -#ifdef __KERNEL__
>  #include <linux/types.h>
> -#else
> +#ifndef __KERNEL__
>  #include <stdint.h>
>  #endif
>  

That patch looks wrong, and unnecessary. It was fine before.

-- 
dwmw2
