Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTqeT-0006r9-Qc
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 13:51:51 +0000
Subject: Re: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swap
 is enabled
To: Seb <sebtx452@gmail.com>
References: <1484741452-27141-1-git-send-email-sebtx452@gmail.com>
 <e5bb2245-a0d0-5b66-2c75-9af26c6ea846@phrozen.org>
 <CA+hF=GeD0dhBUkR+wR_35pSXgSnU0kW6EfYWa9h2QrGOTReMnA@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
From: John Crispin <john@phrozen.org>
Message-ID: <845374ff-62b0-983b-b399-4965421a9066@phrozen.org>
Date: Wed, 18 Jan 2017 14:51:25 +0100
MIME-Version: 1.0
In-Reply-To: <CA+hF=GeD0dhBUkR+wR_35pSXgSnU0kW6EfYWa9h2QrGOTReMnA@mail.gmail.com>
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



On 18/01/2017 14:48, Seb wrote:
> Hi John,
> 
> 
>>>
>>>       ltq_mtd->map->map_priv_1 = LTQ_NOR_PROBING;
>>
>> this line should be dropped
> 
> Yes, I noticed this mistake. I fixed it but forgotten to add thix fix
> to my commit -_-
> 
>>> +     /* We swap the addresses only if the EBU endianness swap is disabled */
>>> +     if (ltq_ebu_r32(LTQ_EBU_BUSCON0) & BIT(30))
>>
>> add a define for BIT(30) please and we should really check if this a
>> v1.2 or newer. if my memory is correct this was a silicon bug inside
>> v1.0 and v1.1
> 
> In my kernel (OpenWrt) boot log I have :
> 
> [    0.000000] Linux version 4.4.14 (qa@serveurQA) (gcc version 5.3.0
> (OpenWrt GCC 5.3.0 50020) ) #150 SMP Tue Jan 17 09:18:24 UTC 2017
> [    0.000000] SoC: xRX200 rev 1.2
> [    0.000000] bootconsole [early0] enabled
> [    0.000000] CPU0 revision is: 00019556 (MIPS 34Kc)
> 
> It would be better to ensure that the SoC version is >= 1.2 (as this
> bug was fixed in this version).

the bug is also fixed on the 300 and 500 series chips, so we would want
to check for that aswell.

	John




> You can get more informations in my OpenWrt pull request :
> 
> https://github.com/openwrt/openwrt/pull/321
> 
> 
> Regards,
> 
> Sebastien.
> 
