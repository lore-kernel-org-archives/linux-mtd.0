Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhLO2-0001QP-RE
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 17:09:35 +0000
Message-ID: <552AA6B7.3070806@nod.at>
Date: Sun, 12 Apr 2015 19:09:11 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <1427631197-23610-1-git-send-email-richard@nod.at>	<1427631197-23610-5-git-send-email-richard@nod.at>
 <20150412190119.7f0f7c64@bbrezillon>
In-Reply-To: <20150412190119.7f0f7c64@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 12.04.2015 um 19:01 schrieb Boris Brezillon:
> Hi Richard,
> 
> After the 'coding style related'/'useless' comments, now comes a real
> question related to the approach you've taken :-).
> 
> On Sun, 29 Mar 2015 14:13:17 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
> [...]
>> +
>> +/**
>> + * ubi_wl_trigger_bitrot_check - triggers a re-read of all physical erase
>> + * blocks.
>> + * @ubi: UBI device description object
>> + */
>> +void ubi_wl_trigger_bitrot_check(struct ubi_device *ubi)
>> +{
>> +	int i;
>> +	struct ubi_wl_entry *e;
>> +
>> +	ubi_msg(ubi, "Running a full read check");
>> +
>> +	for (i = 0; i < ubi->peb_count; i++) {
>> +		spin_lock(&ubi->wl_lock);
>> +		e = ubi->lookuptbl[i];
>> +		spin_unlock(&ubi->wl_lock);
>> +		if (e) {
>> +			atomic_inc(&ubi->bit_rot_work);
>> +			schedule_bitrot_check(ubi, e);
>> +		}
>> +	}
> 
> Do we really need to create a ubi_work per PEB ?
> Couldn't we create a single work being rescheduled inside the worker
> function (after updating the ubi_wl_entry of course).

Currently the UBI worker thread handles one PEB per ubi_work. I didn't wanted
to break that pattern. The downside of that approach is that we need more memory.
A few KiB per run.

I'm not sure if I understood your idea. You mean that we schedule one check for
PEB N and this work will re-schedule again a work for PEB N+1?
Using that approach we can safe memory, yes. But is it worth the hassle?
I'd like to avoid works which schedule again other works.
In the current way it is clear where the work is scheduled and how much.

> I'm pretty sure I'm missing something obvious that you'll probably
> point out ;-).

No no, it is a very good question.

Thanks,
//richard
