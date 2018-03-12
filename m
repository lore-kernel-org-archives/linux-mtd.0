Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1evGNp-0001V0-HX
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 05:52:31 +0000
Received: by mail-io0-x242.google.com with SMTP id v10so3340497iob.6
 for <linux-mtd@lists.infradead.org>; Sun, 11 Mar 2018 22:52:17 -0700 (PDT)
Subject: Re: [PATCH 0/2] mtd: use put_device() if device_register fail
To: Richard Weinberger <richard@nod.at>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <3975609.gPYExXdWMR@blindfold>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <4a280604-16f2-776b-d997-d5882af6fe35@gmail.com>
Date: Mon, 12 Mar 2018 11:21:24 +0530
MIME-Version: 1.0
In-Reply-To: <3975609.gPYExXdWMR@blindfold>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Monday 12 March 2018 01:05 AM, Richard Weinberger wrote:
> Am Freitag, 9. März 2018, 11:50:47 CET schrieb Arvind Yadav:
>> if device_register() returned an error! Always use put_device()
>> to give up the reference initialized.
>>
>> Arvind Yadav (2):
>>    [PATCH 1/2] mtd: use put_device() if device_register fail
>>    [PATCH 2/2] mtd: ubi: use put_device() if device_register fail
> Uhh, this is not obvious. Does device_register() really always return with a
> reference held in all (error) cases?
>
> Thanks,
> //richard
if device_register() returned an error! Always use put_device()
to give up the reference initialized.(-- Please see the comment
for device_register() ). put_device() is able to handle those case
where it'll not return a reference.

~arvind
