Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8XV6-00085p-8i
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 15:56:28 +0000
Message-ID: <52E92494.1090407@nod.at>
Date: Wed, 29 Jan 2014 16:56:04 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] reproducable ubifs reboot assert and corruption
References: <20140122051510.GB17284@gmail.com>
 <CAFLxGvwmzftdQKSjjjwpFLS8g3EJqMrQ2gU2scBsh2MvG7Wyyw@mail.gmail.com>
 <20140127163939.GA27809@gmail.com> <20140129053238.GA6035@gmail.com>
 <52E8AE25.8080502@nod.at> <20140129154622.GB7278@gmail.com>
In-Reply-To: <20140129154622.GB7278@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Am 29.01.2014 16:46, schrieb Andrew Ruder:
> On Wed, Jan 29, 2014 at 08:30:45AM +0100, Richard Weinberger wrote:
>> BTW: Can you please share your .config?
> 
> No problem.  FYI, this is for a board that is still in development so
> not all my changes have been submitted for inclusion yet.  I would be
> happy to share the changes now if necessary but I've attached the --stat
> to show that as far as mtd/ubifs goes, i'm basically running a stock
> v3.12:

Does the issue also happen if you disable preemption?
i.e. CONFIG_PREEMPT_NONE=y

Maybe it is really a race...

Thanks,
//richard
