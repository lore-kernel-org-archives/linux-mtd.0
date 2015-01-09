Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9hXR-0000M6-G6
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 21:56:14 +0000
Message-ID: <54B04E65.60306@nod.at>
Date: Fri, 09 Jan 2015 22:55:49 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, dedekind1@gmail.com
Subject: Re: Fastmap update v2 (pile 1)
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <54B04A50.8040307@vanguardiasur.com.ar>
In-Reply-To: <54B04A50.8040307@vanguardiasur.com.ar>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.01.2015 um 22:38 schrieb Ezequiel Garcia:
> Hi Richard,
> 
> On 11/24/2014 10:20 AM, Richard Weinberger wrote:
>> Artem,
>>
>> as requested I'm resending my fastmap work in smaller pieces.
>> This is pile 1 of 7.
>> Rebasing my patches to ubifs.git was a massive PITA because the
>> logging style changes touched a lot of code and almost every patch
>> failed to apply and needed inspection by hand.
>> The first patches are bug fixes, the latter introduce cleanups
>> and new features.
>> After all bugfixes are mainline I'll make sure that all needed
>> fixes go into -stable.
>>
> 
> Maybe it would be clearer if you could point out exactly which of these
> are considered bugfixes.

All of Pile1, 2, 3 and 4. :-)
One or tow patches are preparations for the real fix but obviously you'll need them
too.
The rest are enhancements and cleanups.
As I wrote before I've structured the patch set in a way to make backporting easy.

> For bugfixes, having a detailed explanation of the problem the commit is
> meant to fix would be better as well.

Okay, I'll add the horror stories to these patches.

> This patchset seems to have stalled, so perhaps having this information
> would help Artem to pick the ones that you point as fixes, before we
> miss another cycle.

The question is, shall I wait for Artem or resend again?
Most patches are completely unseen.

> Would it help if we test the whole series? (any specific test in mind?)

Sure. All issues have been found while real world usage and excessive powercut tests.

Thanks,
//richard
