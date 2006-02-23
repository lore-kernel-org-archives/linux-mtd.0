Received: from wproxy.gmail.com ([64.233.184.203])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FC4d5-0000jM-OL
	for linux-mtd@lists.infradead.org; Wed, 22 Feb 2006 19:46:49 -0500
Received: by wproxy.gmail.com with SMTP id 69so265798wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Feb 2006 16:46:43 -0800 (PST)
Message-ID: <f9d2a5e10602221646h240ae399p88c88233e0fb3bb8@mail.gmail.com>
Date: Wed, 22 Feb 2006 17:46:43 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: tglx@linutronix.de
In-Reply-To: <1140337746.2480.682.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43EB96DC.3030900@eptar.com>
	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>
	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>
	<200602161432.17447.manningc2@actrix.gen.nz>
	<1140253826.2480.651.camel@localhost.localdomain>
	<f9d2a5e10602181011k6552d396q4da6daef944a6fff@mail.gmail.com>
	<1140337746.2480.682.camel@localhost.localdomain>
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Depends. The 1bit correction/ 2bit detection Hamming ECC algorithm found
> in the kernel is not too bad, but Reed Solomon is a quite conmputation
> expensive algorithm. Look into the encoder / decoder code in
> lib/reed_solomon.


Do NAND errors tend to clump in sequences of bits (ie, something reed
solomon is paticularly good at)?

> In general you have to iterate over the data buffer and compute on each
> step. The performance penalty depends on the complexitiy of the
> algortihm. If you have enough space in your FPGA then its definitely a
> good idea to put some ECC calculation mechanism into it. There are
> implementations for both ECC and Reed Solomon available.

Care to recommend any?
