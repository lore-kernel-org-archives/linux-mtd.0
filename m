Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5r5L-0004H0-Ss
 for linux-mtd@lists.infradead.org; Sat, 12 Jul 2014 06:47:04 +0000
Received: by mail-pd0-f180.google.com with SMTP id y13so280249pdi.11
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2014 23:46:42 -0700 (PDT)
Date: Fri, 11 Jul 2014 23:46:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bean Huo <beanhuo@outlook.com>
Subject: Re: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error
Message-ID: <20140712064639.GD23883@brian-ubuntu>
References: <BLU185-W2144FD57B7B7D8B8C90EB4A60F0@phx.gbl>
 <CAOY=C6HaXPrEGPSzEUb5XM79SdqTSGwMPmQXq3U7abNvW0SuQA@mail.gmail.com>
 <BLU185-W959F702F780985563AD7C0A60E0@phx.gbl>
 <CAOY=C6GcNzvBieUVm1pk4XQipxj3U9N1Dw09JEM6ZdW7jJLjcA@mail.gmail.com>
 <BLU185-W92FA6A378C0039524F045FA60E0@phx.gbl>
 <CAOY=C6FG8fgZGKhXvXG03hQQNSOYz+=uqrfYmNXfHKkz4XRSog@mail.gmail.com>
 <BLU185-W73A028C46FBD1D13672BC0A6090@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLU185-W73A028C46FBD1D13672BC0A6090@phx.gbl>
Cc: "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Stijn Devriendt <highguy@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Linux-MTD

Please do not remove the MTD mailing list from your email. I am much
more likely to ignore it that way.

Also, please don't top post. I'm top-posting right now, because I can't
understand your thread very easily, and it's hard to resurrect for
sending to the mailing list anyway.

Regarding Stijn's comments: if you have good reason to believe that some
flash's CFI parameter will be non-zero, but incorrect, then perhaps you
could enforce a minimum value.

Brian

On Fri, Jul 11, 2014 at 12:18:40AM +0000, Bean Huo wrote:
> hi,Brian Norris
>     are you a maintainer of MTD? please help me and please give me a result,thanks!
> 
> ________________________________
> > Date: Thu, 10 Jul 2014 11:53:50 +0200 
> > Subject: Re: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error 
> > From: highguy@gmail.com 
> > To: beanhuo@outlook.com 
> > CC: dwmw2@infradead.org; computersforpeace@gmail.com; 
> > paul.gortmaker@windriver.com 
> > 
> > On 10/07/2014 10:53, Bean Huo wrote: 
> > 
> > hi, 
> > thanks for your response! 
> > please look at the file cfi_cmdset_0001.c,It also use timeout value of CFI. 
> > But the difference with my patch is that if timeout value is not defined in the CFI,the default timeout value is 500000us. 
> > Do you mean that the default timeout value extend moure than 2MS? 
> > 
> > if (cfi->cfiq->BufWriteTimeoutTyp && 
> > cfi->cfiq->BufWriteTimeoutMax) 
> > cfi->chips[i].buffer_write_time_max = 
> > 1<<(cfi->cfiq->BufWriteTimeoutTyp + 
> > cfi->cfiq->BufWriteTimeoutMax); 
> > 
> > 
> > Good question. I don't think I can answer that one. Perhaps one of the MTD 
> > maintainers can. 
> > 
> > Regards, 
> > Stijn 
> > 
> > ________________________________ 
> > 
> > 
> > Date: Thu, 10 Jul 2014 08:33:16 +0200 
> > Subject: Re: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error 
> > From: highguy@gmail.com<mailto:highguy@gmail.com> 
> > To: beanhuo@outlook.com<mailto:beanhuo@outlook.com> 
> > CC: dwmw2@infradead.org<mailto:dwmw2@infradead.org>; computersforpeace@gmail.com<mailto:computersforpeace@gmail.com>; 
> > paul.gortmaker@windriver.com<mailto:paul.gortmaker@windriver.com> 
> > 
> > 
> > On Thu, Jul 10, 2014 at 4:22 AM, Bean Huo 
> > <beanhuo@outlook.com<mailto:beanhuo@outlook.com><mailto:beanhuo@outlook.com><mailto:beanhuo@outlook.com>> wrote: 
> > 
> > hi,Stijn 
> > please see below about my answer: 
> > 
> > 
> > ________________________________ 
> > 
> > 
> > Date: Wed, 9 Jul 2014 10:03:02 +0200 
> > Subject: Re: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error 
> > From: highguy@gmail.com<mailto:highguy@gmail.com><mailto:highguy@gmail.com><mailto:highguy@gmail.com> 
> > To: beanhuo@outlook.com<mailto:beanhuo@outlook.com><mailto:beanhuo@outlook.com><mailto:beanhuo@outlook.com> 
> > CC: dwmw2@infradead.org<mailto:dwmw2@infradead.org><mailto:dwmw2@infradead.org><mailto:dwmw2@infradead.org>; 
> > 
> > 
> > computersforpeace@gmail.com<mailto:computersforpeace@gmail.com><mailto:computersforpeace@gmail.com><mailto:computersforpeace@gmail.com>; 
> > 
> > 
> > paul.gortmaker@windriver.com<mailto:paul.gortmaker@windriver.com><mailto:paul.gortmaker@windriver.com><mailto:paul.gortmaker@windriver.com> 
> > 
> > Hi Bean, 
> > 
> > If I'm not mistaken the 2ms was also there because manufacturers 
> > 
> > 
> > don't always 
> > 
> > 
> > fill out the CFI data properly. I've seen incorrect values for other 
> > fields, so I'd be 
> > hesitant to trust the data. 
> > 
> > My proposition would be 3-fold: 
> > - first read the data from CFI 
> > 
> > 
> > this has been done in my patch.timeout value will be firstly pre-read 
> > from CFI. 
> > 
> > 
> > 
> > - use the value max(value, 2ms) 
> > 
> > 
> > in my patch,if CFI don't exsit this area value,and do_write_buffer max 
> > timeout will still be 2Ms 
> > 
> > 
> > But now you risk breaking flashes with incorrect timeout value <2ms. 
> > Those flashes would have 
> > worked fine, but by using the incorrect CFI value now, they'll silently 
> > break. 
> > 
> > 
> > 
> > - perhaps an override list (aka shame-the-mfr-list) for those flashes 
> > with known incorrect values 
> > 
> > 
> > I think,your worry is completely unnecessary,if flash with incorrect 
> > values ih this area, 
> > this is related to the quality of the flash,not the linux kernel.But,on 
> > the contrary,if forsome flashes with correct timeout 
> > value(because the size of the buffer program has been increased from 
> > 256 Bytes to 512 Bytes,timeout value is greater than 2MS) 
> > in this area,and we now still use default max timeout 
> > 2Ms,sometimes,this will lead to buffer-write operation failed.I have 
> > found this case 
> > in some flashes,also for this reason,I now submit this patch. 
> > 
> > 
> > If flashes have incorrect values, then this IS a worry for the linux kernel. 
> > People don't stop using these flashes because the CFI values are faulty, they 
> > expect S/W to workaround it. That is what the kernel has done until now. 
> > Have a look at the file pci-quirks.c. A whole file dedicated to fixing up 
> > crappy hardware. It's the kernel's job to make things work, no 
> > questions asked. 
> > (although we get to shame the vendors in public). 
> > 
> > Regards, 
> > Stijn 
> > 
> > 
> > 
> > You could probably implement 1&2 with almost no hassle, 3 would probably be 
> > for the first flash that has incorrect values (and needs over 2ms timeout). 
> > 
> > Regards, 
> > Stijn 
> > 
> > 
> > 
> >  		 	   		  
