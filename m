Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Cbgy-0000pS-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2002 08:19:08 +0000
Received: from there ([172.22.2.25])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with SMTP id gAF8nVs02462
	for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2002 09:49:31 +0100
Message-Id: <200211150849.gAF8nVs02462@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: linux-mtd@lists.infradead.org
Subject: Re: cmdline.c file name collision
Date: Fri, 15 Nov 2002 10:56:44 +0100
References: <D99C1FB421989A40818B6370E3187094040A3ABD@tayexc19.americas.cpqcorp.net>
In-Reply-To: <D99C1FB421989A40818B6370E3187094040A3ABD@tayexc19.americas.cpqcorp.net>
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

Am Donnerstag, 14. November 2002 23:39 schrieb Hicks, Jamey:
> I've renamed my copy to
> cmdlinepart.c in the handhelds.org CVS repository, but I have not done so
> on the MTD repository.  If no one objects, I will add cmdlinepart.c and
> remove cmdline.c in the infradead cvs.

Why not mtdcmdline.c ? I think it is more important to have the name indicate 
the subsystem this file belongs to. The fact that it deals with partitions is 
IMHO of minor importance (and might even change in the future).

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
