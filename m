Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zljpj-0007NK-Mo
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 20:36:36 +0000
Received: by wicge5 with SMTP id ge5so31707837wic.0
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 13:36:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151012203101.GM107187@google.com>
References: <20151009221537.32203.5867.stgit@dwillia2-desk3.jf.intel.com>
 <20151009221651.32203.63446.stgit@dwillia2-desk3.jf.intel.com>
 <20151012175803.GL107187@google.com>
 <20151012203101.GM107187@google.com>
Date: Mon, 12 Oct 2015 13:36:13 -0700
Message-ID: <CAPcyv4jBaM4jASAgY6O1if+LbYW7TdFBkMt8ZDATL7wrE7LUEQ@mail.gmail.com>
Subject: Re: [PATCH 14/20] pxa2xx-flash: switch from ioremap_cache to memremap
From: Dan Williams <dan.j.williams@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arch@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 12, 2015 at 1:31 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Oct 12, 2015 at 10:58:03AM -0700, Brian Norris wrote:
>> You missed linux-mtd again. Please use scripts/get_maintainer.pl next
>> time to at least get the relevant mailing list(s). (The individual CC's
>> are not always necessary, but the subsystem lists definitely are.)
>
> Anyway, pushed to l2-mtd.git.
>

Thanks Brian, I'll watch out for that next time.
