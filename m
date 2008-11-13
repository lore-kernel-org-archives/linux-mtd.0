Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0eXu-0005zT-Mg
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 15:55:51 +0000
Received: by wf-out-1314.google.com with SMTP id 28so921581wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Nov 2008 07:55:50 -0800 (PST)
Message-ID: <8bd0f97a0811130755t1e75b5b9tbdcf5189feea8b38@mail.gmail.com>
Date: Thu, 13 Nov 2008 10:55:49 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
In-Reply-To: <20081114.005132.78730934.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081113.224350.18312549.anemo@mba.ocn.ne.jp>
	<20081113.232823.125897716.anemo@mba.ocn.ne.jp>
	<8bd0f97a0811130651k11c52a53j91c80cf196e9f66a@mail.gmail.com>
	<20081114.005132.78730934.anemo@mba.ocn.ne.jp>
Cc: linux-mtd@lists.infradead.org, vapier@gentoo.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 13, 2008 at 10:51, Atsushi Nemoto wrote:
> On Thu, 13 Nov 2008 09:51:01 -0500, "Mike Frysinger" wrote:
>> > Automatic fallback to mtd_device in parse_mtd() is convenient but
>> > somewhat unflexible...
>>
>> we could just have it do it all the time.  i dont see a problem with
>> exposing the entire block device the whole time ?  i know for the
>> driver or two of mine, i'm fine with it.
>>
>> ...
>>        ret = parse_mtd_partitions(mtd, probe_types, &parts, 0);
>>        if (ret > 0) {
>>                ret = add_mtd_partitions(mtd, parts, ret);
>>                kfree(parts);
>>        } else if (nr_parts)
>>                ret = add_mtd_partitions(mtd, parts, nr_parts);
>>        if (ret)
>>                return ret;
>> #endif
>>
>>        return add_mtd_device(mtd);
>
> I'm OK with this.  But not sure all current mtd partition users.
>
> Are you going to convert all parse_mtd_partitions() call?  Maybe some
> people do not want to change /dev/mtd numbers...

if it's a real concern, we can make it optional.  i'll post patches to
convert physmap and my drivers as those are the only ones i can
actually test.
-mike
