Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp80q-0006Pd-Ov
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 12:07:41 -0400
From: Andy Hawkins <a.hawkins@cabletime.com>
To: D.A.Fedorov@inp.nsk.su
In-Reply-To: <1090856360.2220.63.camel@adh>
References: <Pine.SGI.4.10.10407262153220.569820-100000@Sky.inp.nsk.su>
	<1090856360.2220.63.camel@adh>
Content-Type: text/plain
Message-Id: <1090858047.2219.77.camel@adh>
Mime-Version: 1.0
Date: 26 Jul 2004 17:07:27 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

After a bit more digging and reading of the data sheet, it appears the
the chip I'm using doesn't need locking and unlocking. I then went back
to the version of the code where we had this working (whatever came with
the 2.4.20 kernel) and found that none of this locking / unlocking
mechanism was present.

So, to test I commented out the contents of cfi_amdstd_lock_varsize and
cfi_amdstd_unlock_varsize, and I can now successfully write to the NOR!

Are these functions only required for some very specific chips? If so,
what is the *correct* way for this code to determine whether or not they
are needed (this code is in a 'generic' file, so I'm surprised that
there's chip specific information in there).

Thanks for any advice you can offer.

Andy
