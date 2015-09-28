Received: from mx0b-00158d01.pphosted.com ([67.231.152.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgWni-0001XX-GQ
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 11:40:59 +0000
From: Fabien Proriol <Fabien.Proriol@viavisolutions.com>
To: Paul Barker <paul@paulbarker.me.uk>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE:Fixing off_t handling in flashcp
Date: Mon, 28 Sep 2015 11:38:30 +0000
Message-ID: <FE17C31C9CA27B49A9BCBCD9E09346590127675B57@EUEXMB01.ds.jdsu.net>
References: <20150926105507.GA2711@bang.betafive.co.uk>
In-Reply-To: <20150926105507.GA2711@bang.betafive.co.uk>
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I used it since 2014 by appling this patch with my OpenEmbedded recipe, and=
 it's work well for ARM architecture (xilinx zynq).

Fabien
________________________________________
De : Paul Barker [paul@paulbarker.me.uk]
Envoy=E9 : samedi 26 septembre 2015 12:55
=C0 : linux-mtd@lists.infradead.org; Fabien Proriol
Objet : Fixing off_t handling in flashcp

Hi,

flashcp uses "%lu" to print values of type off_t. For example, from line 30=
7 of
flashcp.c, with formatting butchered to fit in 80 cols:

    log_printf (LOG_NORMAL,"\rWriting data: %dk/%luk (%lu%%)",
                KB (written + i),
                KB (filestat.st_size),
                PERCENTAGE (written + i,filestat.st_size));

The KB() macro doesn't change the type of filestat.st_size, which is 64 bit=
s
when large file support is enabled. On a 32-bit system this should be print=
ed as
"%llu" not "%lu".

Looking through the archives there is already a patch to address this but i=
t
doesn't seem to have been applied or replied to:
http://lists.infradead.org/pipermail/linux-mtd/2014-November/056410.html

I'd like to see this fixed as the current display output is ugly on our sys=
tems.
Could someone take another look at this patch from Fabien? I'll also test t=
his
at work this week to ensure it works correctly.

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk=
