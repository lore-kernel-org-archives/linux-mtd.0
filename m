Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6xAP-0007hT-6P
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 07:28:49 +0000
Received: by mail-pd0-f175.google.com with SMTP id v10so6567386pde.6
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2014 00:28:27 -0700 (PDT)
Date: Tue, 15 Jul 2014 00:28:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bean Huo <beanhuo@outlook.com>
Subject: Re: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error
Message-ID: <20140715072823.GH23883@brian-ubuntu>
References: <BLU185-W2144FD57B7B7D8B8C90EB4A60F0@phx.gbl>
 <CAOY=C6HaXPrEGPSzEUb5XM79SdqTSGwMPmQXq3U7abNvW0SuQA@mail.gmail.com>
 <BLU185-W959F702F780985563AD7C0A60E0@phx.gbl>
 <CAOY=C6GcNzvBieUVm1pk4XQipxj3U9N1Dw09JEM6ZdW7jJLjcA@mail.gmail.com>
 <BLU185-W92FA6A378C0039524F045FA60E0@phx.gbl>
 <CAOY=C6FG8fgZGKhXvXG03hQQNSOYz+=uqrfYmNXfHKkz4XRSog@mail.gmail.com>
 <BLU185-W73A028C46FBD1D13672BC0A6090@phx.gbl>
 <20140712064639.GD23883@brian-ubuntu>
 <BLU185-W7188DFB38D0DD264DF6255A6F60@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLU185-W7188DFB38D0DD264DF6255A6F60@phx.gbl>
Cc: "christian.riesch@omicron.at" <christian.riesch@omicron.at>,
 "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stijn Devriendt <highguy@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

On Tue, Jul 15, 2014 at 04:23:44AM +0000, Bean Huo wrote:
> Thanks for your warmly response about my patch.I have been waiting for your message too long.
> It's hard for me to give you a good reason that some flash's CFI parameter is non-zero,and 
> incorrect.I just found that if flash'buffer is 512 bytes,not 256 bytes,timeout error will happen.
> If using CFI's timemout value,that is OK.But for cfi_cmdset_0001.c,it also use timeout value of CFI.
> The difference with mine is that if timeout value is not defined in the CFI,the default maxmum timeout
> value is 500000us.

I understand the points here. But this is just a timeout value, so it
isn't a big issue if it's a little too large; but it's a major problem if
it's too short. Since this is an aged driver, which has to accomodate
all sorts of potentially broken chips, I think a "minimum timeout" is a
good idea. And using the current timeout of 2ms (or larger) is fine. So
in pseudocode:

	if (CFI_time_typ != 0 && CFI_time_max != 0)
		timeout_max = CFI_time_typ + CFI_time_max;
	else
		timeout_max = 0;
	timeout_max = max(timeout_max, 2000);

> Because my company's mailbox title exsits chinese words,and i sent this patch for 
> many times,you don't have one response,so i thought that you maybe couldn't receive my email.later,i
> chose my personal email.

It is reasonable to worry about bounced mail occasionally. If the
mailing list rejected your mail, you should get an automated message.
You can also check the archives soon after sending, to make sure your
mail shows up:

  http://lists.infradead.org/pipermail/linux-mtd/

And for LKML email, you can check one of several archives mirrors, like
lkml.org.

> For this patch,i will do some changes,please every maintainer and commit-signer check. 		 	   		  

Yes, please send a new version (version 4 now?). But please double check
your patch submission, so that it applies correctly this time.

Thanks,
Brian
