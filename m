Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpRu6-00031b-I7
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 09:22:04 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Billalabeitia,
	Jose Carlos (GE Consumer & Industrial)" <jc.billalabeitia@ge.com>
In-Reply-To: <09A97B4DFB4DB64FB8B58BBC4A1F3C290600D166@GNTMLVEM01.e2k.ad.ge.com>
References: <09A97B4DFB4DB64FB8B58BBC4A1F3C290600D166@GNTMLVEM01.e2k.ad.ge.com>
Content-Type: text/plain
Message-Id: <1090934147.20889.158.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Tue, 27 Jul 2004 15:15:48 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: RE: JFFS2 Flash Filesystem corrupted
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-27 at 12:45, Billalabeitia, Jose Carlos (GE Consumer &
Industrial) wrote:

Can you please use a mailer which does appropriate formatting !

> I made a test with the JFFS2:
> - Compile the JFFS2 in debug mode level 1.
> - All the messages sent to the console were captured in a file.
> - Run an app. test that sent SIGUP signal to the second partition
>   of the JFFS2 (where the code resides) every 5 seconds.
> - Left it running overnight (14 hours approx.)
>
> What I got was after rebooting the system this morning:
> 
> No anormal message appeared during the mounting process 
> of JFFS2 second partition.
> One module file had changed; 400 bytes (not 4Kb) were replaced 
> with zeros.
> The time and the size of the modified module file were unchanged. 
> So I suspect of the GC when moving nodes or the buffer cache 
> (as you said).
> 
> All of this make me reinforce the idea that the problem has to 
> do with the GC
> with the "wear levelling", because I think that it is the only 
> one that can move nodes 
> of a file that never changes without modifying its time and size, 
> and with the correct CRC.

That's pure speculation. 

Check the captured debug messages. They contain the answer to your
question. It make take some time to figure it out, but you can
definitely find the place where the file is touched / modified / moved
whatever.

tglx
