Received: from ms.lwn.net ([45.79.88.28])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBPC5-0000JR-3Z
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 17:26:34 +0000
Date: Thu, 18 May 2017 11:26:08 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/53] Get rid of Docbook
Message-ID: <20170518112608.4f355068@lwn.net>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 May 2017 09:15:52 -0300
Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:

> This patch series convert the remaining DocBooks to ReST.

Gotta love this:

>  124 files changed, 7469 insertions(+), 10511 deletions(-)

I've just pulled the whole set from your experimental.git repo.  There are
certainly a few rough edges, but that means it will fit into the rest of
the docs just fine :)

There are a few loose ends, but, rather than complaining about them, I'll
just see what's to be done about them.

Thanks for pushing this through, this is a nice milestone.

jon
