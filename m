Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1757c5-0004nE-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 17:14:54 +0100
Received: from there ([172.22.2.25])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with SMTP id g47GElw06345
	for <linux-mtd@lists.infradead.org>; Tue, 7 May 2002 18:14:47 +0200
Message-Id: <200205071614.g47GElw06345@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: linux-mtd@lists.infradead.org
Subject: Re: 2.4.18-howto?
Date: Tue, 7 May 2002 18:16:10 +0200
References: <81D0D3538E3CD411AE3C00D0B7474C31C8EE37@jadran.hermes.si> <20020507150057.R16630@schwebel.de>
In-Reply-To: <20020507150057.R16630@schwebel.de>
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

Am Dienstag, 7. Mai 2002 15:00 schrieb Robert Schwebel:
> Hi Ludvik,
>
> On Tue, May 07, 2002 at 01:31:52PM +0200, Ludvik Kumin wrote:
> > I work with 2.4.18, but I don't use the latest SW from CVS (I use the
> > original code from the kernel and it works OK - at least the part I
> > need).
>
> I need the ADNP concaternation layer stuff...

Does this part cause any specific trouble ? (if so, which ?)

>
> > About the HOWTO: do you have "jffs-mtd-HOWTO.txt"?
>
> Yes, but it is nearly one year old.

.. which doesn't necessarily mean it's outdated...

I read in an earlier mail that your problem is with compiling the utils (all 
of them or is it just mkfs.jffs ?). Note that you don't necessarily need this 
program, even if you plan on using jffs2. The only utils you really need are 
erase and eraseall.

Anyway, I just did the following:

* pull the latest stuff from the MTD CVS (i.e. "cvs up")
* cd mtd/utils;make

.. and it worked (Suse 7.3).


Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
