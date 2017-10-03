Received: from outbound01.mx-relay.com ([5.39.185.33]
 helo=outbound01-c.mx-relay.com)
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzH9N-0007cO-BO
 for linux-mtd@lists.infradead.org; Tue, 03 Oct 2017 06:57:54 +0000
Subject: Re: ubifs robustness with early power cut warning
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
 <740e523e-2373-0e8c-6480-ecd68fff6ef3@aimvalley.nl>
 <CAFLxGvwwjFwn1hyme=jgkUQsBJcyK0gXqSNdoXa9WbCB0U4NBQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Kees Trommel <ctrommel@aimvalley.nl>
Message-ID: <67c51db1-2492-a1df-e576-bd4b78a1e2e8@aimvalley.nl>
Date: Tue, 3 Oct 2017 08:57:29 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwwjFwn1hyme=jgkUQsBJcyK0gXqSNdoXa9WbCB0U4NBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

 > Out of curiosity, did you also try to freeze or schedule the calling 
task?

No I did not. When the GPIO gets active the board will die (power off) 
soon, so no need to freeze/block the calling task because it soon will 
die too.

Kees.

On 10/02/17 13:35, Richard Weinberger wrote:
> Kees,
>
> On Mon, Oct 2, 2017 at 10:06 AM, Kees Trommel <ctrommel@aimvalley.nl> wrote:
>> Doug,
>>
>> Attached a patch file with an implementation that I developed for our custom
>> board that has an early powerdown (is dying) signal (GPIO pin).
>>
>> The idea is that when an "I am dying" condition is detected no erase or
>> program is started by the mtd layer. It is assumed that an erase or program
>> started before the board starts to die will be completed successfully.
> Out of curiosity, did you also try to freeze or schedule the calling task?
>
> Maybe we should add something like that to MTD as generic interface.
> I saw such hacks in all variants in vendor/customer kernels.
>
