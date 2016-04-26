Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auwzG-0006Ss-HP
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 07:00:47 +0000
Subject: Re: [RFC] Porting kernel MTD tests to user space
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <CAAEAJfDQvN46HdqWAHVY+xk+=Y-Cs_LapN1kBC14CH=WObEK8A@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at
From: Richard Weinberger <richard@nod.at>
Message-ID: <571F1206.9020506@nod.at>
Date: Tue, 26 Apr 2016 09:00:22 +0200
MIME-Version: 1.0
In-Reply-To: <CAAEAJfDQvN46HdqWAHVY+xk+=Y-Cs_LapN1kBC14CH=WObEK8A@mail.gmail.com>
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

Am 26.04.2016 um 05:13 schrieb Ezequiel Garcia:
> On 25 April 2016 at 19:13, Richard Weinberger <richard@nod.at> wrote:
>> David was so kind and did an initial port of Linux's MTD tests to user space.
>> He took most tests as-is and massaged them to work in user space using libmtd.
>> In the long run the goal is giving up the kernel tests as much as possible
>> and improve the tests present in mtd-utils.
>>
>> Feedback is very welcome!
>>
> 
> I think this is great, and it will be great to test NAND/NOR devices easier.
> 
> The autoconf patch looked also great, but for some reason it
> stalled, so... what do we need to do to prevent this one from stalling as well?
> 

Please give it testing/review. :-)
Regarding my autoconf patch, IIRC nobody clearly stated whether the change
is welcomed or not.
But I can happily revive it.

Thanks,
//richard
