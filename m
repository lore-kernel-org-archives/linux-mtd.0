Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGqgZ-0006xZ-GB
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2018 19:25:20 +0000
Received: by mail-lj1-x243.google.com with SMTP id t22-v6so5711614lji.7
 for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2018 12:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20181019070622.26661-1-linus.walleij@linaro.org>
 <20181019070622.26661-2-linus.walleij@linaro.org>
 <CACRpkda=1CNzZe1ACGm9nwVDGbHdAxhWzpqcANs-KKBhPpNF-w@mail.gmail.com>
 <20181025190825.GA15870@bogus>
In-Reply-To: <20181025190825.GA15870@bogus>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Oct 2018 20:24:52 +0100
Message-ID: <CACRpkdbThqKUTvN294iKad0z4or5FAJioR08b9n5UwbF=hCCDQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: partitions: Add RedBoot FIS DT bindings
To: Rob Herring <robh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Mark Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 25, 2018 at 9:08 PM Rob Herring <robh@kernel.org> wrote:

> It's all fine for me.

Thanks.

> I was only going to comment is Redboot still a thing? :)

Yep. What I've learned recently is that some of the stuff we
support has way longer lifecycles than we expected. There are
brand new devices shipping using the RedBoot partition table
as we speak. It seems to be coming from places like Taiwan.

Yours,
Linus Walleij
