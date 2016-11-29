Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBXKP-0001Al-OB
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2016 01:35:27 +0000
Received: by mail-pg0-x242.google.com with SMTP id e9so14621537pgc.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2016 17:35:05 -0800 (PST)
Subject: Re: [PATCH v2, 1/1] mtd: devices: m25p80: Add PM suspend resume
 support
To: Kamal Dasu <kamal.dasu@broadcom.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1473710494-4084-1-git-send-email-kdasu.kdev@gmail.com>
 <4fe502a4-ee01-3fb8-6697-161de814596e@atmel.com>
 <CAKekbeubczM5NpQy-Umqx-SmDM+deMcgYciyST2Sgrh2_dOsAw@mail.gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-spi@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ad1d08cf-4846-9b77-f8c0-149edb17b7e5@gmail.com>
Date: Mon, 28 Nov 2016 17:35:02 -0800
MIME-Version: 1.0
In-Reply-To: <CAKekbeubczM5NpQy-Umqx-SmDM+deMcgYciyST2Sgrh2_dOsAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/24/2016 11:18 AM, Kamal Dasu wrote:
> 
> Cyrille,
> 
> On Mon, Oct 17, 2016 at 1:08 PM, Cyrille Pitchen
> <cyrille.pitchen@atmel.com <mailto:cyrille.pitchen@atmel.com>> wrote:
> 
>     Hi Kamal,
> 
>     Le 12/09/2016 à 22:01, Kamal Dasu a écrit :
>     > Adding PM support so as to be able to probe spi-nor flash
>     > on resume. There are vendor specific commands to setup
>     > the transfer mode and enable read/write as part of
>     > spi_nor_scan(), done on initial probe and needed on resume().
>     > The spi-nor structure is private to the m25p driver and hence
>     > is the only place this can be done without having to duplicate
>     > code in controller driver.
> 
>     Just to be sure I've understood the purpose of this patch: here we
>     suppose
>     that the SPI NOR memory power supply was cut when the CPU entered
>     its suspend
>     mode. So when the CPU is resumed, the SPI NOR memory power supply is
>     enabled
>     again as well and the internal state of the memory is reset.
> 
> 
> Memory could be intact and in refresh state. But generally the spi nor
> part might be powered down. 
> 
> 
>     Depending on the manufacturer, we may need to send dedicated
>     commands so the
>     memory is ready again (for instance, a Global Unlock Block command
>     for SST
>     memories so we can perform Sector Erase and Page Program operations).
>     Those commands are sent from spi_nor_scan(). Hence you call
>     spi_nor_scan()
>     once again from the resume callback.
> 
> 
> Yes there are are chain of calls that setup the state of the part from
> spi_nor_scan that are vendor specific based on the jdec id. So yes some
> of the unlock commands need to be sent before we can start using the
> part again.
>  
> 
>     If so, your patch does make sense but I wonder whether some
>     operations done
>     inside spi_nor_scan() and not related to the memory itself but more
>     to other
>     layers like mtd (struct mtd_info) could always be safely performed a
>     second
>     time. I don't know if that issue already exists or would ever exist,
>     if so
>     it might be interesting to find a mean to tell spi_nor_scan()
>     whether it's
>     called for the first time on this memory (boot) or not (resume).
> 
> 
> I do see the mtd settings that could be done a second time but should
> not cause any issues IMHO.  I don't see a need to distinguish between a
> (re)boot or a resume  and complicate the code. Unless somebody can point

Cyrille, are you okay with Kamal's response? I just saw the 4.10 pull
request pass by and since this patch was still in flight, it did not get
included, can it be queued for 4.11 or is there something else to work on?
-- 
Florian
