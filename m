Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REihx-00064T-1x
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:25:57 +0000
Received: by wwf10 with SMTP id 10so1739492wwf.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 07:25:52 -0700 (PDT)
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Fri, 14 Oct 2011 17:25:21 +0300
In-Reply-To: <20111014142149.GA25079@totoro>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
	<1318600108.12351.130.camel@sauron> <20111014142149.GA25079@totoro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318602329.12351.143.camel@sauron>
Mime-Version: 1.0
Cc: Grant Likely <grant.likely@secretlab.ca>,
	Scott Wood <scottwood@freescale.com>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-10-14 at 15:21 +0100, Jamie Iles wrote:
> > the top of my head, it is logical when things go like this: I have a
> > kernel with working platform data, but I can change that dynamically by
> > feeding it a device tree configuration. Hmm?
> 
> I think in general platform data and device tree should be mutually 
> exclusive.

OK, but would you please confirm this by pointing to some docs or
discussions, or may be people from devicetree-discuss@lists.ozlabs.org
could confirm that?

-- 
Best Regards,
Artem Bityutskiy
