Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfYrs-0005ge-FO
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 19:41:17 +0000
Subject: Re: [PATCH] UBI: Validate data_size
To: David Gstir <david@sigma-star.at>
References: <1442959087-9820-1-git-send-email-richard@nod.at>
 <2909A36F-2B40-424F-9861-BB992DB2B2BF@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5605A344.20200@nod.at>
Date: Fri, 25 Sep 2015 21:40:52 +0200
MIME-Version: 1.0
In-Reply-To: <2909A36F-2B40-424F-9861-BB992DB2B2BF@sigma-star.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.09.2015 um 12:37 schrieb David Gstir:
> 
>> On 22.09.2015, at 23:58, Richard Weinberger <richard@nod.at> wrote:
>>
>> Make sure that data_size is less than LEB size.
>> Otherwise a handcrafted UBI image is able to trigger
>> an out of bounds memory access in ubi_compare_lebs().
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>> drivers/mtd/ubi/io.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
>> index 5bbd1f0..1fc23e4 100644
>> --- a/drivers/mtd/ubi/io.c
>> +++ b/drivers/mtd/ubi/io.c
>> @@ -926,6 +926,11 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
>> 		goto bad;
>> 	}
>>
>> +	if (data_size > ubi->leb_size) {
>> +		ubi_err(ubi, "bad data_size");
>> +		goto bad;
>> +	}
>> +
> 
> Nice catch!
> 
> Reviewed-by: David Gstir <david@sigma-star.at>

Applied and queued for 4.3-rc.

Thanks,
//richard
