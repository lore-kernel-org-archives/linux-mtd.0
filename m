Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOZEq-00079P-8v
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 06:48:53 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: carl liao <carlliao@21cn.com>
In-Reply-To: <DB949578818096.01258@send2.inner-21cn.com>
References: <DB949578818096.01258@send2.inner-21cn.com>
Content-Type: text/plain
Date: Thu, 21 Apr 2005 14:48:22 +0400
Message-Id: <1114080502.32582.39.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Why nandwrite success but mount complain?
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-04-21 at 18:16 +0800, carl liao wrote:
> Which codes should I dig into:
>     1) NAND Flash drvier?
>     2) NAND Flash core layer?
>     3) JFFS2 wbuf.c and other JFFS2 codes in the kernel?
>     4) the nandwrite program itself?
> 
I suspect 1.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
