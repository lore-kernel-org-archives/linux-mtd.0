Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvcTi-0002jk-AO
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 13:20:02 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 12:54:09 +0000
References: <4034E8ED.5757.55A2D9@localhost> <403B1DDE.22464.B72D0@localhost>
	<1077624009.7826.266.camel@hades.cambridge.redhat.com>
In-Reply-To: <1077624009.7826.266.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <691DF1325FFE@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 Feb 2004 12:00 pm, David Woodhouse wrote:
> On Tue, 2004-02-24 at 09:48 +0000, simon@baydel.com wrote:
> > Comitted the sin of posting a reply with the reply text first, sorry.
>
> And this time you committed the sin of including _far_ more of the
> previous mail(s) than was necessary. But I'm not feeling cruel today so
> I'll not continue to ignore you :)
>
> > I have only managed to get this to fail if the jffs2 filesystem is
> > mounted as root. I do not seem to be able to get it to close and unmount

Thanks for the reply I am really struggling with this. I appreciate that this 
stuff keeps you really busy and I will try to make it as easy for you as I 
can. 

I only seem to get this problem if I use the SMC as root. I have put a prink 
in mtdblock.c which tells me when the flush and release modules are called.
After trawling thw archives I also set the debugging level to 1. Now I get 
the message mtdblock_open \n ok when the kernel mounts root.

If I boot from the network, mount the SMC, build a JFFS2 filesystem,copy 
files, on umount I get a release message. I can then reboot via the network 
and make changes to the JFFS2 filesystem., many times, and all is ok. If I 
boot my system and I pass the root=/dev/mtdblock1 argument to the kernel it 
comes up fine on the SMC. This modifies mainly files in /var. If I then 
reboot the system I do not get any messages from the mtdblock flush or 
release routines. Next time the filesystem is mounted it is corrupt.

I have looked int the util/MAKEDEV file and the readme but I don't know how 
to select the mtdblock_ro device.

I take it what I am trying to do is possible and is suitable for a production 
environment ?

Thanks again

Simon
