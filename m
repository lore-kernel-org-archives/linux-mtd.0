Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ShQf-0001hQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 18:08:33 +0100
Message-ID: <3D2DBB83.ED181F2C@analog.com>
Date: Thu, 11 Jul 2002 10:08:19 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: Daniel Belz <danielb@cyclades.com.br>
CC: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Mounting JFFS2, Bootloader
References: <3D2D79FE.5C54CC78@cyclades.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Having recently done the same kind of thing (on a different board), I
think I can help. 

Exactly what you need depends a bit on how you want to handle this. If
you are happy with a bootstrap that can only handle one kernel, then
it's really easy: You hardcode the path/filename of the kernel into
the bootloader, and then walk the filesystem looking for this file. If
you want more flexibility than that, you may instead need to look for
a configuration file and then process the configuration file. 

JFFS2 has a really easy to work with on-device layout, so it shouldn't
take much effort to locate the files you're interested in. 

The files you'll need to work with are in fs/jffs2 and include/linux. 

Figure out exactly what capabilities you want first though. That'll
make it much easier to plan out. And remember, if it's being done in
the bootloader, you're not in the kernel, so you may have to
reimplement some things. 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
