Received: from mail-pa0-f51.google.com ([209.85.220.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFRJ7-00047V-A4
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 16:44:38 +0000
Received: by mail-pa0-f51.google.com with SMTP id ld10so15581354pab.38
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2014 08:44:12 -0800 (PST)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <20140205141917.GA25091@localhost>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-4-git-send-email-b.brezillon.dev@gmail.com>
 <20140129175331.GA27143@localhost>
 <20140205111500.B19FDC40A89@trevor.secretlab.ca>
 <52F23DF4.7010901@gmail.com> <20140205141917.GA25091@localhost>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 17 Feb 2014 16:43:51 +0000
Message-ID: <CACxGe6vW3m8DA3rGSane6GNmjXHt=pjAPVr25WZyopV9jA-XUw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] of: mtd: add documentation for
 nand-ecc-level property
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 5, 2014 at 2:19 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Hi Grant, Boris:
>
> (BTW, dropped Russell, Rob Landley and some unrelated mailing lists from Cc,
> and added Thomas, Gregory and Rob Herring).
>
> On Wed, Feb 05, 2014 at 02:34:44PM +0100, Boris BREZILLON wrote:
>> On 05/02/2014 12:15, Grant Likely wrote:
>> > On Wed, 29 Jan 2014 14:53:32 -0300, Ezequiel Garcia <ezequiel.garcia@free-electrons.com> wrote:
> [..]
>> >>
>> >> Maybe we can discuss about it now?
>> >>
>> >>    nand-ecc-strength : integer ECC required strength.
>> >>    nand-ecc-size : integer step size associated to the ECC strength.
>> > I'm okay with either, but the above binding is indeed more readable.
>>
>> That's fine by me, if everybody agrees, let's go for the
>> nand-ecc-strength/nand-ecc-size couple then.
>>
>
> Great. So, if some DT dictator^C^Cmaintainers can Ack this binding,
> I can send a new patchset, with pxa3xx-nand using it...
>
>> I'll rebase next version of my series on Ezequiel's patch providing
>> these OF helpers.
>>
>
> ... and then you can base on it?
>
> This is the original patchset:
>
> http://permalink.gmane.org/gmane.linux.drivers.devicetree/58764
> http://permalink.gmane.org/gmane.linux.drivers.devicetree/58763

I've looked at both. Go ahead and add my a-b line:

Acked-by: Grant Likely <grant.likely@linaro.org>
