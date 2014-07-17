Received: from mail-qa0-x230.google.com ([2607:f8b0:400d:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7aKV-0003yY-Tg
 for linux-mtd@lists.infradead.org; Thu, 17 Jul 2014 01:17:53 +0000
Received: by mail-qa0-f48.google.com with SMTP id m5so1333085qaj.21
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2014 18:17:28 -0700 (PDT)
Date: Wed, 16 Jul 2014 18:17:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bean Huo <beanhuo@outlook.com>
Subject: Re: [PATCH v6] mtd:nor:timeout:fix do_write_buffer() timeout error
Message-ID: <20140717011724.GW7537@ld-irv-0074>
References: <BLU436-SMTP223B6F83933407357F0FF3BA6F70@phx.gbl>
 <20140716180423.GV7537@ld-irv-0074>
 <BLU185-W53748517956B27745D7033A6F40@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BLU185-W53748517956B27745D7033A6F40@phx.gbl>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.riesch@omicron.at" <christian.riesch@omicron.at>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 17, 2014 at 12:54:17AM +0000, Bean Huo wrote:
> > I have just fixed up your patch myself, to use max() and to improve some
> > of the language. Let me know if the below works for you.
> 
> hi,Brian
>  Thanks once again.I test and it works Ok.It can be accepted now? 		 	   		  

Yes. Pushed to l2-mtd.git.

Please be more diligent next time to follow CodingStyle and email
submission practices next time. Even if your company email gives
trouble, I'm sure you can find some way to send patches properly. For
instance, a quick search shows me that your outlook.com email supports
sending email via SMTP:

  http://windows.microsoft.com/en-us/windows/outlook/send-receive-from-app

That means you can, for instance, use git-send-email to send patches.

Brian
