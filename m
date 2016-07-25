Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRmf3-0006qt-BF
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 20:39:38 +0000
Subject: Re: [PATCH 1/2] MTD: UBI: speed up init by moving status messages to
 debugfs
To: Greg KH <greg@kroah.com>
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <5795EA91.2030304@nod.at> <5795F6AE.8070508@mentor.com>
 <5795F8CE.4050605@nod.at> <20160725164708.GB7540@kroah.com>
Cc: Rajeev Kumar <rajeev_kumar@mentor.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <579678EE.4010408@nod.at>
Date: Mon, 25 Jul 2016 22:39:10 +0200
MIME-Version: 1.0
In-Reply-To: <20160725164708.GB7540@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Am 25.07.2016 um 18:47 schrieb Greg KH:
> On Mon, Jul 25, 2016 at 01:32:30PM +0200, Richard Weinberger wrote:
>> These days I'd not print all of them. But we do already and I know
>> setups which parse dmesg and grep for some of these values.
> 
> That's horrid and should not be tolerated, please never grep the kernel
> log for anything.
> 
>> Either to see whether attach worked or just to gather debug infos for
>> QA.
>> I don't want to risk breaking existing stuff.
> 
> We do not claim that kernel log messages are an "ABI" that can not be
> changed or broken at all.

I know, but today I'm less sadistic than usual and allow users to keep their
stuff.
Rajeev's issue is not related to UBI and can be solved in a generic and sane
way using loglevels. So there is no need to change the existing logging.

Thanks,
//richard
