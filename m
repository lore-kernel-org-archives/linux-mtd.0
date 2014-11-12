Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoXZ2-0006vy-Iy
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 13:02:25 +0000
Message-ID: <54635A42.2080102@nod.at>
Date: Wed, 12 Nov 2014 14:01:54 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
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
 <1415794063.22887.245.camel@sauron.fi.intel.com>
In-Reply-To: <1415794063.22887.245.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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



Am 12.11.2014 um 13:07 schrieb Artem Bityutskiy:
> On Tue, 2014-11-11 at 22:39 +0100, Richard Weinberger wrote:
>> Please don't (ab)use fastmap. If you really need persistent read-counters use an internal UBI volume.
> 
> Just like you, I do not think the proposed solution is the right answer
> to the problem, at least so far. But if we imagine that Tanya proves
> that the counters is the right thing, storing them in fastmap would be
> the first thing which comes to mind. Just calling this an abuse without
> explaining (even if this is right) is not very collaborative.

I explaind that already.
There have been so many mails on this topic that some facts may got lost.

Tanya stated that the read counters must not get lost.
But it can happen that you lose the fastmap. Fastmap is optional.
I.e. if you boot an older kernel it will delete the fastmap. If you run
out of PEBs which can be used by fastmap, fastmap has to delete the current fastmap.
Same for too many write errors, etc...

If we add the read-counters to fastmap we'd have to change the fastmap on-flash layout too.
(Unless we do very hacky tricks)
Also writing a fastmap is not cheap, we have to stop all IO. So, saving the read-counter will
be expensive and an performance problem.

Thanks,
//richard
