Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auwxD-0004pN-0h
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 06:58:40 +0000
Subject: Re: [RFC] Porting kernel MTD tests to user space
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461647856.32142.1.camel@gmail.com>
Cc: david.oberhollenzer@sigma-star.at
From: Richard Weinberger <richard@nod.at>
Message-ID: <571F117E.8090709@nod.at>
Date: Tue, 26 Apr 2016 08:58:06 +0200
MIME-Version: 1.0
In-Reply-To: <1461647856.32142.1.camel@gmail.com>
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

Am 26.04.2016 um 07:17 schrieb Artem Bityutskiy:
> On Tue, 2016-04-26 at 00:13 +0200, Richard Weinberger wrote:
>> David was so kind and did an initial port of Linux's MTD tests to
>> user space.
>> He took most tests as-is and massaged them to work in user space
>> using libmtd.
>> In the long run the goal is giving up the kernel tests as much as
>> possible
>> and improve the tests present in mtd-utils.
>>
>> Feedback is very welcome!
> 
> I would consider moving them, not just porting. Indeed, we probably do
> not want to have the same code in 2 places, or is there a strong reason
> why would we want that?

I'd mark ported tests as obsolete but keep them to not break somebodies
setups.
But I think you are right, having two code bases is not what we want.

Brian, what is your opinion on that?

Thanks,
//richard
