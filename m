Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enJkE-00056C-6I
 for linux-mtd@lists.infradead.org; Sun, 18 Feb 2018 07:50:48 +0000
Received: from player755.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3F047A3CFC
 for <linux-mtd@lists.infradead.org>; Sun, 18 Feb 2018 08:50:18 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Sun, 18 Feb 2018 08:50:07 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Jonas
 Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH V5 0/2] mtd: simplify mtd_device_parse_register() code
In-Reply-To: <20180217093812.0814fe2b@bbrezillon>
References: <20180115224547.9265-1-zajec5@gmail.com>
 <20180116154542.9767-1-zajec5@gmail.com>
 <20180217093812.0814fe2b@bbrezillon>
Message-ID: <dffdc82be3b673d01c5589e091360d20@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-02-17 09:38, Boris Brezillon wrote:
> On Tue, 16 Jan 2018 16:45:40 +0100
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> From: Rafał Miłecki <rafal@milecki.pl>
>> 
>> Even though I have some experience with MTD subsystem every time I was
>> starting working on it I had to do some quick research on the code 
>> flow.
>> I think there is some place for cleanup and optimization that would
>> simplify overall code and allow new developers to start working on it
>> more easily.
>> 
>> In these patches I meant to slightly simplify 
>> mtd_device_parse_register
>> function. I think we could reduce amount of add/register/del functions
>> and this is the first step for that.
>> 
>> Ideally I think mtdcore.c shouldn't handle parsing but just use a 
>> single
>> function from mtdpart.c.
>> 
>> Patch 1/2 modifies code to make sure parsing code is not mixed with 
>> MTD
>> master code. This should allow moving parsing parts to the mtdpart.c 
>> in
>> the future.
>> 
>> Patch 2/2 simplifies code and makes sure parsing is handled at 1 place
>> only.
>> 
>> Even though this cleanup isn't complete I think it already has some
>> value and could be accepted (if there won't be objections) on its own.
>> It's also quite small which should allow reviewing it easily.
>> 
>> Rafał Miłecki (2):
>>   mtd: move code adding master MTD out of mtd_add_device_partitions()
>>   mtd: get rid of the mtd_add_device_partitions()
> 
> Applied (even if I keep thinking those 2 commits should have been
> merged in a single one :P)

Thanks, I appreciate your help on this.
