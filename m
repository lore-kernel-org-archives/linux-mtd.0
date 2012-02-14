Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxEEa-00019I-T8
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 08:59:37 +0000
Received: by dakp5 with SMTP id p5so6439200dak.36
 for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2012 00:59:34 -0800 (PST)
Message-ID: <1329210112.22240.217.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] libmtd: fix mtd_write() issues for large data-only writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 14 Feb 2012 11:01:52 +0200
In-Reply-To: <1328934905-27007-1-git-send-email-computersforpeace@gmail.com>
References: <1328934905-27007-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-B0MqnjCLpDBWnFEKFfBY"
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


--=-B0MqnjCLpDBWnFEKFfBY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-02-10 at 20:35 -0800, Brian Norris wrote:
> ioctl(MEMWRITE) is implemented with memdup_user(), and so it allocates
> kernel memory in contiguous regions. This limits its usefulness for large
> amounts of data, since contiguous kernel memory can become scarce. I have
> experienced "out of memory" problems with ubiformat, for instance, which
> writes in eraseblock-sized regions:

Pushed this one and the other 3 patches to mtd-utils.git, thanks a lot!

--=20
Best Regards,
Artem Bityutskiy

--=-B0MqnjCLpDBWnFEKFfBY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPOiMAAAoJECmIfjd9wqK0YMQP/inKKnf55LMBYLjLHxd5bMt0
9UkTm3tIenTPr2TlUuNF3gLaOuDkKvK6rB/36oKPy4iHHXJ56nDJ/2YJPI9qzhRQ
+bDkaaUSrjS4sfH02ZOsJ7SUM0Q/7+Z9oPPlx4xqVDyhniclsPlseFubRIz6ngRv
5tgtKuDpquKbZIveb2PhlsP9rH8/HXOCkidCcCStqkTJL2jfWw3TsytNSq6BtjOB
r6km7lmeHLdxYI6aECeO4vCoPdsW6trHN+6H/p1bB+iG1srII/nERRFWCrhuqSg7
8T3bsUbilH2kNPWjZVM6JDEZMcuWZtV0ef/F/4mpMGxtaBLsp3F1SomaX35Z8T70
PIbgMxH14zpNknSZwBwu3k9EtVDx0mWI+jXJAXV/x0a77YBo4vcAxJm96u8Htfiz
7R3JOh6Puk5/QDABET3eOOyNo6r0VAUNtDBNBuDqRUTVMqWm9pBeelIboe9LwhSO
uPEZxTINL5cg4BMcqvpRn4nZmzeoOWZmnLYUAKzz4JVqF1/e/KB2tH/kfI4A5sE5
PdS2I6tA56zdHJe4+bMgEFg/qErE1Am8ErlcosF7QS32j1JRjsMiYFNr+Rw9SNFG
lSycpScIKpI+RFxq1f8igg32Wlmr5TwXOjbiJ4BFEpbbnLeKEnCPGM0CYhxPEpSS
5b8IEdV/jnWCJQ/0SIDf
=OEBK
-----END PGP SIGNATURE-----

--=-B0MqnjCLpDBWnFEKFfBY--
