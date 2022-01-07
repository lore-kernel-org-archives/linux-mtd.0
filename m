Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39093C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 20:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPY/qQKGaITcYrfA9Fs3FmziyKJTqSM1ubLsRo/fZIs=; b=L6nRLXvVpG6AycBUv2+Y/0OiUG
	mbVc7djODr5h7qAriCXIkbFgLnrNinptt412uBxr1Rv2qRluUslmlUm28Egg2pxRvfJewYhvI/Qsd
	wVEj3nKFlLgL//b0MjttdcUzJph0VUTLcPBBqGnzc6zK2QtKW6b9VPRKLdmogCxq+xtWoRKguolT1
	iXaUhAkiqAEwJqAkDNuFR5TdAY98jF5SLQpaCS5e08JJPF4bQdR/lRuRugwwnPLqHPqWjfcgFpGEa
	6nEh2TZzEebF8e3KOEahaD0UAqJfqO/cKHta27iv2af/S/VCnc6TCoK5Q1krGFZzYJnjxsFccZLdr
	6qb+csQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5w5E-005Dnt-Tv; Fri, 07 Jan 2022 20:43:32 +0000
Received: from mx.cs.msu.ru ([188.44.42.42] helo=mail.cs.msu.ru)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5w5B-005DnY-LZ
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 20:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cs.msu.ru; 
 s=dkim;
 h=Subject:In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CAj6ZvCGsPU1I8LtRSp3RhetGGO18H0jd7c6GnJn/AI=; b=Tmtwzq882fuqOFkgczsh/hVTJV
 vjYXVLuJSb3ebjGHUX/IMLewO/j7T7pru2BtNUWx1U0M9+uf4naJNbstc4a4hV627q9Fmvp2M8WVB
 rrPobMbnO55k1E282B+ZDvv2xnqKt+6vi2dm/N58n2PoB9yvml12ZZi653qVVPbFvBrQ1N3Cb1Mlt
 VpFJqmRvAKdp7QhJGXuWQmopkT9Zg4uypDmWsHhYSHIs2H59UUqr6Mb685+Z5ze6ULlPQQej9nGSV
 Up77CfcM/pPZTa0PvLewaq5PkmdXAK939R648+o8vCCb1GgM/jYykm3sn1Pe3d2AL16FSeIumeX9/
 Rgr2mlbw==;
Received: from [37.204.119.143] (port=58124 helo=cello)
 by mail.cs.msu.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <ar@cs.msu.ru>)
 id 1n5uvJ-00092m-Js; Fri, 07 Jan 2022 22:29:15 +0300
Date: Fri, 7 Jan 2022 22:29:12 +0300
From: Arseny Maslennikov <ar@cs.msu.ru>
To: Walt Drummond <walt@drummond.us>
Cc: Theodore Ts'o <tytso@mit.edu>,
 "Eric W. Biederman" <ebiederm@xmission.com>, aacraid@microsemi.com,
 viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de,
 bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com,
 bristot@redhat.com, dave.hansen@linux.intel.com,
 dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org,
 geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
 idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com,
 ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org,
 bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org,
 john.johansen@canonical.com, juri.lelli@redhat.com,
 keescook@chromium.org, mcgrof@kernel.org,
 martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de,
 oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org,
 rth@twiddle.net, richard@nod.at, serge@hallyn.com,
 rostedt@goodmis.org, tglx@linutronix.de,
 trond.myklebust@hammerspace.com, vincent.guittot@linaro.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 ceph-devel@vger.kernel.org, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-m68k@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-security-module@vger.kernel.org
Message-ID: <YdiUiHAhLyfgpvVY@cello>
References: <20220103181956.983342-1-walt@drummond.us>
 <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu>
 <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
 <YdTI16ZxFFNco7rH@mit.edu>
 <CADCN6nzT-Dw-AabtwWrfVRDd5HzMS3EOy8WkeomicJF07nQyoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADCN6nzT-Dw-AabtwWrfVRDd5HzMS3EOy8WkeomicJF07nQyoA@mail.gmail.com>
OpenPGP: url=http://grep.cs.msu.ru/~ar/pgp-key.asc
X-SA-Exim-Connect-IP: 37.204.119.143
X-SA-Exim-Mail-From: ar@cs.msu.ru
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
X-SA-Exim-Version: 4.2.1
X-SA-Exim-Scanned: No (on mail.cs.msu.ru); Unknown failure
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_124329_724996_81930C28 
X-CRM114-Status: GOOD (  10.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2913779224903254667=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2913779224903254667==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jM/2AY6iSqMbsk1G"
Content-Disposition: inline


--jM/2AY6iSqMbsk1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 04, 2022 at 02:31:44PM -0800, Walt Drummond wrote:
> The only standard tools that support SIGINFO are sleep, dd and ping,
> (and kill, for obvious reasons) so it's not like there's a vast hole
> in the tooling or something, nor is there a large legacy software base
> just waiting for SIGINFO to appear.   So while I very much enjoyed
> figuring out how to make SIGINFO work ...

As far as I recall, GNU make on *BSD does support SIGINFO (Not a
standard tool, but obviously an established one).

The developers of strace have expressed interest in SIGINFO support
to print tracer status messages (unfortunately, not on a public list).
Computational software can use this instead of stderr progress spam, if
run in an interactive fashion on a terminal, as it frequently is. There
is a user base, it's just not very vocal on kernel lists. :)

--jM/2AY6iSqMbsk1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE56JD3UKTLEu/ddrm9dQjyAYL01AFAmHYlIMACgkQ9dQjyAYL
01A2JA/+L9JwmjJHTVt97zLB/gp/798jHIH5xpSIqAGns8OfFkzQ95dxlpb2U9vw
QnNRixTQzfe+GISVL0FKMOQnAodV/FiSCGQU3ebudcPQXtrGtYHUT8Ijz9WL8+pR
LEbZvDDW4JT2N8sGVcsiAtSER9kHRUpdNBPCdIxURmQf0Fgjj16cYV/cr3j8NQpw
uXKAulKoHIWjD84jc1douEnwo6Eij7QA7nZ1N4PLesZ6cdPxLpKYMR7bWbf9r5Fd
B6C8jKZKl+eETWJx7ECQ/z2BBeUNw1bwUK8F0MgF+Kb01V29ouGaB2eUP4JhBH1b
zBhEM+N1dYjc3gzDDTJHURS0lm9Pzcg1Dj4nRYVEYbddU3wNd/kYPQIk+BmWoUH8
h6xtMYCT3k+hL6Y59LVXra23PpktJljTFtMI8DXYmuJS+yy+dV7g1rn4Ui9FmF7B
UmI4khTwZV2TQ1C0LsSuzwkBm71S27ziqmKVTci0hmzEFalls/Mr2rAP7dSwK4FE
3kjQxOPKuiSgwV2+Odw4M6JQKChplAVOy6dzr8QIq3ULzaMoZ4LxX4JhvqvaK/0w
vqRxoJ/OmC/pbHdVM/h7OnsS0t67UnlO8zJwuOAn03S7mpo67HZ/xKHCsJctF4Ca
cwRnCVEeiYv1kjA2YEbjg9uohTtnfysNsoVA+rE7TNEqeWb4r1c=
=ueZJ
-----END PGP SIGNATURE-----

--jM/2AY6iSqMbsk1G--


--===============2913779224903254667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2913779224903254667==--

