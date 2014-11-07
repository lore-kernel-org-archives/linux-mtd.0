Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmfKs-0007z4-Nl
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 08:56:03 +0000
Message-ID: <1415350530.958.282.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Fri, 07 Nov 2014 10:55:30 +0200
In-Reply-To: <545B66BA.4090904@codeaurora.org>
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>
 <545630E1.8020505@codeaurora.org>
 <1415261234.958.171.camel@sauron.fi.intel.com>
 <545B66BA.4090904@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-06 at 14:16 +0200, Tanya Brokhman wrote:
> > There is also the "radiation" effect. Say, you have 3 continuous
> PEBs A,
> > B, C. And some PEB D which is far away from them. You never change
> A, C,
> > and D, you only read them. And you change B many times. IIUC, the
> > radiation effect is that A and C will accumulate bit-flips earlier
> than
> > D, because D is being erased and re-programmed.
> 
> I think you got confused with the block-names (A B C D) because it 
> doesn't make sense :) You said D never changes, just read from.

A, C - read, written, erased relatively often.
B, D - only read with the same rate.

B will gain bit flips quicker than D due to the radiation effect. On
some NANDs like MLC a lot quicker.

Disclaimer: I am not a HW expert, this is my understanding.

The patches in question do not cover this "radiation" effect.

The "read all periodically and scrub if enough bit-flips" approach
covers the radiation effect, just like the other NAND effects
(read-disturb, aging).

Artem.
