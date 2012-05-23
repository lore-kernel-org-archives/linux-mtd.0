Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SX6Dr-0002is-Hf
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 07:43:08 +0000
Message-ID: <4FBC9507.9070200@nod.at>
Date: Wed, 23 May 2012 09:43:03 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com> <4FBBC4EE.4040802@nod.at>
 <20120522211809.53bd6444@halley>
 <2423212898cfc1c21343bff32e776dbd@radon2.swed.at>
 <20120523091856.4e9217a2@pixies.home.jungo.com>
In-Reply-To: <20120523091856.4e9217a2@pixies.home.jungo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

On 23.05.2012 08:18, Shmulik Ladkani wrote:
>> It removes a PEB from the free rb-tree.
>> ubi->lookuptbl[pnum] does not matter at this time.
>
> For practical matters, you are correct.
> Design wise, it is bit inconsistent and confusing.
>
> On one hand, you claim above that 'ubi->lookuptbl' holds the WL entries
> known to WL subsystem - that is, lookuptbl is a data structure used and
> maintained by the WL subsystem.
> OTOH, when a PEB is removed from hands of WL (by a ubi_wl_get_fm_peb
> call), you keep its WL entry assigned in ubi->lookuptbl.
>
> I'll rethink this, see if there's a potential trouble here.

If I remove the PEB from ubi->lookuptbl I'll have to reread the EC 
header upon ubi_wl_put_fm_peb().
Otherwise it's EC value is lost.

>>> However 'ubi_wl_put_fm_peb' creates a 'ubi_wl_entry' if not found in
>>> the lookuptbl.
>> Currently fastmap "fixes" ubi->lookuptbl on demand. Is this a problem?
>
> I guess not.
>
> The only problem, as previously noted, is the failure to create a new
> 'ubi_wl_entry' when the PEB needs to be returned to WL subsystem.

I think I can return them to the lookuptbl while attaching.

Stay tuned, I'll release v7 today or tomorrow.

Thanks,
//richard
