Received: from www14.mailshell.com ([209.157.66.246] helo=mailshell.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AOsAi-0006gu-CZ
	for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2003 05:25:04 +0000
Message-ID: <20031126052329.30052.qmail@mailshell.com>
In-Reply-To: <20031126054700.1d653837.lanas@t-online.de>
References: <20031124213552.5357c92a.lanas@t-online.de>
	 <20031125003817.GA1762@ei.homeip.net>
	 <Pine.LNX.4.53.0311250040510.2903@pink.linuxgrrls.org>
	 <20031125053911.6526ba39.lanas@t-online.de>
	 <000001c3b38f$b3118170$6401a8c0@f87htyy9967774jjyuww2>
	 <20031126054700.1d653837.lanas@t-online.de>
Mime-Version: 1.0
Date: Wed, 26 Nov 2003 13:23:30 +0000
From: daniel@dmhome.net
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: DoC newbie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

[ Sorry if I inform you about things that others already mentioned, I've
missed a few posts from this thread. ]  

In the past I have booted and setup many diskonchip devices with grub. I
can't find the original HOWTO anymore, but this link is more or less
what I used to do, and it worked great. 

http://lakeshoremicro.com/diskonchip-grub-howto.html


> Meanwhile, is it also possible to install either the jffs2 file system
> or either another type of journaling system targeted for leveling cell
> wear on a regular flash IDE device ?

Using the blkmtd driver, which is an emulation layer. I feel it's
usefull to benefit from the compression that jffs2 offers (as opossed to
cramfs, which is also compressed , but read-only) - but i am not sure if
you really can benefit from the wear leveling that jffs2 offers, since
ide flash devices have controllers inside that have their own flash
trasnlation layer... 


Greetings, 
Daniel 
