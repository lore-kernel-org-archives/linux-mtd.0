Received: from 220-130-17-250.hinet-ip.hinet.net ([220.130.17.250]
	helo=wellsyn.com)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6ozr-0000me-Nq
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 07:00:05 -0500
Message-ID: <027b01c51fe8$7f7624d0$1b0a060a@WellSyn.org>
From: "Kevin Liao" <kevinliao@wellsyn.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
	<Pine.LNX.4.58.0503031136030.26599@phoenix.infradead.org>
Date: Thu, 3 Mar 2005 19:59:46 +0800
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: compile error (undefined reference to jffs2_getlink) for kernel
	2.4.26
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Kevin,
> 
> I'm sorry, that was my patch which broke 2.4. I've completely forgotten 
> about 2.4-compatibility. I'll see what I might do to repair this. 
> Apologies.
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
>

You do not need to be sorry at all. I really don't want you guys to
maintain the backward compatibility for 2.4.x. I just want to find
the reason why this snapshop breaks 2.4.x and try to fix it by
myself. I need to say thank to tglx. Because his help, I now have
a working 2.4.x kernel with snapshop 20050228:) And I totally
agree his suggestion for removing the 2.4.x code from current CVS.

Regards,
Kevin
