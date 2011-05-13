Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKrYE-0002LO-OJ
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 12:33:04 +0000
Received: by eyh6 with SMTP id 6so818059eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 05:33:01 -0700 (PDT)
Subject: RE: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A694157DD@dekaexchange07.deka.local>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-3-git-send-email-mlcreech@gmail.com>
	<1305198589.2713.97.camel@localhost>
	<1305273513.14423.15.camel@localhost>
	<0A40042D85E7C84DB443060EC44B3FD32A694157DD@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 May 2011 15:29:25 +0300
Message-ID: <1305289765.14423.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Matthew L. Creech" <mlcreech@gmail.com>
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

On Fri, 2011-05-13 at 06:59 -0400, Atlant Schmidt wrote:
> Artem:
> 
>   I don't know what the coding standards are like on
>   your project,

The kenrel standard, described in Documentation/CodingStyle

>  but in very much of the C/C++ developer
>   world, <tab>s are frowned upon in code as being fragile,
>   primarily because there are varying standards for just
>   how wide a <tab> should be.

In the kernel we just stand that it must be 8 spaces.

>  By default, they're 8 spaces,
>   but I've worked at several shops where they are only
>   4 spaces and one shop where they are deemed to be 3!

Well, there were many flamewars about this, but we just assume that
anyone looking at the kernel source code has to setup their editors to
have tab=8 spaces.

>   Because of this, many coding standards (such as the
>   WebKit coding standards and my current employer's
>   standard) outright ban <tab> characters in code and
>   I'd recommend you do so as well, no matter what the
>   current scripts enforce. (It's certainly easy enough
>   to expand all the tabs in an existing code base so
>   as to bring it into compliance with a "no tabs" rule.)

Well, UBIFS is part of the kernel and it follows the kernel coding
style.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
