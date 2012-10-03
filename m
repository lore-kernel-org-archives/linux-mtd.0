Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJLJh-0008SR-7P
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2012 09:32:33 +0000
Message-ID: <506C062D.8080608@nod.at>
Date: Wed, 03 Oct 2012 11:32:29 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: UBI: Fastmap request for inclusion (v19)
References: <1348674710-102885-1-git-send-email-richard@nod.at>
 <1349252745.2017.120.camel@sauron.fi.intel.com>
 <20121003103625.0bbff63c@spider.haslach.nod.at>
 <1349253885.2017.125.camel@sauron.fi.intel.com> <506BFF58.4060106@nod.at>
 <1349256659.2017.128.camel@sauron.fi.intel.com>
In-Reply-To: <1349256659.2017.128.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03.10.2012 11:30, Artem Bityutskiy wrote:
> On Wed, 2012-10-03 at 11:03 +0200, Richard Weinberger wrote:
>> Yeah, it looks like all issues reported by aiaiai are caused by the missing goto.
>> Can you deal with the patch below or do you want me to send it using git send-email?
>
> I'll apply it. But please, re-work the error handling in that function
> separately.
>

Okay, but not now during the merge window.
Is this fine for you?

Thanks,
//richard
