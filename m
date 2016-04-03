Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ambW0-0000GI-3l
 for linux-mtd@lists.infradead.org; Sun, 03 Apr 2016 06:28:04 +0000
Received: by mail-pf0-x231.google.com with SMTP id n1so16295003pfn.2
 for <linux-mtd@lists.infradead.org>; Sat, 02 Apr 2016 23:27:43 -0700 (PDT)
Date: Sat, 2 Apr 2016 23:27:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Binderman <dcb314@hotmail.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: linux-next/include/linux/mtd/pfow.h: possible poor sequence of
 conditionals ?
Message-ID: <20160403062740.GA21749@localhost>
References: <DUB128-W1B9618CEFDEE4D2DDF6C89C800@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DUB128-W1B9618CEFDEE4D2DDF6C89C800@phx.gbl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 22, 2016 at 02:49:06PM +0000, David Binderman wrote:
> Hello there,
> 
> > [linux-next/include/linux/mtd/pfow.h:133]: (style) Expression is always false because 'else if' condition matches previous condition at line 130.
> > [linux-next/include/linux/mtd/pfow.h:136]: (style) Expression is always false because 'else if' condition matches previous condition at line 130.
> 
> Source code is
> 
>     if (prog_status & 0x03)
>         printk(KERN_NOTICE"DSR.9,8: (11) Attempt to program invalid "
>                         "half with 41h command\n");
>     else if (prog_status & 0x02)
>         printk(KERN_NOTICE"DSR.9,8: (10) Object Mode Program attempt "
>                     "in region with Control Mode data\n");
>     else if (prog_status &  0x01)
>         printk(KERN_NOTICE"DSR.9,8: (01) Program attempt in region "
>                         "with Object Mode data\n");
> 
> Maybe something like
> 
>     switch (prog_status & 0x03)
>     {
>         case 0x03:
>             printk(); break;
>         case 0x02:
>             printk(); break;
>         case 0x01:
>             printk(); break;
>     }
> 
> might be better code.

I'm not sure if you're aware of this... but this isn't really a style
issue; it's a correctness issue. I believe the original code is wrong.

Feel free to send a patch, especially if you can test it.

Regards,
Brian
