Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FP0ZR-00068U-LY
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 12:04:55 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0603300856x11b5557fk811737263625d8db@mail.gmail.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<1143714902.3579.31.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603301119220.14923@localhost.localdomain>
	<1143736739.3579.50.camel@sauron.oktetlabs.ru>
	<6934efce0603300856x11b5557fk811737263625d8db@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 30 Mar 2006 21:03:54 +0400
Message-Id: <1143738234.3579.53.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, Nicolas Pitre <nico@cam.org>,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-03-30 at 08:56 -0800, Jared Hulbert wrote:
> Most high performance NOR today have a buffered write mode to get
> decent write speed.  This requires you write a bunch of words to the
> chips write buffer and then tell it to program.  See
> cfi_ident.MaxBufWriteSize in cfi.h.

Ah, ok, thanks. Yeah, id does matter. The question though is how to
represent this in a generic way...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
