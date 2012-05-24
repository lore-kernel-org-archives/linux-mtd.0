Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXTNl-0001a7-F9
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 08:26:54 +0000
Message-ID: <4FBDF0CB.4040501@nod.at>
Date: Thu, 24 May 2012 10:26:51 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com> <4FBBC4EE.4040802@nod.at>
 <20120522211809.53bd6444@halley>
 <b3d5919d0b35bb559b7dc115bc9e2720@radon2.swed.at>
 <1337847592.15137.83.camel@sauron.fi.intel.com>
In-Reply-To: <1337847592.15137.83.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24.05.2012 10:19, Artem Bityutskiy wrote:
>> After thinking a bit more about this case I think the best we can to
>> is
>> switching to read-only mode if ubi_update_fastmap()
>> fails.
>>
> Unless it fails because of -EIO, which means the PEB may become bad and
> you need to pick a different one and schedule the faulty one for
> torturing and marking as bad.

Wouldn't make more sense if ubi_update_fastmap() handles the -EIO case 
internally?

Currently (as of v7) both callers ubi_volume_notify() and 
ubi_wl_get_peb() check the return value of ubi_update_fastmap()
and set UBI into read-only mode if ubi_update_fastmap() fails.

Thanks,
//richard
