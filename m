Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2ze4-0002Fw-7D
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2012 07:10:00 +0000
Received: by wibhq4 with SMTP id hq4so2164778wib.0
 for <linux-mtd@lists.infradead.org>; Sun, 19 Aug 2012 00:09:54 -0700 (PDT)
Date: Sun, 19 Aug 2012 10:09:46 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
Message-ID: <20120819100946.646cbb8a@pixies.home.jungo.com>
In-Reply-To: <1345124012.3393.239.camel@sauron.fi.intel.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
 <CACQ1gAhFJ6AKYJpc1ZiHm+3Y=APnwUmVL3f0KW=OFMDMWzCVJg@mail.gmail.com>
 <20120816134234.32b468f6@pixies.home.jungo.com>
 <1345124012.3393.239.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 Aug 2012 16:33:32 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> We do not have that big user-base. No one uses 0 in the tree, most use
> the default. I never heard anyone using 0. I did not use it also. I
> think it is OK to have the lower range start from non-zero. But why it
> is 2 and not 1 - I am not sure :-)

Artem,

Note that originally range was 0..25 (percentage).

It was changed to be 2..256 (per 1024) by 07ad322 in linux-ubi.

Seems arbitrary change.
So if you'd like, we can fix to 1..256 (or 0..256) - as you prefer.

Regards,
Shmulik
