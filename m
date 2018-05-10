Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGqBk-0008KO-BX
 for linux-mtd@lists.infradead.org; Thu, 10 May 2018 18:21:14 +0000
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
 (envelope-from <ben@decadent.org.uk>) id 1fGqBS-0003vu-3T
 for linux-mtd@lists.infradead.org; Thu, 10 May 2018 19:20:55 +0100
Date: Thu, 10 May 2018 19:20:54 +0100
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20180510182053.GM8564@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QHhm1I6mwQR20oIa"
Content-Disposition: inline
Subject: [PATCH] mtd: Fix comparison in map_word_andequal()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--QHhm1I6mwQR20oIa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 9e343e87d2c4 ("mtd: cfi: convert inline functions to macros")
changed map_word_andequal() into a macro, but also changed the right
hand side of the comparison from val3 to val2.  Change it back to use
val3 on the right hand side.

Thankfully this did not cause a regression because all callers
currently pass the same argument for val2 and val3.

Fixes: 9e343e87d2c4 ("mtd: cfi: convert inline functions to macros")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 include/linux/mtd/map.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index b5b43f94f311..01b990e4b228 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -312,7 +312,7 @@ void map_destroy(struct mtd_info *mtd);
 ({									\
 	int i, ret = 1;							\
 	for (i = 0; i < map_words(map); i++) {				\
-		if (((val1).x[i] & (val2).x[i]) != (val2).x[i]) {	\
+		if (((val1).x[i] & (val2).x[i]) != (val3).x[i]) {	\
 			ret = 0;					\
 			break;						\
 		}							\

--QHhm1I6mwQR20oIa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBWvSNhee/yOyVhhEJAQrfDA//TQGDeReY3jRReIGUofj7ese88zGri0Wc
LtyEh3dgcMsx23YSxekASyHIa+W3maW1YX0c5JKicHAGrzW5rr64BsQ9egDy1O7e
hb9kCiO+V45JzHaKeEnSjn+PvC7SDYmEv/8J/eED5CLMCTduiqQyQT1iu85gPgRc
dyhTg/LaBRqR4wc4XQUPDZdmr4EJHfNYcUmmx+3YfryekOYIOiW5LoG7r3C0CX+x
vZq1O1eqxEGbTV53uHWBl5iyrWZ2HUWFa28kIXvdHau9ahE3TK5W/R4+ffwOsq7x
uw4tSl8W2p432LUVvdo9B1eTJSEFW8JF3NbraOdQtats3KKbUl2ah2CCTKPL4m0A
wM1PfsZRnn0n8vvVrGlzGbyOx8iOMcocTDS90Bi0HVOeQNjrisryrJ3L15iLhswJ
NezeDbxXydpldRkfAwhN266wZUFsMDptCvvg0zmRKX9ufKqGMgWcVj64ikJHRi4a
sz81Sg1i9PMnZ2FC6ymmGLjrYHF5aa+5Fc6DpYeo15eoorDjVUHilNOlBxu9YORU
oRsWWiXAIS5xQvFm7v7nUVMa0DQzwM81lvSqdAgUTRNgqI0KGTmn5NhpjqU0esce
m+j1/318IRs83Dx/Qs/31g7NYsWsi2tlq4SxEXPMIZAION8fu4XCvIFtHzi1N/Oj
XcfspaKJtZ8=
=qsTQ
-----END PGP SIGNATURE-----

--QHhm1I6mwQR20oIa--
