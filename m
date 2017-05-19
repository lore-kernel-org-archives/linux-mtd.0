Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBj3X-0002kO-OK
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 14:39:05 +0000
Date: Fri, 19 May 2017 23:38:27 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, Ananth N
 Mavinakayanahalli <ananth@linux.vnet.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 11/30] kprobes.txt: standardize document format
Message-Id: <20170519233827.3bd5d632420bc5a4ce70f85d@kernel.org>
In-Reply-To: <93a4ddafd210f3e0acd622a24d983614cf581c82.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
 <93a4ddafd210f3e0acd622a24d983614cf581c82.1495156975.git.mchehab@s-opensource.com>
Mime-Version: 1.0
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

On Thu, 18 May 2017 22:24:03 -0300
Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:

> Each text file under Documentation follows a different
> format. Some doesn't even have titles!
> 
> Change its representation to follow the adopted standard,
> using ReST markups for it to be parseable by Sphinx:
> 
> - comment the contents;
> - add proper markups for titles;
> - mark literal blocks as such;
> - use :Author: for authorship;
> - use the right markups for footnotes;
> - escape some literals that would otherwise cause problems;
> - fix identation and add blank lines where needed.

OK, it seems good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

By the way, there are some words which referes other section
in this document, should it also be updated according to
Sphinx format?

e.g.
[snip]
> @@ -53,7 +59,8 @@ a post_handler, and how to use the maxactive and nmissed fields of
>  a kretprobe.  But if you're in a hurry to start using Kprobes, you
>  can skip ahead to section 2.

here, it refers "section 2".

Thank you,


-- 
Masami Hiramatsu <mhiramat@kernel.org>
