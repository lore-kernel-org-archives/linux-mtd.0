Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9hvE-0002Re-5s
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 22:20:48 +0000
Message-ID: <54B05428.60303@nod.at>
Date: Fri, 09 Jan 2015 23:20:24 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, dedekind1@gmail.com
Subject: Re: Fastmap update v2 (pile 1)
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <54B04A50.8040307@vanguardiasur.com.ar> <54B04E65.60306@nod.at>
 <54B051B3.3050308@vanguardiasur.com.ar>
In-Reply-To: <54B051B3.3050308@vanguardiasur.com.ar>
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

Am 09.01.2015 um 23:09 schrieb Ezequiel Garcia:
>> All of Pile1, 2, 3 and 4. :-)
>> One or tow patches are preparations for the real fix but obviously you'll need them
>> too.
>> The rest are enhancements and cleanups.
> 
> What do you mean by "the rest"?

Pile 5, 6, and 7.

>> As I wrote before I've structured the patch set in a way to make backporting easy.
>>
>>> For bugfixes, having a detailed explanation of the problem the commit is
>>> meant to fix would be better as well.
>>
>> Okay, I'll add the horror stories to these patches.
>>
> 
> I know it's a real pain, but if you can add a Fixes: tag, it would
> certainly help Artem track down the bug. The good thing is that you get
> the -stable hassle for free.

We cannot tag these as stable, first I have to inject old fastamp fixes
into -stable.
Two years ago Artem and I decided that fastmap as experimental feature does
not need -stable backports. It turned out that this was horrible wrong
and stupid.

>>> This patchset seems to have stalled, so perhaps having this information
>>> would help Artem to pick the ones that you point as fixes, before we
>>> miss another cycle.
>>
>> The question is, shall I wait for Artem or resend again?
> 
> Hm, well, given we are just a handful of developers, and we are all time
> constrained, maybe we could focus on the first two piles for now:
> 
> Pile 1, November 24, https://lkml.org/lkml/2014/11/24/324
> Pile 2, November 30, https://lkml.org/lkml/2014/11/30/50

Hmm, I'm not sure whether it is a good idea to resend Pile1 and Pile2.
I've currently around 50 patches on linux-mtd floating around (nett, without resends).
I fear it will just increase the mess we already have.

I really would like to hear what Artems plans are.
Actually I resent and split up the first series upon his request.

Thanks,
//richard
