Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwGRX-0003J3-Op
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 08:00:28 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Yuzuru Nitta <nitta@hht.co.jp>
In-Reply-To: <20040226095217.4793.NITTA@hht.co.jp>
References: <20040226095217.4793.NITTA@hht.co.jp>
Content-Type: text/plain
Message-Id: <1077782418.11584.1044.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 26 Feb 2004 08:00:18 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 for ST M29W320DT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-26 at 11:19 +0900, Yuzuru Nitta wrote:
> /---------------------------------------------------------
>    address               size   device          buswidth
> /---------------------------------------------------------
> 0x00000000 - 0x01FFFFFF  32MB   ST M29W640DT x4  (32bit)
> /---------------------------------------------------------
> 0x02000000 - 0x027FFFFF  8MB    ST M29W320DT x2  (32bit)
> /---------------------------------------------------------

So your 640DT devices are each in 8-bit mode, and the 320DT devices are
in 16-bit mode? Are you sure about that?

Ignore JFFS2 and write data to the chips directly via /dev/mtd<N>. See
if there's a recognisable pattern.

-- 
dwmw2
