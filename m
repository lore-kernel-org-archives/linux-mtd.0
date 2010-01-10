Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTlFZ-0006oR-7k
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 00:01:49 +0000
Received: by fxm22 with SMTP id 22so22937114fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Jan 2010 16:01:44 -0800 (PST)
Subject: Re: ubiattach taking very long time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea60912220614r656df531sae2be73e8f7f8163@mail.gmail.com>
References: <dbdb2ea60912220614r656df531sae2be73e8f7f8163@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 02:01:41 +0200
Message-Id: <1263081701.7315.128.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-12-22 at 09:14 -0500, twebb wrote:
> Does it make any sense that a ubiattach would take > 20 secs?  The
> flash I'm using is Samsung 4GiB MLC NAND flash.  I'm running 2.6.28
> kernel.  Here's the capture...

Yes, it can do this. UBI is not scalable, read here:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_scalability

Please, also take a look here:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_attach_faster

To really fix your problem we need UBI2.

In your case, it needs to read 8KiB from each PEB. If you know your I/O
speed, you can do the math.

To measure your read speed and scan speed, you can use 'mtd_speedtest':

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
