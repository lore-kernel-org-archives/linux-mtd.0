Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16c28F-0006pa-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Feb 2002 10:31:51 +0000
Date: Sat, 16 Feb 2002 11:43:03 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org, J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
In-Reply-To: <30752.1013796129@redhat.com>
Message-ID: <Pine.LNX.4.21.0202161133340.17237-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Fri, 15 Feb 2002, David Woodhouse wrote:

> Partial blocks is impossible, so not supported. Multiple blocks is 
> permitted.

OK, just to be clear about this: If my erase function is asked
to erase -say-  1.5 blocks, what should it do:

- erase one block and silently ignore the .5 part ?
- erase one block and return an error ?
- erase two blocks ?
- do nothing and return an error ?

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
