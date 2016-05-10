Date: Tue, 10 May 2016 16:55:17 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, linux-mediatek@lists.infradead.org,
 erin.lo@mediatek.com, daniel.thompson@linaro.org, blogic@openwrt.org
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160510165517.69a17aeb@bbrezillon>
In-Reply-To: <5731F22C.902@linaro.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon> <5731F22C.902@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 10 May 2016 10:37:32 -0400
Jorge Ramirez <jorge.ramirez-ortiz@linaro.org> wrote:

> On 05/10/2016 08:13 AM, Boris Brezillon wrote:
> >> +#define ECC_IDLE_REG(x)		((x) == ECC_ENC ? ECC_ENCIDLE : ECC_DECIDLE)  
> >> >+#define ECC_IDLE_MASK(x)	((x) == ECC_ENC ? ENC_IDLE : DEC_IDLE)  
> > No need for this macro, it's always bit0, so just define an ECC_IDLE
> > macro and use it for both decoder and encoder.  
> 
> this was only done for consistency to help people reading the code (same 
> for codec_enable, codec_disable).
> I suppose I could remove macros and just write 0 and 1 to the registers 
> if you prefer that.

No.

> 
> >
> > There seems to be some kind of pattern in your ENC/DEC registers.
> > ENC registers start at 0 and DEC ones at 0x100.
> > CNF register is always at 0x4 + mode/dir_offset (ie 0x100 for DEC and
> > 0x0 for ENC), ...
> > Maybe you should define common macros for those registers, and choose
> > the base offset depending on the mode you're operating in (encoding or
> > decoding).  
> 
> Not sure if you are familiar with George Lakoff and his book "Don't 
> Think Of An Elephant! Know Your Values And Frame The Debate" but the key 
> message is not to engage in a discussion when you disagree with the 
> terms used by your counterpart since you wont be able to frame the 
> argument (the book is actually very interesting if politics and and the 
> political debate is something that interest you)
> 
> I explicitly chose not to talk about modes, instead I chose the engine 
> driver to talk about the codecs it controls; for me mode is a higher 
> level concept that I didn't have a need for since in this case the mode 
> is a 1-1 relationship to the codec. So when you tell me about the mode 
> the engine is operating in I'd rather say the codec that the ecc engine 
> is accessing. I hope it makes sense.

I'm not arguing about the use of codec, but IMO codec is just
representing a device that is capable of encoding/decoding stuff, it
does not represent in which mode you want to use this device.

> 
> if you want to talk about modes instead of the encoders and decoders 
> that is fine since you are the maintainer.

No, the terms encoders/decoders are fine, I was just suggesting to
share some of the definitions between the encoder and decoder parts.

> I can rewrite the relevant parts of the driver but I honestly see no value.

No that's fine.

> 
> why did I wrote these macros? just for readability since they are simple 
> conditionals.

Again, I'm not arguing against the definition of helper macros, just
suggesting another way to do it to avoid register offset duplication.

> So coming back to your second question, I not sure why I would use a 
> base offset when I already have the map. I wouldn't.

Anyway, let's keep it like this.

> 
> >  
> >> >+#define ECC_IRQ_REG(x)		((x) == ECC_ENC ? ECC_ENCIRQ_EN : ECC_DECIRQ_EN)
> >> >+#define ECC_IRQ_EN(x)		((x) == ECC_ENC ? ENC_IRQEN : DEC_IRQEN)
> >> >+#define ECC_CTL_REG(x)		((x) == ECC_ENC ? ECC_ENCCON : ECC_DECCON)
> >> >+#define ECC_CODEC_ENABLE(x)	((x) == ECC_ENC ? ENC_EN : DEC_EN)
> >> >+#define ECC_CODEC_DISABLE(x)	((x) == ECC_ENC ? ENC_DE : DEC_DE)  
> 
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
