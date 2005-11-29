Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh7wK-0002Kg-MB
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 11:02:47 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Eh7fU-0006fb-8R
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 16:45:20 +0100
Received: from desk.marajade.sandelman.ca ([205.150.200.247])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 16:45:20 +0100
Received: from mcr by desk.marajade.sandelman.ca with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 16:45:20 +0100
To: linux-mtd@lists.infradead.org
From: Michael Richardson <mcr@sandelman.ottawa.on.ca>
Date: Tue, 29 Nov 2005 10:18:18 -0500
Message-ID: <v0sltfeb45.fsf@marajade.sandelman.ca>
References: <v0mzjofaup.fsf@marajade.sandelman.ca>
	<20051129100937.AF133353F54@atlas.denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Sender: news <news@sea.gmane.org>
Subject: Re: [PATCH 1/2] --cvs-exclude for mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=


>>>>> "Wolfgang" == Wolfgang Denk <wd@denx.de> writes:
    Wolfgang> In message <v0mzjofaup.fsf@marajade.sandelman.ca> you wrote:
    >> This adds an option to ignore CVS directories.

    Wolfgang> This doesn't make sense to me. You can and should use "cvs
    Wolfgang> export" to create the directory trees you want to package.

  yes, one could do that. I chose not to.
  It isn't like I forced this option to be on.

  cvs export requires that I actually check my changes in before I can test
them, which causes a lot of needless churn.  
  It may also mean that developers in my team will check in debug statements
and forget to remove them.  
  
    Wolfgang> You use CVS, others use GIT, or Subversion, or ClearCase, or
    Wolfgang> Monotone, or darcs, or ... - it would not be really practical
    Wolfgang> to add special rules for everybody's favorite tool.

  It would very much be practical to do this.
  I'd rather have a more general --exclude.

  Of course, you argue for removing equivalent options from rsync and other
things.  Accept the patch or not. 

-- 
]       ON HUMILITY: to err is human. To moo, bovine.           |  firewalls  [
]   Michael Richardson,    Xelerance Corporation, Ottawa, ON    |net architect[
] mcr@xelerance.com      http://www.sandelman.ottawa.on.ca/mcr/ |device driver[
] panic("Just another Debian GNU/Linux using, kernel hacking, security guy"); [

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQEVAwUAQ4xxPICLcPvd0N1lAQJIEAf/f+J0AR6+1IctD1JUWJ/1drWqFY53zjOz
De1/8CjUVks5mP/ERKuaMGSaEAVsJT7TSNJ3LhpvG+IXN1549FNpIZVliltzi0x0
Fzf0Bv0o81KuxFatle8lupolAV2NU+ZqxlqP3qdEuiq8YcPg4buY1Xt09LhyPAM+
6rMXemG77CUx1HJCFTXYSR/6/k7yYHJdbx1CyxkwPyLWozIGg8hCxT4DA1rKttb1
2/yg+QUTW6XuYmEWH94lWOnq9ax5/qidCPNSKNKO0kwpaKlUY+ibToErpe+hGXRV
GBKuoPZ2fb3+OGUwIfiL5q/RrKhAQbog8JQH+x9bnFGq8jXV21Rt1Q==
=zICq
-----END PGP SIGNATURE-----
--=-=-=--
