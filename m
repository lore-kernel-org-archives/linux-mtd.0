Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VyZP-00080x-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 18:35:23 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8C0092FYDIMH@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 07 Jan 2003 20:05:43 +0100 (MET)
Date: Tue, 07 Jan 2003 20:04:45 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: 16 NANDS
In-reply-to: <20030106230808.9E85F439D@tiger.actrix.co.nz>
To: manningc2@actrix.gen.nz, m.neiger@synergie-inf.com,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200301072004.45259.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: 
 <515CABE7496FD111AA3300201829FCBE3552DD@archie.gsi.synergie-inf.com>
 <20030106230808.9E85F439D@tiger.actrix.co.nz>
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

On Tuesday 07 January 2003 00:03, Charles Manning wrote:
> I believe Thomas has this on his TBD list, but - like everyone - he is
> rather busy so it might take a while before this comes to the top of his
> priority list.
True :)
> Hey why not give it a shot? One way to get experience is to just jump in
> (especially on something like this which looks relatively simple). There
> are many nice people in mtd land who will provide support.
I have the framework ready to support different buswidths. This means there 
will be a bunch of function pointers, which have to be set correctly. The 
functions are not that different, but it's better to have a little duplicated 
code instead of if (buswitdh == x) then else.... crap.
If you're interested, I can provide you with my modified codebase. Give me 
time until weekend to polish it a little bit and write some lines, what to do 
where. You're heartly welcome in the club of volunteers :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
