Received: from fk-out-0910.google.com ([209.85.128.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1INa13-0003PJ-JZ
	for linux-mtd@lists.infradead.org; Tue, 21 Aug 2007 16:07:54 -0400
Received: by fk-out-0910.google.com with SMTP id 19so2769462fkr
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Aug 2007 13:07:51 -0700 (PDT)
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Magic Panel (SH3-DSP board) MTD mapping
Date: Tue, 21 Aug 2007 22:12:00 +0200
References: <200708200837.08856.super.firetwister@gmail.com>
	<1187595327.3137.3.camel@shinybook.infradead.org>
In-Reply-To: <1187595327.3137.3.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708212212.01245.super.firetwister@gmail.com>
From: Markus Brunner <super.firetwister@googlemail.com>
Cc: Mark Jonas <toertel@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 20 August 2007, David Woodhouse wrote:
> On Mon, 2007-08-20 at 08:37 +0200, Markus Brunner wrote:
> > this adds a MTD mapping for the onboard NOR flash on the Magic Panel
> > R2. The mapping module is based on the solutionengine mapping module.
> >
> > How are the chances for inclusion in 2.6.24?
>
> Looks like you should be able to use a platform_device for this.

Yes. I should have looked outside arch/sh/, too. 
I'm just a bit confused why the solutionengine mapping isn't done there.
