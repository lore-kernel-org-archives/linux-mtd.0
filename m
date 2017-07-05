Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSs73-0005n3-Is
 for linux-mtd@lists.infradead.org; Wed, 05 Jul 2017 21:45:35 +0000
Received: by mail-it0-x241.google.com with SMTP id 188so15889185itx.0
 for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2017 14:45:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <20170518112608.4f355068@lwn.net> <20170518200140.11982b12@vento.lan>
 <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 5 Jul 2017 14:45:06 -0700
Message-ID: <CA+r1ZhhZw6+LOAMbw6=kidPBr2Ntrz0ORGV165DEWuX8haKrWw@mail.gmail.com>
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

On Fri, Jun 16, 2017 at 7:03 AM, Markus Heiser
<markus.heiser@darmarit.de> wrote:
>

> docproc and some lines in the Makefile & .gitignore
>
> ./scripts/docproc.c
> ./scripts/.docproc.cmd
> ./scripts/Makefile
> ./scripts/.gitignore

With 4.12, running make xmldocs (or any other working target) and then
"make cleandocs; git clean -fdx" turns up

Removing scripts/.check-lc_ctype.cmd
Removing scripts/.docproc.cmd
Removing scripts/basic/.fixdep.cmd
Removing scripts/basic/fixdep
Removing scripts/check-lc_ctype
Removing scripts/docproc

-- 
Jim
