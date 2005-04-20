Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOIFS-00022d-II
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 12:40:23 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DOIA7-0004pM-Ib
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 18:34:57 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2005 18:34:51 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2005 18:34:51 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 20 Apr 2005 16:34:01 +0000 (UTC)
Message-ID: <loom.20050420T180411-538@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<425E3174.4030308@inf.u-szeged.hu>
	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
	<loom.20050420T165531-253@post.gmane.org>
	<1114010417.32582.30.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> On Wed, 2005-04-20 at 14:59 +0000, Sergei Sharonov wrote:
> > Hmm.. then what improvement does summary patch provide? In my case mount
> > returns in 1.5 minutes but then I cannot do anything to flash for
> > another 20+ minutes.
> Poor poor you 

More like stuck ;-)
I believe I got the hardware and the OS right - the only trouble is
a filesystem. I cannot believe that I am the only one who runs linux
with large FLASH and requires power-fail safe operation. So far I
checked into:
1. JFFS2 - seems stable, good support, mainstream, but long mount time
makes it unusable with large NAND FLASH.
2. YAFFS2 - still playing with it. Has a lot of promise but is not
IMHO a stable/usable product at this point of time.
3. Reliance/FlashFX Pro - a commercial product that promises to do
what I need but is not yet available for linux. I was told end of Q2,
early Q3.
4. Samsung RFS - there were a few announcements last summer. They never
answered my email though.
5. Stuff like TargetFFS, etc. that has not been ported (and no
intention?) to linux.
6. JFFS3 - still in design stage.
7. M-Systems software - AFAIK I cannot use it with raw NAND FLASH.

If anybody knows of a solution, please post.


> Summary should accelerate mounting but leave the other characteristics 
> inact in theory.

What exactly can I do after mount returns: ls is blocked, write is blocked..

Sergei Sharonov 
 
