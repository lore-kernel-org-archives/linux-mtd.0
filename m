Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHQp9-0007MC-TB
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2016 07:51:33 +0000
Subject: Re: [PATCH v2 01/46] mtdpart: Propagate _get/put_device()
To: Karl Beldan <karl.beldan@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
 <20160921121531.7786ee9b@bbrezillon> <20160928201611.GB142302@google.com>
 <CACYmx9P8LgpZFu8yZR0UqAi52D2Sn6Ht+A6h-qygeAz8AsULwA@mail.gmail.com>
 <20161214210935.GA135941@google.com>
 <CACYmx9Oh6z84HggiWw+zou9Zy9cFerrm8Krpd-Y2Rk8oVDP1kg@mail.gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniel Walter <dwalter@sigma-star.at>, Stable <stable@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <4a84fc5f-5980-5be0-6488-af77e0e8548a@nod.at>
Date: Thu, 15 Dec 2016 08:51:06 +0100
MIME-Version: 1.0
In-Reply-To: <CACYmx9Oh6z84HggiWw+zou9Zy9cFerrm8Krpd-Y2Rk8oVDP1kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15.12.2016 08:09, Karl Beldan wrote:
>>> I think this should also go into -stable.
>>
>> Why? Do you have real use cases that are broken by this? I understand
> 
> I do, some code adding partitions on a gluebi master.

What exactly are you doing?

>> this is a problem, but I'm curious on how this satisfies the stable
>> rules.
>>
>> Also, note that this isn't a regression; it's been broken forever and
>> apparently no one noticed. IMO that raises the bar a bit (but not
>> impossibly so) for -stable.
>>
> 
> I just encountered the bug yesterday and yes it is obvious it has been
> broken forever.
> I don't have strong opinion about these things so no worries.

If existing stuff is broken, and you can trigger it. Please let us
know. Then it should go into -stable.

Thanks,
//richard
