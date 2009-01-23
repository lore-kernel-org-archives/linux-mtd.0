Received: from sovereign.computergmbh.de ([85.214.69.204])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LQOco-0004Av-5q
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2009 16:11:20 +0000
Date: Fri, 23 Jan 2009 17:11:13 +0100 (CET)
From: Jan Engelhardt <jengelh@medozas.de>
Sender: jengelh@sovereign.computergmbh.de
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
In-Reply-To: <1232726658.3504.22.camel@localhost.localdomain>
Message-ID: <alpine.LSU.2.00.0901231710350.15413@fbirervta.pbzchgretzou.qr>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org>
	<49725B1E.604@kernel.org>
	<1232498319.3123.34.camel@localhost.localdomain>
	<1232726359.3504.18.camel@localhost.localdomain>
	<1232726658.3504.22.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	"H. Peter Anvin" <hpa@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>, dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	Ingo Molnar <mingo@elte.hu>, linux-media@vger.kernel.org,
	mchehab@infradead.org, linux-raid@vger.kernel.org,
	netfilter@vger.kernel.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, oliver.hartkopp@volkswagen.de,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Friday 2009-01-23 17:04, Jaswinder Singh Rajput wrote:
>> > diff --git a/include/linux/dvb/audio.h b/include/linux/dvb/audio.h
>> > index 89412e1..758a48c 100644
>> > --- a/include/linux/dvb/audio.h
>> > +++ b/include/linux/dvb/audio.h
>> > @@ -24,9 +24,8 @@
>> >  #ifndef _DVBAUDIO_H_
>> >  #define _DVBAUDIO_H_
>> >  
>> > -#ifdef __KERNEL__
>> >  #include <linux/types.h>
>> > -#else
>> > +#ifndef __KERNEL__
>> >  #include <stdint.h>
>> >  #endif
>> > 
>> 
>> It seems one have objection for this. So I will again insert this in my
>> new patchset.
>> 
>
>oops, s/seems one/seems no one ;-)

I had an objection as previously stated -- namely that
<stdint.h> should be included to remain friendly to C++0x
programs which should use <cstdint> instead. Forcing
stdint.h is therefore not nice.
