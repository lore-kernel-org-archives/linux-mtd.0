Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6od3-0008Qy-Go
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 06:36:30 -0500
Date: Thu, 3 Mar 2005 11:36:08 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Kevin Liao <kevinliao@wellsyn.com>
In-Reply-To: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
Message-ID: <Pine.LNX.4.58.0503031136030.26599@phoenix.infradead.org>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
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

Kevin Liao wrote:
> I use the snapshop 20050302 to patch kernel 2.4.26 for ARM. I get the 
> following
> error messages when I try to "make zImage":
> 

Kevin,

I'm sorry, that was my patch which broke 2.4. I've completely forgotten 
about 2.4-compatibility. I'll see what I might do to repair this. 
Apologies.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
