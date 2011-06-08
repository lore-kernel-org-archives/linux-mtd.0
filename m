Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJNB-00051g-Na
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:04:42 +0000
Received: by vxd2 with SMTP id 2so468939vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:04:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307524810.31223.35.camel@localhost>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-29-git-send-email-dbaryshkov@gmail.com>
	<1307524810.31223.35.camel@localhost>
Date: Wed, 8 Jun 2011 18:04:39 +0400
Message-ID: <BANLkTikD6b7E0zK+y02NXu2me+e0du3N-w@mail.gmail.com>
Subject: Re: [PATCH 28/44] mtd: edb7312.c: use mtd_device_parse_register
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/8/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
>> -	mtd_device_register(ep7312_mtd, mtd_parts, mtd_parts_nb);
>> +	mtd_device_register(ep7312_mtd, NULL, 0,
>> +			partition_info, NUM_PARTITIONS);
>
> And probably here?

82 syms

-- 
With best wishes
Dmitry
