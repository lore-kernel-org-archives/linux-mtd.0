Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dWCGK-0006UJ-QC
 for linux-mtd@lists.infradead.org; Sat, 15 Jul 2017 01:52:55 +0000
Date: Fri, 14 Jul 2017 22:52:13 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Jim Davis <jim.epost@gmail.com>
Cc: Markus Heiser <markus.heiser@darmarit.de>, Jani Nikula
 <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>, Linux Doc
 Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@infradead.org>, "linux-kernel@vger.kernel.org org List"
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/53] Get rid of Docbook
Message-ID: <20170714225213.0a6dba4f@vento.lan>
In-Reply-To: <CA+r1Zhj6NqnR_Dg+xGiW7==1ZmQW3XBvt0XY9c=gjqssso74Qg@mail.gmail.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <20170518112608.4f355068@lwn.net>
 <20170518200140.11982b12@vento.lan>
 <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
 <CA+r1ZhhZw6+LOAMbw6=kidPBr2Ntrz0ORGV165DEWuX8haKrWw@mail.gmail.com>
 <386A482A-26F9-4C82-871D-E03E9F6401D8@darmarit.de>
 <CA+r1Zhj6NqnR_Dg+xGiW7==1ZmQW3XBvt0XY9c=gjqssso74Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Fri, 14 Jul 2017 16:15:23 -0700
Jim Davis <jim.epost@gmail.com> escreveu:

> On Thu, Jul 6, 2017 at 1:54 AM, Markus Heiser <markus.heiser@darmarit.de>=
 wrote:
>=20
> >  52b3f23 Docs: clean up some DocBook loose ends =20
>=20
> Speaking of minor loose ends,
>=20
> make SPHINXDIRS=3Duserspace-api pdfdocs
>=20
> works -- though now that it's all sphinx, wouldn't just DIRS be better? -=
- and

Hmm... I don't like the idea of just DIRS, as there are other paths
used on Makefile (INSTALL_PATH, INSTALL_MOD_PATH, INSTALL_HDR_PATH).

>=20
> make DOCBOOKS=3Duserspace-api pdfdocs
>=20
> still works too.  But that generates all of the pdf files, and not
> just the userspace-api.pdf.=20

It will just ignore it. The same happens if you do:
	make FOO=3Dbar htmldocs

Yet, it could make sense to either warn or make it equivalent to
SPHINXDIRS at the Documentation/Makefile.

> And running now-dead targets like "make
> ps" or "make sgmldocs" or "make mandocs" just returns with no output.

Yeah. We need to get rid of those targets from Documentation/Makefile:

	sgmldocs:
	psdocs:
	mandocs:
	installmandocs:

I guess the enclosed patch should do the trick.

Thanks,
Mauro

-

docs: Makefile: remove no-ops targets

After removal of DocBook, those targets are bogus.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

diff --git a/Documentation/Makefile b/Documentation/Makefile
index a42320385df3..d75c00e3aadb 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -95,16 +95,6 @@ endif # HAVE_SPHINX
 # The following targets are independent of HAVE_SPHINX, and the rules shou=
ld
 # work or silently pass without Sphinx.
=20
-# no-ops for the Sphinx toolchain
-sgmldocs:
-	@:
-psdocs:
-	@:
-mandocs:
-	@:
-installmandocs:
-	@:
-
 cleandocs:
 	$(Q)rm -rf $(BUILDDIR)
 	$(Q)$(MAKE) BUILDDIR=3D$(abspath $(BUILDDIR)) $(build)=3DDocumentation/me=
dia clean
diff --git a/Documentation/translations/zh_CN/HOWTO b/Documentation/transla=
tions/zh_CN/HOWTO
index 11be075ba5fa..5f6d09edc9ac 100644
--- a/Documentation/translations/zh_CN/HOWTO
+++ b/Documentation/translations/zh_CN/HOWTO
@@ -149,9 +149,7 @@ Linux=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=81=E4=B8=AD=E5=
=8C=85=E5=90=AB=E6=9C=89=E5=A4=A7=E9=87=8F=E7=9A=84=E6=96=87=E6=A1=A3=E3=80=
=82=E8=BF=99=E4=BA=9B=E6=96=87=E6=A1=A3=E5=AF=B9=E4=BA=8E=E5=AD=A6=E4=B9=A0=
=E5=A6=82=E4=BD=95=E4=B8=8E
 =E6=A0=B8=E6=BA=90=E7=A0=81=E7=9A=84=E4=B8=BB=E7=9B=AE=E5=BD=95=E4=B8=AD=
=E4=BD=BF=E7=94=A8=E4=BB=A5=E4=B8=8B=E4=B8=8D=E5=90=8C=E5=91=BD=E4=BB=A4=E5=
=B0=86=E4=BC=9A=E5=88=86=E5=88=AB=E7=94=9F=E6=88=90PDF=E3=80=81Postscript=
=E3=80=81HTML=E5=92=8C=E6=89=8B=E5=86=8C
 =E9=A1=B5=E7=AD=89=E4=B8=8D=E5=90=8C=E6=A0=BC=E5=BC=8F=E7=9A=84=E6=96=87=
=E6=A1=A3=EF=BC=9A
     make pdfdocs
-    make psdocs
     make htmldocs
-    make mandocs
=20
=20
 =E5=A6=82=E4=BD=95=E6=88=90=E4=B8=BA=E5=86=85=E6=A0=B8=E5=BC=80=E5=8F=91=
=E8=80=85
diff --git a/Makefile b/Makefile
index 547947ff87de..5db9c669e541 100644
--- a/Makefile
+++ b/Makefile
@@ -1459,7 +1459,7 @@ $(help-board-dirs): help-%:
=20
 # Documentation targets
 # ------------------------------------------------------------------------=
---
-DOC_TARGETS :=3D xmldocs sgmldocs psdocs latexdocs pdfdocs htmldocs mandoc=
s installmandocs epubdocs cleandocs linkcheckdocs
+DOC_TARGETS :=3D xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs lin=
kcheckdocs
 PHONY +=3D $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=3DDocumentation $@
