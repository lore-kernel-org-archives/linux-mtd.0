Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoWiV-0001hx-TZ
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 12:08:08 +0000
Message-ID: <1415794063.22887.245.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 12 Nov 2014 14:07:43 +0200
In-Reply-To: <54628207.5030205@nod.at>
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

On Tue, 2014-11-11 at 22:39 +0100, Richard Weinberger wrote:
> Please don't (ab)use fastmap. If you really need persistent read-counters use an internal UBI volume.

Just like you, I do not think the proposed solution is the right answer
to the problem, at least so far. But if we imagine that Tanya proves
that the counters is the right thing, storing them in fastmap would be
the first thing which comes to mind. Just calling this an abuse without
explaining (even if this is right) is not very collaborative.

Let me see why would that be an "abuse"... Probably because of the
nature of the data. Fastmap contains data which only changes in case of
writes (well, more precisely, erases, but those usually go are related
to writes). Read counters are completely opposite - they stay constant
when we write and change when we read.

Putting them all to the same on-flash area is possible, but is it
optimal? I wouldn't be so sure, I see cons. and pros.

Any other reasons?

Artem.
