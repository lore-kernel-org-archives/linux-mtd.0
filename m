Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1Iqd3Y-00012n-A3
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 18:14:38 -0500
Date: Sat, 10 Nov 2007 00:05:58 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
Message-ID: <20071109230558.GB23020@lazybastard.org>
References: <162938.6418.qm@web43137.mail.sp1.yahoo.com>
	<alpine.LFD.0.9999.0711091542120.21255@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.0.9999.0711091542120.21255@xanadu.home>
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 November 2007 15:42:39 -0500, Nicolas Pitre wrote:
> 
> It is a _software_ mechanism.

Even the hardware mechanism is controlled by software, so I don't really
see a big difference.  Imo only two questions matter:
1. How hard is it to do what you want?
2. How hard is it to do what you don't want?

Ideally it should be dead easy to do the right thing and nigh'on
impossible to do the wrong.  Making both easy is a bad thing.  Making
both hard is equally bad - users would do anything to disable protection
mechanisms.

So the question is how to use the hardware mechanism in a way that
prevents damage but doesn't become a complete nuisance.  Completely
disabling it is an act of desperation, sure.  If we don't find a better
way, we'd at least want a config option to control this.

Jörn

-- 
You cannot suppose that Moliere ever troubled himself to be original in the
matter of ideas. You cannot suppose that the stories he tells in his plays
have never been told before. They were culled, as you very well know.
-- Andre-Louis Moreau in Scarabouche
