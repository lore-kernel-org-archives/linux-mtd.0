Received: from mercuryimc.plus.com ([80.229.200.144]
 helo=centos1.newflow.co.uk)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uq0vJ-0001op-8O
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2013 12:58:42 +0000
Message-ID: <51C44DE3.3000202@newflow.co.uk>
Date: Fri, 21 Jun 2013 13:58:11 +0100
From: Mark Jackson <mpfj-list@newflow.co.uk>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: 3.10.0-rc4: jffs2: Possible circular locking dependency detected
References: <51C2FC56.1070808@newflow.co.uk>
In-Reply-To: <51C2FC56.1070808@newflow.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20/06/13 13:57, Mark Jackson wrote:
> Just mounted a JFFS2 partition (held in NOR flash on a custom AM335x
> CPU board), and I always get the following:-
> 
> [    3.864244]
> [    3.865851] ======================================================
> [    3.872359] [ INFO: possible circular locking dependency detected ]
> [    3.878968] 3.10.0-rc4-00172-gf31c62e-dirty #249 Not tainted
> [    3.884926] -------------------------------------------------------
> [    3.891526] rcS/507 is trying to acquire lock:
> [    3.896206]  (&mm->mmap_sem){++++++}, at: [<c00b42c8>] might_fault+0x3c/0x94
> [    3.903684]
> [    3.903684] but task is already holding lock:
> [    3.909826]  (&f->sem){+.+.+.}, at: [<c016f208>] jffs2_readdir+0x40/0x1b0
> [    3.917021]
> [    3.917021] which lock already depends on the new lock.

Looks like I reported something similar earlier this year:-

http://lists.infradead.org/pipermail/linux-mtd/2013-February/045888.html

And I also found this going back to 3.0.18:-

http://www.spinics.net/lists/linux-rt-users/msg07617.html
