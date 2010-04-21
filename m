Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4W0F-00054x-2W
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 09:13:52 +0000
Date: Wed, 21 Apr 2010 11:13:48 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: attaching UBI while getting read errors from NAND driver fails.
Message-ID: <20100421091348.GC31506@Chamillionaire.breakpoint.cc>
References: <20100420184412.GA19928@Chamillionaire.breakpoint.cc>
	<1271818257.11751.1372.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1271818257.11751.1372.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2010-04-21 05:50:57 [+0300]:

>On Tue, 2010-04-20 at 20:44 +0200, Sebastian Andrzej Siewior wrote:
>> | UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
>> So we return with -EBADMSG as you can see in the error message. This
>> error is then converted by ubi_io_read() into -EIO:
>> |                /*
>> |                 * The driver should never return -EBADMSG if it failed to read
>> |                 * all the requested data. But some buggy drivers might do
>> |                 * this, so we change it to -EIO.
>> |                 */
>> |                if (read != len && err == -EBADMSG) {
>> |                        ubi_assert(0);
>> |                        err = -EIO;
>> |                }
>> 
>Well, I think the idea was that the MTD layer tries to read all the
>requested data despite of a possible unrecoverable ECC error in the
>middle. So if it returns -EBADMSG, we know that the read buffer contains
>all the data anyway, even though some of the data may be incorrect.
>
>So, I'd suggest changing MTD and making it return read == len in that
>case.

Wait. According to the error message, I had read == len (both 64). So I
think it never got changed to -EIO, my mistake.

>> @@ -756,7 +756,8 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
>>  		bitflips = 1;
>>  	}
>>  
>> -	si->is_empty = 0;
>> +	if (err != UBI_IO_BAD_EC_HDR)
>> +		si->is_empty = 0;
>>  
>>  	if (!ec_corr) {
>>  		int image_seq;
>> @@ -827,6 +828,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
>>  			return err;
>>  		goto adjust_mean_ec;
>>  	}
>> +	si->is_empty = 0;
>>  
>>  	vol_id = be32_to_cpu(vidh->vol_id);
>>  	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
>
>This part looks right.

Do you want me to resend this part as the fix?

Sebastian
