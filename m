Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avLfP-00039n-Ub
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 09:21:56 +0000
Subject: Re: [PATCH 2/8] mtd-utils: Add multi-block erase function
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-3-git-send-email-richard@nod.at>
 <20160426100406.452b2378@bbrezillon>
Cc: linux-mtd@lists.infradead.org
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <e3758952-76e9-8b62-f575-42248f2d66f4@sigma-star.at>
Date: Wed, 27 Apr 2016 11:21:31 +0200
MIME-Version: 1.0
In-Reply-To: <20160426100406.452b2378@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/26/2016 10:04 AM, Boris Brezillon wrote:
>> -int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
>> +int mtd_erase_multi(libmtd_t desc, const struct mtd_dev_info *mtd,
>> +			int fd, int eb, int blocks)
>>  {
>>  	int ret;
>>  	struct libmtd *lib = (struct libmtd *)desc;
>> @@ -856,8 +857,12 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ei64.start = (__u64)eb * mtd->eb_size;
>> -	ei64.length = mtd->eb_size;
>> +	ret = mtd_valid_erase_block(mtd, eb + blocks - 1);
>> +	if (ret)
>> +		return ret;
> 
> Maybe you should also check if @eb is a valid block (what if @eb < 0,
> but @eb + @blocks >= 0).
> 
This patch only renames the mtd_erase function to mtd_erase_multi and lets it
accept a block count. The existing code already checks @eb for validity.

A new implementation of mtd_erase is added below that calls mtd_erase_multi with a block
count of 1.

>> +
>> +	ei64.start = (__u64)eb * (__u64)mtd->eb_size;
>
> I'm not sure you really need the second (__u64) cast, AFAIR, the first
> one already guarantees that the intermediate result will be stored in a
> __u64 variable.

Yes, according to the C89 spec, section 3.2.1.5 it is technically not needed.
Since both are integer operands, casting one to something larger than int (and
of different signedness) causes the other operand to be converted to the same
type before the operation is performed.


David
