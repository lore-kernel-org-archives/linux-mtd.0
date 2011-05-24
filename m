Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOg7U-0003zS-BW
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 01:09:14 +0000
Received: by wyb28 with SMTP id 28so5851805wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 18:09:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
	<4DB14439.1050507@parrot.com>
	<Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
Date: Mon, 23 May 2011 18:09:10 -0700
Message-ID: <BANLkTik218nb1bnFL03UA3WYwh+=BQAXCA@mail.gmail.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Sorry this thread has been sitting for a long time. I've been very
busy and haven't had time for MTD stuff.

>From Matthieu:
"Did you ask some clarification to manufacturers ?"

No, unfortunately, I did not. I didn't realize the "regression" issues
at the time, so I didn't think to look further than my interpretation
of the datasheets.

On Tue, Apr 26, 2011 at 12:30 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Fri, 22 Apr 2011, Matthieu CASTET wrote:
>
>>> So I bet
>>> your device is actually an x8 device and so the 1st/6th byte pattern is
>>> correct. I think the fact that this conflicts with your ECC patterns is
>>> something you must deal with.
>>
>> I don't agree, that's a big mtd regression. If you update your kernel on such
>> flash, you brick it.
>
> I agree, even if the behavior may have been incorrect in the past, we should think very carefully about changing this for exactly this reason.

Right, I see how this could be a problem. So for a resolution, I'd ask
for suggestions on which of the following seems best:
1) Completely revert the SCANBYTE1AND6 change
2) Remove the option from nand_get_flash_type(), still allowing
drivers to enable the scan option themselves
3) Have nand_get_flash_type() use ECC layout information to decide to
scan bytes 1+6 or just byte 1 only

Regarding correctness:
As far as I can tell, no one has found a definitive answer on the
manufacturer intention, right? I'm now leaning toward the intention
that software only needs to scan *either* byte 1 *or* byte 6, but I
don't know for sure.

Thanks,
Brian
