Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17A5AL-0005jl-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 09:38:46 +0100
Received: from there ([172.22.2.25])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with SMTP id g4L8cXw29740
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 10:38:33 +0200
Message-Id: <200205210838.g4L8cXw29740@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: linux-mtd@lists.infradead.org
Subject: Re: AW: Getting big flash onto motherboards. Will CF work? what   wil l?
Date: Tue, 21 May 2002 10:40:17 +0200
References: <71B37AB6576DD211AB7E008048CD4D3101ED392A@exchange.ten.logware.de>
In-Reply-To: <71B37AB6576DD211AB7E008048CD4D3101ED392A@exchange.ten.logware.de>
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

Am Dienstag, 21. Mai 2002 09:01 schrieb Veikko Werner:
> > On Fri, 17 May 2002, john riehl wrote:
> > > At 08:51 PM 5/17/02 +0200, Robert Kaiser wrote:
> > >  what
> > > happens when cf loses power?
> >
> > I understand that when a CF loses power while a write is in
> > progress, it
> > may corrupt some blocks in such a way that they can not be recovered.
>
> sure, but is this a problem only CF has?

No, I guess normal IDE disks have it as well. But flash memory does not, and 
-I think- DOC devices also don't have this problem. That's why I was asking 
wether DOM's are any different from CF (besides the form factor): I guess I 
was hoping they also would not have this problem, but apparently nobody 
really knows :-(

> Or is it just a problem if we're using th wrong (non journaling)
> filesystem?

Applying any of the journalling filesystems to a CF will *not* solve this 
problem, AFAIK. You may survive the occasional power outage, possibly lose a 
sector in the process. But if unclean shutdown happens on a regular basis, 
the CF may run out of usable sectors sooner or later.


Rob


-- 
----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
