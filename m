Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEf9v-0006pZ-Up
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 16:33:36 +0000
Received: by mail-wj0-x241.google.com with SMTP id kp2so50766250wjc.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2016 08:33:10 -0800 (PST)
Subject: Re: [PATCH v6 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20161205112727.GI1459@lahna.fi.intel.com>
 <2dac1535-de7f-47c3-2747-ba8cac854811@gmail.com>
 <20161205163106.GJ1459@lahna.fi.intel.com>
 <62db8daa-7ebf-1a42-bd70-897c3c636e3c@atmel.com>
 <20161206094525.GA25385@dell.home> <20161207085330.GN1459@lahna.fi.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Peter Tyser <ptyser@xes-inc.com>,
 key.seong.lim@intel.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0695162f-0959-ab2c-4e68-14881e386060@gmail.com>
Date: Wed, 7 Dec 2016 17:07:55 +0100
MIME-Version: 1.0
In-Reply-To: <20161207085330.GN1459@lahna.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/07/2016 09:53 AM, Mika Westerberg wrote:
> On Tue, Dec 06, 2016 at 09:45:25AM +0000, Lee Jones wrote:
>> I'm happy either way.  However if you take them, I will require a
>> pull-request to an immutable branch containing only these patches.
>>
>> If I take them, it won't be until v4.11, since we are half way though
>> -rc8 already and I would like them to soak in -next for at least a
>> couple of weeks.
> 
> This series already missed v4.8 and v4.9 so I don't think there is a
> rush to get it for v4.10 either ;-) I'm fine if it goes for v4.11.

Hmmmmmmmmmmm, that kinda sucks. Lee, are you positive this isn't 4.10
material ?

-- 
Best regards,
Marek Vasut
