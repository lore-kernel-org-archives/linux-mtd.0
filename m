Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUjYN-0000Gt-HH
 for linux-mtd@lists.infradead.org; Sun, 08 Mar 2015 22:20:08 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 5/9] mtd: pxa3xx_nand: add support for the Marvell
 Berlin nand controller
References: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
 <1425555085-29531-6-git-send-email-antoine.tenart@free-electrons.com>
 <54FA6DFC.1070904@free-electrons.com> <87oao3xvh8.fsf@free.fr>
 <54FCAF6C.7010902@free-electrons.com>
Date: Sun, 08 Mar 2015 23:19:36 +0100
In-Reply-To: <54FCAF6C.7010902@free-electrons.com> (Ezequiel Garcia's message
 of "Sun, 08 Mar 2015 17:22:04 -0300")
Message-ID: <87ioebxhc7.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

>> I think you'll kill the zylonite board, and I'll nack it if that's the case. At
>> least that's what happened when I tried to use onfi default values last time in
>> barebox development.
>> 
>> I can test your changes, but if the specific zylonite nand (ie. nand id 0xba20,
>> ie. pxa310 embedded flash) gets broken, I'm against the removal of the legacy
>> timings removal.
>>
>
> I'm not speaking of any timing params here, but about the flash
> identification.
>
> Which flash do you have there?
The one with 0xba20 id as I said, which is AFAIK a Numonyx NAND02GR4B2C.

And of course a "READ_ID(ONFI)" doesn't work (tested)... sic ... as showed in :
http://www.linux-mtd.infradead.org/nand-data/nanddata.html

Cheers.

-- 
Robert
