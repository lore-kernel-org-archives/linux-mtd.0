Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9XeF-0006pZ-MS
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 19:05:05 -0500
Received: from dsl-213-023-243-193.arcor-ip.net
	([213.23.243.193]:33213 helo=zappa ident=mail)
	by mail.ku-gbr.de with asmtp (Exim 4.24 #1 (Debian))
	id 1D9XeE-0001Yv-9v
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2005 01:04:58 +0100
Received: from [10.10.0.17] (helo=sexmachine.doom)
	by zappa with esmtp (Exim 3.36 #1 (Debian)) id 1D9XeD-0003eU-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2005 01:04:57 +0100
Received: from konsti by sexmachine.doom with local (Exim 4.43)
	id 1D9XeC-0002fU-IW
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 01:04:56 +0100
Resent-Message-ID: <20050311000456.GE10058@ku-gbr.de>
Date: Fri, 11 Mar 2005 01:03:50 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20050311000350.GC10058@ku-gbr.de>
References: <20050310231850.GA10058@ku-gbr.de>
	<BCEFJBPJCGFCNMMMIDBHEEPKCKAA.Joakim.Tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BCEFJBPJCGFCNMMMIDBHEEPKCKAA.Joakim.Tjernlund@lumentis.se>
Cc: 
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-11 00:38 +0100 schrieb Joakim Tjernlund:

> Invalidating dcache should probably go into the copy_from routine, if needed.
> I don't known if your ARM CPU is cache coherent or not. If it is, you shouldn't need
> to invalidate the dcache.

IIRC it is coherent, but I have to taka a look at this :)
> 
> It could still be an alignment problem, I think the ->name field is at an
> unligned address if my memory serves me right.

I don't exclude an alignment problem...

> > May I copy this mail into the ml, since you addressed me without it?
> 
> Sure, I just hit the wrong reply button.

:)

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
