Received: from mail-db3on0108.outbound.protection.outlook.com
 ([157.55.234.108] helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgWEi-0004LE-Vm
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 10:00:18 +0000
From: Per Smitt <per.smitt@sbie.se>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: bad node type after using ubiupdatevol
Date: Tue, 21 Oct 2014 09:59:50 +0000
Message-ID: <1413885590813.80183@sbie.se>
References: <1413805882326.37838@sbie.se>
 ,<1413811808.7906.278.camel@sauron.fi.intel.com>
 <1413813476716.79473@sbie.se>
 ,<1413814665.7906.316.camel@sauron.fi.intel.com>
 <1413882313759.52960@sbie.se>, <1413884755.7906.424.camel@sauron.fi.intel.com>
In-Reply-To: <1413884755.7906.424.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > First of all, do you have fastmap enabled or disabled (check=0A=
> > > your .config)=0A=
> >=0A=
> > It is not at all in my config. I am running a Freescale i.MX28 yocto=0A=
> > solution and it uses kernel 2.6.35.3.=0A=
> =0A=
> Oh, it is so old. There might have been fixes since then. And I am not=0A=
> sure how out-of-date the MTD tests are in this kernel.=0A=
=0A=
The kernel is old but the mtd-utils are slightly fresher. =0A=
=0A=
* commit dcea43eba91642939c82739387147da26d572758=0A=
| Author: Aaron Sierra <asierra@xes-inc.com>=0A=
| Date:   Fri Sep 27 11:34:04 2013 -0500=0A=
=0A=
But if I understand you correctly most part of the UBIFS code is in=0A=
kernel drivers so it doesn't matter which version of mtd-utils I have.=0A=
=0A=
What would you recommend in this situation. Should I try to compile a =0A=
later kernel with my toolchain and see if I can get Linux running with =0A=
that one? If so which version of the Linux kernel should I use?=0A=
=0A=
/Per=
