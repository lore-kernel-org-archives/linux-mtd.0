Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTNI6-0002ge-VF
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2018 08:07:35 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, marek.vasut@gmail.com,
 dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, thomas.petazzoni@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH 2/2] ubi: introduce ubi.nocheck parameter to skip CRC
 check when attaching ubi vol
Date: Thu, 14 Jun 2018 10:07:14 +0200
Message-ID: <4831753.6lg8f61FNt@blindfold>
In-Reply-To: <20180614100436.40741c67@bbrezillon>
References: <95e04a201ac4ef82e68ce8e0c4f548b193e51b55.1524214122.git-series.quentin.schulz@bootlin.com>
 <1588647.N1yrutfcI7@blindfold> <20180614100436.40741c67@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 14. Juni 2018, 10:04:36 CEST schrieb Boris Brezillon:
> On Thu, 14 Jun 2018 09:29:42 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
> > Quentin,
> > 
> > Am Montag, 11. Juni 2018, 12:20:37 CEST schrieb Quentin Schulz:
> > > If we go for a per-image flag, adding nocheck to the ioctl makes sense,
> > > otherwise we have to find a way to select only one or more volumes for
> > > which the nocheck flag should be set. That being said, I'm not sure a
> > > per-image flag is the way we want to go.
> > > 
> > > What are your thoughts on this?  
> > 
> > I like that approach a lot more, please send a patch. :-)
> 
> I don't think the approach you're talking about has been mentioned by
> Quentin in this email :-). To clarify the discussion, we're talking
> about adding a new flag to VTBL entries telling whether the CRC should
> be skipped or not.

Hehe yes. Too many discussions on and off-list in parallel. ;)

Thanks,
//richard
