Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TKS4h-00005Z-IA
 for linux-mtd@lists.infradead.org; Sat, 06 Oct 2012 10:57:40 +0000
Received: by mail-ob0-f177.google.com with SMTP id wd20so2548832obb.36
 for <linux-mtd@lists.infradead.org>; Sat, 06 Oct 2012 03:57:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1349426906.20373.77.camel@sauron.fi.intel.com>
References: <CACna6rwju0g+sq+vBAfCqFJm=EBLg79G2XoGEKs5n1Y=PcmKBg@mail.gmail.com>
 <1348499094.4880.65.camel@sauron.fi.intel.com>
 <CACna6ryu06qsgX99kdkeDaB+XJv4XwC0-O+5ysNFa1iOMEgNow@mail.gmail.com>
 <1348574785.20474.15.camel@sauron.fi.intel.com>
 <1349426906.20373.77.camel@sauron.fi.intel.com>
Date: Sat, 6 Oct 2012 12:57:35 +0200
Message-ID: <CACna6rxZpxFL6xfjbdsW95_rfqL_yhRbUxLnGXeDLXQypLN0mQ@mail.gmail.com>
Subject: Re: Problem with verify-ing patch (error: arch/m68k/Kconfig.cpu:
 patch does not apply)
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/10/5 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2012-09-25 at 15:06 +0300, Artem Bityutskiy wrote:
>> I'll do the fixes as soon as I have some time, please, keep bugging me
>> and thanks for your feed-back!
>
> I've just pushed a change which should improve user-friendliness. Now I
> check for dependencies in many places and try to inform the user if a
> program is missing, plus give some suggestions where to take it from.
> E.g., for cross-tools I print the URL where one can download pre-built
> cross-tools.

Great, thanks for you work! :)

--=20
Rafa=C5=82
