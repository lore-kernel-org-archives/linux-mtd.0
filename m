MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <4FF8F58FAA9D5D4193D4E554E4352C5902C6E92A@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1458562809-36114-1-git-send-email-lakshmis@xilinx.com>
 <20160321130734.GS2566@sirena.org.uk>
 <4FF8F58FAA9D5D4193D4E554E4352C5902C6D34C@XAP-PVEXMBX02.xlnx.xilinx.com>
 <20160322100615.GA2566@sirena.org.uk>
 <4FF8F58FAA9D5D4193D4E554E4352C5902C6DB59@XAP-PVEXMBX02.xlnx.xilinx.com>
 <20160325150109.GF2566@sirena.org.uk>
 <4FF8F58FAA9D5D4193D4E554E4352C5902C6E92A@XAP-PVEXMBX02.xlnx.xilinx.com>
Date: Thu, 31 Mar 2016 10:28:09 +0200
Message-ID: <CAMuHMdV0B8Qka57nMv009aLdQ-fdBpAYr3wONQ7xaMfKXrORvQ@mail.gmail.com>
Subject: Re: [LINUX PATCH 1/2] mtd: Added dummy entry in the spi_transfer
 structure.
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Lakshmi Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michals@xilinx.com>,
 Soren Brinkmann <sorenb@xilinx.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>, Jagan Teki <jteki@openedev.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Anirudha Sarangi <anirudh@xilinx.com>,
 "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 31, 2016 at 8:14 AM, Lakshmi Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
>>> >This is really not what I'd expect to happen, I'd expect that these dummy
>>> >cycles would be in addition to the actual data (see my request for better
>>> >documentation...).  If they overlap with the data then what is the point in
>>> >specifying this?  It's more work for the host, what benefit do we get from
>>> >doing it over just handing it like a normal byte?
>>
>>> len field in the transfer structure contains dummy bytes along with actual
>>data
>>> bytes, controllers which requires dummy bytes use len field and simply
>>Ignore
>>> the dummy field (contains only no of cycles)added in this patch. Controllers
>>> (like ZynqMP GQSPI) expects dummy in cycles won't work directly by using
>>> len field because host driver doesn't know that len field of a particular
>>transfer
>>> includes dummy bytes or not (and also number of dummy bytes included in
>>len
>>> field). In such cases driver use this dummy field to identify the number of
>>dummy
>>> cycles and based on that it will send the required number of dummy cycles
>>(which
>>> i did in the second patch).
>>
>>This doesn't make any sense at all to me.  Why does the controller care
>>what the bytes being sent to and from the device mean?
>
> From the flash point of view, it expects the controller to send the dummy
> on 1/2/4 lines based on the command. For Quad commands, flash expects
> 4 lines to be active during dummy phase. Similarly, 2 lines for dual
> Commands and 1 line for normal/fast commands.
> Since len field contains total number of cmd+addr+dummy bytes,
> host driver should take care of sending these bytes on their respective
> bus widths. Knowing when the dummy is being sent also helps in
> the correct switching of IO pads (since the data lines are bidirectional)
> ZynqMP GQSPI is a generic controller, majorly interfaced to flash devices.
> It seems reasonable for it to know the above information from
> the flash layer. Adding "dummy" cycles entry should be useful to any
> controller that cares about it without affecting other spi/qspi controllers.

The m25p80 driver already uses dummy cycles, using real spi_transfer
structs, which have tx_nbits/rx_nbits fields to indicate how many data lines
to use.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
