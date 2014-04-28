Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WegSJ-00083a-9b
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 07:58:28 +0000
Message-ID: <535E0A06.1080606@nod.at>
Date: Mon, 28 Apr 2014 09:57:58 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubi layer tests (fastmap testing)
References: <535E01DB.5050405@codeaurora.org>
In-Reply-To: <535E01DB.5050405@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tanya,

Am 28.04.2014 09:23, schrieb Tanya Brokhman:
> Hi Richard
> 
> You referred me to ubi-tests which were very helpful and discovered a bug in our driver. Thank you!

Yay! :)

> Unfortunately mtd-tests are not applicable to our driver.

Why are mtd-tests not useable?

> I was wondering if there are any other ubi test I can run? Specially once concentrating on fastmap feature. How was it tested?

Fastmap was mostly tested with ubi-tests (to see whether the fastmap data structure can always be written do flash)
and by running many attach/detach cycles.
The critical part of fastmap happens at attach time. If fastmap fails to construct the EBA you'll have to find out
whether the on flash fastmap data structure is faulty (i.e. fastmap forgot to save some state) or fastmap interpreted the data
in a wrong manner.

BTW: It's awesome to see ongoing work on the still experimental fastmap feature. :-)

Thanks,
//richard
