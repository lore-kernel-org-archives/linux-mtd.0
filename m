Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8ZMz-0006Q0-CT
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2011 14:42:37 +0000
Received: by mail-ew0-f49.google.com with SMTP id 3so1453614ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Apr 2011 07:42:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd-utils: improve simple_strtoX usage commentary
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <BANLkTi=NSasDOP=xSxD3zxQNCQEOc1dV6w@mail.gmail.com>
References: <1302275249-11962-1-git-send-email-dedekind1@gmail.com>
	<BANLkTi=NSasDOP=xSxD3zxQNCQEOc1dV6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 09 Apr 2011 17:39:50 +0300
Message-ID: <1302359990.2787.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-08 at 12:20 -0400, Mike Frysinger wrote:
> On Fri, Apr 8, 2011 at 11:07, Artem Bityutskiy wrote:
> > + * num = simple_strtoul(str, &error);
> > + * if (error || !is_valid_number(num))
> > + *     error_happened();
> 
> when i read this, it makes me think there is a "is_valid_number()"
> function i should be calling.
> 
> maybe something like:
> if (error || ... number is out of range for your need ...)
> -mike

I'll do this and push this out, thanks for review!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
