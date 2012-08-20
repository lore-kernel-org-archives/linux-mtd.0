Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3LuF-0002wC-7j
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 06:56:11 +0000
Received: by lbbgf7 with SMTP id gf7so2983653lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 19 Aug 2012 23:56:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345403092.1930.4.camel@kyv>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
 <CACQ1gAhFJ6AKYJpc1ZiHm+3Y=APnwUmVL3f0KW=OFMDMWzCVJg@mail.gmail.com>
 <20120816134234.32b468f6@pixies.home.jungo.com>
 <1345124012.3393.239.camel@sauron.fi.intel.com>
 <20120819100946.646cbb8a@pixies.home.jungo.com> <1345403092.1930.4.camel@kyv>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 08:55:48 +0200
Message-ID: <CACQ1gAh7db9Dnqouzv5S=uAfTfavw45dwWSRAozGU4s7y8FA9w@mail.gmail.com>
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,
2012/8/19 Artem Bityutskiy <dedekind1@gmail.com>:
> Yeah, I wanted to make it 1..256 but forgot, will do now. 0..256 would
> need some more work to avoid division by 0.
Division by 0 is handled in the get_bad_peb_limit() function, I don't
see another dangerous place.
So, I think that we can change back the range to 0..256.
(and if we want to be coherent with user-space, it should be 0..255,
as the range is coded with an u8)

Richard.

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
