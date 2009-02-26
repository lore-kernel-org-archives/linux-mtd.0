Received: from 2605ds1-ynoe.1.fullrate.dk ([90.184.12.24] helo=shrek.krogh.cc)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcmCG-0004tt-U4
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 19:47:08 +0000
Message-ID: <49A6F1AC.4090305@krogh.cc>
Date: Thu, 26 Feb 2009 20:46:52 +0100
From: Jesper Krogh <jesper@krogh.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Linux 2.6.29-rc6
References: <alpine.LFD.2.00.0902222023520.3111@localhost.localdomain>	
	<49A679E8.1010301@krogh.cc>	
	<alpine.LFD.2.00.0902260941090.3111@localhost.localdomain>	
	<49A6EE17.4070102@krogh.cc>
	<1235677008.8730.176.camel@macbook.infradead.org>
In-Reply-To: <1235677008.8730.176.camel@macbook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ryan Jackson <rjackson@lnxi.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Dave Olsen <dolsen@lnxi.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Thu, 2009-02-26 at 19:31 +0000, Jesper Krogh wrote:
>> 1) pick the distro .config
>> 2) make oldconfig
> 
> So it should have been a module, not built-in?

It is a module.. and it somehow gets auto-loaded on my system. (not 
listed in /etc/modules).

$ grep -i ck804xrom /boot/config-2.6.29-rc6
CONFIG_MTD_CK804XROM=m

Same in the distro .config
$ grep -i ck804xrom /boot/config-2.6.24-23-server
CONFIG_MTD_CK804XROM=m


>> 3) Let the kernel load what it think it needs.
> 
> That part at least ought to be disabled -- we don't let this driver
> autoload, because unless you _know_ you need it, you don't need it.
> 
> It's for overwriting your BIOS.

Oh. Thanks for your time... I'll just make sure to disable it from now on.

-- 
Jesper
