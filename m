Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18287x-00031V-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2002 11:43:41 +0100
To: xuli <slowforce@zju.edu.cn>
Cc: linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Subject: Re: JFFS2 basic question 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sun, 17 Oct 2004 14:32:30 +0800."
             <E18243X-0002eo-00@pentafluge.infradead.org>
Date: Thu, 17 Oct 2002 12:43:13 +0200
Message-Id: <20021017104318.89BA9FAA7@denx.denx.de>
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

In message <E18243X-0002eo-00@pentafluge.infradead.org> you wrote:
>
> i want to implement the jffs2 file system under kernel2.4.4,
> but when i compile the kernel with the MTD and Jffs2 support
> i got a lot of errors: multiple definition. Because there is 

You could be a bit more specific _which_ errors you get.

> a file zlib.c both located in fs/jffs2/ and drivers/net/.
> Does anybody meet the same problem with me?

It worked fine for me, in a couple of configurations,  running  2.4.4
on misc PowerPC systems.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
To program is to be.
