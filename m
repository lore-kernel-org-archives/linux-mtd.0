Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16knd1-0006sM-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 14:51:51 +0000
Message-Id: <200203121503.g2CF3Ew17376@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [patch] dilnetpc.c broken?
Date: Tue, 12 Mar 2002 16:03:50 +0100
References: <20020311202323.A11507@wohnheim.fh-wedel.de> <200203121322.g2CDMLw14608@dagobert.svc.sysgo.de> <20020312155351.A10431@wohnheim.fh-wedel.de>
In-Reply-To: <20020312155351.A10431@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org, Robert Schwebel <robert@schwebel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Am Dienstag, 12. März 2002 15:53 schrieben Sie:
> On Tue, 12 March 2002 14:22:56 +0100, Robert Kaiser wrote:
> > > The DIL/Net PC mapping driver appears to be broken. At least, it
> > > didn't compile properly on my machine. After a quick look at the code,
> > > the following appears to be the correct fix for the problem.
> >
> > It had a stray #endif that I have just removed in CVS. Other than that it
> > compiles fine for me. What exactly went wrong when you tried to compile
> > it ?
>
> MTDPART_OFS_NXTBLK was unknown. A quick grep over
> /usr/src/linux/include didn't show it #defined anywhere. I replaced it
> with MTDPART_OFS_APPEND, which appeared to be the intended offset.

Hmm, then you must have a different version of partitions.h in
/usr/src/linux/include/linux/mtd. Mine is from the MTD CVS
(cvs up'ed this morning, but the #defines have been there
for a long time, AFAIK):


rob@rob:~/mtd/include/linux/mtd> grep MTDPART_OFS_ partitions.h 
 *      defined as MTDPART_OFS_APPEND, the partition will start where the 
 *      previous one ended; if MTDPART_OFS_NXTBLK, at the next erase block.
 * erasesize aligned (e.g. use MTDPART_OFS_NEXTBLK).
#define MTDPART_OFS_NXTBLK      (-2)
#define MTDPART_OFS_APPEND      (-1)

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
