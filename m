Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TF38V-000679-5w
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 13:19:16 +0000
Message-ID: <1348233550.7550.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V5] mtd: m25p80: Make fast read configurable via DT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>
Date: Fri, 21 Sep 2012 16:19:10 +0300
In-Reply-To: <201209171610.28410.marex@denx.de>
References: <1345923416-9293-1-git-send-email-marex@denx.de>
 <201209171610.28410.marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-OnCi+bgaJ2bV0OXmkNoX"
Mime-Version: 1.0
Cc: robherring2@gmail.com, devicetree-discuss@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OnCi+bgaJ2bV0OXmkNoX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-17 at 16:10 +0200, Marek Vasut wrote:
> Bump, do you think we can get this into 3.7 please?

Aiaiai!

---------------------------------------------------------------------------=
-----

Successfully built configuration "i386_defconfig,i386,", results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/devices/m25p80.c: In function =E2=80=98m25p_probe=E2=80=99:
+drivers/mtd/devices/m25p80.c:808:23: warning: unused variable =E2=80=98np=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----


--=20
Best Regards,
Artem Bityutskiy

--=-OnCi+bgaJ2bV0OXmkNoX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXGlOAAoJECmIfjd9wqK0QYUQAIHqypvKSsHsUOvX9KrsNFe0
RktQndeAEJNh/zFGUOfPAJEtBxIQ+vKwDUWBMuAIR0RQM8ip7vFTiTjJL7veAnnq
suKMQAH52dWloE3rHsC2aQ4BZlEsl+r1hoLekcOUNpw7NMyCuMdQh6syGiNzIGYE
Fl1BExyvzAs7639ju662P1vlez6SS6IFTA17th1Mo3FLLBasIqV7HJEMEQ+tig3k
KMHLO5rWtXQ+mmUOoq4TUPYUOst2SeqjoRkZ2PZJrkoDayz7Wz+/6YxzfbcVwBt0
3XqilAQvV9bSXK0WHGpZ5zClkhjurbx+94c5YoR0zyqVhBxKclWD3evlq0iqHEBj
pi8SQovC8cm1nuxkxHN4TFcugTX9akugktkfttqYbEjG7wHgETAuC0BxcOuxZN8R
Qw6ZXaR08A8JH/rx13liaumRitxEG/SnZXdwnZ+7QT49zhumOnTjeDKsVmcoTGV9
bzT6/0HajWMpCBPLzd21V3LQx5y+L59iIjCawzjhNMvL9r5yralf9C6j6XkDFfJM
PeJ1l6zcrWozS24RMld9A+XY2wsBc2Bqq4UIp4zzzzNbgdl2kn5YOhy2M5RoWAFv
TW+k3lqL0pcru5zIll/MwJ+8TLbaT8sA6pKh4cMvTeWMPINRblWrMJovI96tSYfp
EMBk9vcPT/7eNzzZgBL1
=csaK
-----END PGP SIGNATURE-----

--=-OnCi+bgaJ2bV0OXmkNoX--
