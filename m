Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16km3R-0006l2-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 13:11:02 +0000
Message-Id: <200203121322.g2CDMLw14608@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [patch] dilnetpc.c broken?
Date: Tue, 12 Mar 2002 14:22:56 +0100
References: <20020311202323.A11507@wohnheim.fh-wedel.de>
In-Reply-To: <20020311202323.A11507@wohnheim.fh-wedel.de>
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

Am Montag, 11. März 2002 20:23 schrieben Sie:
> The DIL/Net PC mapping driver appears to be broken. At least, it
> didn't compile properly on my machine. After a quick look at the code,
> the following appears to be the correct fix for the problem.

It had a stray #endif that I have just removed in CVS. Other than that it 
compiles fine for me. What exactly went wrong when you tried to compile it ?

> That said, I have no idea, what the DIL/Net PC is or who is using that
> driver. Can anyone comment on it? Is anyone using it?


See Robert (Schwebel)'s reply. It appears to be quite popular among
embedded folks (at least in Germany).

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
