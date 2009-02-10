Message-ID: <49915BAF.2070709@linutronix.de>
Date: Tue, 10 Feb 2009 11:49:19 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [RFC / PATCH] ubiformat: make it work on mtd parts > 2GiB
References: <20090210095614.GA1995@www.tglx.de>	
	<1234260416.17790.109.camel@localhost.localdomain>	
	<4991542C.4080206@linutronix.de>
	<1234261659.17790.117.camel@localhost.localdomain>
In-Reply-To: <1234261659.17790.117.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2009-02-10 at 11:17 +0100, Sebastian Andrzej Siewior wrote:
>>> I do not think you need to make eraseblock number and offset to be
>>> unsigned. In fact, I'd like them to be signed, because this is the same
>>> we have in the kernel (in UBI/UBIFS), and I'd like to be more or less
>>> consistent.
>> That is a point. However those things should never be negative so maybe we 
>> could change this in kernel.
> 
> They should not indeed be negative. However, signed numbers are just
> much more appropriate when you write the code, because you may put an
> error code there if something goes wrong.
> 
> For example, the UBIFS Garbage collector returns the freed eraseblock
> number in case of success or a negative error code in case of failure.
> Compare:
> 
> int ubifs_garbage_collect(struct ubifs_info *c)
> 
> and
> 
> int ubifs_garbage_collect(struct ubifs_info *c, unsigned int *leb)
> 
> The first prototype is what we have now. The second is what we would
> have to have to be able to return LEB number and error code.
> 
> And vs. changing UBI/UBIFS - that would be really a lot of work.

Yup, thanks for info. That makes sense.

> Anyway, the thing is that 31-bit should be more than enough for
> eraseblock number.
For now :)

> 
>> While we here, I get a couple of "compare between signed and unsigned" 
>> warnings from gcc. I tried to clean them up but I end up with huge patches 
>> similar to this one. Are you aware of those or you simply don't get them?
> 
> I'd rather shut the warnings up by an gcc option - is there such an
> option?
You are using -W which deprecated and -Wextra is doing the same thing. One 
of the things -Wextra does is adding -Wsign-compare so you have to add 
-Wno-sign-compare to stop that.

Sebastian
-- 
Firmensitz: 88690 Uhldingen, Auf dem Berg 3
Registergericht: Amtsgericht Freiburg i. Br., HRB 700 806;
StNr. 87007/07777; Ust-Id Nr.: DE252739476
Geschäftsführer: Heinz Egger, Thomas Gleixner
