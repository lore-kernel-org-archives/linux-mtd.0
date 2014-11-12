Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoY2Y-0003RL-31
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 13:32:54 +0000
Message-ID: <1415799149.22887.266.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 12 Nov 2014 15:32:29 +0200
In-Reply-To: <54635A42.2080102@nod.at>
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>
 <545630E1.8020505@codeaurora.org>
 <1415261234.958.171.camel@sauron.fi.intel.com>
 <545B66BA.4090904@codeaurora.org>
 <1415350722.958.286.camel@sauron.fi.intel.com>
 <54627350.9080509@codeaurora.org> <54628207.5030205@nod.at>
 <1415794063.22887.245.camel@sauron.fi.intel.com> <54635A42.2080102@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, jlauruhn@micron.com,
 linux-mtd@lists.infradead.org, Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Sort of off-topic]

On Wed, 2014-11-12 at 14:01 +0100, Richard Weinberger wrote:
> Tanya stated that the read counters must not get lost.

I understood that this is more of "we try not to lose them, but if we
lose, we can deal with this".

> But it can happen that you lose the fastmap. Fastmap is optional.

And new data structure would be kind of optional too.

> I.e. if you boot an older kernel it will delete the fastmap. If you run
> out of PEBs which can be used by fastmap, fastmap has to delete the current fastmap.
> Same for too many write errors, etc...

It would be cool to document this in more details, say in the web site.
If someone uses fastmap, they probably need to know exactly when it
could "disappear", in order to try avoiding these conditions.

> If we add the read-counters to fastmap we'd have to change the fastmap on-flash layout too.

But this is not the end of the world. Fastmap is still an experimental
feature, and I personally consider it as "not yet proved to be ready for
production", because I did not hear success stories yet. It does not
mean there are no success stories. And this is just my perception, I may
be wrong. So while not touching on-flash format is always a good goal,
we may be less resistant about fastmap.

> (Unless we do very hacky tricks)
> Also writing a fastmap is not cheap, we have to stop all IO. So, saving the read-counter will
> be expensive and an performance problem.

For me this one sounds like a strong point. We do not really want to
make fastmap change more often.

Thanks,
Artem.
