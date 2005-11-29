Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EhCHt-0007Uk-BE
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 15:41:23 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1EhCCF-0007cE-2p
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 21:35:27 +0100
Received: from desk.marajade.sandelman.ca ([205.150.200.247])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 21:35:27 +0100
Received: from mcr by desk.marajade.sandelman.ca with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 21:35:27 +0100
To: linux-mtd@lists.infradead.org
From: Michael Richardson <mcr@sandelman.ottawa.on.ca>
Date: Tue, 29 Nov 2005 15:31:58 -0500
Message-ID: <v0br03dwld.fsf@marajade.sandelman.ca>
References: <v0mzjofaup.fsf@marajade.sandelman.ca>
	<20051129100937.AF133353F54@atlas.denx.de>
	<v0sltfeb45.fsf@marajade.sandelman.ca>
	<625fc13d0511290908h528df3e5j7a81163e7854ee1a@mail.gmail.com>
	<625fc13d0511290912v16aca7c2lc3610f738ff85a6d@mail.gmail.com>
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


>>>>> "Josh" == Josh Boyer <jwboyer@gmail.com> writes:
    >> I believe the answer is "not".

    Josh> To clarify, the answer is no because you've hard coded this exclude
    Josh> stuff in the tool itself.  Making a more generic --exclude which
    Josh> reads what to exclude from a file might be an option that is
    Josh> acceptable. Then for your specific case you could simply have "CVS"
    Josh> and ".KEEP_ME" listed there.

  Thank you --- I appreciate constructive feedback! 

  I'm happy to do a proper --exclude. I would have rather done it that way to
begin with, but it was hard to hack up in a moment. I posted because I wanted
to clear my queue of patches.
  I would propose, like rsync:
        --exclude=glob
        --exclude-from=FILE
        --scm-exclude=FILE                         

  Last one could be set to, for instance:
           --scm-exclude=.cvsignore
 
  (and could occur multiple times)

  [did my patch to create jffs2cpio make it out?]

-- 
]       ON HUMILITY: to err is human. To moo, bovine.           |  firewalls  [
]   Michael Richardson,    Xelerance Corporation, Ottawa, ON    |net architect[
] mcr@xelerance.com      http://www.sandelman.ottawa.on.ca/mcr/ |device driver[
] panic("Just another Debian GNU/Linux using, kernel hacking, security guy"); [

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQEVAwUAQ4y6xYCLcPvd0N1lAQIw6Af/cdFif1V4x9du2wNxRnBZLd9rnx7VsJ13
aA8MmG9nZxdaGnDf4ZvoVnI6hMlS3q6SDJpJKu7UDseAXEcTBNPkZRQ03uTmxKd3
oLmIQNKkB+tWfzj5r2Z0/Uv2F8Y8KLpCWnWMJjxK86bqR4NR1vgKhmUtySYvUxlx
cC31IUsxx0Tudt3kNZQ91B2XefrOQl6innwB3Zm55SCoLLPig16kxwCe1EOjouyv
DM/t2J+bWXhYylztlXObvocYU+NyMtpB06L+EndWp9fv6yh5WtpXDy6EkrYNa3A4
xe1zm7rigQmvn2xP9Mc5qznUqJqEHMo6OBysuEuDCoMsfWy0KODCsQ==
=TQXV
-----END PGP SIGNATURE-----
--=-=-=--
