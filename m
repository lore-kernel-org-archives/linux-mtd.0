Received: from sovereign.computergmbh.de ([85.214.69.204])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LQTye-0007dp-4o
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2009 21:54:14 +0000
Date: Fri, 23 Jan 2009 22:54:09 +0100 (CET)
From: Jan Engelhardt <jengelh@medozas.de>
Sender: jengelh@sovereign.computergmbh.de
To: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
In-Reply-To: <497A3793.5090502@zytor.com>
Message-ID: <alpine.LSU.2.00.0901232252510.25716@fbirervta.pbzchgretzou.qr>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org>
	<49725B1E.604@kernel.org>
	<1232498319.3123.34.camel@localhost.localdomain>
	<1232726359.3504.18.camel@localhost.localdomain>
	<1232726658.3504.22.camel@localhost.localdomain>
	<alpine.LSU.2.00.0901231710350.15413@fbirervta.pbzchgretzou.qr>
	<497A3793.5090502@zytor.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	"H. Peter Anvin" <hpa@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>, dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	netfilter-devel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	linux-media@vger.kernel.org, mchehab@infradead.org,
	linux-raid@vger.kernel.org, netfilter@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jaswinder Singh Rajput <jaswinder@kernel.org>,
	oliver.hartkopp@volkswagen.de, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Friday 2009-01-23 22:33, H. Peter Anvin wrote:
>>
>> I had an objection as previously stated -- namely that
>> <stdint.h> should be included to remain friendly to C++0x
>> programs which should use <cstdint> instead. Forcing
>> stdint.h is therefore not nice.
>
> FWIW, it's kind of pointless in that case; <cstdint> exports it into the std::
> namespace rather than the root namespace, so using stdint types still don't
> work.

Hm, maybe g++ defaults to std? Because this works without me using
"using std;"

#include <cstdint>
int main(void)
{
	uint32_t x;
}
