Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPZRB-0007LX-KQ
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 14:54:34 +0000
Received: by mail-lb0-f171.google.com with SMTP id u14so2358695lbd.16
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 07:54:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52458644.5040900@nod.at>
References: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
 <52458377.7040100@nod.at>
 <CACQ1gAjcoW=mKS97t0HPYP6NXy92Cwm5YFriydPcke3N6LoB_A@mail.gmail.com>
 <52458644.5040900@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 27 Sep 2013 16:53:50 +0200
Message-ID: <CACQ1gAi-vYqQooo023QkQRaScwxsesmrU1F68=BgjwTP8Xp4Ug@mail.gmail.com>
Subject: Re: [PATCH] UBI: fastmap: fix backward compatibility with image_seq
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/9/27 Richard Weinberger <richard@nod.at>:
> Am 27.09.2013 15:16, schrieb Richard Genoud:
>> 2013/9/27 Richard Weinberger <richard@nod.at>:
>>> Am 27.09.2013 14:51, schrieb Richard Genoud:
>>>> Some old UBI implementations (e.g. U-Boot) have not implemented the image
>>>> sequence feature.
>>>> So, when erase blocks are written, the image sequence in the ec header
>>>> is lost (set to zero).
>>>> UBI scan_all() takes this case into account (commits
>>>> 32bc4820287a1a03982979515949e8ea56eac641 and
>>>> 2eadaad67b2b6bd132eda105128d2d466298b8e3)
>>>>
>>>> But fastmap scan functions (ubi_scan_fastmap() and scan_pool()) didn't.
>>>>
>>>> This patch fixes the issue.
>>>>
>>>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>>>> ---
>>>
>>> W00t! Good catch!
>>>
>>> Acked-by: Richard Weinberger <richard@nod.at>
>> Thanks :)
>>
>>
>> There's still an error when the image sequence is bad:
>> [   35.632812] UBI error: scan_pool: bad image seq: 0x0, expected: 0x6e452f03
>> [   35.640625] UBI error: ubi_scan_fastmap: Attach by fastmap failed,
>> doing a full scan!
>> [   35.648437] kmem_cache_destroy ubi_ainf_peb_slab: Slab cache still
>> has objects  <- the destroy_ai in line 1415
>
> *grrr*, the problem here is that not all allocations which are done via
> kmem_cache_alloc(ai->aeb_slab_cache, ...) got kfree()'d.
>
> Thanks,
> //richard

My first guess is in fastmap.c, function scan_pool(), in the loop "for
(i = 0; i < pool_size; i++)"
there's some "add_aeb()" and "new_aeb = kmem_cache_alloc()"
And on error, I don't see a loop backward to free those ones.


Richard.
