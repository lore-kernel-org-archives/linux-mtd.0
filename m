Received: from mika.eatserver.nl ([2001:67c:28fc:195:20:9:75:0])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtciD-0004eB-PT
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 11:23:51 +0000
Message-ID: <50EFF641.9080503@aimvalley.nl>
Date: Fri, 11 Jan 2013 12:23:45 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Bosi Daniele <Daniele.Bosi@mta.it>
Subject: Re: R: UBI corruption on a NOR flash
References: <BE7AFD5DB9EB17418CAAAEEA76697290190E878AAB@mta-mail.MTA.INT>
In-Reply-To: <BE7AFD5DB9EB17418CAAAEEA76697290190E878AAB@mta-mail.MTA.INT>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/13 10:00, Bosi Daniele wrote:
> Norbert,
> thank you very much for your quick support.
> I've downloaded the ubifs-v2.6.32.git linux as you suggested us, but I see a lot a differences regarding UBI with our very old 2.6.24.6 kernel.
>
> Do you think this is the only work we can do? Are there other possible solutions to fix the issue we have? (Like for example applying the patch showed in http://lists.infradead.org/pipermail/linux-mtd/2010-December/033322.html) ?
>
> Thank you again
> Daniele Bosi
>

I would update to the ubi/ubifs backported v2.6.32 because:
- the ubi/mtd CFI buffer write patch involves several patches, with one or two
   patches/updates lateron
- other NOR flash (power cut) problems were solved as well and you're not sure
   which one hurts you

Actually, we are very lucky Artem still maintains (or maintained?) ubifs-v2.6.32.git
since v2.6.32 is more than 3 years old.

---
Norbert
