Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FDkpP-0001cP-UA
	for linux-mtd@lists.infradead.org; Mon, 27 Feb 2006 11:02:29 -0500
Message-ID: <44032266.1040501@yandex.ru>
Date: Mon, 27 Feb 2006 19:01:42 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <43EB96DC.3030900@eptar.com>
	<43F74BF1.1080307@ru.mvista.com>	<1140337326.2480.674.camel@localhost.localdomain>	<200602210942.38302.manningc2@actrix.gen.nz>	<1140471467.2480.793.camel@localhost.localdomain>	<43FB00B4.9040706@yandex.ru>	<1140523614.2480.931.camel@localhost.localdomain>	<44004666.8030805@yandex.ru>
	<625fc13d0602270527k39b18cabv5762c008bb1e2b73@mail.gmail.com>
In-Reply-To: <625fc13d0602270527k39b18cabv5762c008bb1e2b73@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> Often times the eraseregions have no practical use for the software
> involved.  Take the Intel P30 for example.  It has a few eraseblocks
> at either the top or bottom of the chip that are different eraseblock
> size.  
This explains why putting this all together in one mtd-> structure is 
bad  (they have different eraseblocks size).

> If you have different eraseregions show up as different MTD devices
> (or partitions which are essentially the same thing in this
> discussion),
Err, actually partitions are better, because they are handeled by the 
same flash driver.

> then you have to manually concatenate them back into a
> single device.
What for do you need to concatenate them back? Different erase regions 
are used for completely different purposes, right? So if you work with 
the small "boot" region, you don't normally need the rest of the flash 
and vice versa.

My point is that there should be a generalized flash model like this:

1. there are only 3 operations: read, write, erase;
2. erase is done in terms of eraseblocks, eraseblocks are all equivalent 
in size;
4. there is a minimal input/output unit exists;

That's all. Erase regions and OOB is out of this simple flash model, do 
you see what I mean? Add your erase regions to this model and you'll end 
up with a mess. Organize these regions as different instances of the 
above generalized model, and you have a very nice picture.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
