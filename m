Received: from mail-oa0-x229.google.com ([2607:f8b0:4003:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgITJ-0006n0-BL
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 18:13:54 +0000
Received: by mail-oa0-f41.google.com with SMTP id g12so5786232oah.14
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 10:13:30 -0800 (PST)
Date: Tue, 12 Nov 2013 10:13:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
Message-ID: <20131112181324.GK20061@ld-irv-0074.broadcom.com>
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <526FEC7D.6060403@ti.com> <526FFFA0.8040800@ti.com>
 <201310301111.54613.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201310301111.54613.marex@denx.de>
Cc: Sourav Poddar <sourav.poddar@ti.com>, linux-mtd@lists.infradead.org,
 balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 30, 2013 at 11:11:54AM +0100, Marek Vasut wrote:
> Dear Sourav Poddar,
> 
> > On Tuesday 29 October 2013 10:42 PM, Sourav Poddar wrote:
> > > On Tuesday 29 October 2013 10:38 PM, Marek Vasut wrote:
> > >> Dear Sourav Poddar,
> > >> 
> > >>> On Tuesday 29 October 2013 08:57 PM, Marek Vasut wrote:
> > >>>> Dear Sourav Poddar,
> > >>>> 
> > >>>>> Dear Marek Vasut,
> > >>>>> 
> > >>>>> On Tuesday 29 October 2013 07:31 PM, Marek Vasut wrote:
> > >>>>>> Dear Sourav Poddar,
> > >>>>>> 
> > >>>>>>> Hi,
> > >>>>>>> 
> > >>>>>>> On Sunday 27 October 2013 10:15 PM, Marek Vasut wrote:
> > >>>>>>>> Dear Sourav Poddar,
> > >>>>>>>> 
> > >>>>>>>> [...]
> > >>>>>>>> 
> > >>>>>>>>> +static int macronix_quad_enable(struct m25p *flash)
> > >>>>>>>>> +{
> > >>>>>>>>> +    int ret, val;
> > >>>>>>>>> +    u8 cmd[2];
> > >>>>>>>>> +    cmd[0] = OPCODE_WRSR;
> > >>>>>>>>> +
> > >>>>>>>>> +    val = read_sr(flash);
> > >>>>>>>>> +    cmd[1] = val | SR_QUAD_EN_MX;
> > >>>>>>>>> +    write_enable(flash);
> > >>>>>>>>> +
> > >>>>>>>>> +    spi_write(flash->spi,&cmd, 2);
> > >>>>>>>>> +
> > >>>>>>>>> +    if (wait_till_ready(flash))
> > >>>>>>>>> +        return 1;
> > >>>>>>>>> +
> > >>>>>>>>> +    ret = read_sr(flash);
> > >>>>>>>> 
> > >>>>>>>> Maybe read_sr() and read_cr() shall be fixed to return retval only
> > >>>>>>>> and the val shall be passed to them as an argument pointer?
> > >>>>>>>> Aka. ret
> > >>>>>>>> = read_sr(flash,&val);
> > >>>>>>>> 
> > >>>>>>>> That way, this dangerous construct below could become:
> > >>>>>>>> 
> > >>>>>>>> if (!(val&     SR_....)) {
> > >>>>>>>> 
> > >>>>>>>>     dev_err();
> > >>>>>>>>     ret = -EINVAL;
> > >>>>>>>> 
> > >>>>>>>> }
> > >>>>>>>> 
> > >>>>>>>> return ret;
> > >>>>>>> 
> > >>>>>>> I was trying to work on it and realise, we dont need to pass val
> > >>>>>>> directly. We can continue returning the val and can still
> > >>>>>>> cleanup the
> > >>>>>>> below code as u suggetsed above.
> > >>>>>>> if (!(ret&    SR_....)) {
> > >>>>>>> 
> > >>>>>>>         dev_err();
> > >>>>>>>         ret = -EINVAL;
> > >>>>>>> 
> > >>>>>>> }
> > >>>>>> 
> > >>>>>> Uh oh, no. This doesn't seem right. I'd like to be able to clearly
> > >>>>>> check if the function failed to read the register altogether OR if
> > >>>>>> not, check the returned value of the register. Mixing these two
> > >>>>>> together won't do us good. But maybe I just fail to understand your
> > >>>>>> proposal, if so, then I appologize.
> > >>>>> 
> > >>>>> Yes, what I am trying to propose is to eliminate the return error
> > >>>>> check.
> > >>>> 
> > >>>> But we want to be able to check if there is a failure :)
> > >>>> 
> > >>>>> The check whether register read has happened correctly is embedded in
> > >>>>> read_sr/read_cr function itself.
> > >>>>> 
> > >>>>>            if (retval<   0) {
> > >>>>>            
> > >>>>>                    dev_err(&flash->spi->dev, "error %d reading SR\n",
> > >>>>>                    
> > >>>>>                                    (int) retval);
> > >>>>>                    
> > >>>>>                    return retval;
> > >>>>>            
> > >>>>>            }
> > >>>>> 
> > >>>>> Same goes for read_cr.
> > >>>>> So, if the above condition is not hit, we simply return the read
> > >>>>> value
> > >>>>> and check it with the respective bits.
> > >>>> 
> > >>>> Look here:
> > >>>>    107 static int read_sr(struct m25p *flash)
> > >>>>    108 {
> > >>>>    109         ssize_t retval;
> > >>>>    110         u8 code = OPCODE_RDSR;
> > >>>>    111         u8 val;
> > >>>>    112
> > >>>>    113         retval = spi_write_then_read(flash->spi,&code,
> > >>>> 
> > >>>> 1,&val, 1);
> > >>>> 
> > >>>>    114
> > >>>>    115         if (retval<   0) {
> > >>>>    116                 dev_err(&flash->spi->dev, "error %d reading
> > >>>> 
> > >>>> SR\n",
> > >>>> 
> > >>>>    117                                 (int) retval);
> > >>>>    118                 return retval;
> > >>>> 
> > >>>> here you return error value IFF spi_write_then_read() fails for some
> > >>>> reason.
> > >>>> 
> > >>>>    119         }
> > >>>>    120
> > >>>>    121         return val;
> > >>>> 
> > >>>> here you return actual value of the register.
> > >>>> 
> > >>>>    122 }
> > >>>> 
> > >>>> This is how I'd change the function to make it less error-prone:
> > >>>> 
> > >>>> *107 static int read_sr(struct m25p *flash, u8 *rval)
> > >>>> 
> > >>>>    108 {
> > >>>>    109         ssize_t retval;
> > >>>>    110         u8 code = OPCODE_RDSR;
> > >>>>    111         u8 val;
> > >>>>    112
> > >>>>    113         retval = spi_write_then_read(flash->spi,&code,
> > >>>> 
> > >>>> 1,&val, 1);
> > >>>> 
> > >>>>    114
> > >>>>    115         if (retval<   0) {
> > >>>>    116                 dev_err(&flash->spi->dev, "error %d reading
> > >>>> 
> > >>>> SR\n",
> > >>>> 
> > >>>>    117                                 (int) retval);
> > >>>>    118                 return retval;
> > >>>>    119         }
> > >>>> 
> > >>>> *120         *rval = val;
> > >>>> *121         return 0;
> > >>>> 
> > >>>>    122 }
> > >>>> 
> > >>>> This way, you can check if the SPI read failed and if so, handle it in
> > >>>> some way. The return value would only be valid if this function
> > >>>> returned
> > >>>> 0.
> > >>> 
> > >>> I got this, but do you think its necessary to have two checks for
> > >>> verifying
> > >>> whether read passed. ?
> > >> 
> > >> Yes of course it is necessary, how else would you be able to tell if
> > >> the value
> > >> is valid ? Sure, you can depend on negative integer here and on the
> > >> fact that
> > >> the u8 will never be 32-bits wide (to produce a negative integer when
> > >> the return
> > >> value is valid), but personally I think this is error-prone as hell.
> > >> 
> > >>> If I go by your code above, after returning from above,
> > >>> check for return value for successful read
> > >>> and then check the respective bit set(SR_*). ?
> > >> 
> > >> Yes, you will be checking the bit in SR only if you are sure the
> > >> value is valid.
> > > 
> > > hmm..alrite I will do the cleanup and send v2.
> > 
> > I think it will be better to take the above recommended cleanup as a
> > seperate patch
> > on top of $subject patch?
> 
> Separate patch is OK, but I think it's better to put it before this series to 
> not spread this bad practice further.
> 
> Again, I will wave at Brian to stop my possible misguidance ASAP here.

Wow, I have to apologize for my lack of attention span (and more
importantly, lack of clear organizational skills for managing a large
inbox). I missed Marek's pleas for help here, and only noticed after I
came to clean out the old versions of Sourav's patch.

I'm not entirely convinced that the "negative means error; positive
means return value" construct needs changed. I've seen that in a few
other APIs, and it's worked OK (e.g., the mtd->_read() API, where a
driver can return 'max bitflips' as a non-negative integer, or negative
for an error). Of course, this case is slightly different, as we return
a full status register. But I think the guarantee that the status is 8
bits gives us headroom to make sure the positive and negative cases
cannot clash.

But now that I'm noticing your request here... I think the existing
style of checks separates the error and success case clearly (in
wait_till_ready()):

  if ((sr = read_sr(flash)) < 0)
  	break;
  else if (!(sr & SR_WIP))
  	return 0;

Where Sourav's code chooses brevity while sacrificing clarity:

  ret = read_sr(flash);
  if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
  	dev_err(&flash->spi->dev,
  	        "Macronix Quad bit not set");
  	return -EINVAL;
  }

It'd be clearer to say:

  ret = read_sr(flash);
  if (ret < 0)
	return ret;
  else if (!(ret & SR_QUAD_EN_MX)) {
  	dev_err(&flash->spi->dev, "Macronix Quad bit not set\n");
	return -EINVAL; /* Probably -EIO? */
  }

Feel free to follow up with a patch if you'd like.

Brian
