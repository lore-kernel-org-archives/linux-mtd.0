Received: from smtp.flash.net.br ([201.46.240.48] helo=smtp.gru.flash.tv.br)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxSsE-0004Nm-0A
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 21:24:04 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.gru.flash.tv.br (Postfix) with ESMTP id 644241E6AE2
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Apr 2009 18:23:33 -0300 (BRT)
Received: from smtp.gru.flash.tv.br ([127.0.0.1])
	by localhost (smtp.gru.flash.tv.br [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KMSYmC6oKZN6 for <linux-mtd@lists.infradead.org>;
	Fri, 24 Apr 2009 18:23:31 -0300 (BRT)
Received: from chagas.nectar.ath.cx (unknown [187.22.248.170])
	by smtp.gru.flash.tv.br (Postfix) with ESMTPA id C3D401E6AB9
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Apr 2009 18:23:26 -0300 (BRT)
Date: Fri, 24 Apr 2009 18:23:12 -0300
From: =?utf-8?Q?Rog=C3=A9rio?= Brito <rbrito@ime.usp.br>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: Regarding the linkstation defconfig
Message-ID: <20090424212311.GA7858@ime.usp.br>
References: <20090424065816.GA15525@ime.usp.br>
	<Pine.LNX.4.64.0904242158210.8309@axis700.grange>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0904242158210.8309@axis700.grange>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Kumar Gala <galak@kernel.crashing.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Guennadi, and Kumar.

On Apr 24 2009, Guennadi Liakhovetski wrote:
> On Fri, 24 Apr 2009, Rogério Brito wrote:
> > Guennadi, since you seem to be the one responsible for the
> > linkstation/kurobox in the kernel,
> 
> That's not howI interpret my role in linkstation development /
> support.

Sorry. I thought that you were. I have, nonetheless, interest in helping
and understanding more about the platform.

> > - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> >  01. why is anticipatory the default scheduler for linkstations when CFQ
> >      is the default scheduler for the rest of the kernel?
(...)
> >  12. wouldn't it be a good thing to enable CONFIG_PRINTK_TIME?
> > - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> 
> As I already replied to you earlier, I am not particularly interested in 
> fine-tuning and optimisation of defconfigs. IMHO *_defconfigs are only 
> examples of board configuration, that are known to build and work. The 
> rest is up to the user / packager.

IMVHO, defconfigs should be examples of board configuration, known to
build and work (like you said) *and* be, in a way, exemplary to the
user/packager.

> > Again, please, forgive my ignorance here regarding the questions above.
> > I'm really looking for some clarification and to get things in shape
> > both on my systems and in the default kernel configuration, in general.
> 
> Feel free to submit patches with reasoning to the powerpc ML and 
> respective maintainer as per MAINTAINERS file.

I'm doing that as a reply to this message.


Thanks for your guiding, Rogério Brito.

-- 
Rogério Brito : rbrito@{mackenzie,ime.usp}.br : GPG key 1024D/7C2CAEB8
http://www.ime.usp.br/~rbrito : http://meusite.mackenzie.com.br/rbrito
Projects: algorithms.berlios.de : lame.sf.net : vrms.alioth.debian.org
