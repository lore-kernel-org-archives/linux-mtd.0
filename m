Received: from smtp-out-4.wanadoo.fr ([193.252.19.23] helo=mel-rto4.wanadoo.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nJzh-0006ye-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 15:21:57 +0100
From: "Thomas TESTASECCA" <thomas.testasecca@etictelecom.com>
To: "Russell King - ARM Linux" <linux@arm.linux.org.uk>,
	"David Woodhouse" <dwmw2@infradead.org>
Cc: "Mtd" <linux-mtd@lists.infradead.org>,
	"Linux-Arm-Kernel@Lists. Arm. Linux. Org. Uk" <linux-arm-kernel@lists.arm.linux.org.uk>,
	"Der Herr Hofrat" <der.herr@mail.hofr.at>
Subject: RE: Scheduler, or task priority problem ... i need help 
Date: Fri, 6 Sep 2002 16:19:21 +0200
Message-ID: <AEEFILJDOOHJLBCFOBJDKEJJDAAA.thomas.testasecca@etictelecom.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <8622.1031245320@redhat.com>
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

Hi,
I have updated the MTD/JFFS2 drivers from current CVS, it works fine :)
Thanks for everything !!
greetings
TOM

-----Message d'origine-----
De : David Woodhouse [mailto:dwmw2@redhat.com]De la part de David
Woodhouse
Envoye : jeudi 5 septembre 2002 19:02
A : Russell King - ARM Linux
Cc : Der Herr Hofrat; Thomas TESTASECCA; Linux-Arm-Kernel@Lists. Arm.
Linux. Org. Uk
Objet : Re: Scheduler, or task priority problem ... i need help



linux@arm.linux.org.uk said:
>  I'd recommend that you talk to the jffs2 people (see other mailing
> lists) about this problem - jffs2 shouldn't suck all the CPU time in
> the world, especially when there are other higher-priority threads
> wanting to run.

The current CVS code did get sprinkled with cond_resched() fairly recently.
I suppose the 2.4 branch could do with the same.


--
dwmw2
