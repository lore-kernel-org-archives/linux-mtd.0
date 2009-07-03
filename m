Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Compile Error: structure has no member named lowest_vol_num
Date: Fri, 3 Jul 2009 09:17:06 +0200
Message-ID: <077E41CFFD002C4CAB7DFA4386A53264F5D814@DEMUEXC014.nsn-intra.net>
In-Reply-To: <8bd0f97a0907030012j53afcec1s81f71dfae233db9c@mail.gmail.com>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<1246373088.20721.11.camel@localhost.localdomain>
	<8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
	<1246603942.20721.29.camel@localhost.localdomain>
	<077E41CFFD002C4CAB7DFA4386A53264F5D812@DEMUEXC014.nsn-intra.net>
	<8bd0f97a0907030002y521723a4s42e71dbb63e7e502@mail.gmail.com>
	<077E41CFFD002C4CAB7DFA4386A53264F5D813@DEMUEXC014.nsn-intra.net>
	<8bd0f97a0907030012j53afcec1s81f71dfae233db9c@mail.gmail.com>
From: "Biefel, Reiner (NSN - DE/Munich)" <reiner.biefel@nsn.com>
To: "ext Mike Frysinger" <vapier.adi@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>they either have then in the standard path like a sane toolchain, or
>they use CFLAGS.  i'm not saying putting -I flags in CFLAGS vs
>CPPFLAGS is correct, just that people rarely do it the right way.=20

Does this mean, if I had used CFLAGS instead CPPFLAGS I don't need your
patch?

-Reiner
