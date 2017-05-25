Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFLl7-00054i-0l
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 14:35:03 +0000
Date: Thu, 25 May 2017 14:16:43 +0900
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Gustavo Padovan <gustavo@padovan.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, Sumit Semwal
 <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 20/29] sync_file.txt: standardize document format
Message-ID: <20170525141604.3b7cac94@vela.lan>
In-Reply-To: <20170525013636.GB16058@jade>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <e781f61e582e7c7eb5de456608043aff9fe2b2b5.1495157082.git.mchehab@s-opensource.com>
 <20170525013636.GB16058@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Wed, 24 May 2017 22:36:36 -0300
Gustavo Padovan <gustavo@padovan.org> escreveu:

> Hi Mauro,
> 
> 2017-05-18 Mauro Carvalho Chehab <mchehab@s-opensource.com>:
> 
> > Each text file under Documentation follows a different
> > format. Some doesn't even have titles!
> > 
> > Change its representation to follow the adopted standard,
> > using ReST markups for it to be parseable by Sphinx:
> > - Use markup for document title and authorship;
> > - Mark literal blocks;
> > - Use a numbered list for references.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > ---
> >  Documentation/sync_file.txt | 23 +++++++++++++----------
> >  1 file changed, 13 insertions(+), 10 deletions(-)  
> 
> We went ahead and applied this to drm-misc-next. Thanks.

OK!

Thanks!
Mauro
