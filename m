Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ0YA-0007Ts-0D
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 14:35:43 +0000
Received: by pacan13 with SMTP id an13so28779226pac.1
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 07:35:20 -0700 (PDT)
Message-ID: <55B39E54.4080305@gmail.com>
Date: Sun, 26 Jul 2015 00:03:56 +0930
From: Joseph East <eastyjr@gmail.com>
MIME-Version: 1.0
To: Jonas Gorski <jogo@openwrt.org>
CC: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: bcm47xxpart.c: Extra TRX magics, NVRAM part handling
References: <1437826417-8200-1-git-send-email-eastyjr@gmail.com>
 <CAOiHx=na3_WYK1rvo8oO=2rKs5EzTMEcxGT-fccxoOyskfKrQg@mail.gmail.com>
In-Reply-To: <CAOiHx=na3_WYK1rvo8oO=2rKs5EzTMEcxGT-fccxoOyskfKrQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25/07/2015 10:08 PM, Jonas Gorski wrote:
> If it's based on four patches, it should be also submitted as four
> patches, especially as these four changes only have in common that
> they touch the same file.

Will re-send patches as separate items shortly. I thought that as each patch only impacted this one file, squashing them would be the better course of action.

>>
>> +       if (!found_nvram) {
>> +               pr_err("can not find a nvram partition reserve last block\n");
> 
> I have trouble parsing this sentence, do you mean somethign like
> "Cannot find an nvram partition, therefore reserve the last block as
> one."? Also this probably should be a pr_warn, not a pr_err, as you
> don't abort here.
> 
> 
>> +               bcm47xxpart_add_part(&parts[curr_part++], "nvram_guess",
>> +                                    master->size - blocksize * 2, MTD_WRITEABLE);
>> +               for (i = 0; i < curr_part; i++) {
>> +                       if (parts[i].size + parts[i].offset == master->size)
>> +                               parts[i].offset -= blocksize * 2;
> 
> ... and you reserve the last *two* blocks here, not just the last block.
> 

Have corrected the description to reflect reservation of the last two blocks in V2.

Cheers,
Joseph
