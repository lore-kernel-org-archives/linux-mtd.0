Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUv5D-0002jG-Gl
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 09:34:17 +0000
Received: by mail-pd0-f169.google.com with SMTP id fp1so9335751pdb.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 02:33:52 -0700 (PDT)
Date: Tue, 1 Apr 2014 02:33:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
Message-ID: <20140401093349.GK6400@brian-ubuntu>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
 <20140329131642.GA2775@book.gsilab.sittig.org>
 <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
 <20140331194522.GL2775@book.gsilab.sittig.org>
 <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9FD4@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB9FD4@DBDE04.ent.ti.com>
Cc: David Mosberger <davidm@egauge.net>, Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 01, 2014 at 05:29:54AM +0000, Pekon Gupta wrote:
> >From: David Mosberger [mailto:davidm@egauge.net]
> >The ECC-mode of the driver never changes.
> >Sure, what you describe could be implemented as an additional feature
> >in the future (I don't have any plans to do so since it makes little sense to
> >me, as no other ECC-mode uses the layout of the on-die-controller).
> >
> >To be honest, I'm a bit confused: on the one hand, you're asking me to
> >simplify the patches into smaller pieces, on the other you seem to ask
> >for new features.
> >
> I too would like to see ECC-mode selection based on user's choice.

I think what Gerhard was asking and what Pekon is asking for are
different. I don't think Gerhard's suggestion is realistic (that users
would change ECC modes mid-use). But Pekon's following concern (which I
share) sounds more reasonable, I think, for init-time configuration.

> So there should be mechanism to enable/disable this feature based on
> DT or platform-data. And onfi_set_feature() is the correct thing to use.
> This would make your patches more simple, without disturbing the generic
> frame-work. If you patch causes any regression, or abruptly changes
> behavior of any working driver, then it's less likely to get accepted.

I actually don't think his patches would abruptly change any working
driver, since it only utilizes on-die ECC if the chip already had it
enabled (and existing drivers would thus not function properly). But I
don't think it's the best design, since it assumes that the flash's
initial state is the expected mode of operation.

> So, instead of re-sending patches it's important to discuss the changes.

Yes, please.

Brian
