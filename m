Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFmRy-0000ls-IY
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 13:42:22 +0000
Received: by bkwj4 with SMTP id j4so155495bkw.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 06:42:21 -0700 (PDT)
Message-ID: <1348407738.1889.13.camel@kyv>
Subject: Re: [PATCH] Test for multi-bit error correction
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Sun, 23 Sep 2012 16:42:18 +0300
In-Reply-To: <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 ,<1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
 ,<1346315075.2848.538.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7f1InHPMgh+xrhuXCLVm"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7f1InHPMgh+xrhuXCLVm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-31 at 08:59 +1000, Iwo Mergler wrote:
> This tests ECC biterror recovery on a single NAND page. Mostly intended
> to test ECC hardware and low-level NAND driver.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-7f1InHPMgh+xrhuXCLVm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXxG6AAoJECmIfjd9wqK0NzEP/10PpiyqNXHWR7tFfeiMOEv5
o83ZdQlhpotDVCkHCUdL1pnSLeNIbm6B54LHZJJ9ypIwdkTM/CWqIfIgVWPFcto3
gawx8waQrqFckDjttgujzWHEbrMbMnU4N276SNU1sYvBlXEFP0OGYO4JXFOWmrLP
Vev9fuGyoOowQ/TAaycYqx98iN077P0WNjSFdmdUJBhHuDkO07pjCe+X9Fch2Wt1
rdh4hltIvLC+O4ea472bZrKgG6kNFnO8TK2bWbSSrjBVUuaftBhIFx8X6o529ydx
5MxlgwwjgShHiwvvI8iGVPeRTX2hcff+5fokynl12ZhQTtPzyW9MP63FEN0Bho+c
53ZgpiH+ZhIiuZB54DzBHhF9wqFxELN8HztAJIcEwXZQx28psMA528ETGafKvpKV
TGMlqVtXY/NMJ4YAwvDpd/mEzYUMJJtb+t62f6HIso2SGF1HiCtnxggNaR68XiX5
7QoAp8zuy3RqDrYldk6kOKheOKNiy2NPEue6CT6xMMxxU3nQifcDM9APzVLrxO3B
C7enE+P44+BjAgFIG/obsNAJfxHoS44V7Wjv/QgNS+dpJXeR1HvvQsLHtotuH8Am
wVuK2wJk5KAuZnA5YiMqiJAUw8bxEWG4C6UbV/TDHKTuNaaeGud+uszTJCfUvwou
g1/I6QBgqHsUWlnF5ndh
=pVQc
-----END PGP SIGNATURE-----

--=-7f1InHPMgh+xrhuXCLVm--
