Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DRdXg-0002c9-5x
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2005 18:01:01 -0400
Message-ID: <4272AE99.6090008@mvista.com>
Date: Fri, 29 Apr 2005 15:00:57 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Talat Ozyagcilar <tozyagcilar@gmail.com>
References: <57258408050429071549faab15@mail.gmail.com>
In-Reply-To: <57258408050429071549faab15@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd erase error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Talat Ozyagcilar wrote:
...
> mtdblock: writing cached data for "RootFS" at 0x0, size 0x20000
> Chip reports voltage low on erase: status 0xa8
...
> Is this really a hardware problem, or has anybody come across this? 

It means the driver for the chip's connection to your board (probably) 
isn't raising the voltage to the proper level (called VPP in the mtd 
code) required by the chip for an erase operation.  Various code paths 
can nest VPP enables/disables in unbalanced ways, often causing 
problems.  If this is the case in your situation, info in
http://lists.infradead.org/pipermail/linux-mtd/2005-January/011517.html
may help.

-- 
Todd
