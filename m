Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbSl5-0004PH-M2
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 10:12:16 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
Date: Wed, 30 Oct 2013 11:11:54 +0100
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <526FEC7D.6060403@ti.com> <526FFFA0.8040800@ti.com>
In-Reply-To: <526FFFA0.8040800@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310301111.54613.marex@denx.de>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sourav Poddar,

> On Tuesday 29 October 2013 10:42 PM, Sourav Poddar wrote:
> > On Tuesday 29 October 2013 10:38 PM, Marek Vasut wrote:
> >> Dear Sourav Poddar,
> >> 
> >>> On Tuesday 29 October 2013 08:57 PM, Marek Vasut wrote:
> >>>> Dear Sourav Poddar,
> >>>> 
> >>>>> Dear Marek Vasut,
> >>>>> 
> >>>>> On Tuesday 29 October 2013 07:31 PM, Marek Vasut wrote:
> >>>>>> Dear Sourav Poddar,
> >>>>>> 
> >>>>>>> Hi,
> >>>>>>> 
> >>>>>>> On Sunday 27 October 2013 10:15 PM, Marek Vasut wrote:
> >>>>>>>> Dear Sourav Poddar,
> >>>>>>>> 
> >>>>>>>> [...]
> >>>>>>>> 
> >>>>>>>>> +static int macronix_quad_enable(struct m25p *flash)
> >>>>>>>>> +{
> >>>>>>>>> +    int ret, val;
> >>>>>>>>> +    u8 cmd[2];
> >>>>>>>>> +    cmd[0] = OPCODE_WRSR;
> >>>>>>>>> +
> >>>>>>>>> +    val = read_sr(flash);
> >>>>>>>>> +    cmd[1] = val | SR_QUAD_EN_MX;
> >>>>>>>>> +    write_enable(flash);
> >>>>>>>>> +
> >>>>>>>>> +    spi_write(flash->spi,&cmd, 2);
> >>>>>>>>> +
> >>>>>>>>> +    if (wait_till_ready(flash))
> >>>>>>>>> +        return 1;
> >>>>>>>>> +
> >>>>>>>>> +    ret = read_sr(flash);
> >>>>>>>> 
> >>>>>>>> Maybe read_sr() and read_cr() shall be fixed to return retval only
> >>>>>>>> and the val shall be passed to them as an argument pointer?
> >>>>>>>> Aka. ret
> >>>>>>>> = read_sr(flash,&val);
> >>>>>>>> 
> >>>>>>>> That way, this dangerous construct below could become:
> >>>>>>>> 
> >>>>>>>> if (!(val&     SR_....)) {
> >>>>>>>> 
> >>>>>>>>     dev_err();
> >>>>>>>>     ret = -EINVAL;
> >>>>>>>> 
> >>>>>>>> }
> >>>>>>>> 
> >>>>>>>> return ret;
> >>>>>>> 
> >>>>>>> I was trying to work on it and realise, we dont need to pass val
> >>>>>>> directly. We can continue returning the val and can still
> >>>>>>> cleanup the
> >>>>>>> below code as u suggetsed above.
> >>>>>>> if (!(ret&    SR_....)) {
> >>>>>>> 
> >>>>>>>         dev_err();
> >>>>>>>         ret = -EINVAL;
> >>>>>>> 
> >>>>>>> }
> >>>>>> 
> >>>>>> Uh oh, no. This doesn't seem right. I'd like to be able to clearly
> >>>>>> check if the function failed to read the register altogether OR if
> >>>>>> not, check the returned value of the register. Mixing these two
> >>>>>> together won't do us good. But maybe I just fail to understand your
> >>>>>> proposal, if so, then I appologize.
> >>>>> 
> >>>>> Yes, what I am trying to propose is to eliminate the return error
> >>>>> check.
> >>>> 
> >>>> But we want to be able to check if there is a failure :)
> >>>> 
> >>>>> The check whether register read has happened correctly is embedded in
> >>>>> read_sr/read_cr function itself.
> >>>>> 
> >>>>>            if (retval<   0) {
> >>>>>            
> >>>>>                    dev_err(&flash->spi->dev, "error %d reading SR\n",
> >>>>>                    
> >>>>>                                    (int) retval);
> >>>>>                    
> >>>>>                    return retval;
> >>>>>            
> >>>>>            }
> >>>>> 
> >>>>> Same goes for read_cr.
> >>>>> So, if the above condition is not hit, we simply return the read
> >>>>> value
> >>>>> and check it with the respective bits.
> >>>> 
> >>>> Look here:
> >>>>    107 static int read_sr(struct m25p *flash)
> >>>>    108 {
> >>>>    109         ssize_t retval;
> >>>>    110         u8 code = OPCODE_RDSR;
> >>>>    111         u8 val;
> >>>>    112
> >>>>    113         retval = spi_write_then_read(flash->spi,&code,
> >>>> 
> >>>> 1,&val, 1);
> >>>> 
> >>>>    114
> >>>>    115         if (retval<   0) {
> >>>>    116                 dev_err(&flash->spi->dev, "error %d reading
> >>>> 
> >>>> SR\n",
> >>>> 
> >>>>    117                                 (int) retval);
> >>>>    118                 return retval;
> >>>> 
> >>>> here you return error value IFF spi_write_then_read() fails for some
> >>>> reason.
> >>>> 
> >>>>    119         }
> >>>>    120
> >>>>    121         return val;
> >>>> 
> >>>> here you return actual value of the register.
> >>>> 
> >>>>    122 }
> >>>> 
> >>>> This is how I'd change the function to make it less error-prone:
> >>>> 
> >>>> *107 static int read_sr(struct m25p *flash, u8 *rval)
> >>>> 
> >>>>    108 {
> >>>>    109         ssize_t retval;
> >>>>    110         u8 code = OPCODE_RDSR;
> >>>>    111         u8 val;
> >>>>    112
> >>>>    113         retval = spi_write_then_read(flash->spi,&code,
> >>>> 
> >>>> 1,&val, 1);
> >>>> 
> >>>>    114
> >>>>    115         if (retval<   0) {
> >>>>    116                 dev_err(&flash->spi->dev, "error %d reading
> >>>> 
> >>>> SR\n",
> >>>> 
> >>>>    117                                 (int) retval);
> >>>>    118                 return retval;
> >>>>    119         }
> >>>> 
> >>>> *120         *rval = val;
> >>>> *121         return 0;
> >>>> 
> >>>>    122 }
> >>>> 
> >>>> This way, you can check if the SPI read failed and if so, handle it in
> >>>> some way. The return value would only be valid if this function
> >>>> returned
> >>>> 0.
> >>> 
> >>> I got this, but do you think its necessary to have two checks for
> >>> verifying
> >>> whether read passed. ?
> >> 
> >> Yes of course it is necessary, how else would you be able to tell if
> >> the value
> >> is valid ? Sure, you can depend on negative integer here and on the
> >> fact that
> >> the u8 will never be 32-bits wide (to produce a negative integer when
> >> the return
> >> value is valid), but personally I think this is error-prone as hell.
> >> 
> >>> If I go by your code above, after returning from above,
> >>> check for return value for successful read
> >>> and then check the respective bit set(SR_*). ?
> >> 
> >> Yes, you will be checking the bit in SR only if you are sure the
> >> value is valid.
> > 
> > hmm..alrite I will do the cleanup and send v2.
> 
> I think it will be better to take the above recommended cleanup as a
> seperate patch
> on top of $subject patch?

Separate patch is OK, but I think it's better to put it before this series to 
not spread this bad practice further.

Again, I will wave at Brian to stop my possible misguidance ASAP here.
