Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJmzK-00081d-3M
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 15:05:22 +0000
Message-ID: <1349363121.20373.69.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Thu, 04 Oct 2012 18:05:21 +0300
In-Reply-To: <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <1346413469.9709.44.camel@sauron.fi.intel.com>
 <CAP+RiCBRopbShAGf_fWCvK2R=uPPR1j4Pz12JfJxdEMUjwofNw@mail.gmail.com>
 <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-S0BYD+WBrMA2Q6BFC83s"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-S0BYD+WBrMA2Q6BFC83s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-17 at 08:34 -0500, Brent Taylor wrote:
> Artem,
>    I was finally able to capture the issue again with linux version
> 3.5.1, and I now have a 64MB mtd image for you to look at.  The issue
> occurred in the root filesystem this time.  Let me know what's the
> best way to get this image to you.  The image was retrieved from a NOR
> flash chip instead of a NAND flash chip, but I've seen the error on
> both which leads me to believe it's not a flash driver issue and it's
> something in the UBIFS subsystem.  If there is more data you need from
> me to help track this down, just let me know.

Well, I do not have any service where you can upload it to. If it
compresses well, may be e-mail would work. Otherwise you'd need to give
me an URL where to download from.

--=20
Best Regards,
Artem Bityutskiy

--=-S0BYD+WBrMA2Q6BFC83s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQbaWxAAoJECmIfjd9wqK0TeEP/0RFHHuL0euFnq1n/2PNybSO
JT2HXS7OJzh67my+x0RfKLpU7tglUDZVTRalOrMvkCll15MP+fBYE1q+ctp4a2HR
8VD5SYvi8d0r2YUqOZLkx8d3cg5yxlJP+focBhrGWI2CkboHCUXd3iwi7lwVSe88
jpN64xbJjI7781HqagMmT1lH2rKwKmcblMNr9UYACGTHso3YRxurlwu8BL/VnPca
bTt5SsL26SQOT4PbwWdFCEe5Md6wCL1icaNc3R89Yes2rqgtLtvVspWvv046RLTu
PwJ5ziaMUp71zOpHsAtWol8GzM0Mpv5o5v48sTKu9CoEcouYHe2aSHnOQeGHcQzs
Ay4mOBqokzuJfRNobU8Mekc62UhNxRhYx5dgwgjPMtUZj7N71jny9WLAcVHrxpVi
S7inYKa1vLMzA7NmnUPJwrZsqgKPAA5iGyBq7Yr/0gBknYTrX17QWcg8uK6+ozk8
pcXrsUS3rdLO0SS4Pl1izgbttPNj8WegP5nQYFz4aW7w3kvfgR7PWeBhiByF64NJ
SL6dr8amZpovWmdpTGo82Gpsd/u77ahqqECQW92OlTNqnSATv+F7r6Q65AH1et4g
ETOzQGW13caUP41mK+dAQfJP9tmzKMlBgliPLfQE25HsvhL8yvbCxkeI97ciBqgB
31OZvEkYzqjIrQ8BOJlV
=OfRO
-----END PGP SIGNATURE-----

--=-S0BYD+WBrMA2Q6BFC83s--
