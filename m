Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NtDL-0003cY-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 11:15:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021216095652.D4D24C6139@atlas.denx.de> 
References: <20021216095652.D4D24C6139@atlas.denx.de> 
To: Wolfgang Denk <wd@denx.de>
Cc: Paul Nash <paulnash@wildseed.com>,
    "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Dec 2002 11:45:49 +0000
Message-ID: <18190.1040039149@passion.cambridge.redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

wd@denx.de said:
> Running the kernel XIP is not so insane. It can help to  reduce  boot
> time.  We  still  more  than  3  seconds from power-on to application
> start, which is not so  bad,  but  still  too  much  in  some  cases;
> avoiding  the  memcpy()  of  some  2 MB of data is kind of attractive
> then...

That's true, although even if you have the kernel on a separate flash chip
to which you don't ever write, it does cost you later because you then run
from flash which is slower than RAM. I wonder if we could copy the kernel
from flash to RAM at runtime and fix up the page tables as we go, to get the
best of both worlds?

--
dwmw2
