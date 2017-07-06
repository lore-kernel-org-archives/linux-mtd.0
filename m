Received: from smtp1-2.goneo.de ([85.220.129.31] helo=smtp1.goneo.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT2gf-0006Ri-7G
 for linux-mtd@lists.infradead.org; Thu, 06 Jul 2017 09:03:03 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v2 00/53] Get rid of Docbook
From: Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <CA+r1ZhhZw6+LOAMbw6=kidPBr2Ntrz0ORGV165DEWuX8haKrWw@mail.gmail.com>
Date: Thu, 6 Jul 2017 10:54:51 +0200
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
Content-Transfer-Encoding: 7bit
Message-Id: <386A482A-26F9-4C82-871D-E03E9F6401D8@darmarit.de>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <20170518112608.4f355068@lwn.net> <20170518200140.11982b12@vento.lan>
 <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
 <CA+r1ZhhZw6+LOAMbw6=kidPBr2Ntrz0ORGV165DEWuX8haKrWw@mail.gmail.com>
To: Jim Davis <jim.epost@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Am 05.07.2017 um 23:45 schrieb Jim Davis <jim.epost@gmail.com>:
> 
> On Fri, Jun 16, 2017 at 7:03 AM, Markus Heiser
> <markus.heiser@darmarit.de> wrote:
>> 
> 
>> docproc and some lines in the Makefile & .gitignore
>> 
>> ./scripts/docproc.c
>> ./scripts/.docproc.cmd
>> ./scripts/Makefile
>> ./scripts/.gitignore
> 
> With 4.12, running make xmldocs (or any other working target) and then
> "make cleandocs; git clean -fdx" turns up
> 
> Removing scripts/.check-lc_ctype.cmd
> Removing scripts/.docproc.cmd
> Removing scripts/basic/.fixdep.cmd
> Removing scripts/basic/fixdep
> Removing scripts/check-lc_ctype
> Removing scripts/docproc

Tried with Jon's docs-next .. only 'fixdep' remains (not part
of Documentation). I guess the docproc & Co. was already fixed
by Jon [1]:

 52b3f23 Docs: clean up some DocBook loose ends

[1] https://www.mail-archive.com/linux-doc@vger.kernel.org/msg13238.html

-- Markus --
