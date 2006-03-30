Received: from nproxy.gmail.com ([64.233.182.185])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FP0Y4-0005zn-8U
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 12:03:07 -0500
Received: by nproxy.gmail.com with SMTP id d4so367887nfe
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Mar 2006 09:03:02 -0800 (PST)
Message-ID: <6934efce0603300856x11b5557fk811737263625d8db@mail.gmail.com>
Date: Thu, 30 Mar 2006 08:56:51 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1143736739.3579.50.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<1143714902.3579.31.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0603301119220.14923@localhost.localdomain>
	<1143736739.3579.50.camel@sauron.oktetlabs.ru>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, Nicolas Pitre <nico@cam.org>,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Err, what do you mean by "the NOR write buffer size"?

Most high performance NOR today have a buffered write mode to get
decent write speed.  This requires you write a bunch of words to the
chips write buffer and then tell it to program.  See
cfi_ident.MaxBufWriteSize in cfi.h.
