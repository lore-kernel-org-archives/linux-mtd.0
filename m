Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Nt0k-0003av-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 11:02:10 +0000
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Nash <paulnash@wildseed.com>,
	"Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 16 Dec 2002 09:38:34 GMT."
             <2466.1040031514@passion.cambridge.redhat.com>
Date: Mon, 16 Dec 2002 10:56:47 +0100
Message-Id: <20021216095652.D4D24C6139@atlas.denx.de>
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

In message <2466.1040031514@passion.cambridge.redhat.com> you wrote:
> 
> Also true. Of course we have to distinguish between XIP of file system 
> pages and of the kernel -- I was ignoring the latter because it's even less 
> sane than the former. If you ever want to write to the chip, you have to 
> disable all interrupts and wait while the chip is busy. For up to 20 
> seconds, in the case of a slow erase.

Running the kernel XIP is not so insane. It can help to  reduce  boot
time.  We  still  more  than  3  seconds from power-on to application
start, which is not so  bad,  but  still  too  much  in  some  cases;
avoiding  the  memcpy()  of  some  2 MB of data is kind of attractive
then...

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
"Just think of a computer as hardware you can program."
- Nigel de la Tierre
