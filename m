Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Compile Error: structure has no member named lowest_vol_num
Date: Tue, 30 Jun 2009 16:27:06 +0200
Message-ID: <077E41CFFD002C4CAB7DFA4386A53264F5D7F9@DEMUEXC014.nsn-intra.net>
In-Reply-To: <1246362304.20721.2.camel@localhost.localdomain>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<077E41CFFD002C4CAB7DFA4386A53264F5D7EC@DEMUEXC014.nsn-intra.net>
	<1246362304.20721.2.camel@localhost.localdomain>
From: "Biefel, Reiner (NSN - DE/Munich)" <reiner.biefel@nsn.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've downloaded the snapshot from http://git.infradead.org/mtd-utils.git
with enty
2009-06-08
	Detlef Bardtholdt
	libubi: fix wrong size calculation with sizes > 4GiB
	commit | commitdiff | tree | snapshot

- tar xzvf mtd-utils-e4d5eea6414093fb074b19585cb8bebadc2d3e0e.tar.gz
- cd mtd-utils
- CFLAGS=3D'-O2' CPPFLAGS=3D'-I
/utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/include -I
/utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/include -I
/utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/include' LDFLAGS=3D'-L
/utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/lib -L
/utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/lib -L
/utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/lib' make CC=3Dgcc
WITHOUT_XATTR=3D1
BUILDDIR=3D/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils

BR,
Reiner=20
