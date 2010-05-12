Received: from mail-gx0-f212.google.com ([209.85.217.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OCB5k-0003ha-GM
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 12:31:13 +0000
Received: by gxk4 with SMTP id 4so14028gxk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 May 2010 05:31:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTinbUzqx3hwbhB9vBUTvZqFJ5orIKDwSrKG6P5Mf@mail.gmail.com>
References: <n2g152584231004131315ge1d824bfm6820ccb877a0fde6@mail.gmail.com>
	<z2z152584231004201324tc69525a0hb86ff9fdeb679ca4@mail.gmail.com>
	<1272373142.7750.5.camel@localhost>
	<AANLkTinWOfcRRrfhgUO2tvBeVDu_PvnKeKa_0MQKbJtG@mail.gmail.com>
	<1273635175.8881.3.camel@localhost.localdomain>
	<AANLkTimjSxP9tCJM86hNRRgFKvj5MQLSYowOF5P-PpOe@mail.gmail.com>
	<AANLkTinbUzqx3hwbhB9vBUTvZqFJ5orIKDwSrKG6P5Mf@mail.gmail.com>
Date: Wed, 12 May 2010 14:31:10 +0200
Message-ID: <AANLkTinD7cNOEhTKnmR9vCLkO4l3TLj5v_Q92QSQBnvZ@mail.gmail.com>
Subject: Re: Erase race?
From: massimo cirillo <maxcir@gmail.com>
To: Jon Ringle <jon@ringle.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Have you any evidence of erase suspend occurrence ?
Could you try to disable erase suspend from cfi_cmdset_0001.c ?
To this end, uncomment
#define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
#define CMDSET0001_DISABLE_WRITE_SUSPEND
(they must be defined) at the beginning of the file and repeat
your test.
Bye

2010/5/12 Jon Ringle <jon@ringle.org>:
> On Wed, May 12, 2010 at 4:21 AM, massimo cirillo <maxcir@gmail.com> wrote:
>> Hi Jon,
>> I verified some particular error conditions regarding
>> the erase suspend in some nor flash chip.
>> Please tell me the part number of the flash you
>> are using and I will check it.
>
> Thanks. The boards that showed this failure have Intel JS28F256P30T95.
> However, we are planning on switching to Numonyx JS28F256P30TF due to
> upcoming obsolescence of the Intel part.
>
> Jon
>
