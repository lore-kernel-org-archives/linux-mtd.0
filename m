Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWiQZ-0001jl-19
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 04:09:36 +0000
Received: by fxm3 with SMTP id 3so170031fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jul 2010 21:09:33 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: formatting of odd-sized OOB in nanddump
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C34C5C6.7010008@broadcom.com>
References: <1276706527-4563-1-git-send-email-norris@broadcom.com>
	<1278511674.12733.18.camel@localhost> <4C34C5C6.7010008@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jul 2010 07:09:29 +0300
Message-Id: <1278562169.7365.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2010-07-07 at 11:21 -0700, Brian Norris wrote:
> > Why 10 bytes, why not 12 or 14?
> 
> As of now, the only OOB-size that's not a multiple of 16 supported in 
> the other bits of ugly code is 218-bytes.
> 
> 218 % 16 = 10
> 
> What's the point of checking for a "supported" page-size/OOB-size 
> earlier if we're not gonna use that info? :)

No point, as well as not much point introducing magic hard-coded
constant like 10 - the printing should be generic.
> 
> > I think it is better to just copy-paste-modify the kernel
> > print_hex_dump() and utilize it, instead of this ugly crocodile code ...
> 
> I'm looking at that, since it seems a better solution. Does anyone 
> oppose including ASCII output in the "pretty" option? It's built in to 
> the print_hex_dump() already, so it shouldn't be too difficult to adapt. 
> Anyway, it seems that someone intended to print ASCII at some point 
> (nanddump.c, line 77):
> 
> static bool             pretty_print = false;   // print nice in ascii

Well, it is better to make this configurable or not print ASCII, IMO,
because it potentially may break scripts which use nanddump.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
