Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SwwKH-0002os-CV
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 14:24:33 +0000
Message-ID: <1343917741.25013.114.camel@sauron.fi.intel.com>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 02 Aug 2012 17:29:01 +0300
In-Reply-To: <20120802161512.5ac7a303@spider.haslach.nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343916747.25013.112.camel@sauron.fi.intel.com>
 <20120802161512.5ac7a303@spider.haslach.nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zFZ0cpCnnzv+p7vvpNDO"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zFZ0cpCnnzv+p7vvpNDO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-02 at 16:15 +0200, Richard Weinberger wrote:
> > If I understand correctly, it can be only because of a bug. If I am
> > correct, could you please add a 'dump_stack()' to improve the error
> > report?
> >=20
>=20
> This can happen if all PEBs are used and fastmap is unable to find (or
> produce) an empty one.

In which situations is this possible? Could you please give an example?

--=20
Best Regards,
Artem Bityutskiy

--=-zFZ0cpCnnzv+p7vvpNDO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQGo6tAAoJECmIfjd9wqK0RbEP/jVp8rNpWIbN4O6iC00xyMpU
m77m7dr75m36ASgqLwGemFVL7ewQqp4OJRH6cPF++i2YGIlq3PDf87e3tMYPLml1
S/IDCMBNKxbrGUl6rCK4fGYBLcx/g2JflmqJ3TG3UMtcQDRTZx8lE9Hk5gCzZ2KS
eY+Mcwbb0Q8WgObFpp9bx8S5LFQk/tiguUkKfIOrL+18w/pwC0NQSqBm2G0ZjVYO
A94QGQS2V7yb+OSbmTDXhUlYaejE3hT0ZSz8XirZK1g+AkGXdyTSnl3db2Mep8dl
X+HaaFivSklCLy9L3P8ceOFq/eFhg/86S1svO4LcY7umVZGqV3L4xOEhhqLEtpl1
qnrlzG/IBWn0uPqGZLtx9lgXNuVbT6zlmmlOp72xy6/IhEEkSkkYxwc0Ct4p8GNl
0NSO8VEAmnudesa6p78LMwnCkifV6nJkgtbkNg0mf8scsJuLE6qstuNoBFJpKBGF
q3xl44+F5clRqBArKTaEqANBBFeD4wJ4QcTWr+esDWX12MKKtw7VJ4Q+WBrzsmKM
TfcUd9q+tssUw3sd9Kt3vvJsNvGJEfsHYMb8X49nBzAl03/NaWeKBhoBZeosH9yY
9kXtXhVw60Am9K0/k4g2zh17LLhQXpcbPbcHzbDj1XHtOnee4jGE03N60bNRCRQ4
YROhtJvgOT9Gs4kOETCC
=xFMj
-----END PGP SIGNATURE-----

--=-zFZ0cpCnnzv+p7vvpNDO--
