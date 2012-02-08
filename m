Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvF3p-0000JY-33
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 21:28:17 +0000
Received: by ghbg20 with SMTP id g20so583144ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 13:28:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1328260644.13362.1.camel@sauron.fi.intel.com>
References: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
 <1328182404.28171.161.camel@sauron.fi.intel.com>
 <201202021420.18252.brian.foster@maxim-ic.com>
 <1328260644.13362.1.camel@sauron.fi.intel.com>
Date: Wed, 8 Feb 2012 13:28:16 -0800
Message-ID: <CAN8TOE_u0KSWRP9CgW7Jv4vdQKZ8ZfaBZucqcjZgfzcZwXT43A@mail.gmail.com>
Subject: Re: [PATCH 1/2] libmtd: add `mtd_dev_present()' library function
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 3, 2012 at 1:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Ok, I've just prepared the below patch. Compile-tested only. Anyone
> volunteers to verify?

I've tested your patch and it's basically OK, but there are a few
issues with the rest of how libmtd/mtdinfo handles legacy stuff. I'm
sending a separate patch series on top of your patch that solves other
issues (partly fixing up my code and partly fixing up old bugs).

Brian
