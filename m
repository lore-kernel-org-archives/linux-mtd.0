Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYAG7-0006DI-Pl
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 08:55:12 +0000
Message-ID: <5427CCD8.2090605@nod.at>
Date: Sun, 28 Sep 2014 10:54:48 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedeking1@gmail.com
Subject: Re: [RFC/PATCH 1/5] mtd: ubi: Read disturb infrastructure
References: <1411886220-8208-1-git-send-email-tlinder@codeaurora.org>
 <5427C45C.2080506@nod.at> <5427CB6E.7010007@codeaurora.org>
In-Reply-To: <5427CB6E.7010007@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.09.2014 10:48, schrieb Tanya Brokhman:
>>> @@ -424,6 +440,8 @@ struct ubi_fm_sb {
>>>       __be32 used_blocks;
>>>       __be32 block_loc[UBI_FM_MAX_BLOCKS];
>>>       __be32 block_ec[UBI_FM_MAX_BLOCKS];
>>> +    __be32 block_rc[UBI_FM_MAX_BLOCKS];
>>> +    __be64 block_let[UBI_FM_MAX_BLOCKS];
>>
>> Doesn't this break the fastmap on-disk layout?
> 
> What do you mean "break"? I verified fastmap feature is working. the whole read-disturb depends on it so I tested this thoroughly.

Did you write a fastmap with your changes applied and then an attach using a fastmap implementation *without*
you changes?
I bet it will not work because the disk layout is now different.
Linux is not the only user of fastmap. We need to be very careful here.

Thanks,
//richard
