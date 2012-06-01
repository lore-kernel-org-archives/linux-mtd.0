Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaNW8-00083K-Hf
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 08:47:33 +0000
Message-ID: <4FC881A6.5050505@intel.com>
Date: Fri, 01 Jun 2012 11:47:34 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1337771191-95358-2-git-send-email-richard@nod.at>
 <4FC85780.9070200@intel.com> <4FC8768E.1010703@nod.at>
 <1338538244.2536.147.camel@sauron.fi.intel.com> <4FC8790D.8070801@nod.at>
In-Reply-To: <4FC8790D.8070801@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/06/12 11:10, Richard Weinberger wrote:
> Am 01.06.2012 10:10, schrieb Artem Bityutskiy:
>> On Fri, 2012-06-01 at 10:00 +0200, Richard Weinberger wrote:
>>> True. But why is this a problem?
>>> If we can recovers using a full scan after a power cut we are fine.
>>
>> Does fastmap have zero power-cut tolerance by design?
> 
> Yes.
> E.g. If the fastmap was not written corretly the CRC will not match and we fall back
> to scanning. That's why fastmap tries hard to fallback to scanning if anything goes wrong.
> Why should we make fastmap even more complicated than it already is?

That is fine.  It just needs to be documented so people know what to expect.
i.e. fastmap may not be enough for a use case where power cuts are frequent
and/or long scan times are not acceptable.
