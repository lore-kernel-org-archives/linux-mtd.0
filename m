Received: from mail-ob0-f179.google.com ([209.85.214.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSKsC-0002cP-Ap
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 08:06:57 +0000
Received: by obkg7 with SMTP id g7so25812160obk.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 01:06:35 -0700 (PDT)
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com.
 [209.85.214.169])
 by smtp.gmail.com with ESMTPSA id x201sm2034643oia.28.2015.08.20.01.06.29
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2015 01:06:30 -0700 (PDT)
Received: by obkg7 with SMTP id g7so25810583obk.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 01:06:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201508200955.20067.marex@denx.de>
References: <CAN1oZWyE9E2kRkGZPajpiNbpeKEjOhs9NDNDbUpmdw18WNYL2A@mail.gmail.com>
 <CAN1oZWx_wefKJhB2pVbhw_UUZNR8LfveS-FPBFtgndGg_nXoUw@mail.gmail.com>
 <201508200955.20067.marex@denx.de>
Date: Thu, 20 Aug 2015 16:06:29 +0800
Message-ID: <CAN1oZWzkdSX7NXTG1aVmR79MMoDVRtrrq6j3KO2Qi138hnf_LQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
From: Viet Nga Dao <vndao@altera.com>
To: Marek Vasut <marex@denx.de>
Cc: Viet Nga Dao <vndao@altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 20, 2015 at 3:55 PM, Marek Vasut <marex@denx.de> wrote:
> On Thursday, August 20, 2015 at 09:37:33 AM, Viet Nga Dao wrote:
>> Hi,
>
> Hi,
>
>> >> On Tuesday, August 18, 2015 at 03:24:44 AM, Brian Norris wrote:
>> >>> I'm not very helpful here, so hopefully Viet can be of more use:
>> >> Yup :)
>> >>
>> >>> On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
>> >>> > On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
>> >>> > Also, I cannot find any documentation for this IP block even if I
>> >>> > search through Quartus/QSys, is there any proper documentation
>> >>> > available anywhere?
>> >>>
>> >>> I never found proper documentation, but I didn't look too hard. I've
>> >>> mostly been going off of Viet's comments and code.
>> >>
>> >> Me neither, and I looked through the altera stuff in fact. I'm trying to
>> >> learn whether this is just an Soft IP, in which case it certainly can
>> >> be fixed ; or if there is actually some chip shipping with this crap
>> >> synthesised into actual silicon.
>> >>
>> >>> But FWIW, I did find some relevant info for the peculiar Altera EPCQ
>> >>> flash here:
>> >>>
>> >>> https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/litera
>> >>> ture/
>> >>> hb/cfg/cfg_cf52012.pdf
>> >>
>> >> Altera EPCS/EPCQ flashes are just rebranded micron flashes, they just
>> >> have different JEDEC >ID and are a bit more expensive.
>> >
>> > You can find the document at here
>> > (https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literatu
>> > re/ug/ug_embedded_ip.pdf)
>> >
>> >  Chapter 42.Page 407.
>> >
>> > For the soft IP issue, i've requested hardware engineer to come out
>> > the solution.
>
> That's good :)
>
>> > So in the mean way, our driver will NOT support Micron
>> > flashes until hardware fix is completed.
>
> This doesn't answer my question, so let me reiterate. Is this controller
> only Soft IP (as in, FPGA core) or is this controller shipping in some
> chip as Hard IP (as in, piece of silicon) ?
>

This is new soft IP.

>> > Hence, i just submitted version 5 for this driver with eliminating
>> > micron device support. Hope this version will get ACKed by you.
>
> We'll see.
>
> Best regards,
> Marek Vasut
