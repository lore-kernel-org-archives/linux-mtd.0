Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmvX-0001rH-PD
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:53:28 +0000
Message-ID: <55F7EA7E.7020407@axis.com>
Date: Tue, 15 Sep 2015 11:53:02 +0200
From: Niklas Cassel <niklas.cassel@axis.com>
MIME-Version: 1.0
To: Alex Smith <alex@alex-smith.me.uk>, Brian Norris
 <computersforpeace@gmail.com>
CC: Alex Smith <alex.smith@imgtec.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] mtd: nand: increase ready wait timeout and report
 timeouts
References: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>	<1441703453-2838-2-git-send-email-alex.smith@imgtec.com>	<20150909234936.GB11487@google.com>
 <CAOFt0_DK+KDe4g2QP-+v0nZiSWU0oaLW7=B+WfzNHq-GHwg=BA@mail.gmail.com>
In-Reply-To: <CAOFt0_DK+KDe4g2QP-+v0nZiSWU0oaLW7=B+WfzNHq-GHwg=BA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/15/2015 11:38 AM, Alex Smith wrote:
> On 10 September 2015 at 00:49, Brian Norris <computersforpeace@gmail.com> wrote:
>> + Niklas
>>
>> On Tue, Sep 08, 2015 at 10:10:50AM +0100, Alex Smith wrote:
>>> If nand_wait_ready() times out, this is silently ignored, and its
>>> caller will then proceed to read from/write to the chip before it is
>>> ready. This can potentially result in corruption with no indication as
>>> to why.
>>>
>>> While a 20ms timeout seems like it should be plenty enough, certain
>>> behaviour can cause it to timeout much earlier than expected. The
>>> situation which prompted this change was that CPU 0, which is
>>> responsible for updating jiffies, was holding interrupts disabled
>>> for a fairly long time while writing to the console during a printk,
>>> causing several jiffies updates to be delayed. If CPU 1 happens to
>>> enter the timeout loop in nand_wait_ready() just before CPU 0 re-
>>> enables interrupts and updates jiffies, CPU 1 will immediately time
>>> out when the delayed jiffies updates are made. The result of this is
>>> that nand_wait_ready() actually waits less time than the NAND chip
>>> would normally take to be ready, and then read_page() proceeds to
>>> read out bad data from the chip.
>>>
>>> The situation described above may seem unlikely, but in fact it can be
>>> reproduced almost every boot on the MIPS Creator Ci20.
>>>
>>> Debugging this was made more difficult by the misleading comment above
>>> nand_wait_ready() stating "The timeout is caught later" - no timeout
>>> was ever reported, leading me away from the real source of the problem.
>>>
>>> Therefore, this patch increases the timeout to 200ms. This should be
>>> enough to cover cases where jiffies updates get delayed. Additionally,
>>> add a pr_warn() when a timeout does occur so that it is easier to
>>> pinpoint any problems in future caused by the chip not becoming ready.
>>
>> Did you examine other solutions? I've seen patches for hrtimer support
>> previously:
>>
>> http://patchwork.ozlabs.org/patch/160333/
>> http://patchwork.ozlabs.org/patch/431066/
>>
>> A few things have been cleaned up since then, so some of the initial
>> objections to the hrtimer patch don't make sense anymore, I believe.
>>
>> Anyway, I think just increasing the timeout looks OK to me (as long as
>> we never have a 200ms jiffies jump... can this happen??), so hrtimer may
>> be over-engineering. I just want to make sure both options have been
>> considered before officially choosing one over the other.
>>
>> Brian
> 
> Hi Brian, Niklas,
> 
> I'm no expert in the matter but I feel like using a hrtimer here would
> indeed be over-engineering and could potentially add overhead to the
> "normal" case where the chip becomes ready well before the timeout
> expires? Just increasing the timeout seems like a simpler solution
> that solves the problem. I think that a jiffies jump of a few hundred
> milliseconds is extremely unlikely and would indicate something else
> that needs to be fixed (i.e. in the SMP case I had it would mean that
> the CPU which is supposed to update jiffies has interrupts disabled
> for hundreds of milliseconds).
> 
> Niklas: If I update the patch based on your suggestions would you be
> happy to go with that rather than your hrtimer patch?

Yes.

I've tested the patch inlined in the end of
http://marc.info/?l=linux-kernel&m=144197105326420
and it works just as good as the hrtimer patch that I sent out a couple of months ago.

(For our use-case where irqs were sometimes disabled for more than 20 ms.)
