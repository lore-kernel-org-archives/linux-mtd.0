From: dwmw2@infradead.org (David Woodhouse)
Date: 07 Feb 2003 13:54:16 +0000
Subject: mkfs.jffs on arm
In-Reply-To: <3E43C03E.4616.12A05CE@localhost>
References: <3E43C03E.4616.12A05CE@localhost>
Message-ID: <1044626056.21169.11.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-07 at 13:18, Igor Trevisan wrote:
> Hi all!
> 
> I have to port mkfs.jffs and erase commands on my
> EDB7312 board (arm core by CirrusLogic) but I'm having
> some problems...
> Are there any suggestion to cross-compile mtd utilities
> for an arm target?
> Thanks inadvance..
> 	Igor.

make CROSS=arm-linux-

-- 
dwmw2
