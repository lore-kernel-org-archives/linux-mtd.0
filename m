Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yme41-0002o6-4D
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 08:06:50 +0000
Message-ID: <553DEDFE.2000700@nod.at>
Date: Mon, 27 Apr 2015 10:06:22 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dolev Raviv <draviv@codeaurora.org>
Subject: Re: planning general storage capacity for y fs
References: <006901d08012$3a1f97a0$ae5ec6e0$@codeaurora.org>
 <CAFLxGvyJDyN2-WJUkJ9wz5cCDvNjrUsbdpHrN4DH7S1gQoF2Yw@mail.gmail.com>
 <007201d080bf$96a0e4e0$c3e2aea0$@codeaurora.org>
In-Reply-To: <007201d080bf$96a0e4e0$c3e2aea0$@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 'Tanya Brokhman' <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.04.2015 um 09:55 schrieb Dolev Raviv:
> Thanks Richard!
> Let me rephrase the question: In the past I knew there was a rule of thumb, 'leave free 30% of the storage space'. Nowadays I couldn't find any reference to this.

Most likely because this is and was always kind of superstition. ;)
An almost full filesystems has to do more to find free space, but I don't dare to
give rules of thumb.

> I was wondering, is there a known point in UBIFS (or ext4), where leaving less free storage space, that performance is dropping? Maybe a ratio of free-occupied is not the right way to look at it, but to leave a certain size free (e.g. 50MB)?

I don't think so. Maybe Ted can give you more details on ext4.
For UBIFS I'd say, figure yourself. i.e. run benchmarks...

Thanks,
//richard
