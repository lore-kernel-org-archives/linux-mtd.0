Received: from ug-out-1314.google.com ([66.249.92.172])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy6kP-00082E-8p
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 08:45:17 -0400
Received: by ug-out-1314.google.com with SMTP id q2so1738028uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jul 2006 05:44:52 -0700 (PDT)
Message-ID: <625fc13d0607050543p4ab85316vc4d62f30e1ecb571@mail.gmail.com>
Date: Wed, 5 Jul 2006 07:43:05 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 1/1] UBI
In-Reply-To: <1152100017.4825.20.camel@sauron.oktetlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1151408975.16490.12.camel@sauron.oktetlabs.ru>
	<625fc13d0607050436r591a1857m348c8f64cc16e0b1@mail.gmail.com>
	<1152100017.4825.20.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/5/06, Artem B. Bityutskiy <dedekind@infradead.org> wrote:
> Hello Josh,
>
> On Wed, 2006-07-05 at 06:36 -0500, Josh Boyer wrote:
> > Does the range for bad eraseblock reserve really need to be up to 1/2
> > the device?
> Probably no, which digit would you conceive?

Well, most ship from the manufacturer with up to 10% bad.  So taking
that as a starting point, I would claim that 25% bad is enough of a
problem to seriously think of replacing the chip.  However, it's all
arbitrary so I suppose it doesn't matter.

> > Why all the forward declarations of structures in the various header
> > files?  Couldn't this be done by properly including the header files
> > that are needed?
> Well, I deliberately used forward declaration as it is faster then
> including headers just for the sake of getting some structure defined.
>
> Why is it bad? Please, refer a particular example.

It's not particularly bad... it just looks unclean in my opinion.
Certainly not a show-stopper.

josh
