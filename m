Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15zcVc-0006Of-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Nov 2001 11:29:12 +0000
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id MAA15864
	for <linux-mtd@lists.infradead.org>; Fri, 2 Nov 2001 12:38:02 +0100 (MET)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: RE: Question/suggestion
Date: Fri, 2 Nov 2001 12:37:48 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLEEMPEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <IGEFJKJNHJDCBKALBJLLEEJHEPAA.joakim.tjernlund@lumentis.se>
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

Hi all

Some update I have noticed: 
When I download a big tarfile, untar it, remove tarfile, reboot. 
One of the initscripts does a remount and there it hangs again for some 30-60 seconds.
This is our typical SW upgrade senario so it is a bit annoying. 

Am I the only one seeing this?
I am running Monta Vistas HHL 2.0 MPC8xx kernel(2.4.2 based). Could
this problem be local to the HHL kernel or is it a JFFS2 thing?

I am using JFFS2 CVS from around October 23

 Joakim

> 
> 
> Hi All
> 
> First: 
> I have noticed that when I mount a jffs2 FS(created with mkfs.jffs2) for the
> first time and look at the output of the df command, I see that "Use%" field
> slowly rise to 100% and then it drops back to ~15% and then it stays there.
> During this rise I also noticed that kupdate was eating alot of CPU(~80%)
> 
> Is this normal?
> 
