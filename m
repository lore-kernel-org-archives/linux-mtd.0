Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDict-00067f-Lq
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 09:09:14 -0400
Message-ID: <4321894C.8050809@yandex.ru>
Date: Fri, 09 Sep 2005 17:08:28 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <42FB68AE.6070805@inf.u-szeged.hu>	
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru>	
	<43008129.2060303@inf.u-szeged.hu> <43008BFB.502@yandex.ru>	
	<4300970E.2090803@inf.u-szeged.hu>
	<43009AE1.6010907@yandex.ru>	 <4301A259.3090304@yandex.ru>	
	<1126186364.28995.10.camel@hades.cambridge.redhat.com>	
	<43203E13.3080204@yandex.ru>
	<20050908184326.GE20668@wohnheim.fh-wedel.de>
	<1126270658.4491.8.camel@windu.rchland.ibm.com>
In-Reply-To: <1126270658.4491.8.camel@windu.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhao_fusheng@hotmail.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 eraseblock header
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> 
> In any case, would you please bump the overall version of JFFS2 if this
> change is made?  I don't mean "JFFS3", I mean "JFFS2 version 2.3" or
> similar.  See super.c line 320 for where I'm talking about.
Agree, this should be done. I also offered to introduce a version number 
byte to the erasebloch header. This is somewhat ugly but will help to 
quickly recognize the JFFS2 image version. In future this will help us.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
