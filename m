Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U6wZ-0003A0-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 14:03:03 +0000
Message-ID: <020601c1a5aa$9962b1d0$0a070d0a@axis.se>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "Ramya Ravichandran" <rrhsin@yahoo.co.in>,
   "kira brown" <kira@hex.linuxgrrls.org>
Cc: <linux-mtd@lists.infradead.org>
References: <20020125123341.92380.qmail@web8105.in.yahoo.com>
Subject: Re: Cf Card vs DiskOnChip
Date: Fri, 25 Jan 2002 15:14:27 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

 
> > > Hi,
> > >
> > >    I am a newbie  developing a embedded linux
> > > controller for an industrial environment. I am
> > unable
> > > to decide whether to use a Compact Flash card or
> > > DiskOnChip.With 128MB I need to get the whole
> > thing
> > > running.
> > 
> > Why on earth do you need so much storage?
> > 
> I need to have an application running on it with
> serial communication

I assume you need the storage for some large logs then?
To get a basic embedded Linux system doing serial communication
and networking 2MB flash should be enough.
/Johan
