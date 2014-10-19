Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfxyO-0000oC-7v
 for linux-mtd@lists.infradead.org; Sun, 19 Oct 2014 21:25:09 +0000
Received: by mail-wi0-f176.google.com with SMTP id hi2so5638867wib.3
 for <linux-mtd@lists.infradead.org>; Sun, 19 Oct 2014 14:24:45 -0700 (PDT)
Date: Sun, 19 Oct 2014 23:24:43 +0200
From: Frans Klaver <fransklaver@gmail.com>
To: Alexander Holler <holler@ahsoftware.de>
Subject: Re: [PATCH 00/27] Fix common bug in most nand drivers not showing a
 device in sysfs
Message-ID: <20141019212443.GA9322@gmail.com>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <543F678E.1030401@ahsoftware.de>
 <CAH6sp9O=36FTGg4FTCywsNzdJi4PjUmiiT6_EHr=i166+NA2ng@mail.gmail.com>
 <54413B9B.9030702@ahsoftware.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54413B9B.9030702@ahsoftware.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2014 at 05:54:03PM +0200, Alexander Holler wrote:
> I assume the result will be just 21 one-line-patches anyway, missing
> the chance to avoid similiar silly patch series in the future by
> creating a common function (which even reduces code size over all).

That's to be expected, yes. A single patch may even be defensible. I
share your concern that it's easier to get it wrong than it is to get it
right, though.

> So, if you like, just add my Signed-off-by too, there isn't really much
> one could do wrong. ;)

Sure.

Frans
