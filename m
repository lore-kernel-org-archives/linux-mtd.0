Received: from s3.sipsolutions.net ([2a01:4f8:190:3424::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBfuF-0006gq-VZ
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 11:17:18 +0000
Message-ID: <1495192604.3274.5.camel@sipsolutions.net>
Subject: Re: [PATCH 08/29] rfkill.txt: standardize document format
From: Johannes Berg <johannes@sipsolutions.net>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>,  linux-mtd@lists.infradead.org,
 linux-wireless@vger.kernel.org
Date: Fri, 19 May 2017 13:16:44 +0200
In-Reply-To: <20170519081117.6da0a699@vento.lan>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <3361dce0e96427ed8fc375ab78371c0a6d0f55cc.1495157082.git.mchehab@s-opensource.com>
 <1495188901.3274.0.camel@sipsolutions.net>
 <20170519081117.6da0a699@vento.lan>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2017-05-19 at 08:11 -0300, Mauro Carvalho Chehab wrote:
> 
> Yes, it should work. Actually, you would need to use :depth: 2 to
> produce this output:
> 
> 
> 	Contents
> 
> 	    . rfkill - RF kill switch support
> 	        . Introduction
> 	        . Implementation details
> 	        . Kernel API
> 	        . Userspace support

Sounds good to me.

> I opted to keep the contents as a comment just because, in the past,
> some maintainers complained about TOC removal, arguing that it makes
> harder for the ones that would be reading the file in ascii.

Ok. I don't really care much either way, I guess. The file is short
enough that the TOC isn't all that important to start with.

johannes
