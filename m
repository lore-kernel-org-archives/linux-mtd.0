Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB6ZS-0004aA-LT
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 18:52:07 +0000
Message-ID: <54B5693C.6020700@nod.at>
Date: Tue, 13 Jan 2015 19:51:40 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75%
 of correction strength
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <54B51CCA.1090707@nod.at> <20150113184805.GS9759@ld-irv-0074>
In-Reply-To: <20150113184805.GS9759@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Steve deRosier <derosier@gmail.com>, Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

Am 13.01.2015 um 19:48 schrieb Brian Norris:
> Hi Richard,
> 
> On Tue, Jan 13, 2015 at 02:25:30PM +0100, Richard Weinberger wrote:
>> Am 12.01.2015 um 21:51 schrieb Brian Norris:
>>> The MTD API reports -EUCLEAN only if the maximum number of bitflips
>>> found in any ECC block exceeds a certain threshold. This is done to
>>> avoid excessive -EUCLEAN reports to MTD users, which may induce
>>> additional scrubbing of data, even when the ECC algorithm in use is
>>> perfectly capable of handling the bitflips.
>>>
>>> This threshold can be controlled by user-space (via sysfs), to allow
>>> users to determine what they are willing to tolerate in their
>>> application. But it still helps to have sane defaults.
>>>
>>> In recent discussion [1], it was pointed out that our default threshold
>>> is equal to the correction strength. That means that we won't actually
>>> report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
>>> are almost too many to handle. It was determined that 3/4 of the
>>> correction strength is probably a better default.
>>>
>>> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html
>>
>> I like this change but I have one question.
>>
>> UBI will treat a block as bad if it shows bitflips (EUCLEAN) right
>> after erasure.
> 
> Can you elaborate? When "after erasure"? The closest I see is that UBI
> will mark a block bad if it sees an -EIO failure from sync_erase() in
> erase_worker(). If you have extra debug checks on, then
> ubi_self_check_all_ff() could potentially give you bitflip problems
> after the erase, but that's an odd corner case anyway, which many
> drivers have been handling in hacked together ad-hoc ways anyway (search
> for "bitflips in erase pages").
> 
> So I can't pinpoint what you're talking about, exactly.

See torture_peb()
out:
        mutex_unlock(&ubi->buf_mutex);
        if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err)) {
                /*
                 * If a bit-flip or data integrity error was detected, the test
                 * has not passed because it happened on a freshly erased
                 * physical eraseblock which means something is wrong with it.
                 */
                ubi_err(ubi, "read problems on freshly erased PEB %d, must be bad",
                        pnum);
                err = -EIO;
        }

>> For SLC NAND this works very well.
>> Does this also hold for MLC NAND? If one or two bit flips are okay
>> even for a freshly erased MLC NAND this change could cause UBI to
>> mark good blocks as bad depending on the ECC strength.
> 
> I would typically assume that MLC NAND users must be using significantly
> stronger ECC (e.g., 12-bit / 512-byte, at least), so "one or two
> bitflips" would still fall well under 75% of 12 bits.

Same here. I just want to make sure that UBI does not assume a perfect NAND world. :)

Thanks,
//richard
