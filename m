Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhLo4-0002rp-5q
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 17:36:29 +0000
Message-ID: <552AAD03.5050901@nod.at>
Date: Sun, 12 Apr 2015 19:36:03 +0200
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

After re-reading this loop I realized that I've missed a possible race against
other workers. It can happen that we schedule eX and while being scheduled it
is possible that eX turns bad and some worker frees eX under us.
Not very likely but definitely possible.
Let's see if I can find a solution for that without adding new locks or refcounter to
ubi_wl_entry.

I can think of adding a check to the schedule work code which ensures that work
targeting eX is scheduled only once.


Thanks,
//richard
