Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STajS-0008IW-3h
 for linux-mtd@lists.infradead.org; Sun, 13 May 2012 15:29:14 +0000
Message-ID: <4FAFD326.4020406@nod.at>
Date: Sun, 13 May 2012 17:28:38 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] [RFC] UBI: Kill data type hint
References: <1336738443-112022-1-git-send-email-richard@nod.at>	
 <1336738443-112022-2-git-send-email-richard@nod.at>
 <1336920094.2003.20.camel@koala>
In-Reply-To: <1336920094.2003.20.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 13.05.2012 16:41, schrieb Artem Bityutskiy:
> Hi Richard,
>
> On Fri, 2012-05-11 at 14:14 +0200, Richard Weinberger wrote:
>>   struct ubi_map_req {
>>          __s32 lnum;
>> -       __s8  dtype;
>> -       __s8  padding[3];
>> +       __s8  padding[4];
>>   } __packed;
>
>
> The "dtype" field is part of ABI, and merging it with padding is bad
> because padding holds "free" fields, which can be used in future. But
> "dtype" is not really free. I think it should stay here. You should put
> a comment explaining that it was used in the past for this and that, but
> now unused and ignored by UBI. Probably a date when we stopped using it
> would also be good.

Oh, it's ABI. Then I'll keep it and mark it as obsolete.

> May be it even deserves to be in a separate patches for this one and
> ubi_leb_change_req ?

Indeed.

Thanks,
//richard
