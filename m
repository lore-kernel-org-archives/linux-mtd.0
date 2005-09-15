Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFq06-0002pT-AC
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 05:26:02 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
In-Reply-To: <43293B92.8070604@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>
	<4329251C.7050102@mw-itcon.de>	<43292A8B.4020707@yandex.ru>
	<43292E94.4020702@mw-itcon.de> <43293527.9010504@yandex.ru>
	<43293B92.8070604@mw-itcon.de>
Content-Type: text/plain
Date: Thu, 15 Sep 2005 13:25:17 +0400
Message-Id: <1126776317.20014.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-15 at 11:14 +0200, Peter Menzebach wrote:
> My guess at the moment is, that the write buffering has some problems 
> somewhere. I can see, that everytime a whole pagesize is written to 
> flash. Is that intended?
This is OK. The whole goal of the write-buffer is to accumulate small
writes and to flush the whole page at once. It is assumed that the
minimal flash IO unit is c->wbuf_pagesize.

Could you please reproduce the problem, gather the log and send it
again, but with 2 notes:

1. please, output messages synchronously to a serial console (try dmesg
-n 8). When you use dmesg you see only the last output and loose
everything which does not fit the internal Linux output ring buffer.

2. AFAIU, after remount files disappear. Please, also send the log of
the second mount/

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
