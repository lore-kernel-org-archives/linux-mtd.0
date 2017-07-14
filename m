Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dW9oI-00048K-NA
 for linux-mtd@lists.infradead.org; Fri, 14 Jul 2017 23:15:48 +0000
Received: by mail-it0-x234.google.com with SMTP id k192so32573613ith.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Jul 2017 16:15:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <386A482A-26F9-4C82-871D-E03E9F6401D8@darmarit.de>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <20170518112608.4f355068@lwn.net> <20170518200140.11982b12@vento.lan>
 <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
 <CA+r1ZhhZw6+LOAMbw6=kidPBr2Ntrz0ORGV165DEWuX8haKrWw@mail.gmail.com>
 <386A482A-26F9-4C82-871D-E03E9F6401D8@darmarit.de>
From: Jim Davis <jim.epost@gmail.com>
Date: Fri, 14 Jul 2017 16:15:23 -0700
Message-ID: <CA+r1Zhj6NqnR_Dg+xGiW7==1ZmQW3XBvt0XY9c=gjqssso74Qg@mail.gmail.com>
Subject: Re: [PATCH v2 00/53] Get rid of Docbook
To: Markus Heiser <markus.heiser@darmarit.de>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 "linux-kernel@vger.kernel.org org List" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 6, 2017 at 1:54 AM, Markus Heiser <markus.heiser@darmarit.de> wrote:

>  52b3f23 Docs: clean up some DocBook loose ends

Speaking of minor loose ends,

make SPHINXDIRS=userspace-api pdfdocs

works -- though now that it's all sphinx, wouldn't just DIRS be better? -- and

make DOCBOOKS=userspace-api pdfdocs

still works too.  But that generates all of the pdf files, and not
just the userspace-api.pdf.  And running now-dead targets like "make
ps" or "make sgmldocs" or "make mandocs" just returns with no output.

-- 
Jim
