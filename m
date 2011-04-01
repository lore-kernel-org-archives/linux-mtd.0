Received: from bipbip.grupopie.com ([195.23.16.24])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5gga-0003PH-IZ
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:54:57 +0000
Message-ID: <4D95F54D.8020802@grupopie.com>
Date: Fri, 01 Apr 2011 16:54:53 +0100
From: Paulo Marques <pmarques@grupopie.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/2] do not select KALLSYMS_ALL
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>	
	<4D948D52.4040708@grupopie.com>
	<1301669776.2789.92.camel@localhost>	
	<1301670104.2789.94.camel@localhost>
	<4D95F092.4080604@grupopie.com>
	<1301672549.2789.107.camel@localhost>
In-Reply-To: <1301672549.2789.107.camel@localhost>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Fri, 2011-04-01 at 16:34 +0100, Paulo Marques wrote:
>>[...]
>> With an automatic makefile mechanism, the problem would go unnoticed and
>> it just wouldn't be fixed, increasing the kernel compile time for
>> everyone who hits the same troublesome configuration.
> 
> Yes, the build system may print a message:
> 
> Your symbols table is screwed, this is a bug, report about it. As a
> temporary workaround use "make KALLSYMS_EXTRA_PASS=1"
> 
> Or something like that.

Yes, I think that would work too, and it would even prevent the option
from being on for no good reason.

-- 
Paulo Marques - www.grupopie.com

"Nostalgia isn't what it used to be."
