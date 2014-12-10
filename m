Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XyUoa-0002jY-0N
 for linux-mtd@lists.infradead.org; Wed, 10 Dec 2014 00:07:37 +0000
Message-ID: <54878EA9.5070701@nod.at>
Date: Wed, 10 Dec 2014 01:07:05 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Scott Branden <sbranden@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: implement common reboot notifier boilerplate
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
 <54815522.6000004@broadcom.com> <20141205180726.GN21347@ld-irv-0074>
 <54878D8B.70205@broadcom.com>
In-Reply-To: <54878D8B.70205@broadcom.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: ricard.wanderlof@axis.com, Artem Bityutskiy <dedekind1@gmail.com>,
 cdoban@broadcom.com, rjui@broadcom.com, richard.weinberger@gmail.com,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.12.2014 um 01:02 schrieb Scott Branden:
> Hi Brian,
> 
> I guess I'll leave this in your hands now unless there's anything else you need help will.
> 
> I don't see how this is controversial.  It is simply adding a reboot notifier so the MTD devices are shut down gracefully.  You already added it to NOR.  We're now just adding it
> generically for NAND and NOR.

FWIW, I'll not block this. If it can be done in a sane way in MTD core and the MTD maintainers are fine with it I'm fine too. :-)
My concern was that David was against this a few yeas ago and I tend to agree with him.

Thanks,
//richard
