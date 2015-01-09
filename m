Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9h9d-0006O5-80
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 21:31:38 +0000
Message-ID: <54B0489D.1050905@nod.at>
Date: Fri, 09 Jan 2015 22:31:09 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, dedekind1@gmail.com
Subject: Re: [PATCH 1/6] UBI: Fastmap: Care about the protection queue
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-2-git-send-email-richard@nod.at>
 <54B046BC.8060802@vanguardiasur.com.ar>
In-Reply-To: <54B046BC.8060802@vanguardiasur.com.ar>
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

Am 09.01.2015 um 22:23 schrieb Ezequiel Garcia:
> On 11/24/2014 10:20 AM, Richard Weinberger wrote:
>> Fastmap can miss a PEB if it is in the protection queue
>> and not jet in the used tree.
> 
> s/jet/yet
> 
>> Treat every protected PEB as used.
>>
> 
> I'm wondering if we can have a detailed description of the issues this
> commit fixes (if any?). In other words, what's the result of *not*
> having the patch?

Without this patch fastmap can miss one PEB.
As consequence of this during attach the fastmap self-check
will detect this inconsistency and will fall back to a full scan.
If you try to attach using a custom fastmap implementation (found in
bootloaders) which do often not have sophisticated self-checks you'll
face a serious data corruption or if you're lucky UBI will crash.

Now clearer? :-)

Thanks,
//richard
