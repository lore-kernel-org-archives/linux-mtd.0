Received: from wx-out-0506.google.com ([66.249.82.229])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IPQJL-0004fQ-Cu
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 18:10:25 -0400
Received: by wx-out-0506.google.com with SMTP id s7so1279339wxc
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Aug 2007 15:10:17 -0700 (PDT)
Message-ID: <9a8748490708261510u6f373d2s760bef86e81bbe02@mail.gmail.com>
Date: Mon, 27 Aug 2007 00:10:17 +0200
From: "Jesper Juhl" <jesper.juhl@gmail.com>
To: "Jan Engelhardt" <jengelh@computergmbh.de>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <Pine.LNX.4.64.0708261635080.15614@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<9a8748490708251728h51d51092r11a3562ceb63b2f9@mail.gmail.com>
	<Pine.LNX.4.64.0708252021070.8721@localhost.localdomain>
	<200708261528.56250.vda.linux@googlemail.com>
	<Pine.LNX.4.64.0708261635080.15614@fbirervta.pbzchgretzou.qr>
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	"Robert P. J. Day" <rpjday@mindspring.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26/08/07, Jan Engelhardt <jengelh@computergmbh.de> wrote:
>
> On Aug 26 2007 15:28, Denys Vlasenko wrote:
> >> >
> >> > What exactely would using kcalloc() over kzalloc() here buy us?
> >>
> >> technically, nothing.
> >
> >The idea of calloc is that it can check for underflow in parameter.
>
> Actually, overflow.
>
> calloc(0xFFFF0000,  0x1000) => will return NULL
> malloc(0xFFFF0000 * 0x1000) => silent 32 bit multiplication/truncation,
> will allocate less than requested.
>
> >calloc(-1, 10000000) => easy to detect
> >malloc(-1 * 10000000) => malloc(-10000000) => not so trivial
>
Ok, that makes a bit of sense. Thank you.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
