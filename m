Received: from smtp13.mail.yahoo.co.jp ([211.14.15.236])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JFtt-0000ZV-M8
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 18:00:13 +0100
Message-ID: <003d01c3214c$ca7fa560$740486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<1053626518.21582.460.camel@imladris.demon.co.uk>
Date: Sat, 24 May 2003 02:00:19 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
Cc: <linux-mtd@lists.infradead.org>
Sent: Friday, May 23, 2003 3:01 AM
Subject: Re: vmalloc for zlib workspace


> Hmm. That's a useful idea. Care to benchmark it an show how _much_ it
> improves performance in practice? Although I suppose there's no downside
> to it so we might as well change it.

I haven't tested it yet, I will check later...
I think it could be effective to multitask environment.

Matsunaga
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
