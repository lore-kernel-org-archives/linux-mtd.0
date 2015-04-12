Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhKoZ-0004jC-Ll
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 16:32:56 +0000
Message-ID: <552A9E20.6010207@nod.at>
Date: Sun, 12 Apr 2015 18:32:32 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <1427631197-23610-1-git-send-email-richard@nod.at>	<1427631197-23610-5-git-send-email-richard@nod.at>	<20150412171450.51170602@bbrezillon>	<552A99F0.9040701@nod.at>
 <20150412183101.2cbcde3f@bbrezillon>
In-Reply-To: <20150412183101.2cbcde3f@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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

Am 12.04.2015 um 18:31 schrieb Boris Brezillon:
> On Sun, 12 Apr 2015 18:14:40 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>>> IMHO the following code chunk, starting here:
>>>
>>>> +			wl_wrk = prepare_erase_work(e, -1, -1, 1);
>>>> +			if (IS_ERR(wl_wrk)) {
>>>> +				err = PTR_ERR(wl_wrk);
>>>> +				goto out;
>>>> +			}
>>>> +
>>>> +			__schedule_ubi_work(ubi, wl_wrk);
>>>
>>> and ending here ^, could be placed in an helper function
>>> (re_erase_peb ?)
>>
>> As long we have only one user of that pattern I'd keep it as is.
>> We have in UBI already a gazillion helper functions.
> 
> Okay, then maybe you should comment what you're doing here: erase an
> already erased PEB where bitflips have occured.

Makes sense!

>>
>>>> +			err = 0;
>>>> +		}
>>>> +		/*
>>>> +		 * e is target of a move operation, all we can do is kicking
>>>> +		 * wear leveling such that we can catch it later or wear
>>>> +		 * leveling itself scrubbs the PEB.
>>>> +		 */
>>>> +		else if (ubi->move_to == e || ubi->move_from == e) {
>>>> +			spin_unlock(&ubi->wl_lock);
>>>> +
>>>> +			err = ensure_wear_leveling(ubi, 1);
>>>> +		}
>>>> +		/*
>>>> +		 * e is member of a fastmap pool. We are not allowed to
>>>> +		 * remove it from that pool as the on-flash fastmap data
>>>> +		 * structure refers to it. Let's schedule a new fastmap write
>>>> +		 * such that the said PEB can get released.
>>>> +		 */
>>>> +		else {
>>>> +			ubi_schedule_fm_work(ubi);
>>>> +			spin_unlock(&ubi->wl_lock);
>>>> +
>>>> +			err = 0;
>>>> +		}
>>>
>>> I'm nitpicking again, but I like to have a single place where spinlocks
>>> are locked and unlocked, so here is a rework suggestion for the code
>>> inside the 'if (err == UBI_IO_BITFLIPS)' statement:
>>
>> A single lock/unlock place is nice but in this case the whole logic fits
>> into a single page on screen. "do_this" and "do_that" variables don't make
>> the code more readable IMHO.
>> But as with all nitpicks it is a matter of taste and we could waste multiple
>> days on such things.
> 
> Isn't that the whole point of code reviews :-P ?

;-)

Thanks,
//richard
